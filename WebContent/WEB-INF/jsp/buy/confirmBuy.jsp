<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<style type="text/css">
.money {
	color: red;
	font-size: 30px;
}
</style>
<body>
	<c:choose>
		<c:when test="${sessionScope.user!=null}">
			<h1 align="center">订单信息</h1>
			<form action="alipayTo" method="post">
				<table align="center" cellpadding="0" cellspacing="10px"
					width="1000px">
					<tr height="30px">
						<td colspan="2">请确认订单信息！</td>
					</tr>
					<tr height="30px">
						<td>订单编号：</td>
						<td width="500px" align="right">${order}<input type="hidden" id="WIDout_trade_no" name="WIDout_trade_no" value="${order}"/></td>
					</tr>
					<tr height="30px">
						<td>充值项目：</td>
						<td width="500px" align="right">${projectName}<input type="hidden" id="WIDsubject" name="WIDsubject" value="${projectName}"/></td>
					</tr>
					<tr height="30px">
						<td>充值账号：</td>
						<td width="500px" align="right">${sessionScope.user.username}<input type="hidden" id="WIDbody" name="WIDbody" value="${sessionScope.user.username}"/></td>
					</tr>
					<tr height="30px">
						<td>充值金额：</td>
						<td width="500px" align="right" class="money">${money}<input type="hidden" id="WIDtotal_amount" name="WIDtotal_amount" value="${money}"/></td>
					</tr>

					<tr height="30px">
						<td colspan="2" align="center"><input type="submit" name="sub" value="确认支付"/></td>
					</tr>
				</table>
			</form>
		</c:when><c:otherwise>
			<%
				response.sendRedirect("/userLogin");
			%>
		</c:otherwise>
	</c:choose>
</body>
</html>