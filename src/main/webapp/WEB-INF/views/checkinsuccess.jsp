<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check In successful</title>
<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/resource/header.png" mce-href="/favicon.ico"/>

<script type="text/javascript" 
src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrapValidator.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/style.css"/>

<script language="javascript">     
var myTime = setTimeout("Timeout()", 5000);     
function rTime() {     
    clearTimeout(myTime);     
    myTime = setTimeout('Timeout()', 5000);     
}    
function Timeout() {     
    document.location.href='${pageContext.request.contextPath}/welcome';     
}     
document.documentElement.onkeydown=rTime;    
document.doocumentElement.onclick=rTime;    
</script>
<style>
.divcss1{color:#000000}
.divcss{color:#008B8B}
.col-center-block {
position: absolute;
top: 50%;
-webkit-transform: translateY(-50%);
-moz-transform:  translateY(-50%);
-ms-transform:  translateY(-50%);
-o-transform:  translateY(-50%);
transform:  translateY(-50%);
}
</style>
</head>
<body  class="bg_white">
	<%-- <div>
		<img src="${pageContext.request.contextPath}/resource/Minilogo.png">
	</div> --%>
	<div class="header">
		<img alt="" src="${pageContext.request.contextPath}/resource/img/NCS.png">
      <div style="font-size:33px; "> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Visitor Sign System</div>
    </div>
	<div class="content">
	<div class="left_banner">
	<label class="divcss1" style="font-size:25px;" >Welcome to NCSI Chengdu</label>
	
	<br>
	<table align="center">
		<tr height="70">
			<th style="font-size: 20px;text-align:center;"class="divcss">您的信息已录入，谢谢</th>
		</tr>
		<tr height="70">
			<th style="font-size: 20px;text-align:center;" class="divcss">Thank you for your register</th>
		</tr>
		<tr height="70">
			<th style="font-size: 20px;text-align:center;" class="divcss">clink the link to go back <a href="${pageContext.request.contextPath}/welcome">home</a> page or auto skip after 5 secounds</th>
		</tr>
	</table>
</div>
</div>
</body>
</html>