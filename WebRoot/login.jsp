<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<title>用户登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css">
<%--<script  type="text/javascript" charset="UTF-8" ></script>--%>
<script type="text/javascript" src="js/jquery-1.7.1.min.js" charset="UTF-8" ></script>
<%--&lt;%&ndash;<script  type="text/javascript" charset="UTF-8" >&ndash;%&gt;</script>--%>
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
       height:110px;
       line-height:110px;
       font-size:34px;
       font-family: "SimHei";
       color:#E60113;
       text-align: center;
       background-image: url('images/logintxt.png');
       background-repeat: no-repeat;
       background-position:50px center;
   }
   .ltloginCon{
       width:305px;
       height:110px;
       line-height:55px;
       float:left;
       margin-left:65px;
       margin-top:20px;
       font-size:16px;
       overflow:hidden;
   }
   .ltloginBtn{
       width:306px;
       height:60px;
       float:left;
       margin-left:65px;
       margin-top:50px;
   }
   #user_nameTop{
       background-image: url('images/ltdlk1.png');
       background-position: 10px center;
       background-repeat: no-repeat;
       padding-left:50px;
       border-radius: 0px;
       border: 0px;
       border-bottom: 1px solid #CCCCCC;
   }
   #user_passTop{
       background-image: url('images/ltdlk2.png');
       background-position: 10px center;
       background-repeat: no-repeat;
       padding-left:50px;
       border-radius: 0px;
       border: 0px;
       border-bottom: 1px;
       border-bottom: 1px solid #CCCCCC;
   }
   .form-control:focus,#loginInBtn:focus,#loginInBtn:active {
   	   outline:none;
       box-shadow: none;
       border-color: transparent; 
       border-bottom: 1px solid #CCCCCC;
   }
   #middle{
   	   background-image: url('images/user_login.jpg');
       background-repeat: no-repeat;
       background-size:100% 100%;
   }
</style>
</head>
<body>
<jsp:include page="top.jsp"><jsp:param name="menu" value="login" /></jsp:include>
<div id="middle" style="height:calc(100% - 87px);width:100%;align-items: center; display: flex;">
	<div style="width:400px;height:399px;margin:0 auto;border:1px solid #F04844;border-radius:20px;;background-color: rgba(255, 255, 255, .8);">
           <div class="ltloginTitle"></div>
           <div class="ltloginCon">
                   <div class="form-group" style="">
                       <input type="text" id="user_nameTop" placeholder="请输入登录账号" style="width:220px;height:40px" class="form-control">
                   </div>
                   <div class="form-group" style="">
                       <input type="password" id="user_passTop" placeholder="请输入登录密码" style="width:220px;height:40px" class="form-control">
                   </div>
           </div>
           <div class="ltloginBtn">
               <button id="loginInBtn" class="btnstyle" style="width:100%;height:45px"> 登 录 </button>
               <br/><br/>新用户? 点击 <a style="color:blue" href="reg.jsp">注册</a> 进行账户注册.
           </div>
	</div>
</div>

<jsp:include page="bottom.jsp"></jsp:include>
<%--<script type="text/javascript" charset="UTF-8"  >--%>
<%--//实现验证码点击刷新--%>
<%--// function reloadcode(){--%>
<%--// 	var verify=document.getElementById('safecode');--%>
<%--// 	verify.setAttribute('src','Random.jsp?'+Math.random());--%>
<%--// }--%>
<%--$(document).ready(function(){--%>

<%--});--%>
<%--</script>--%>
</body>
</html>