
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>电影城综合管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript">

</script>
<style type="text/css">
 body,td,div
 {
   font-size:15px;
 }
 html,body{
 	height:100%;
 	overflow:hidden;
 }
 body{
 	background-image:url('images/login_bg.jpg');
 	background-repeat:no-repeat;
 	background-size:100% 100%;
 }
 .loginDiv{
 	width:500px;height:300px;line-height:40px;overflow:hidden;
 	position:absolute;
	 left:50%;
	 transform: translateX(-50%);
 	top:150px;
 	padding:10px;
 	font-weight:bold;
    box-shadow: 0 4px 8px 20px rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    background-color: rgba(255, 255, 255, .4);
    /*设置负值，为要定位子盒子的一半高度*/
    border: solid #fff 1px;
    border-radius: 8px 8px 8px 8px;
    filter:alpha(Opacity=80);
    -moz-opacity:0.8;
    opacity: 0.8;
	 text-align: center
 }
 .title-box {
	position:absolute;
 	top:80px;
 	 left:36%;
    width: 500px;
    height: 50px;
    line-height: 30px;
    font-size:32px;
    font-weight:bold;
    font-family: "SimHei";
    letter-spacing: 10px;
    color: #45BA4D;
}
</style>
</head>
<BODY>
<FORM id="info" name="info"  method="post" action="LoginInSystem.action">
<div class="title-box"><img src="images/film.png" style="vertical-align:middle;width:45px"/> 电影城综合管理系统</div>
<div class="loginDiv">
	<br/>　登录账户：<INPUT type="text" id="params.user_name" name="manager_name" value="${params.manager_name}" style="WIDTH: 180px">
	<br/>　登录密码：<INPUT type="password"  id="params.user_pass" name="manager_pass" value="${params.manager_pass}" style="WIDTH: 180px">
<%--	<br/>　验 &nbsp;证 &nbsp;码：<INPUT type="text"  id="params.random" name="random" style="WIDTH: 110px" />--%>
<%--								<img src="Random.jsp" width="50" valign="middle" style="cursor:pointer;vertical-align:middle" title="换一张" id="safecode" border="0" onClick="reloadcode()"/>--%>
	<br/>　　　　　　<input type="button" id="loginInBtn" class="btnstyle" value="登录系统" style="width:100px;height:30px;font-size:16px;    margin-left: -100px;
    margin-top: 15px"/>
	<br/><span id="loginTip" style="color:orange">${tip}</span>
</div>
</FORM>
<script  type="text/javascript"  charset="UTF-8" >
	//实现验证码点击刷新
	// function reloadcode(){
	// 	var verify=document.getElementById('safecode');
	// 	verify.setAttribute('src','Random.jsp?'+Math.random());
	// }

	$(document).ready(function(){
		var loginInBtn = $("#loginInBtn");
		var user_name = $("#params\\.user_name");
		var user_pass = $("#params\\.user_pass");
		var random = $("#params\\.random");
		var loginTip = $("#loginTip");

		loginInBtn.bind('click',function(){
			if(user_name.val()==''||user_pass.val()==''||random.val()==''){
				loginTip.html("用户名、密码和验证码不能为空！")
				return;
			}
			$("#info").submit();

		});
	});
</script>
</BODY>
</HTML>
