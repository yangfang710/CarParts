<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>配件详细</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/pager/pager.css'/>" />
	<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/car/desc.css'/>">
	<script src="<c:url value='/jsps/js/car/desc.js'/>"></script>
	
  </head>
  
  <body>
  <div class="divBookName">${car.cname }</div>
  <div>
    <img align="top" src="<c:url value='/${car.image_w }'/>" class="img_image_w" />
    <div class="divBookDesc">
	    <ul>
	    	<li>汽车编号：${car.carId }</li>
	    	<li>当前价：<span class="price_n">&yen;${car.currPrice }</span></li>
	    	<li>定价：<span class="spanPrice">&yen;${car.price }</span>　折扣：<span style="color: #c30;">${car.discount }</span>折</li>
	    </ul>
		<hr class="hr1"/>
		<table>
			<tr>
				<td colspan="3">
					发动机：${car.machine } 
				</td>
			</tr>
			<tr>
				<td colspan="3">
					排量：${car.paiLiang } 
				</td>
			</tr>
			<tr>
				<td colspan="3">
					燃油：${car.oil }
				</td>
			</tr>
			<tr>
				<td colspan="3">保修期政策：${car.keepPolicy }</td>
			</tr>
			<tr>
				<td>车门数量：${car.doorNum }</td>
				<td>轴距：${car.shaftDis }</td>
				<td>容积：${car.volume }</td>
			</tr>
			<tr>
				<td width="180">车身型式：${car.carType }</td>
				<td>最大功率：${car.maxWat }</td>
				<td></td>
			</tr>
		</table>
		<div class="divForm">
			<form id="form1" action="<c:url value='/CartItemServlet'/>" method="post">
				<input type="hidden" name="method" value="add"/>
				<input type="hidden" name="carId" value="${car.carId }"/>
  				我要买：<input id="cnt" style="width: 40px;text-align: center;" type="text" name="quantity" value="1"/> 件
  			</form>
  			<a href="javascript:$('#form1').submit();"><img id="btn" src="<c:url value='/images/buy1.png'/>" /></a>
  		</div>
	</div>
  </div>
  </body>
</html>
