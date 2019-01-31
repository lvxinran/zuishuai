<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>“最帅”视频网站</title>

</head>
<script src="../../js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document).ready(function setColor() {
		$(this).css("color", "yellow")
	})
</script>
<style type="text/css">
</style>
<body>
	<h1>最帅，为你而生！</h1>
	<form action="loginUser" method="post">
		<table align="center" cellpadding="0" cellspacing="5px" border="0">
			<tr>
				<td colspan="2" align="center">用户登陆</td>
			</tr>
			<tr>
				<td>用户名：</td>
				<c:choose>
					<c:when test="${username!=null}">
						<td><input type="text" name="username" value="${username}" /></td>
					</c:when>
					<c:otherwise>
						<td><input type="text" name="username" /></td>
					</c:otherwise>
				</c:choose>
				<td width="200px"><c:if test="${error!=null}">

						<span><font color="red">用户名或密码错误</font></span>
					</c:if></td>
			</tr>

			<tr>
				<td>密码：</td>
				<c:choose>
					<c:when test="${password!=null}">
						<td><input type="password" name="password"
							value="${password}" /></td>
					</c:when>
					<c:otherwise>
						<td><input type="password" name="password" /></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td><input type="submit" name="sub" value="登陆" /></td>
				<td><h3 align="center">
						<a href="" onblur="setColor()">腾讯QQ授权登陆</a>
					</h3></td>
			</tr>

		</table>
	</form>


</body>
</html>