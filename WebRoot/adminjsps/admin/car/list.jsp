<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>商品分类</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/car/list.css'/>">
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/pager/pager.css'/>" />

<script type="text/javascript" src="<c:url value='/adminjsps/admin/js/car/list.js'/>"></script>
  </head>
  
  <body>
<div class="divCar">
<ul>


<c:forEach items="${pb.beanList }" var="car">
 <li>
  <div class="inner">
    <a class="pic" href="<c:url value='/admin/AdminCarServlet?method=load&carId=${car.carId }'/>"><img src="<c:url value='/${car.image_b }'/>" border="0"/></a>
    <p class="price" >
		<span class="price_n">&yen;${car.currPrice }</span>
		<span class="price_r">&yen;${car.price }</span>
		(<span class="price_s">${car.discount }折</span>)
	</p>
	<c:url value="/admin/AdminCarServlet" var="paiLiangUrl">
		<c:param name="method" value="findByPaiLiang"/>
		<c:param name="paiLiang" value="${car.paiLiang }"/>
	</c:url>
	<c:url value="/admin/AdminCarServlet" var="oilUrl">
		<c:param name="method" value="findByOil"/>
		<c:param name="oil" value="${car.oil }"/>
	</c:url>
	<p><a id="carname" title="${car.cname }" href="<c:url value='/admin/AdminCarServlet?method=load&carId=${car.carId }'/>">${car.cname }</a></p>
	<p><a href="${paiLiangUrl }" name='P_zz' title='${car.paiLiang }'>${car.paiLiang }</a></p>
	<p class="publishing">
		<span>排量：</span><a href="${paiLiangUrl }">${car.paiLiang }</a>
	</p>
  </div>
 </li>
</c:forEach>



 


</ul>
</div>
<div style="float:left; width: 100%; text-align: center;">
	<hr/>
	<br/>
	<%@include file="/jsps/pager/pager.jsp" %>
</div>
  </body>
 
</html>

