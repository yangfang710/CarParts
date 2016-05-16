<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>top</title>
    <base target="body">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		body {font-size: 10pt;}
		a {text-decoration:none;color: #fff;}
		a:visited {color: #fff;}
		a:hover {color:#CD2626; text-decoration: underline;}
	</style>
  </head>
  
<!--   <body style="background: url(/CarParts/images/top.jpg) no-repeat; color: black;"> -->
<!-- 	<div style="font-size:30px;font-weight:bold;text-align: left; line-height: 30px;margin-left:50px;margin-top:30px;float: left;">汽车配件销售系统后台管理</div> -->
<!-- 	<div style="text-align: right; line-height: 10px;margin-top:10px;"> -->

  <body style="background: #0A2A50 ; color: #fff;">
	<div style="font-size:30px;font-weight:bold;text-align: left; line-height: 30px;margin-left:50px;margin-top:30px;float: left;">商品导购系统后台管理</div>
	<div style="display:inline-block;float:right;height:30px; line-height: 30px;padding-right:10px;">
		<span style="padding-left:50px;margin-right:50px;font-size:16px">
			<a href="<c:url value='/admin/AdminCategoryServlet?method=findAll'/>">类别管理</a>&nbsp;|&nbsp;
			<a href="<c:url value='/adminjsps/admin/car/main.jsp'/>">配件管理</a>&nbsp;|&nbsp;
			<a href="<c:url value='/admin/AdminOrderServlet?method=findAll'/>">订单管理</a>
		</span>
		<span>欢迎管理员，${sessionScope.admin.adminname }</span>
		<a style="color:red;font-size:14px;font-weight:bold;" target="_top" href="<c:url value='/adminjsps/login.jsp'/>">安全退出</a>
	</div>
  </body>
</html>
