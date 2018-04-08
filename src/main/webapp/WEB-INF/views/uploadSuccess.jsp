<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check In successful</title>
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/resource/header.png"
	mce-href="/favicon.ico" />

<style>
.divcss{color:#008B8B}
</style>
</head>
<body>
	<div>
		<img src="${pageContext.request.contextPath}/resource/Minilogo.png">
	</div>
	<table align="center">
		<tr height="100">
			<th style="font-size: 36px"class="divcss">信息导入成功！</th>
		</tr>
		 </table>
		 <div>
		 <span class="divcss">表中一共</span>
		 <span class="divcss">${totalCount}</span>
		 <span class="divcss">条数据:</span>
		<span class="divcss" style="line-height:40px;" text-align:center;><c:forEach var="visitor" items="${totalList}" >
			${visitor}
		</c:forEach></span>
		<span class="divcss">其中，成功导入</span>
		<span class="divcss">${importCount}</span>
		<span class="divcss">条,</span>
		<c:if test="${importCount!=0}">
			<span class="divcss"><c:forEach var="visitor" items="${importList}" >
			${visitor},
		</c:forEach></span>
		</c:if>
	
		<span class="divcss">因为有重复数据</span>
		</div>
		
		
</body>
</html>