<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${film!=null && film.film_id!=0?'编辑':'添加'}电影信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script charset="utf-8" src="editor2/kindeditor-all-min.js"></script>
<script charset="utf-8" src="editor2/lang/zh-CN.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	
	 var num = /^\d+(\.\d+)?$/;
	 $("#addBtn").bind('click',function(){
		 editor.sync();
		if($("#film_name").val()==''){
			alert('影片名称不能为空');
			return;
		}
		if($("#film_pic").val()==''){
			alert('电影图片不能为空');
			return;
		}
		if($("#film_type_id").val()=='0'){
			alert('电影类型不能为空');
			return;
		}
		if(!num.exec($("#film_price").val())){
			alert('电影票价必须为数字');
			return;
		}
		if($("#film_date").val()==''){
			alert('放映日期不能为空');
			return;
		}
		if(!validScene()){
			return false;
		}
		if($("#noticeContent").val()==''){
			alert('剧情介绍不能为空');
			return;
		}
		$("#film_id").val(0);
		$("#info").attr('action','Admin_addFilm.action').submit();
		 
	 });
	 
	 $("#editBtn").bind('click',function(){
		 editor.sync();
		    if($("#film_name").val()==''){
				alert('影片名称不能为空');
				return;
			}
			if($("#film_pic").val()==''){
				alert('电影图片不能为空');
				return;
			}
			if($("#film_type_id").val()=='0'){
				alert('电影类型不能为空');
				return;
			}
			if(!num.exec($("#film_price").val())){
				alert('电影票价必须为数字');
				return;
			}
			if($("#film_date").val()==''){
				alert('放映日期不能为空');
				return;
			}
			if(!validScene()){
				return false;
			}
			if($("#noticeContent").val()==''){
				alert('剧情介绍不能为空');
				return;
			}
			$("#info").attr('action','Admin_saveFilm.action').submit();
			 
	});
	
	function validScene(){
		var film_scene = "";
		$("input[name='film_scenes']").each(function(){
			if($(this).is(':checked')){
				if(film_scene==""){
					film_scene = $(this).val();
				}else{
					film_scene += ","+$(this).val();
				}
			}
		});
		if(film_scene==""){
			alert("请设置放映场次");
			return false;
		}
		$("#film_scene").val(film_scene);
		return true;
	}
});
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">电影管理&gt;&gt;${film!=null && film.film_id!=0?'编辑':'添加'}电影</span>
</div>
<form id="info" name="info" action="Admin_addFilm.action" method="post">   
<input type="hidden" id="film_id" name="film_id" value="${film.film_id}" /> 
<input type="hidden" name="film_pic" id="film_pic" value='${film.film_pic}'/>
<table width="800" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
  <tr> 
     <td height="24">
       <Table border="0" cellspacing="0" cellpadding="0" align="center" width="100%"> 
            <TR>
              <TD height="24" class="edittitleleft">&nbsp;</TD>
              <TD class="edittitle">${film!=null && film.film_id!=0?'编辑':'添加'}电影</TD>
              <TD class="edittitleright">&nbsp;</TD>
            </TR>
        </TABLE>
     </td>
   </tr>
   <tr>
     <td height="1" bgcolor="#8f8f8f"></td>
   </tr>
   <tr>
     <td >
     <table width="100%" align="center" cellpadding="1" cellspacing="1" class="editbody">
        <tr>
          <td width="150" align="right" style="padding-right:5px"><font color="red">*</font> 影片名称：</td>
          <td width="*">
          	<input type="text" name="film_name" id="film_name" value="${film.film_name}"/>
          </td>
        </tr> 
        <tr>
		  <td align="right" style="padding-right:5px">电影图片：</td>
		  <td align="left" colspan="3">
		    <img id="userImg" src="../images/films/${film.film_pic}" width="70" height="80" style="border:0px;"/>
	        &nbsp;<span id="op" style="display:none"><img src="images/loading004.gif"  height="80" /></span>
	      </td>
	    </tr>
	    <tr>
		  <td align="right" style="padding-right:5px"></td>
	      <td align="left" colspan="3">
	          <iframe name="uploadPage" src="uploadImg.jsp" width="100%" height="50" marginheight="0" marginwidth="0" scrolling="no" frameborder="0"></iframe>            
	       </td>
	    </tr>
        <tr>
          <td  align="right" style="padding-right:5px"><font color="red">*</font> 电影类型：</td>
          <td >
          	<select name="film_type_id" id="film_type_id" style="width:155px">
		      	  <option value="0">请选择</option> 
			      <c:forEach items="${filmTypes}" var="filmType">
			      <option ${filmType.film_type_id==film.film_type_id?'selected':''} value="${filmType.film_type_id}">${filmType.film_type_name}</option> 
			      </c:forEach>
			  </select>
          </td>
        </tr> 
        <tr>
          <td  align="right" style="padding-right:5px"><font color="red">*</font> 电影票价：</td>
          <td >
          	<input type="text" name="film_price" id="film_price" value="${film.film_price}"/>
          </td>
        </tr> 
        <tr>
          <td  align="right" style="padding-right:5px">主要演员：</td>
          <td >
          	<input type="text" name="film_actors" id="film_actors" value="${film.film_actors}"/>
          </td>
        </tr>
        <tr>
          <td  align="right" style="padding-right:5px"><font color="red">*</font> 放映日期：</td>
          <td >
          	<input type="text" name="film_date" id="film_date" value="${film.film_date}"
          	 						onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/>
          </td>
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 放映场次：</td>
          <td>
			<input type="hidden" id="film_scene" name="film_scene" value="${film.film_scene}" /> 
            <c:forTokens items="09:00、11:00、13:00、15:00、17:00、19:00、 21:00、23:00" delims="、" var="scene">
          	<input type="checkbox" name="film_scenes" value="${scene}" ${fn:contains(film.film_scene,scene)?'checked':''} />${scene}&nbsp;&nbsp;
            </c:forTokens>
          </td>
        </tr>
         <tr>
          <td width="35%" align="right" style="padding-right:5px"><font color="red">*</font> 放映厅：</td>
          <td width="65%">
          	  <select name="film_room" id="film_room" style="width:155px">
		      	  <c:forTokens items="1号放映厅、2号放映厅、3号放映厅、4号放映厅、5号放映厅" delims="、" var="room">
			      <option ${room==film.film_room?'selected':''} value="${room}">${room}</option> 
			      </c:forTokens> 
			  </select>
          </td>
        </tr> 
        <tr>
          <td  align="right" style="padding-right:5px"><font color="red">*</font>剧情介绍：</td>
          <td >
          	<textarea style="width:500px;height:350px" name="film_desc" id="noticeContent">${film.film_desc}</textarea>
          </td>
        </tr>
     </table>
     </td>
   </tr>  
   <tr>
     <td>
       <table width="100%" align="center" cellpadding="0" cellspacing="0" class="editbody2">
        <tr>
          <td align="center" height="30">
          	<c:if test="${film!=null && film.film_id!=0}">
          	<input type="button" id="editBtn" Class="btnstyle" value="编 辑"/> 
          	</c:if>
          	<c:if test="${film==null || film.film_id==0}">
          	<input type="button" id="addBtn" Class="btnstyle" value="添 加" />
          	</c:if>
            &nbsp;<label style="color:red">${tip}</label>
          </td>
        </tr>
      </table>
     </td>
   </tr>
</table>
</form>
<script>        
KindEditor.ready(function(K) {
	window.editor = K.create('#noticeContent',{
		width : '95%',
		items:[
			'fullscreen','|','justifyleft', 'justifycenter', 'justifyright','justifyfull',
			'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
			'italic', 'underline','anchor', 'link', 'unlink', '|', 'image', 'plainpaste'
		],
		uploadJson : 'editor2/jsp/upload_json.jsp',
        fileManagerJson : 'editor2/jsp/file_manager_json.jsp',
        allowFileManager : true

	});
});
</script>
</body>
</html>