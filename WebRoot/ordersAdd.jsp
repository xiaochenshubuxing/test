<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<title>在线选座</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/reg.css">
<link rel="stylesheet" type="text/css" href="css/info.css">
<script language="javascript" type="text/javascript" src=""></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
	 
	
</script>
<style type="text/css">
 body,td,div
 {
   font-size:12px;
 }
  html,body{
 	height:100%;
 }
 .seatClass{
 	cursor:pointer;
 	vertical-align:middle
 }
</style>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<div id="middle" style="height:calc(100% - 82px);">
	<div id="list">
		 <div class="nav">当前位置: 主页 > 在线选座订票 </div>
		 <div class="list_info">
		 	 <form name="info" id="info" style="width:100%;height:450px" action="page_addOrders.action" method="post">
		     <input type="hidden" name="user_id" id="buyId" value="${userFront.user_id}"/>
			 <input type="hidden" name="film_id" id="film_id" value="${film.film_id}"/>
			 <input type="hidden" name="film_scene" id="film_scene" value="${film.film_scene2}"/>
			 <input type="hidden" name="orders_seat" id="orders_seat" value=""/>
			 <table class="regTable">
				<tr>
					<td class="theme" colspan="2">
						放映场次：${film.film_scene2}（${film.film_room}），请选择预定的座位：
						<img src="images/seat1.jpg" style="vertical-align:middle"/>空座&nbsp;&nbsp;
						<img src="images/seat2.jpg" style="vertical-align:middle"/>已预定&nbsp;&nbsp;
						<img src="images/seat3.jpg" style="vertical-align:middle"/>已选
					</td>
				</tr>
				<tr>
					<td align="center" width="20"  style="line-height:35px">
					    <c:forEach begin="0" end="8" varStatus="status">
						${status.index+1}排
						<br/>
						</c:forEach>
					</td>
					<td align="center" width="*" style="line-height:35px">
						<c:forEach begin="0" end="8" varStatus="i">
						<c:forEach begin="0" end="15" varStatus="j">
						<c:set var="i2" value="${i.index+1}" />
						<c:set var="j2" value="${j.index+1}" />
						<c:set var="ij" value="${i2}-${j2}" />
						<c:if test="${seatMap[ij]!=null}">
						<img src="images/seat2.jpg" style="vertical-align:middle"/>&nbsp;&nbsp;
						</c:if>
						<c:if test="${seatMap[ij]==null}">
						<img class="seatClass" title="${i2}排 ${j2}座" 
							id="seat_${i2}-${j2}" src="images/seat1.jpg"/>&nbsp;&nbsp;
						</c:if>
						</c:forEach>
						<br/>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="button" id="addBtn" class="btnstyle" value="提交订票"/>
					</td>
				</tr>
		 	 </table>
		 	 </form>
		 </div>
		 
	</div>
	<div id="Picture"></div>
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
	var orders_seat = $("#orders_seat");
	var seats="";
	addBtn.bind("click",function(){
		getSeats();
		orders_seat.val(seats);
		if(orders_seat.val()==''){
			alert("请选择座位");
			return;
		}
		var aQuery = $("#info").serialize();  
		$.post('page_addOrders.action',aQuery,
			function(responseObj) {
					if(responseObj.success) {	
						 alert('订票成功,请如期到达影城观看影片！');
						 window.location.href="page_listMyOrderss.action";
					}else  if(responseObj.err.msg){
						 alert('失败：'+responseObj.err.msg);
					}else{
						 alert('失败：服务器异常！');
					}	
		 },'json');
	});
	
	$("img[id^='seat_']").bind('click',function(){
		var seatNow = $(this);
		var seatImg = seatNow.attr('src');
		if(seatImg.indexOf('seat1.jpg')!=-1){
			seatNow.attr('src',seatImg.replace('seat1','seat3'));
		}else{
			seatNow.attr('src',seatImg.replace('seat3','seat1'));
		}
	});
	
	function getSeats(){
		seats="";
		$("img[id^='seat_']").each(function(){
			var seatNow = $(this);
			var seatImg = seatNow.attr('src');
			if(seatImg.indexOf('seat3.jpg')!=-1){
				if(seats==''){
					seats=seatNow.attr('id').split('_')[1];
				}else{
					seats=seats+","+seatNow.attr('id').split('_')[1];
				}
			}
		});
	}
});
</script>
</body>
</html>