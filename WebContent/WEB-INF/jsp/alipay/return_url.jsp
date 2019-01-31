<%@page import="com.lxr.model.VideoUser"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>电脑网站支付return_url</title>
</head>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.alipay.config.*"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.alipay.api.internal.util.*"%>
<c:choose>
	<c:when test="${error==null}">
		<c:if test="${trade_no!=null}">
		<%
			VideoUser user = (VideoUser)request.getAttribute("videoUser");
			session.setAttribute("user", user);
		%>
			<h1 align="center">最帅，为你而生！</h1>
			<h2 align="center">
				<font color="red">恭喜充值成功！</font>
			</h2>
			<table align="center" cellpadding="0" cellspacing="10px"
				width="1000px">
				<tr>
					<td>您的订单编号为：</td>
					<td align="right">${out_trade_no}</td>
				</tr>
				<tr>
					<td>您的支付宝交易号为：</td>
					<td align="right">${trade_no}</td>
				</tr>
				<tr>
					<td>您的账号为：</td>
					<td align="right">${sessionScope.user.username}</td>
				</tr>
				<tr>
					<td>您已充值成为：</td>
					<td align="right"><font color="red" size="20px">“最帅”视频网站VIP会员</font></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><a href="main">点击返回视频首页</a></td>
				</tr>
			</table>
		</c:if>
	</c:when>
	<c:otherwise>
		<h1>${error}</h1>
	</c:otherwise>

</c:choose>
<body>
</body>
</html>