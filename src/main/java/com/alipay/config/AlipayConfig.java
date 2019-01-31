package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016091500515251";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCRiiXAHtqM1YnvR8RDNUyUX5n2MPmKFBbaajeOYXd8WgsT3Ygy4jvTwAs7W/OesHbgi/6NfOULcr1vdNj32EThzf3XAwIRUdkEhybVhre0er6t/NHU4I2opUg96pqMPwP2DHoMBP78lB9Qi6lVN5Huu1d/FyICNVqyYNWon7GJ/VnKqbuJHYBMHZ11927y4GS62o5dgz2vIeGnl3pUG39pHYb+2T20Q3ZLyae7zf4bFsg0RYEKiIu0Rpypd81SxgFtgpk40bqayTbUhNTCkUrjYV7xZKbYPjnHtU+sQ/zW0Li6ST8rKA9zhq0OmqwxXX848FGhtuvja4bnElvPpPClAgMBAAECggEAO7sX7TZ8ecp19tdcbDzmtgpadNj6wTmne3KWZIAJ+uY1n6yO5ltFNI2fznfZj2pbD6NFEKqOklk/+AtbtLR06LuTD3hzk8okqCATxxSoNpEdyuh08cpLOUjEUm0DisWeCZBrUp2GTQE5rOP01j2dTf5jVYyX75IYLBdj+PW5dqj5xKqQyBQ/WmYgU2w4bJj2ZLZN56NkUpcfTKxcDITNGOF6ATk67rMhZbvMjFTHFX80KolSVVFZ6RuqoE30g9S+Kz3BogNn9I6xrvkNUiCm7/pkIh2bsWC/6+wLyG2IAXkQkNKTPsALTSkfAimrzMtomqUz6IuH0g3CpDiOWcsiTQKBgQD2pU08NNhT63+KF4Lb7ztxWMIYw1gegk/moOfdweN3gjCJpZDF3/pQsqPKmsYIrxFvTuNILwRZtF5LrQnxKkLTePjzTzzNL7WycFpc4fT96L1zRwQD3i53TttKxcLFD2/A3KPANVaNYbSWe2NlsmByJldgsUqUsAtCxo9bX4D7ywKBgQCXDzNiwpmjvk5ZBkIhpkpIyhb83p4Y2I4U6pybcwB/izAU5gyId42lPhu+YqTFFBfCA1Ju7nW1AfU0ul7ByVdx/RD7lZFeOTTTvofCREf2g3ImpufsoCb9XwyZd/ZPpj8mscSjM2yed//nvD2a5TeSeTXnPjBbJR9UQoRUKagXTwKBgBmgGQMtVmB5sjmNscnZ9CoVl6zs9sXMsjJ6+zwd/d0XyKU0b3Mvjxk9RikxpWuXjM8sug5w3BnZ1IY2RzcoNeM0yWC2FdIXp+APLkRCMasDuFM2yKMCPX+l0MDXBSJmNS0rf1Pj9scfpJyR20TgoIably5znRUPqUvZx2Et7f+7AoGBAIL+q5D5MELOxSJuSurjSYfVuBmQ84iYQp3g1e33zHbOPOPimvu8sRiaw3RWFozQ38lfGB0arPhKulj/RSzHbQ1sZ03EZktPUIBOuWu9yqn7UwIxuu139FfEFSkA3pgzko/7mInuDkNdzI0osEOigo6Cjjv5sfVYO9LV2+sgNKQBAoGBAKShw8w+tt0I4hGPYtcm79EwEfQpQpU7fhs90KBGpFp3aL7dLsip4ZFScuyEoQ3a+KOKuiSLRJbbVPZL+XnpEOm+TnQYG+HWMzNI3+AD9PyL6vnMMcz5CUhHyOCAXNaVKl7rPm0Ec17PNbRdbEJKXOi0jdlUX/Uw/Xwf6ChLoB/C";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAv4XFhAKHrfYbJZzdVAmKTYflD3KFFj1FJEmkmWgkZpPzcgVvrnG2t6y8vNokEj/355Ox3mdjBMpHJv88Agb/C0EGgEVJ1Y+6+2jkIaPIMMkUwOHB9ULZK50bVfEl6U40Bgg8hRdX8fzB0aIYTFv/34ErXMa+pw22w+6TkuPK/Qt0oEoZUp72r8ZY0ZThgNulpoKNVGqdtlw1Ombl4Qz2IqJeEDQPQUwGQ+ouLOL/ur/RDOEA1EUA8w05ZbzqPNkIHbUjGxHwvhjTLCjCZ3gG1NvgzhiQ8bYNkEMje6r9xVp9atIlERqpI4sFMS24MjIQXo0ZW6Szw83SAcA0nJmguQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/zuishuai/jsp/alipay/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/zuishuai/payReturn";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

