<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<div id="top">
	<div id="navMenu">
		<ul>
			 <li class="${param.menu==null || param.menu=='home'?'hover':''}"><a href="page_index.action">主 页 </a></li>
	  		 <li class="${param.menu=='filmTop'?'hover':''}"><a href="page_listFilmsTop.action">今日上映  </a></li>
	  		 <li class="${param.menu=='film'?'hover':''}"><a href="page_listFilms.action">影片资源  </a></li>
	  		 <li class="${param.menu=='info'?'hover':''}"><a href="page_listInfos.action">影城公告 </a></li>
	  		 <c:if test="${userFront!=null}">
	  		 <li class="${param.menu=='orders'?'hover':''}"><a href="page_listMyOrderss.action">我的订单 </a></li>
	  		 </c:if>
		</ul>
	</div>
	<div id="navMenu2">
		<ul>
		    <c:if test="${userFront==null}">
			<li class="${param.menu=='login'?'hover':''}"><a href="login.jsp" title="用户登录"><img src="images/logodl.png" style="width:20px;height:20px;vertical-align:middle"/></a></li>
			</c:if>
		    <c:if test="${userFront!=null}">
		    <li class="${param.menu=='self'?'hover':''}"><a href="myInfo.jsp" title="个人信息"><img src="images/self.png" style="width:20px;height:20px;vertical-align:middle"/></a></li>
			<li><a  id="loginOutBtn" href="javascript:void(0)" title="退出登录" > <img src="images/logotc.png" style="width:20px;height:20px;vertical-align:middle;"/></a></li>
			</c:if>
		</ul>

		<ul>
			<c:if test="${userFront==null}">
				<li class="${param.menu=='login'?'hover':''}"><a href="admin/login.jsp" title="管理员登录"><img src="images/logodl.png" style="width:20px;height:20px;vertical-align:middle"/></a></li>
			</c:if>
<%--			<c:if test="${userFront==admin}">--%>
<%--				<li class="${param.menu=='self'?'hover':''}"><a href="myInfo.jsp" title="个人信息"><img src="images/self.png" style="width:20px;height:20px;vertical-align:middle"/></a></li>--%>
<%--				<li><a  id="loginOut" href="javascript:void(0)" title="退出登录" > <img src="images/logotc.png" style="width:20px;height:20px;vertical-align:middle;"/></a></li>--%>
<%--			</c:if>--%>
		</ul>
	</div>
</div>
<script type="text/javascript" src="js/login.js"></script>