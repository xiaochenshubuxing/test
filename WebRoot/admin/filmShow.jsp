<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>电影信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
var tempClassName="";
function tr_mouseover(obj) 
{ 
	tempClassName=obj.className;
	obj.className="list_mouseover";
}
function tr_mouseout(obj)      
{ 
	obj.className=tempClassName;
}      
function CheckAll(obj) 
{
	var checks=document.getElementsByName("chkid");
    for (var i=0;i<checks.length;i++)
	{
	    var e = checks[i];
	    e.checked = obj.checked;
	}
    
}


function serch()
{
   document.info.action="Admin_listFilms.action";
   document.info.submit();
}
function del()
{
	var checks=document.getElementsByName("chkid");
    var ids="";
	for (var i=0;i<checks.length;i++)
    {
        var e = checks[i];
		if(e.checked==true)
		{
		  if(ids=="")
		  {
		    ids=ids+e.value;
		  }
		  else
		  {
		    ids=ids+","+e.value;
		  }
		}
    }
    if(ids=="")
    {
       alert("请至少选择一个要删除的电影！");
       return false;
    }
    if(confirm('确认删除吗!?'))
    {
       document.info.action="Admin_delFilms.action?ids="+ids;
       document.info.submit();
    }
    
}
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
  document.info.action="Admin_listFilms.action";
  document.info.submit();
}
function ChangePage(pagenum)
{
  document.getElementById("pageNo").value=pagenum;
  document.info.action="Admin_listFilms.action";
  document.info.submit();
}
</script>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">电影管理&gt;&gt;电影查询</span>
</div>
<form name="info" id="info" action="Admin_listFilms.action" method="post">
<input type="hidden" name="pageNo" id="pageNo" value="${paperUtil.pageNo}"/>
<table width="95%" align="center" cellpadding="0" cellspacing="0">
  <tr><td colspan="2" height="10px">&nbsp;</td></tr>
  <tr>
    <td width="">电影列表</td>
    <td width="" align="right">
            影片名称：
      <input type="text" id="paramsFilm.film_name" name="film_name" value="${paramsFilm.film_name}" class="inputstyle" Style="width:100px;"/>&nbsp;
            电影类型：
      <select name="film_type_id" id="film_type_id" class="selectstyle" style="width:100px">
      	  <option value="0">请选择</option> 
	      <c:forEach items="${filmTypes}" var="filmType">
	      <option ${filmType.film_type_id==paramsFilm.film_type_id?'selected':''} value="${filmType.film_type_id}">${filmType.film_type_name}</option> 
	      </c:forEach>
	  </select>&nbsp;
            主要演员：
      <input type="text" id="paramsFilm.film_actors" name="film_actors" value="${paramsFilm.film_actors}" class="inputstyle" Style="width:100px;"/>&nbsp;&nbsp;
      <input type="button" value="搜索" onclick="serch();" class="btnstyle"/>&nbsp;
      <input type="button" value="删除" onclick="del();" class="btnstyle"/>
    </td>
  </tr>
  <tr><td colspan="2" height="2px"></td></tr>  
</table>
<table width="95%" align="center" class="table_list" cellpadding="0" cellspacing="0">
   <tr class="listtitle">
     <td width="40" align="center"><input type="checkbox" onclick="CheckAll(this);" style="vertical-align:text-bottom;" title="全选/取消全选"/></td>
     <td width="40" align="center">序号</td>
     <td width="" align="center">影片名称</td>
     <td width="" align="center">电影类型</td>
     <td width="" align="center">主要演员</td>
     <td width="" align="center">电影票价</td>
     <td width="" align="center">放映日期</td>
     <td width="" align="center">放映场次</td>
     <td width="" align="center">放映厅</td>
     <td width="" align="center">平均评分</td>
     <td width="" align="center">操作</td>
   </tr>
   <c:if test="${films!=null &&  fn:length(films)>0}">
   <c:forEach items="${films}" var="film" varStatus="status">
   <tr class="list0" onmouseover="tr_mouseover(this)" onmouseout="tr_mouseout(this)"> 
     <td width="" align="center"><input type="checkbox" name="chkid" value="${film.film_id}" style="vertical-align:text-bottom;"/></td>
     <td width="" align="center">${status.index+1}</td>
     <td width="" align="center">${film.film_name}</td>
     <td width="" align="center">${film.film_type_name}</td>
     <td width="" align="center">${film.film_actors}</td>
     <td width="" align="center">￥${film.film_price}</td>
     <td width="" align="center">${film.film_date}</td>
     <td width="" align="center">${film.film_scene}</td>
     <td width="" align="center">${film.film_room}</td>
     <td width="" align="center">${film.film_score}</td>
     <td width="" align="center">
       <a href="Admin_queryFilm.action?film_id=${film.film_id}">详情</a>&nbsp;&nbsp;
       <a href="Admin_editFilm.action?film_id=${film.film_id}">编辑</a>
     </td>
   </tr> 
   </c:forEach>
   </c:if>
   <c:if test="${films==null ||  fn:length(films)==0}">
   <tr>
     <td height="60" colspan="12" align="center"><b>&lt;不存在电影信息&gt;</b></td>
   </tr>
   </c:if>
   
</table>
<jsp:include page="page.jsp"></jsp:include>
</form> 
</body>
</html>