<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/car/left.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/menu/mymenu.js'/>"></script>
	<link rel="stylesheet" href="<c:url value='/menu/mymenu.css'/>" type="text/css" media="all">
<script language="javascript">
/*
 * 1. 对象名必须与第一个参数相同！
   2. 第二个参数是显示在菜单上的大标题
 */
var bar = new Q6MenuBar("bar", "商品目录");
$(function() {
	bar.colorStyle = 2;//指定配色样式，一共0,1,2,3,4
	bar.config.imgDir = "<c:url value='/menu/img/'/>";//小工具所需图片的路径
	bar.config.radioButton=true;//是否排斥，多个一级分类是否排斥

	/*
	1. 程序设计：一级分类名称
	2. Java Javascript：二级分类名称
	3. /goods/jsps/book/list.jsp：点击二级分类后链接到的URL
	4. body:链接的内容在哪个框架页中显示
	*/
<c:forEach items="${parents}" var="parent">
  <c:forEach items="${parent.children}" var="child">
	bar.add("${parent.catName}", "${child.catName}", "/CarParts/admin/AdminCarServlet?method=findByCategory&cid=${child.cid}", "body");
  </c:forEach>
</c:forEach>
	
	$("#menu").html(bar.toString());
});
</script>
  </head>
  
  <body class="myleft">
<div id="menu"></div>
<script>
  $(function(){
	  var menuTitles=$(".menuTitle"),menuItems=$(".menuItem"),menuTitleIcons=$(".menuTitleIcon");
	  var imgs=["icon1.png","icon2.png","icon3.png","icon4.png"];
	  /*一级菜单样点击之后变换式  */
	   for(var i=0;i<menuTitles.length;i++){
			$(menuTitles[i]).click(function(e){
				$(menuTitles).removeClass("active");
				$(".menuContent").addClass("hide");
				$(this).addClass("active"); 
				$(this).next(".menuContent").removeClass("hide");
			});
		} 
	   /*二级菜单样点击之后变换式  */
	   for(var i=0;i<menuItems.length;i++){
			$(menuItems[i]).click(function(e){
				$(menuItems).removeClass("active");
				$(this).addClass("active"); 
			});
		} 
	   /* 一级菜单图标初始化 */
	   for(var i=1;i<=menuTitleIcons.length;i++){
			$(menuTitleIcons[i]).css("background","url(../images/"+imgs[i]+") no-repeat");
		}  
  });
  	
  </script>
  </body>
</html>
