<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<title>用户注册</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script language="javascript" type="text/javascript" src=""></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
	
</script>
<style type="text/css">
 body{
 }
 html,body{
 	height:100%;
 }
 body,td,div
 {
   font-size:12px;
 }
 .ltloginTitle{
     width:100%;
     height:60px;
     line-height:60px;
     font-size:34px;
     font-family: "SimHei";
     color:#E60113;
     text-align: center;
     background-image: url('images/logintxt2.png');
     background-repeat: no-repeat;
     background-position:200px center;
 }
 .ltloginCon{
     width:635px;
     height:270px;
     float:left;
     margin-left:65px;
     font-size:16px;
     overflow:hidden;
 }
 .ltloginBtn{
       width:635px;
       height:45px;
       float:left;
       margin-top:5px;
       text-align:center;
  }
 .form-group{
    width:250px;
    height:50px;
    line-height:50px;
    float:left;
    margin-left:20px;
 }
 .form-control {
 	   width:180px;height:35px;
 	   background-image: url('images/ltdlk1.png');
       background-position: 10px center;
       background-repeat: no-repeat;
   	   padding-left:50px;
       border-radius: 0px;
       border: 0px;
       border-bottom: 1px solid #CCCCCC;
  }
  .form-control:focus,#addBtn:focus,#addBtn:active {
   	   outline:none;
       box-shadow: none;
       border-color: transparent; 
       border-bottom: 1px solid #CCCCCC;
   }
   #middle{
   	   background-image: url('images/user_reg.jpg');
       background-repeat: no-repeat;
       background-size:100% 100%;
   }
</style>
</head>
<body>
<jsp:include page="top.jsp"><jsp:param name="menu" value="login" /></jsp:include>
<div id="middle" style="height:calc(100% - 87px);width:100%;overflow-x:no;overflow-y:auto">
	<div style="width:680px;height:418px;margin: 0 auto;margin-top:120px;border:1px solid #F04844;border-radius:20px;background-color: rgba(255, 255, 255, .8);">
		   <form name="info" id="info" style="width:100%;height:450px" action="LoginRegSystem.action" method="post">
		   <input type="hidden" id="user_sex" name="user_sex" value="1" /> 
           <div class="ltloginTitle"></div>
           <div class="ltloginCon">
                   <div class="form-group" style="">
                       <input type="text" id="user_name" name="user_name" placeholder="请输入用户名" style="" class="form-control"><span style="color:red">*</span> 
                   </div>
                   <div class="form-group" style="">
                       <input type="text" id="user_mail" name="user_mail" placeholder="请输入电话" style="background-image: url('images/phone.png');" class="form-control"><span style="color:red">*</span> 
                   </div>
                   <div class="form-group" style="">
                       <input type="password" id="user_pass" name="user_pass" placeholder="请输入密码" style="background-image: url('images/ltdlk2.png');" class="form-control"><span style="color:red">*</span> 
                   </div>
                   <div class="form-group" style="">
                        <input type="text" id="nick_name" name="nick_name" placeholder="请输入昵称"  style="background-image: url('images/nick.png');" class="form-control">
                   </div>
                   <div class="form-group" style="">
                       <input type="text" id="user_age" name="user_age" placeholder="请输入年龄" style="background-image: url('images/age.png');" class="form-control"><span style="color:red">*</span> 
                   </div>
                   <div class="form-group" style="">
                        <input type="text" id="random" name="random"  placeholder="请输验证码"  style="width:80px;background-image: url('images/random.png');" class="form-control"/>
						&nbsp;<img src="Random.jsp" width="80" valign="middle" style="cursor:pointer;vertical-align:middle" title="换一张" id="safecode" border="0" onClick="reloadcode()"/>
                   </div>
                   <div class="form-group" style="">
                       <input type="text" id="real_name" name="real_name" placeholder="请输入姓名" style="" class="form-control"><span style="color:red">*</span>
                   </div>
           </div>
           <div class="ltloginBtn">
               <input type="button" id="addBtn" class="btnstyle" style="width:300px;height:45px" value=" 注 册 "/>
           </div>
           </form>
	</div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
//实现验证码点击刷新
function reloadcode(){
	var verify=document.getElementById('safecode');
	verify.setAttribute('src','Random.jsp?'+Math.random());
}
$(document).ready(function(){
	var addBtn = $("#addBtn");
	var user_name = $("#user_name");
	var user_pass = $("#user_pass");
	var user_rpass = $("#user_rpass");
	var real_name = $("#real_name");
	var nick_name = $("#nick_name");
	var user_phone = $("#user_mail");
	var nick_name = $("#nick_name");
	var random = $("#random");

    console.log("xxxxxxxx")
    console.log(user_name,user_pass,real_name,user_phone,nick_name)
	
	var name=/^[a-z][a-z0-9_]{3,15}$/;
    var pass=/^[a-zA-Z0-9]{3,15}$/;
    var email=/^[\w]+[@]\w+[.][\w]+$/;
    var Phone=/^\d{11}$/;
    var num= /^\d+$/;
	addBtn.bind("click",function(){
		
		if(user_name.val()==''||user_pass.val()==''){
			alert("用户名或密码不能为空");
			return false;
		}
		/*
		if(!name.exec(user_name.val())){
			window.alert("用户名必须为字母开头 、字母数字4-16位！");
			return false;
		}
		if(!pass.exec(user_pass.val())){
			window.alert("密码必须为字母数字4-16位！");
			return false;
		}
		
		
		if(user_pass.val()!=user_rpass.val()){
			alert("两次输入密码不一致");
			return false;
		}*/
		if(!num.exec($("#user_age").val())){
			alert('年龄必须为数字');
			return;
		}
		if(real_name.val()==''){
			alert("姓名不能为空");
			return false;
		}
		if(!Phone.exec(user_phone.val())){
			alert("联系电话必须为11位数字");
			return false;
		}
		if(nick_name.val()==''){
			alert("昵称不能为空");
			return false;
		}
		if(random.val()==''){
			alert("验证码不能为空");
			return false;
		}
		var aQuery = $("#info").serialize();  
		$.post('LoginRegSystem.action',aQuery,
			function(responseObj) {
					if(responseObj.success) {	
						 alert('注册成功！');
						 window.location.href="login.jsp";
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