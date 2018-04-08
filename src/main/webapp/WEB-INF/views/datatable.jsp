<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>datatable</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/resource/css/jquery.dataTables.css" type=text/css rel=stylesheet>
<script type="text/javascript" src="${pageContext.request.contextPath }/resource/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resource/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resource/js/dataTables.bootstrap.js"></script>
	<script >
        $(document).ready(function(){
            var url = "${pageContext.request.contextPath }/visitor/datatableQuery";
            var table = $("#datatable1").dataTable();
            if (table)
                table.fnDestroy();
    $('#datatable1').dataTable({
        "bProcessing" : true,
        "serverSide" : true,
        "bInfo" : false,
        "sAjaxSource" : url,
        "sAjaxDataProp" : "visitList",
        "sPagingType" : "full_numbers",
        "aLengthMenu" : [ 10, 15, 20 ],
        "bRetrieve" : true,
        "bPaging" : true,
        "bOrdering" : true,
        "bInfo" : true,
        "sScrollY" : "60%",
        "sScrollX" : "100%",
        "columns": [
            {
                "data":"visitName"
            },
            {
                "data":"visitGender"
            },
          
            {
				orderable : false,
				render : function(data, type, full) {
					
					return '<input class ="form-control poscenter" type= "text" value = "'+full.visitStaff+'" disabled />';
				}

			}, {
				"sClass" : "poscenter",
				orderable : false,
				render : function(data, type, full) {
					
					return '<input class ="form-control" type= "text" value = "'+full.visitMobile+'"/>';
				}
			}
        ]
    });
})


	</script>
<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
	<TABLE id="datatable1" style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc" cellSpacing=1 cellPadding=2 rules=all border=0>
				<thead>
				<TR style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
													<TH>客户名称</TH>
													<TH>客户性别</TH>
													<TH>陪同人员</TH>
													<TH>电话</TH>
												</TR>
										</thead>
											<TBODY>
											</TBODY>
										</TABLE>	
</BODY>
</HTML>
