<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 影片详情</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/product.css">
<link rel="stylesheet" type="text/css" href="css/message.css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript">
 $(document).ready(function(){

	 //点击购票
	 var film_flag = "${film.film_flag}";
	 var user_id = "${userFront.user_id}";
	 var num = /^\d+$/;
	 $("#addOrders").bind('click',function(){
		 if(user_id==''){
			 alert('请先登录');
			 return;
		 }
		 if(film_flag=='1'){
			 alert('电影已过期，无法购买');
			 return;
		 }
		 if($("#film_scene2").val()==""){
			 alert('请选择场次');
			 return;
		 }
		 $("#info").submit();
		
	 });
	 
	 //选择色板
	 $("input[id^='selScene-']").bind('click',function(){
		 $("input[id^='selScene-']").css("border","1px solid #dbcdbd");
		 $(this).css("border","2px solid black");
		 var scene = $(this).val();
		 $("#film_scene2").val(scene);
	 });
}); 
</script>
<style type="text/css">
 body,td,div
 {
   font-size:12px;
 }
 
</style>
</head>
<body>
<jsp:include page="top.jsp"><jsp:param name="menu" value="film" /></jsp:include>
<div id="middleBg">
	<!--  产品检索介绍 -->
	 <div id="product_info">
			<div class="productShow">
					<div class="title">${film.film_name}</div>
					<div class="typehr"></div>
					<div class="pictext">
							<div class="pic"><img src="images/films/${film.film_pic}" width="250px" height="250px"/></div>
							<div class="text">
									<form name="info" id="info" action="page_addOrdersShow.action" method="post">
									<input type="hidden" name="film_id" id="film_id" value="${film.film_id}"/>
									<input type="hidden" name="film_scene2" id="film_scene2" value=""/>
									<div class="textTop" style="height:205px;">
											影片类型：<span style="color:black">${film.film_type_name}</span>
											<br/>电影票价：<span style="color:black">￥${film.film_price} 元</span>
