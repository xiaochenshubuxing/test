<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<title>修改个人信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/store.css">
<script language="javascript" type="text/javascript" src=""></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
var user_id="${userFront.user_id}";
if(user_id==null || user_id==''){
	alert("请先登录！");
	window.location.href="login.jsp";
}	
</script>
<style type="text/css">
 body,td,div
 {
   font-size:12px;
 }
  html,body{
 	height:100%;
 }
</style>
</head>
<body>
<jsp:include page="top.jsp"><jsp:param name="menu" value="self" /><jsp:param name="menutip" value="My Address List" /></jsp:include>
<div id="middle" style="height:calc(100% - 82px);">
	<div id="product_info" style="width:950px;margin:0 auto;margin-top:10px">
			<!-- <div class="title">个人中心  &gt;&gt;  修改个人信息</div> -->
			<div style="margin-top:5px">
				 <form id="info" name="info" action="page_saveUserFront.action" method="post" style="width:100%;height:100%">    
				 <input type="hidden" name="user_id" value="${userFront.user_id}"/>
				 <table class="ptable" style="width:95%;margin-bottom:5px;">
					<tr>
			          <td width="15%" align="right" style="padding-right:5px"><font color="red">*</font> 用户名：</td>
			          <td width="35%" >
			          	${userFront.user_name}
			          </td>
			          <td width="15%" align="right" style="padding-right:5px">密码：</td>
			          <td width="35%">
			            <input type="password" id="user_pass" name="user_pass"  />
			          </td> 
			        </tr> 
			        <tr>
			          <td align="right" style="padding-right:5px"><font color="red">*</font> 姓名：</td>
			          <td>
			            <input type="text" name="real_name" id="real_name" value="${userFront.real_name}"/>
			          </td>
			          <td align="right" style="padding-right:5px"><font color="red">*</font> 昵称：</td>
			          <td>
			            <input type="text" name="nick_name" id="nick_name" value="${userFront.nick_name}"/>
			          </td> 
			        </tr>
			        <tr>
			          <td align="right" style="padding-right:5px"><font color="red">*</font> 性别：</td>
			          <td>
			            <input type="radio" id="sex1" name="user_sex" value="1"/>男&nbsp;&nbsp;
			            <input type="radio" id="sex2" name="user_sex" value="2"/>女
			          </td>
			          <td align="right" style="padding-right:5px">年龄：</td>
			          <td>
			            <input type="text" name="user_age" id="user_age" value="${userFront.user_age}"/>
			          </td>
			        </tr>    
			        <tr>
			          <td align="right" style="padding-right:5px"><font color="red">*</font> 联系方式：</td>
			          <td colspan="3">
			             <input type="text" id="user_mail" name="user_mail" value="${userFront.user_mail}"/>
			          </td>
			        </tr> 
			        <tr class="">
			          <td align="center" height="30" colspan="4">
			            <input type="button" id="saveBtn" Class="btnstyle" value="修 改"/>&nbsp;
			            <span style="color:red">${tip }</span>
			          </td>
			        </tr>
				 </table>
				 </form>
			</div>
		</div>
	 <!--  购物车 -->
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	 var user_sex = "${user.user_sex}";
	 if(user_sex!=''){
		 $("#sex"+user_sex).attr('checked','checked');
	 }else{
		 $("#sex1").attr('checked','checked');
	 }
	 
	 var num=/^\d+$/;
	 var Phone=/^\d{11}$/;
	 $("#saveBtn").bind('click',function(){
		if($("#real_name").val()==''){
			alert('姓名不能为空');
			return;
		}
		if($("#nick_name").val()==''){
			alert('昵称不能为空');
			return;
		}
		if(!num.exec($("#user_age").val())){
			alert('年龄必须为数字');
			return;
		}
		if(!Phone.exec($("#user_mail").val())){
			alert("联系电话必须为11位数字");
			return false;
		}
		var aQuery = $("#info").serialize();  
		$.post('page_saveUserFront.action',aQuery,
			function(responseObj) {
					if(responseObj.success) {	
						 alert('修改成功！');
					}else  if(responseObj.err.msg){
						 alert('失败：'+responseObj.err.msg);
					}else{
						 alert('失败：服务器异常！');
					}	
		 },'json');
		 
	 });
	
});	 
</script>
</body>
</html>