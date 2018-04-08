<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head></head>

<body>
	<h1>Login</h1>
	<font color="red">
	   <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION }">  
	<c:out value="Your login attempt was not successful, try again."/>
	</c:if>
	</font>
	
	<form name='f' action="login" method='POST'>
		
		<table>
			<tr>
				<td>User:</td>
				<td><input type='text' name='username'></td>
				<td><input type='hidden' name='password'></td>
			</tr>
			<tr>
				<td><input name="submit" type="submit"/></td>
			</tr>
		</table>

	</form>

</body>
</html>
