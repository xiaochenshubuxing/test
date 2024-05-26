<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>今日上映</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
$(document).ready(function(){
	$("#list").height(Math.max(document.documentElement.clientHeight-82,825));
}); 
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
<jsp:include page="top.jsp"><jsp:param name="menu" value="filmTop" /></jsp:include>
<div id="middleBg">
	<!--  产品检索展示 -->
	 <div id="product_info">
	 		<!--  产品列表 -->
	 		<form name="info" id="info" action="page_listFilms.action" method="post">
	 		<input type="hidden" id="pageNo" name="pageNo" value="${paperUtil.pageNo}"/>
			<div class="list">
					<div class="products">
					<c:if test="${films!=null &&  fn:length(films)>0}">
   					<c:forEach items="${films}" var="film" varStatus="status">
					<div class="product">
						<div class="productPic"><a href="page_queryFilm.action?film_id=${film.film_id}"><img src="images/films/${film.film_pic}" /></a></div>
						<div class="productText"><span class="title">${film.film_name}</span>
						<br/>影片类型：${film.film_type_name}
						<br/>影片票价：￥${film.film_price}
						<br/>上映日期：${film.film_date}
						</div>
					</div>
					</c:forEach>
					</c:if> 
					</div>
					

			</div>
			</form>
			<!--  产品列表 -->
			
	 </div>
	 <!--  产品检索展示 -->
	 
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
function GoPage()
{
  var pagenum=document.getElementById("goPage").value;
  var patten=/^\d+$/;
  if(!patten.exec(pagenum))
  {
    alert("页码必须为大于0的数字");
    return false;
  }
  document.getElementById("pageNo").value=pagenum;
  document.info.submit();
}
function ChangePage(pagenum)
{
	 document.getElementById("pageNo").value=pagenum;
	 document.info.submit();
}	 
function serch()
{
   document.info.action="page_listFilms.action";
   document.info.submit();
}
</script>
</body>
</html>