<%--											<br/>平均分：<span style="color:black">${film.film_score}</span>--%>
											<br/>主要演员：<span style="color:black">${film.film_actors}</span>
											<br/>放映日期：<span style="color:black">${film.film_date}</span>
											<br/>影片时长：<span style="color:black">${film.film_duration}</span>
											<br/>放映场次：
											<c:forTokens items="09:00、11:00、13:00、15:00、17:00、19:00、 21:00、23:00" delims="、" var="scene">
											<c:if test="${fn:contains(film.film_scene,scene)}">
											<input type="button" id="selScene-${scene}" style="cursor:pointer;width:88px;height:30px;border:1px solid #dbcdbd;border-radius:5px" value="${scene}"/>
											</c:if>
											</c:forTokens>
											<br/>放映厅：<span style="color:black">${film.film_room}（平均评分：<span style="color:black">${film.film_score} 分）</span>
									</div>
									<div class="textBtn">
										<img id="addOrders" src="images/orderP.png" style="border:none;cursor:pointer;vertical-align:middle" width="120"/>&nbsp;&nbsp;
										<a href="#link"><img id="addVote" src="images/vote.png" style="border:none;cursor:pointer;vertical-align:middle" width="120px"/></a>
									</div>
									</form>
							</div>
					</div>
					<div class="typehr"></div>
					<div class="title">剧情介绍</div>
					<div class="typehr"></div>
					<div class="intro">
						${film.film_descShow}
					</div>
					
					<div class="typehr"></div>
					<div class="title">用户影评</div>
					<div class="typehr"></div>
					
					 <!-- 信息开始 -->
					 <c:if test="${sblogs!=null && fn:length(sblogs)>0}">
   					 <c:forEach items="${sblogs}" var="sblog" varStatus="status">
					 <div class="messages">
					 	<div class="messages_top">
							<div class="nickName">${sblog.nick_name}</div>
							<div class="time">
								${sblog.sblog_score} 分&nbsp;&nbsp;&nbsp;&nbsp;
								<%--<img src="images/time.gif" valign="middle"/>--%> 
								${fn:substring(sblog.sblog_date,0,19)}　
							</div>
						</div>
						<div class="messages_bottom">
							<div class="sblog_title">
								 ${sblog.sblog_content}
							</div>
						</div>
					 </div>
					 </c:forEach>
					 </c:if>
					<!-- 信息结束 -->
				
					 <jsp:include page="page.jsp"></jsp:include>
				
					 <!-- 发布留言 -->
					 <div id="addSblog" style="display:block">
					 <form name="info2" id="info2" action="page_addSblog.action" method="post">
					 <input type="hidden" name="user_id" id="paramsSblog.user_id" value="${userFront.user_id}"/>
					 <input type="hidden" name="film_id" id="paramsSblog.film_id" value="${film.film_id}"/>
					 <table class="reply_add">
							<tr>
								<td class="theme" colspan="4">发表影评：</td>
							</tr>
							<tr>
								<td align="right" width="18%">评论分数：</td>
								<td align="left" width="32%">
									<input type="radio" name="sblog_score" value="1" />1分
									<input type="radio" name="sblog_score" value="2" />2分
									<input type="radio" name="sblog_score" value="3" />3分
									<input type="radio" name="sblog_score" value="4" />4分
									<input type="radio" name="sblog_score" checked="checked"  value="5" />5分
								</td>
								<td align="left" colspan="2">
									验证码：
									<input type="text" id="paramsSblog.random" name="random" style="width:80px;" class="inputstyle"/>
									&nbsp;<img src="Random.jsp" width="50" valign="middle" style="cursor:pointer;vertical-align:middle" title="换一张" id="safecode" border="0" onClick="reloadcode()"/>
								</td>
							</tr>
							<tr>
								<td align="right" width="18%">评论内容：</td>
								<td align="left" width="32%"><textarea name="sblog_content" id="paramsSblog.sblog_content" style="width:220px;height:50px" class="inputstyle"></textarea></td>
								<td align="left" colspan="2">
									<input type="button" id="addBtn" class="btnstyle" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="reset" id="resetBtn" class="btnstyle" value="清空"/>
								</td>
							</tr>
					 </table>
					 </form>
					 </div>
					 <a name="link"></a>
			</div>

	 </div>
	 <!--  产品检索 -->
	 
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script type="text/javascript">
var film_id = "${film.film_id}";
function GoPage()
{
  var pagenum=document.getElementById("goPage").value;
  var patten=/^\d+$/;
  if(!patten.exec(pagenum))
  {
    alert("页码必须为大于0的数字");
    return false;
  }
  window.location.href="page_queryFilm.action?film_id="+film_id+"&pageNo="+pagenum;
}
function ChangePage(pagenum)
{
	  window.location.href="page_queryFilm.action?film_id="+film_id+"&pageNo="+pagenum;
}


var user_id = "${userFront.user_id}";
//实现验证码点击刷新
function reloadcode(){
	var verify=document.getElementById('safecode');
	verify.setAttribute('src','Random.jsp?'+Math.random());
}

$(document).ready(function(){
	$("#addBtn").bind("click",function(){
		if(user_id==''){
			alert('请先登录后在进行留言！')
			return;
		}
		if($("#paramsSblog\\.reply_content").val()==''){
			alert('留言内容不能为空！')
			return;
		}
		if($("#random").val()==''){
			alert('验证码不能为空！')
			return;
		}
		var aQuery = $("#info2").serialize();  
		$.post('page_addSblog.action',aQuery,
			function(responseObj) {
					if(responseObj.success) {	
						 alert('留言成功！');
						 window.location.reload();
					}else  if(responseObj.err.msg){
						 alert('留言失败：'+responseObj.err.msg);
					}else{
						 alert('留言失败：服务器异常！');
					}	
		},'json');
	});
});
</script>
</body>
</html>