<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>“最帅”视频网站</title>
</head>
<style type="text/css">
.gray {
	color: gray;
}
.longWidth{
	width: 100%;
}
div{
	float: left;
}
div.right{
	float: right;
}
</style>

<body>
<div class="longWidth">
	<div>
		<h1>最帅，为你而生！</h1>
	</div>
	<div class="right">
		<c:choose>
				<c:when test="${sessionScope.user==null}">
					<h4>
						<a href="userLogin">立即登陆</a>
					</h4>
				</c:when>
				<c:otherwise>
					<h4>你好，${user.nickname}！</h4>
				</c:otherwise>
			</c:choose>
	</div>
	<br />
	<br />
</div>
	<a href="main">点击返回首页</a>
	<h2 class="gray">${video.videoName}</h2>
	<iframe src="${video.videoHtml}" frameborder="0" allowfullscreen="true"
		width="500px" height="320px"></iframe>
</body>
</html>