<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check Out</title>
<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/resource/header.png" mce-href="/favicon.ico"/>

<script type="text/javascript" 
src="${pageContext.request.contextPath}/resource/js/jquery.js"></script>
<script type="text/javascript" 
src="${pageContext.request.contextPath}/resource/js/phone.js"></script>
<script type="text/javascript" 
src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>
<script type="text/javascript" 
src="${pageContext.request.contextPath}/resource/js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrapValidator.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/style.css"/>
<script type="text/javascript" 
src="${pageContext.request.contextPath}/resource/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
			if ('${visitor.PURPOSE_CODE}'== "I") {
				$("#displayInterview").show();
			} else {
				$("#displayInterview").hide();  
			} 
			if ('${visitor.PURPOSE_CODE}'=="R") {
				$("#displayMaintain").show(); 
			} else {
				$("#displayMaintain").hide();
			} 
		if($("#V_PASS").html()==""&&$("#name").html()==""){
			$("#out").hide();
			$("#confirm").hide();
			$("#message").hide();
		}
	}); 
	function checkOut(){
		var V_PASS=$("#V_PASS").text();
		window.location.href="${pageContext.request.contextPath}/visitor/checkut.action?V_PASS="+V_PASS
	}
</script>
<style type="text/css">
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
<body class="bg_white">
<%-- 	<div>

		<img alt="" src="${pageContext.request.contextPath}/resource/Minilogo.png">
	</div> --%>
	<div class="header">
		<img alt="" src="${pageContext.request.contextPath}/resource/img/NCS.png">
      <div style="font-size:33px; "> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Visitor Sign System</div>
    </div>
	<div class="content">
	<div class="left_banner">
		
	<form  class="form-horizontal">
				<div class="form-group" >
				<div>
					<label class="divcss1" style="font-size:25px;" >Welcome to NCSI Chengdu</label>

				</div>
				</div>
			<div class="form-group" >
				<div>
					<label class="divcss" >来访日期 / Date：</label>
				</div>
			
		
				<span id="SIGN_IN_DATE" style="line-height:40px;">${visitor.SIGN_IN_DATE}</span>
				</div>
		
		
		<div class="form-group" >
				<div>
					<label class="divcss" >V-Pass No：</label>
				</div>
				
				
				<span id="V_PASS" style="line-height:40px;"
				>${visitor.v_PASS}</span>
			
			</div>
			<div class="form-group" >
				<div>
					<label class="divcss" >来访目的 / Purpose：</label>
				</div>
				<div >
			<select name="PURPOSE_CODE" class="form-control" disabled="true">
						<option value="M" <c:if test="${visitor.PURPOSE_CODE=='M'}">selected</c:if>>会议 / Meeting</option>
						<option value="C" <c:if test="${visitor.PURPOSE_CODE=='C'}">selected</c:if>>保洁 / Cleaning</option>
						<option value="I" <c:if test="${visitor.PURPOSE_CODE=='I'}">selected</c:if>>面试 / Interview</option>
						<option value="R" <c:if test="${visitor.PURPOSE_CODE=='R'}">selected</c:if>>维修 / Maintenance</option>
						<option value="O" <c:if test="${visitor.PURPOSE_CODE=='O'}">selected</c:if>>其他 / Others</option>
				</select>
				</div>
				</div>
					<div class="form-group" id=displayInterview style="display: none;height:40px;">
				<div>
					<label for="username" class="divcss"  
					>面试职位 / Position：</label>
				</div>
				<div >
			<span>${visitor.JOB_POSITION}</span>
			</div>
			</div>
				<div class="form-group" id=displayMaintain style="display: none;height:40px;">
				<div>
					<label for="company" class="divcss" 
					>访客公司 / Company：</label>
				</div>
				<div >
			<span>${visitor.VISITOR_COMPANY}</span>
			</div>
			</div>
			<div class="form-group" id=displayName >
				<div>
					<label for="username" class="divcss" 
					>访客姓名 / Name：</label>
				</div>
				<div >
			
				<span id="name" style="line-height:40px;">${visitor.NAME}</span>
				</div>
				</div>
					<div class="form-group" >
				<div>
					<label for="gender" class="divcss" 
					>访客性别 / Gender：</label>
				</div>
				<div >
		
				<select name="gender" class="form-control" disabled="true">
				<option value="M" <c:if test="${visitor.GENDER=='M'}">selected="selected"</c:if>>男 / male</option>
				<option value="F"<c:if test="${visitor.GENDER=='F'}">selected="selected"</c:if>>女 / female</option>
					</select>
				</div>
				</div>
				<div class="form-group" >
				<div>
					<label for="username" class="divcss" 
					>访客电话 / Telephone：</label>
				</div>
				<div >
				<span id="MOBILE" style="line-height:40px;">${visitor.MOBILE}</span>
			</div>
			</div>
			<div class="form-group" >
				<div>
					<label for="username" class="divcss" 
					>陪同人员：</label>
				</div>
				<div >
			<span style="line-height:40px;">${visitor.STAFF_NAME}</span>
			</div>
			</div>
			
			<div class="form-gorup" >
				<div >
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
						<u id="message" class="divcss">信息无误请确认</u><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<img id="confirm" width="70px" height="50" alt="" src="${pageContext.request.contextPath}/resource/img/confirm.gif">
					<button id="out" class="btn btn-primary" onclick="checkOut(this);return false;">确认 / Check-Out</button>
				</div>
			</div>
			
			
	</form>
	</div>
	<div class="right_banner">
      </div> 
	</div>
	

</body>
</html>