<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>主题页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<style type="text/css">
html,body{
	height:100%;
	margin:0px; 
	padding:0px; 
}
body{
	background:url(images/main_bg.jpeg) no-repeat;
	background-size:100% 100%;
}
</style>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="500px">
  <tr>
    <td height="23">&nbsp;</td>
  </tr>
  <tr>
    <td align="left" valign="top"><p style="padding-left:20px; padding-top:15px; text-indent:2em; line-height:24px; padding-right:30px; color:white;font-size:22px;">&gt;&gt;${admin.user_typeDesc}：${admin.real_name}，欢迎您登录使用电影城综合管理系统。</p></td>
  </tr>
</table>
</body>
</html>
