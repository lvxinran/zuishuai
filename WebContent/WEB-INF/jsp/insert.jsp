<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
	.longInput{
		width: 600px;
	}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insertVideo" method="post">
		<table align="center" border="0" cellpadding="5" cellspacing="0" width="800">
			<tr>
				<td>视频名称：</td>
				<td><input type="text" name="videoName" class="longInput"/></td>
			</tr>
			<tr>
				<td>视频URL:</td>
				<td><input type="text" name="videoUrl" class="longInput"/></td>
			</tr>
			<tr>
				<td>视频HTML:</td>
				<td><input type="text" name="videoHtml" class="longInput"/></td>
			</tr> 
			<tr>
				<td>视频类型：</td>
				<td><select name="videoType" >
				<c:forEach items="${typeList}" var="t">
					<option value="${t.id}" >${t.name}</option>
				</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td><input type="hidden" name="videoDel" value="0"/> </td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" name="sub" value="添加"></td>
			</tr>
			
		</table>
	
	</form>
</body>
</html>