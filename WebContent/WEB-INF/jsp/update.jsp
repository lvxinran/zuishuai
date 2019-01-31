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
	<form action="updateVideo">
		<table align="center" border="0" cellpadding="0" cellspacing="0"
			width="300">
			<tr>
				<td><input type="hidden" name="id" value="${video.id}" /></td>
			</tr>
			<tr>
				<td>视频名称：</td>
				<td><input type="text" name="videoName"
					value="${video.videoName}" /></td>
			</tr>
			<tr>
				<td>视频URL:</td>
				<td><input type="text" name="videoUrl"
					value="${video.videoUrl }" /></td>
			</tr>
			<tr>
				<td>视频HTML:</td>
				<td><input type="text" name="videoHtml"
					value="${video.videoHtml}" /></td>
			</tr>
			<tr>
				<td>视频类型：</td>
				<td><select name="videoType">
						<c:forEach items="${typeList}" var="t">
							<c:choose>
								<c:when test="${t.id==video.videoTypeId}">
									<option value="${t.id}" selected="selected">${t.name}</option>
								</c:when>
								<c:otherwise>
									<option value="${t.id}">${t.name}</option>
								</c:otherwise>
							</c:choose>

						</c:forEach>

				</select></td>
			</tr>
			<tr>
				<td><input type="hidden" name="videoDel" value="0" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" name="sub"
					value="确认">	
				</td>
				
			</tr>

		</table>

	</form>
</body>
</html>