<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<title>我的影片订票</title>
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
<jsp:include page="top.jsp"><jsp:param name="menu" value="orders" /></jsp:include>
<div id="middle" style="height:calc(100% - 82px);">
	<div id="product_info" style="width:950px;margin:0 auto;margin-top:10px">
			<%--<div class="title">个人中心  &gt;&gt;  我的影片订票</div>
			--%><div style="margin-top:5px">
				 <table class="ptable" style="width:95%;margin-bottom:5px;">
					<tr class="head_text">
						 <td width="" align="center">订单编号</td>
					     <td width="" align="center">影片名称</td>
					     <td width="" align="center">播放日期</td>
					     <td width="" align="center">订票日期</td>
					     <td width="" align="center">放映场次</td>
					     <td width="" align="center">订票数量</td>
					     <td width="" align="center">座位号</td>
					     <td width="" align="center">当前状态</td>
					     <td width="" align="center">操作</td>
					</tr>
					<c:if test="${orderss!=null &&  fn:length(orderss)>0}">
   					   <c:forEach items="${orderss}" var="orders" varStatus="status">
					   <tr> 
					     <td width="" align="center">${orders.orders_id}</td>
					     <td width="" align="center">${orders.film_name}</td>
					     <td width="" align="center">${orders.film_date}</td>
					     <td width="" align="center">${orders.orders_date}</td>
					     <td width="" align="center">${orders.film_scene}<br/>${orders.film_room}</td>
					     <td width="" align="center">${orders.orders_count}</td>
					     <td width="" align="center">${orders.orders_seatDesc}</td>
					     <td width="" align="center">${orders.orders_flagDesc}</td>
					     <td width="" align="center">
					     	<c:if test="${orders.orders_flag==1}">
					     	<a id="cancelOrders_${orders.orders_id}" href="javascript:void(0)">退票</a>&nbsp;
					     	</c:if>
					     </td>
					   </tr> 
					   </c:forEach>
					</c:if>
				    <c:if test="${orderss==null ||  fn:length(orderss)==0}">
				    <tr>
				      <td height="60" colspan="12" align="center"><b>&lt;不存在影片订票信息&gt;</b></td>
				    </tr>
				    </c:if>
				 </table>
			</div>
			<div class="pages">
				<jsp:include page="page.jsp"></jsp:include>
			</div>
		</div>
	 <!--  购物车 -->
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
	  window.location.href="page_listMyOrderss.action?pageNo="+pagenum;
	}
	function ChangePage(pagenum)
	{
		window.location.href="page_listMyOrderss.action?pageNo="+pagenum;
	}
	$(document).ready(function(){
		$("a[id^='cancelOrders']").bind('click',function(){
		    if(confirm('确认退票吗!?'))
		    {
		    	var orders_id=$(this).attr('id').split('_')[1];
		    	var aQuery = {
						'orders_id':orders_id
				};  
				$.post('page_cancelOrders.action',aQuery,
					function(responseObj) {
							if(responseObj.success) {	
								 alert('退票成功！');
								 window.location.reload();
							}else  if(responseObj.err.msg){
								 alert('退票失败：'+responseObj.err.msg);
							}else{
								 alert('退票失败：服务器异常！');
							}	
				},'json');
		    }
		 });
		
	});
</script>
</body>
</html>