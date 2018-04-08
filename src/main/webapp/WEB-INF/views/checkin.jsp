<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check In</title>
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/resource/header.png"
	mce-href="/favicon.ico" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resource/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resource/js/phone.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resource/js/bootstrapValidator.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/bootstrapValidator.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/style.css" />


<style type="text/css">
.divcss {
	color: #008B8B
}

.divcss1 {
	color: #000000
}

.col-center-block {
	position: absolute;
	top: 50%;
	-webkit-transform: translateY(-50%);
	-moz-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	-o-transform: translateY(-50%);
	transform: translateY(-50%);
}
</style>
</head>
<script type="text/javascript">
	$(function() {
		var status = false;
		$("#displayInterview").find("input").attr("disabled", true);
		$("#displayMaintain").find("input").attr("disabled", true);
		$("#displayNameForInterview").hide();
		$("#displayInterview").hide();
		$("#displayMaintain").hide();
		$("#displayNameForInterview").find("select").attr("disabled", true);
		//页面加载完毕后开始执行的事件
		$("select[name='PURPOSE_CODE']")
				.change(
						function() {
							$(checkinform).data("bootstrapValidator").resetForm();
							$("#displayMaintain").find("input").val("");
							$("#displayName").find("input").val("");
							$("#displayEntourage").find("input").val("");
							$("#displayPhone").find("input").val("");
							$("#displayGender").find("select").val("M");
							if ($(this).val() == "I") {
								$("#displayInterview").show();
								$("#displayNameForInterview").show();
								$("#displayName").hide();
								$("#displayName").find("input").attr(
										"disabled", true);
								$("#displayInterview").find("input").attr(
										"disabled", false);
								$("#displayNameForInterview").find("select")
										.attr("disabled", false);
								//加载所有未面试人员名单
								if (status == false) {
									$
											.ajax({
												type : "post",
												url : "${pageContext.request.contextPath}/visitor/findAllInterviewrs",
												success : function(data) {
													status = true;
													$
															.each(
																	data,
																	function(i,
																			item) {
																		$(
																				"select[name=NAMEs]")
																				.append(
																						"<option value='"+item.name+"' >"
																								+ item.name
																								+ "</option>")
																	})
												}
											})
								}
							} else {
								$("#displayInterview").hide();
								$("#displayInterview").find("input").attr(
										"disabled", true);
								$("#displayNameForInterview").hide();

								$("#displayNameForInterview").find("select")
										.attr("disabled", true);
								$("#displayName").show();
								$("#displayName").find("input").attr(
										"disabled", false);
							}
						});
		$("select[name='PURPOSE_CODE']").change(function() {
			if ($(this).val() == "R") {
				$("#displayMaintain").show();
				$("#displayMaintain").find("input").attr("disabled", false);
			} else {
				$("#displayMaintain").hide();
				$("#displayMaintain").find("input").attr("disabled", true);
			}
		});
	});
</script>
<script type="text/javascript">
	function selectName() {
		$
				.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/visitor/findInterviewrMsg",
					data : {
						NAME : $("select[name=NAMEs]").val()
					},
					success : function(data) {
						$("input[name=JOB_POSITION]").val(data.job_POSITION);
						$("input[name=MOBILE]").val(data.mobile);
						$("input[name=STAFF_NAME]").val(data.staff_NAME);
					}
				})
	}

</script>

<body class="bg_white">
	<div class="header">
		<img alt=""
			src="${pageContext.request.contextPath}/resource/img/NCS.png">
		<div style="font-size: 33px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Visitor
			Sign System</div>
	</div>

	<div class="content">
		<div class="left_banner">
			<form id="commentForm" name="checkinform"
				action="${pageContext.request.contextPath }/visitor/checkin"
				class="form-horizontal">

				<div class="form-group">

					<label class="divcss1" style="font-size: 25px;">Welcome to
						NCSI Chengdu</label>
				</div>
				<div class="form-group">

					<label class=" divcss">来访日期/Date：</label>

					<div class="divcss">
						<span class="divcss">${SIGN_IN_DATE}</span>
					</div>
				</div>
				<input type="hidden" name="SIGN_IN_DATE" value="${SIGN_IN_DATE}">

				<div class="form-group">
					<div>
						<label class="divcss">V-Pass No：</label>
					</div>

					<div class=""">
						<span class="divcss">${V_PASS}</span>
					</div>
				</div>
				<input type="hidden" name="V_PASS" value="${V_PASS}">
				<div class="form-group">
					<div>
						<label class=" divcss">来访目的/Purpose：</label>
					</div>

					<div>
						<select name="PURPOSE_CODE" class="form-control">
							<option value="M">会议 / Meeting</option>
							<option value="C">保洁 / Cleaning</option>
							<option value="I">面试 / Interview</option>
							<option value="R">维修 / Maintenance</option>
							<option value="O">其他 / Others</option>
						</select>

					</div>
				</div>
				<div class="form-group" id="displayMaintain">
					<div>
						<label for="company" class="  divcss">访客公司 / Company：</label>
					</div>
					<div>

						<input type="text" name="VISITOR_COMPANY" placeholder="请输入公司名称"
							class="form-control">
					</div>
				</div>
				<div class="form-group" id=displayName>
					<div>
						<label for="username" class="  divcss">访客姓名 / Name：</label>
					</div>
					<div>
						<input type="text" name="NAME" placeholder="请输入姓名"
							class="form-control">
					</div>
				</div>
				<div class="form-group" id=displayNameForInterview>
					<div>
						<label for="username" class="  divcss">访客姓名 / Name：</label>
					</div>
					<div>

						<select name="NAMEs" onchange="selectName(this)"
							class="form-control">
							<option>面试人员</option>
						</select>
					</div>
				</div>
				<div class="form-group" id="displayInterview">
					<div>
						<label for="username" class="  divcss">面试职位 / Position：</label>
					</div>
					<div>
						<input type="text" name="JOB_POSITION" placeholder="请输入职位"
							class="form-control">
					</div>
				</div>

				<div class="form-group" id="displayGender">
					<div>
						<label for="gender" class="  divcss">访客性别 / Gender：</label>
					</div>
					<div>

						<select name="GENDER" class="form-control">
							<option value="M">男 / male</option>
							<option value="F">女 / female</option>
						</select>
					</div>
				</div>

				<div class="form-group " id="displayPhone">
					<div>
						<label for="username" class="  divcss">访客电话 / Telephone：</label>
					</div>
					<div>
						<span class="input-group-addon " style="width: 100px">If
							you are using SinGapore Mobile <br>No. ,please add 000 in
							front of it.
						</span>
					</div>
					<div>
						<input type="text" name="MOBILE" placeholder="请输入手机号"
							class="form-control">
					</div>
				</div>
				<div class="form-group" id="displayEntourage">
					<div>
						<label class="  divcss">陪同人员：</label>
					</div>
					<div>
						<input type="text" name="STAFF_NAME" placeholder="请输入姓名"
							class="form-control">
					</div>
				</div>
				<div class="form-gorup">
					<div >
					
					
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
						<u class="divcss">信息无误请确认</u><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<img width="70px" height="50" alt="" src="${pageContext.request.contextPath}/resource/img/confirm.gif">
						<button type="submit" 
							class="btn btn-primary">确认 / Check-In&nbsp;</button>
					</div>
				</div>

			</form>
		</div>
		<div class="right_banner"></div>
	</div>

</body>
</html>