<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.manager==null}">
			<%
				response.sendRedirect("/login");
			%>
		</c:when>
		<c:otherwise>
			<h4 align="right">您好，${sessionScope.managername}！</h4>
			<h1 align="center">
				“<font color="green">最帅</font>”视频网站后台管理系统
			</h1>
			<h3 align="center">
				<font color="grey">你的最爱，就在最帅</font>
			</h3>

			<table align="center" border="1" cellpadding="0" cellspacing="0">
				<tr>
					<th>id:</th>
					<th width="250px">name:</th>
					<th>url:</th>
					<th width="400px">html:</th>
					<th>typeId:</th>
					<c:if test="${sessionScope.manager.permission<2}">
						<th>do:</th>
					</c:if>
				</tr>
				<c:forEach items="${list}" var="video">
					<tr>
						<td>${video.id }</td>
						<td width="250px">${video.videoName}</td>
						<td><img src="${video.videoUrl}" alt="${video.videoName}"
							width="100px" height="100px"></td>
						<td width="400px">${video.videoHtml}</td>
						<td>${video.videoTypeId}</td>
						<c:if test="${sessionScope.manager.permission<2}">
							<td><a href="delete?id=${video.id}">删除</a> | <a
								href="update?id=${video.id}">修改</a></td>
						</c:if>
					</tr>
				</c:forEach>


			</table>
			<c:if test="${sessionScope.manager.permission<3}">
				<h2 align="center">
					<a href="insert">添加视频信息</a>
				</h2>
			</c:if>


		</c:otherwise>

	</c:choose>

</body>
</html>