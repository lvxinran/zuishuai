<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>“最帅”视频网站</title>
</head>
<style type="text/css">
.model {
	width: 200px;
	height: 160px;
	float: left;
	margin-left: 60px;
	border: 2px;
	border-bottom-color: gray;
}

div {
	display: block;
	float: left;
}

img {
	width: 200px;
	height: 130px;
}

a {
	text-decoration: none;
	color: black;
}

li {
	list-style: none;
	float: left;
	margin-right: 30px;
}

.clear {
	clear: both;
	height: 10px;
}

.show {
	width: 1000px;
	margin: 0 auto;
	margin-top: 20px;
}

div.right {
	float: right;
}

.gray {
	color: gray;
}

.color1 {
	background-color: yellow
}

.longWidth {
	width: 100%;
}
</style>
<body>
	<%
		if (request.getParameter("page") != null) {

			Integer currentPage = Integer.parseInt(request.getParameter("page"));
			request.setAttribute("currentPage", currentPage);
		} else {
			request.setAttribute("currentPage", 1);

		}
	%>

	<div class="longWidth">
		<div>
			<h1>最帅，为你而生</h1>
		</div>

		<div class="right">
			<c:choose>
				<c:when test="${sessionScope.user==null}">
					<h4>
						<a href="userLogin">立即登陆</a>
					</h4>
				</c:when>
				<c:otherwise>
					<h4>
						你好，
						<c:choose>
							<c:when test="${sessionScope.user.permission==1 }">
								<font color="red">${sessionScope.user.nickname}</font>
							</c:when>
							<c:otherwise>
							${sessionScope.user.nickname}
						</c:otherwise>
						</c:choose>
						！ &nbsp;<a href="logOff">退出登陆</a> &nbsp; <a
							href="buyVip?id=${user.id}">会员充值</a>
					</h4>

				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="clear"></div>
	<div>
		<c:forEach items="${list}" var="video">
			<div class="model">
				<div>
					<a href="play?id=${video.id}"><img alt=""
						src="${video.videoUrl}"></a>
				</div>
				<div>
					<a href="play?id=${video.id}">${video.videoName}</a>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="clear"></div>
	<div align="center" class="show">
		<ul>
			<c:choose>
				<c:when test="${currentPage==1}">

					<li class="gray">首页</li>
					<li class="gray">上一页</li>
				</c:when>
				<c:otherwise>
					<li><a href="main?page=1">首页</a></li>
					<li><a href="main?page=${currentPage-1}">上一页</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach begin="1" end="${totalPage}" var="each">
				<c:choose>
					<c:when test="${currentPage==each}">
						<li class="gray">${each}</li>
					</c:when>
					<c:otherwise>
						<li><a href="main?page=${each}">${each}</a></li>
					</c:otherwise>
				</c:choose>

			</c:forEach>
			<c:choose>
				<c:when test="${currentPage==totalPage}">
					<li class="gray">下一页</li>
					<li class="gray">尾页</li>
				</c:when>
				<c:otherwise>
					<li><a href="main?page=${currentPage+1}">下一页</a></li>
					<li><a href="main?page=3">尾页</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>

</body>
</html>