<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<title>后台管理系统</title>
<!-- 包含公共的js,css等资源文件 -->

<link rel="stylesheet" type="text/css" href="<c:url value='/css/logincss.css'/>">
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<script src="<c:url value='/js/common.js'/>"></script>

<script type="text/javascript">
	// 在被嵌套时就刷新上级窗口
	if(window.parent != window){
		window.parent.location.reload(true);
	}
	
	function key_down() {
		if (event.keyCode == 13) {
			checkLogin();
		}
	}
	window.onload=function(){
		 var rand=Math.floor(Math.random()*4);
		 var imgs=["bg.jpg","bg1.jpg","bg2.jpg","bg3.jpg"];
		 str="${pageContext.request.contextPath}/images/"+imgs[rand];
		  $("body").css("background","url("+str+")  no-repeat fixed center center / cover");
	};
	function checkForm() {
		var adminname = $("#loginAction_loginName").val();
		var adminpwd = $("#loginAction_password").val();
		if(adminname == null) {
			alert("管理员名称不能为空！");
			return false;
		}
		if(adminpwd == null) {
			alert("管理员密码不能为空！");
			return false;
		}
		return true;
	}
</script>

</head>

<body>
<div id="container">
	<div id="content">
		<div id="header"><span>后台管理支撑系统</span></div>
		
		<form action="<c:url value='/AdminServlet'/>" method="post" onsubmit="return checkForm()" target="_top" id="form1">
			<input type="hidden" name="method" value="login"/>
			<label class="pic" id="adminname"></label>
			<input type="text" name="adminname" id="loginAction_loginName"/>
			<div id="usernameTip" style="width:200px;"></div>
			<br />
			<label class="pic" id="pass"></label>
			<input type="password" name="adminpwd" id="loginAction_password" />
			<div id="userpassTip" style="width:200px;"></div>
			<br />
			<input id="loginAction_usercaptcha" type="text" style="text-transform: uppercase;" name="verifyCode" onkeydown="key_down()"/>
			<img id="identifycode" src="<c:url value='/VerifyCodeServlet'/>"/>
            <a id="change" href="javascript:_change()">换张图</a>
			<div id="vdcodeTip" style="width:280px;"></div>
			<br />
			<input type="submit" value="登录"  id="loginBtn" />
			<div id="loginbottom" class="login">
			<div id="errorInfo" style="color:red; font-size:15px"></div>
			</div>
		</form>
		
	</div>	
	
	<div id="footer"></div>
</div>
</body>
</html>