<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>uploadFile</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrapValidator.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css"/>
<style type="text/css">
.divcss{color:#008B8B}
.col-center-block {
	position: absolute;
	top:40%;
	right:40%;
	-webkit-transform: translateY(-50%);
	-moz-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	-o-transform: translateY(-50%);
	transform: translateY(-50%);
}

</style>
</head>
<body>
<div>
		<img src="${pageContext.request.contextPath}/resource/Minilogo.png">
	</div>
 <div class="upload-section col-center-block">  
        <form method="post" id="form-test" name="form-test" action="${pageContext.request.contextPath }/uploadFile" enctype="multipart/form-data">
          <div >
			<div style="font-size: 30px;text-align:center;"class="divcss">面试信息导入</div>
		</div>
            <div class="display-section">  
                <input name="display-text" style="width:300px;height:30px;" type="text" id="viewfile" readonly="readonly" ondblclick="document.getElementById('upload-file').click()"/>  
            	&nbsp;&nbsp;&nbsp;
            	<button type="button" style="height:40px;width:100px;" onclick="document.getElementById('upload-file').click()" class="btn btn-primary">Broswer</button>
            </div>  
            </br>
            </br>
            <div style = "text-align:right;">
                        	<button type="button" style="height:40px;width:100px;"  onclick="checkForm(this);return false;" class="btn btn-primary">导入</button>
                        	<button type="button" style="height:40px;width:100px;"  onclick="resets(this);return false;" class="btn btn-primary">重置</button>
            </div>
            <input type="file" id="upload-file" name="upfile" onchange="document.getElementById('viewfile').value=this.value;" accept="xlsx,xls"  style="display: none"/>  
        </form>  
        
    </div>  
    <script type="text/javascript">  
    function resets(a){
    	$("#upload-file").val("");
    	$("#viewfile").val("");
    }
        function checkForm(obj){  
            //检测文件类型  
            var allowSubmit = false;  
            var extArray = new Array('.xlsx', '.xls');  
            var form = document.getElementById('form-test');  
            var filename = document.getElementById('upload-file').value;  
            for (var i = 0; i < extArray.length; i++) {  
                if(filename.split('').reverse().join('').indexOf(extArray[i].split('').reverse().join('')) === 0) {  
                    allowSubmit = true;  
                    break;  
                }  
            }  
            if(allowSubmit){ 
                form.submit();  
            }else{  
                alert('您上传的文件后缀必须是'+extArray.join(',')+'文件');  
            }  
        }  
    	window.alert = function(str) 
    	{ 
    	var shield = document.createElement("DIV"); 
    	shield.id = "shield"; 
    	shield.style.position = "absolute"; 
    	shield.style.left = "0px"; 
    	shield.style.top = "0px"; 
    	shield.style.width = "100%"; 
    	shield.style.height = document.body.scrollHeight+"px"; 
    	//弹出对话框时的背景颜色 
    	shield.style.background = "#fff"; 
    	shield.style.textAlign = "center"; 
    	shield.style.zIndex = "25"; 
    	//背景透明 IE有效 
    	//shield.style.filter = "alpha(opacity=0)"; 
    	var alertFram = document.createElement("DIV"); 
    	alertFram.id="alertFram"; 
    	alertFram.style.position = "absolute"; 
    	alertFram.style.left = "50%"; 
    	alertFram.style.top = "50%"; 
    	alertFram.style.marginLeft = "-225px"; 
    	alertFram.style.marginTop = "-75px"; 
    	alertFram.style.width = "450px"; 
    	alertFram.style.height = "150px"; 
    	alertFram.style.background = "#ff0000"; 
    	alertFram.style.textAlign = "center"; 
    	alertFram.style.lineHeight = "150px"; 
    	alertFram.style.zIndex = "300"; 
    	strHtml = "<ul style=\"list-style:none;margin:0px;padding:0px;width:100%\">\n"; 
    	strHtml += " <li style=\"background:#008B8B;text-align:left;padding-left:20px;font-size:14px;font-weight:bold;height:25px;line-height:25px;border:1px solid #008B8B;\">[上传错误]</li>\n"; 
    	strHtml += " <li style=\"background:#fff;text-align:center;font-size:12px;height:120px;line-height:120px;border-left:1px solid #008B8B;border-right:1px solid #008B8B;\">"+str+"</li>\n"; 
    	strHtml += " <li style=\"background:#008B8B;text-align:center;font-weight:bold;height:25px;line-height:25px; border:1px solid #008B8B;\"><input type=\"button\" value=\"确 定\" onclick=\"doOk()\" /></li>\n"; 
    	strHtml += "</ul>\n"; 
    	alertFram.innerHTML = strHtml; 
    	document.body.appendChild(alertFram); 
    	document.body.appendChild(shield); 
    	var ad = setInterval("doAlpha()",5); 
    	this.doOk = function(){ 
    	alertFram.style.display = "none"; 
    	shield.style.display = "none"; 
    	} 
    	alertFram.focus(); 
    	document.body.onselectstart = function(){return false;}; 
    	} 
    </script> 
</body>
</html>