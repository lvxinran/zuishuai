package com.lxr.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.config.AlipayConfig;
import com.lxr.model.VideoUser;
import com.lxr.service.OrderService;
import com.lxr.service.VideoUserService;

@Controller
@SessionAttributes({ "user" })
public class UserController {
	@Autowired
	private VideoUserService videoUserService;

	@RequestMapping("/userLogin")
	public String userLogin() {
		return "show/loginUser";
	}

	@RequestMapping("/loginUser")
	public ModelAndView loginUser(String username, String password) {
		ModelAndView mav = new ModelAndView();
		VideoUser record = new VideoUser();
		record.setUsername(username);
		record.setPassword(password);
		VideoUser user = videoUserService.loginValidate(record);
		System.out.println(user);
		if (user != null) {
			mav.addObject("user", user);
			mav.setViewName("redirect:/main");
		} else {
			mav.addObject("username", record.getUsername());
			mav.addObject("password", record.getPassword());
			mav.addObject("error", "errorLogin");
			mav.setViewName("show/loginUser");
		}
		return mav;
	}

	@RequestMapping("/logOff")
	public String logOff(HttpSession session, SessionStatus sessionStatus) {
		if (session.getAttribute("user") != null) {
			session.removeAttribute("user");
		}
		sessionStatus.setComplete();
		return "redirect:/main";
	}

	@RequestMapping("/buyVip")
	public ModelAndView buyVip(Integer id) {
		ModelAndView mav = new ModelAndView();
		VideoUser user = videoUserService.getById(id);
		if (user.getPermission() == 0) {
			String order = OrderService.createOrder();
			mav.addObject("order", order);
			mav.addObject("username", user.getUsername());
			mav.addObject("money", "1.00");
			mav.addObject("projectName", "“最帅”视频网站VIP");
			mav.setViewName("buy/confirmBuy");
		} else {
			mav.setViewName("alreadyVip");
		}
		return mav;
	}

	@RequestMapping("/alipayTo")
	public ModelAndView alipayTo(String WIDout_trade_no, String WIDtotal_amount, String WIDsubject, String WIDbody)
			throws Exception {
		System.out.println(WIDout_trade_no + "--" + WIDtotal_amount + "--" + WIDsubject + "--" + WIDbody);

		// 获得初始化的AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
				AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key,
				AlipayConfig.sign_type);

		// 设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

		// 商户订单号，商户网站订单系统中唯一订单号，必填
		String out_trade_no = new String(WIDout_trade_no.getBytes("ISO-8859-1"), "UTF-8");
		// 付款金额，必填
		String total_amount = new String(WIDtotal_amount.getBytes("ISO-8859-1"), "UTF-8");
		// 订单名称，必填
		String subject = new String(WIDsubject.getBytes("ISO-8859-1"), "UTF-8");
		// 商品描述，可空
		String body = new String(WIDbody.getBytes("ISO-8859-1"), "UTF-8");

		alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\"," + "\"total_amount\":\"" + total_amount
				+ "\"," + "\"subject\":\"" + subject + "\"," + "\"body\":\"" + body + "\","
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

		// 若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
		// alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no
		// +"\","
		// + "\"total_amount\":\""+ total_amount +"\","
		// + "\"subject\":\""+ subject +"\","
		// + "\"body\":\""+ body +"\","
		// + "\"timeout_express\":\"10m\","
		// + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		// 请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节

		// 请求
		String result = alipayClient.pageExecute(alipayRequest).getBody();
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName("/alipay/alipay.trade.page.pay");
		return mav;
	}

	@RequestMapping("/payReturn")
	public ModelAndView payReturn(HttpServletRequest request ,SessionStatus sessionStatus) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		Integer id = ((VideoUser) session.getAttribute("user")).getId();
		session.removeAttribute("user");
		sessionStatus.setComplete();
		int re = videoUserService.updatePermission(id);
		VideoUser user = videoUserService.getById(id);		
		request.setAttribute("videoUser", user);
		System.out.println(re);
		// 获取支付宝GET过来反馈信息 
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}

		boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,
				AlipayConfig.sign_type); // 调用SDK验证签名

		// 订单编号
		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

		// 支付宝交易号
		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

		// 付款金额
		String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");
		if (signVerified) {

			mav.addObject("out_trade_no", out_trade_no);
			mav.addObject("trade_no", trade_no);
			mav.addObject("total_amount", total_amount);
		} else {

			mav.addObject("error", "验签失败！");
		}
		mav.setViewName("/alipay/return_url");
		return mav;
	}
}
