$(document).ready(function(){
	var postStr = {
		'user_name':'',
		'user_pass':''
	};
	var selfCenterBtn = $("#selfCenterBtn");
	var loginOutBtn = $("#loginOutBtn");
	var loginInBtn = $("#loginInBtn");
	var regBtn = $("#regBtn");
	var user_name = $("#user_nameTop");
	var user_pass = $("#user_passTop");
	var random = $("#randomTop");

	loginOutBtn.bind('click',function(){
		$.post('LoginOutSystem.action',null,
			function(responseObj) {
					if(responseObj.success) {
						 alert('退出成功！');
						 window.location.href="page_index.action";
					}else  if(responseObj.err.msg){
						 alert('退出异常：'+responseObj.err.msg);
					}else{
						 alert('退出异常：服务器异常！');
					}
		 },'json');
	});

	loginInBtn.bind('click',function(){
		if(user_name.val()==''||user_pass.val()==''){
			alert("用户名和密码不能为空！")
			return;
		}
		if(random.val()==''){
			alert("验证码不能为空！")
			return;
		}
		postStr['user_name'] = user_name.val();
		postStr['user_pass'] = user_pass.val();
		//postStr['random'] = random.val();

		$.post('LoginInSystem.action',postStr,
			function(responseObj) {
					if(responseObj.success) {
						 alert('登录成功');
						 window.location.href="page_index.action";
					}else  if(responseObj.err.msg){
						 alert('登录异常：'+responseObj.err.msg);
					}else{
						 alert('登录异常：服务器异常！');
					}
		 },'json');
	});

	regBtn.bind('click',function(){
		 window.location.href="page_reg.action";
	});

	selfCenterBtn.bind('click',function(){
		 window.location.href="page_myInfo.action";
	});


	$("#film_nameTop").keydown(function(e){
		var curKey = e.which;
		if(curKey == 13){
			 $("#infoTop").submit();
		}
	});
});