<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>组合查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<style type="text/css">
	table {
		color: #404040;
		font-size: 10pt;
	}
	.searchTab td{
			padding-right:15px;
		}
		.searchinput{
			width:180px;
			height:23px;
			line-height:23px;
			padding-left:5px;
			color:#aaa;
			margin:5px;
		}
		.btn{
			text-align:center;
		}
	.linkBtn{
		/* border-radius:4px; */
			color:#fff;
			background:#5093e1;
			border:none;
			height:35px;
			line-height:35px;
			
			 width:60px;
	}
</style>
  </head>
  
  <body>
  <form action="<c:url value='/CarServlet'/>" method="get">
  	<input type="hidden" name="method" value="findByCombination"/>
<table align="center">
	<tr>
		<td>名称：</td>
		<td><input class="searchinput" type="text" name="cname"/></td>
	</tr>
	<tr>
		<td>排量：</td>
		<td><input class="searchinput" type="text" name="paiLiang"/></td>
	</tr>
	<tr>
		<td>燃油：</td>
		<td><input class="searchinput" type="text" name="oil"/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class="btn">
			<input class="linkBtn" type="submit" value="搜索"/>
			<input class="linkBtn" type="reset" value="重置"/>
		</td>
	</tr>
</table>
	</form>
  </body>
</html>
