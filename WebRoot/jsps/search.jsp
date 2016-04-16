<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>按书名查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<style type="text/css">
		body {
			margin-top: 5px;
			margin-bottom: 0px;
			margin-left:150px;
			color: #404040;
		}
		input {
			width: 450px;
			height: 50px;
			border-style:solid;
			margin:0px;
			border-color: #2894FF;
			font-size:20px;
		}
		a {
			text-transform:none;
			text-decoration:none;
			border-width: 0px;
		} 
		a:hover {
			text-decoration:underline;
			border-width: 0px;
		}
		span {
			margin: 0px;
		}
	</style>
	<script type="text/javascript">
	$(function() {
		$("#cname").focus(function() {
			$("#cname").val("");
		});
	});
	</script>
  </head>
  
  <body>
    <form action="<c:url value='/CarServlet'/>" method="get" target="body" id="form1">
    	<input type="hidden" name="method" value="findByCname"/>
    	<input type="text" id="cname" name="cname" value="请输入配件名称"/>
    	<span>
    		<a href="javascript:document.getElementById('form1').submit();"><img align="top" border="0" src="../images/search1.png"/></a>
    		<a href="<c:url value='/jsps/gj.jsp'/>" style="font-size: 10pt; color: #404040;" target="body">高级搜索</a>
    	</span>
    </form>
    
  </body>
</html>
