<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>top</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	
		<style type="text/css">
			body {
				margin: 0px;
			}
			a {text-decoration: none; color: #454545;}
			a:visited {color: #454545;}
			a:hover {color:#FF6600; text-decoration: none;}
		</style>
  </head>
  
  <body style="background: url(/CarParts/images/top.jpg) no-repeat; color: black;">
	<div style="font-size:25px;font-weight:bold;text-align: left; line-height: 30px;margin-left:50px;margin-top:30px;float:left;">商品导购系统</div>
	<div style="text-align: right;font-size: 10pt; line-height: 10px;margin-top:5px;margin-right:5px;">
		<c:choose>
			<c:when test="${empty sessionScope.sessionUser }">
				  你好，请<a href="<c:url value='/jsps/user/login.jsp'/>" target="_parent">登录</a>&nbsp; |&nbsp; 
				  <a href="<c:url value='/jsps/user/regist.jsp'/>" target="_parent">免费注册</a>&nbsp; |&nbsp; 
				  <a href="<c:url value='/adminjsps/login.jsp'/>" target="_parent">管理员登录</a>
			</c:when>
			<c:otherwise>
				      欢迎您，<font color="red">${sessionScope.sessionUser.loginname }</font>！&nbsp;|&nbsp;
				  <a href="<c:url value='/CartItemServlet?method=myCart'/>" target="body">我的购物车</a>&nbsp;|&nbsp;
				  <a href="<c:url value='/OrderServlet?method=myOrders'/>" target="body">我的订单</a>&nbsp;|&nbsp;
				  <a href="<c:url value='/jsps/user/pwd.jsp'/>" target="body">修改密码</a>&nbsp;|&nbsp;
				  <a href="<c:url value='/UserServlet?method=quit'/>" target="_parent">退出</a>
			</c:otherwise>
		</c:choose>
	</div>
  </body>
</html>
