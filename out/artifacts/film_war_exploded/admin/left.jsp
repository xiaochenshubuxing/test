<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<title>管理页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">  
<script src="js/prototype.lite.js" type="text/javascript"></script>
<script src="js/moo.fx.js" type="text/javascript"></script>
<script src="js/moo.fx.pack.js" type="text/javascript"></script>
<style type="text/css">
.left{width:190px; height:500px; overflow:auto;background-color:#EEF2FB}
table tr td{ font-size:12px; font-family:Arial, Helvetica, sans-serif;}
body {
	font:12px Arial, Helvetica, sans-serif;
	color: #000;
	background-color: #EEF2FB;
	margin: 0px;
}
#container {
	width: 160px;
}
H1 {
	font-size: 12px;
	margin: 0px;
	width: 160px;
	cursor: pointer;
	height: 30px;
	line-height: 20px;	
}
H1 a {
	display: block;
	width: 160px;
	height: 30px;
	color: white;
	text-decoration: none;
	moz-outline-style: none;
	background-repeat: no-repeat;
	line-height: 30px;
	text-align: center;
	margin: 0px;
	padding: 0px;
	margin-left:10px;
	margin-top:5px;
	background-color:#079d49;
	border-radius:5px;
}
.content{
	width: 160px;
	/*height: 26px;*/
	
}
.MM ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	display: block;
}
.MM li {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	list-style-type: none;
	display: block;
	text-decoration: none;
	height: 26px;
	width: 160px;
	padding-left: 0px;
	margin-left:10px;
}
.MM {
	width: 160px;
	margin: 0px;
	padding: 0px;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
	clip: rect(0px,0px,0px,0px);
}
.MM a:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 160px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	font-weight: bold;
	color: #006600;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	text-align: center;
	display: block;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 160px;
	text-decoration: none;
}
</style>
</head>

<body>
<table width="190" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr>
  	<td height="0" style="text-align:center; line-height:23px; color:#BEDFF1;font-weight:bold"></td>
  </tr>
  <tr>
    <td width="190" valign="top" style="background:#fff;">
    	<div class="left">
			 <table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
			  <tr>
				<td width="190" valign="top">
				<div id="container">
				  <h1 class="type"><a href="javascript:void(0)">个人信息中心</a></h1>
				  <div class="content">
					<ul class="MM">
					  <li><a href="modifyInfo.jsp" target="MainFrame">个人信息</a></li>
					  <li><a href="modifyPwd.jsp" target="MainFrame">修改密码</a></li>
					</ul>
				  </div>
				  <h1 class="type"><a href="javascript:void(0)">用户信息管理</a></h1>
				  <div class="content">
					<ul class="MM">
					  <li><a href="Admin_listUsers.action" target="MainFrame">用户查询</a></li>
					  <li><a href="Admin_addUserShow.action" target="MainFrame">新增用户</a></li>
					</ul>
				  </div>
				  <h1 class="type"><a href="javascript:void(0)">电影类型管理</a></h1>
				  <div class="content">
					<ul class="MM">
					  <li><a href="Admin_listFilmTypes.action" target="MainFrame">电影类型查询</a></li>
					  <li><a href="Admin_addFilmTypeShow.action" target="MainFrame">新增电影类型</a></li>
					</ul>
				  </div>
				  <h1 class="type"><a href="javascript:void(0)">电影信息管理</a></h1>
				  <div class="content">
					<ul class="MM">
					  <li><a href="Admin_listFilms.action" target="MainFrame">电影查询</a></li>
					  <li><a href="Admin_addFilmShow.action" target="MainFrame">新增电影</a></li>
					</ul>
				  </div>
				  <h1 class="type"><a href="javascript:void(0)">电影订票管理</a></h1>
				  <div class="content">
					<ul class="MM">
					  <li><a href="Admin_listOrderss.action" target="MainFrame">电影订票查询</a></li>
					</ul>
				  </div>
				  <h1 class="type"><a href="javascript:void(0)">电影评论管理</a></h1>
				  <div class="content">
					<ul class="MM">
					  <li><a href="Admin_listSblogs.action" target="MainFrame">电影评论查询</a></li>
					</ul>
				  </div>
				  <h1 class="type"><a href="javascript:void(0)">影城公告管理</a></h1>
				  <div class="content">
					<ul class="MM">
					  <li><a href="Admin_listInfos.action" target="MainFrame">影城公告查询</a></li>
					  <li><a href="Admin_addInfoShow.action" target="MainFrame">新增影城公告</a></li>
					</ul>
				  </div>
				  <h1 class="type"><a href="../page_index.action" target="_parent">退出当前账号</a></h1>
				  
					<script type="text/javascript">
						var contents = document.getElementsByClassName('content');
						var toggles = document.getElementsByClassName('type');
					
						var myAccordion = new fx.Accordion(
							toggles, contents, {opacity: true, duration: 400}
						);
						myAccordion.showThisHideOpen(contents[0]);
					</script>
				</div>
				</td>
			  </tr>
			</table>       	
        </div>
    </td>
  </tr>
</table>
</body>
</html>
