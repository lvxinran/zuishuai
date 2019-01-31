<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${success=='1'}">
		<h1>添加成功！</h1>
	</c:if>
	<c:if test="${success=='2'}">
		<h1>删除成功！</h1>
	</c:if>
	<c:if test="${success==3}">
		<h1>修改成功！</h1>
	</c:if>
	<h2><a href="test">点击返回查看所有视频</a></h2>
</body>
</html>