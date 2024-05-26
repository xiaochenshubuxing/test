<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<title>影城公告</title>
<meta http-equiv="X-UA-Compatible" content="IE=8"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/info.css">
<script language="javascript" type="text/javascript" src=""></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
	$(function(){
		$("#list").height(document.documentElement.clientHeight-82);
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
<jsp:include page="top.jsp"><jsp:param name="menu" value="info" /></jsp:include>
<div id="middle">
	<form name="info" id="info" action="page_listInfos.action" method="post" style="width:695px;height:100%">
	<input type="hidden" name="pageNo" id="pageNo" value="${paperUtil.pageNo}"/>
	<div id="list">
		 <div class="nav">
		    <div class="nav1">当前位置: 主页 > 影城公告 </div>
		 	<div class="nav2">　　　
		 	     标题：
			  <input type="text" style="width:155px" id="pot_title" name="info_title" value="${paramsInfo.info_title}" class="inputstyle"/>&nbsp;
		 	<input type="button" value="搜索" onclick="serch();" class="btnstyle"/>
		 	</div>
		 </div>
		 <div class="list_info">
			<ul>
				<c:forEach items="${infos}" var="info" varStatus="status">
				<li>
					<div class="info_text" style="text-overflow:ellipsis;">
					<img src="images/ico-1.gif" />&nbsp;&nbsp;<a href="page_queryInfo.action?info_id=${info.info_id}" target="_blank" title="${info.info_title}"> 
						${info.info_title}
					</a>　
					</div>
					<div class="info_time">${fn:substring(info.info_date,0,19)}</div>
				</li>
				</c:forEach>
			</ul>
		 </div>
		 <jsp:include page="page.jsp"></jsp:include>
	</div>
	</form>
	<div id="Picture"></div>
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
   var num = /^\d+(\.\d+)?$/;
   document.info.action="page_listInfos.action";
   document.getElementById("pageNo").value=1;
   document.info.submit();
}
</script>
</body>
</html>