<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="css/jquery.slideBox.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="js/jquery.slideBox.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript"> 
$(document).ready(function(){
	 $('#demo3').slideBox({
		duration : 0.3,//滚动持续时间，单位：秒
		easing : 'linear',//swing,linear//滚动特效
		delay : 5,//滚动延迟时间，单位：秒
		hideClickBar : false,//不自动隐藏点选按键
		clickBarRadius : 10
	});
	 
	 var user_id = "${userFront.user_id}";
	 var num = /^\d+$/;
	 $("input[id^='addOrders_']").bind('click',function(){
		 var film_id = $(this).attr("id").split("_")[1];
		 if(user_id==''){
			 alert('请先登录');
			 return;
		 }
		 window.location.href="page_addOrdersShow.action?film_id="+film_id;
		
	 });
});
</script>
<style type="text/css">
#film_nameTop{
	border:1px solid #21ba5c;width:80%;height:35px;border-radius:8px;margin-top:10px;
	background-image: url('images/serch.png');
    background-position: right 10px center;
    background-repeat: no-repeat;
    padding-right:50px;
}
#film_nameTop:active,#film_nameTop:focus{
   outline:none;
   box-shadow: none;
   border: 1px solid #CCCCCC;
}
#rightContent{
	width:960px;
	height:350px;
 	margin-top:10px;
	overflow:hidden;
 	border-radius:5px;
}
.info_con .products{
	height:430px;
	overflow:hidden;
}

.info_con  .product{
	float:left;
	width:228px;
	padding:5px;
	height:205px;
	overflow:hidden;
}

.info_con  .productPic{
	width:230px;
	text-align:center;
	height:130px;
	line-height:130px;
	overflow:hidden;
}

.info_con  .productPic img{
	width:180px;
	height:125px;
	border:0px;
	border-radius:8px;
}

.info_con  .productText{
	width:180px;
	text-align:left;
	padding-left:30px;
	line-height:25px;
	color:#A88D5A;
	text-overflow:ellipsis;
	overflow:hidden;
}

.info_con  .productText .title{
	color:black;
	font-weight:bold;
}
</style>
</head>
<body>
<jsp:include page="top.jsp"><jsp:param name="menu" value="home" /></jsp:include>
<div id="logo">
	    <div style="width:350px;height:70px;line-height:70px;float:right;">
	    	<form name="infoTop" id="infoTop" action="page_listFilms.action" method="post">
	    	<input type="text" id="film_nameTop" name="film_name" value="" style="" placeHolder=" 输入电影名称回车搜索"/>
	    	</form>
		</div>
</div>
<div id="middle">
	<div id="rightContent">
	    <div id="demo3" class="slideBox">
		  <ul class="items">
		    <li><a href="#" title="热门电影资源一"><img src="img/1.jpg"></a></li>
		    <li><a href="#" title="热门电影资源二"><img src="img/2.jpg"></a></li>
		    <li><a href="#" title="热门电影资源三"><img src="img/3.jpg"></a></li>
		    <li><a href="#" title="热门电影资源四"><img src="img/4.jpg"></a></li>
		    <li><a href="#" title="热门电影资源五"><img src="img/5.jpg"></a></li>
		  </ul>
		</div>
    </div>
</div>
<div id="middle" style="margin-top:5px;">
	<div id="info">
		<div class="titleBg">最新影片信息</div>
		<div class="info_con" style="width:956px;height:435px;">
			<div class="products">
				<c:if test="${films!=null && fn:length(films)>0}">
	 			<c:forEach items="${films}" var="film" varStatus="status">
				<div class="product" title="${film.film_name}">
					<div class="productPic"><a href="page_queryFilm.action?film_id=${film.film_id}"><img src="images/films/${film.film_pic}" /></a></div>
					<div class="productText"><span class="title">${film.film_name}</span>
					<br/>影片类型：${film.film_type_name}
				    <br/><input type="button" id="addOrders_${film.film_id}" class="btnstyle" value="点击购买" />
					</div>
				</div>
				</c:forEach>
	 			</c:if>
			</div>
		</div>
	</div>
</div>
<div id="middle" style="margin-top:5px;">
	<div id="info">
		<div class="titleBg">最新影城公告</div>
		<div class="info_con">
			<ul>
			  <c:forEach items="${infos}" var="info" varStatus="status">
			  <li>
				<div>
					<div class="info_text" style="width:440px;text-overflow:ellipsis;">
						<a href="page_queryInfo.action?info_id=${info.info_id}" target="_blank" title="${info.info_title}">
							${fn:length(info.info_title)>24 ? fn:substring(info.info_title,0,24) : info.info_title}
						</a>
					</div>
					<div class="info_time" style="width:180px">[ ${fn:substring(info.info_date,0,19)} ]</div>
				</div>
			  </li>
			  </c:forEach>
			</ul>
		</div>
	</div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>