<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">欢迎登陆“最帅”后台管理页面</h1>
	<form action="loginManager" method="post">
		<table align="center" border="0" cellpadding="5" cellspacing="0">
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="managername" /></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="password" name="managerpassword" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="sub" value="登陆" /></td>
			</tr>
		</table>
	</form>
</body>
</html>