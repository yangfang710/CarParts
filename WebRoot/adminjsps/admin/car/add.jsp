<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加配件</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/car/add.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/jquery/jquery.datepick.css'/>">
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick-zh-CN.js'/>"></script>
<script type="text/javascript">
$(function () {
	$("#publishtime").datepick({dateFormat:"yy-mm-dd"});
	$("#printtime").datepick({dateFormat:"yy-mm-dd"});
	
	$("#btn").addClass("btn1");
	$("#btn").hover(
		function() {
			$("#btn").removeClass("btn1");
			$("#btn").addClass("btn2");
		},
		function() {
			$("#btn").removeClass("btn2");
			$("#btn").addClass("btn1");
		}
	);
	
	$("#btn").click(function() {
		var cname = $("#cname").val();
		var currPrice = $("#currPrice").val();
		var price = $("#price").val();
		var discount = $("#discount").val();
		var paiLiang = $("#paiLiang").val();
		var oil = $("#oil").val();
		var pid = $("#pid").val();
		var cid = $("#cid").val();
		var image_w = $("#image_w").val();
		var image_b = $("#image_b").val();
		
		if(!cname || !currPrice || !price || !discount || !paiLiang || !oil || !pid || !cid || !image_w || !image_b) {
			alert("配件名称、当前价、定价、折扣、排量、燃油、1级分类、2级分类、大图、小图都不能为空！");
			return false;
		}
		
		if(isNaN(currPrice) || isNaN(price) || isNaN(discount)) {
			alert("当前价、定价、折扣必须是合法小数！");
			return false;
		}
		$("#form").submit();
	});
});

function loadChildren() {
	/*
	1. 获取pid
	2. 发出异步请求，功能之：
	  3. 得到一个数组
	  4. 获取cid元素(<select>)，把内部的<option>全部删除
	  5. 添加一个头（<option>请选择2级分类</option>）
	  6. 循环数组，把数组中每个对象转换成一个<option>添加到cid中
	*/
	// 1. 获取pid
	var pid = $("#pid").val();
	// 2. 发送异步请求
	$.ajax({
		async:true,
		cache:false,
		url:"/CarParts/admin/AdminCarServlet",
		data:{method:"ajaxFindChildren", pid:pid},
		type:"POST",
		dataType:"json",
		success:function(arr) {
			// 3. 得到cid，删除它的内容
			$("#cid").empty();//删除元素的子元素
			$("#cid").append($("<option>====请选择2级分类====</option>"));//4.添加头
			// 5. 循环遍历数组，把每个对象转换成<option>添加到cid中
			for(var i = 0; i < arr.length; i++) {
				var option = $("<option>").val(arr[i].cid).text(arr[i].cname);
				$("#cid").append(option);
			}
		}
	});
}

</script>
  </head>
  
  <body>
  <div>
   <p style="font-weight: 900; color: red;">${msg }</p>
   <form action="<c:url value='/admin/AdminAddCarServlet'/>" enctype="multipart/form-data" method="post" id="form">
    <div>
	    <ul>
	    	<li>汽车名称：　<input id="cname" type="text" name="cname" value="上汽通用雪佛兰 赛欧3订金499元 2015款 1.3L 手动 温馨版" style="width:500px;"/></li>
	    	<li>大图：　<input id="image_w" type="file" name="image_w"/></li>
	    	<li>小图：　<input id="image_b" type="file" name="image_b"/></li>
	    	<li>当前价：<input id="currPrice" type="text" name="currPrice" value="100000" style="width:100px;"/></li>
	    	<li>定价：　<input id="price" type="text" name="price" value="80000" style="width:100px;"/>
	    	折扣：<input id="discount" type="text" name="discount" value="8.0" style="width:50px;"/>折</li>
	    </ul>
		<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
		<table>
			<tr>
				<td colspan="3">
					发动机：　　<input type="text" id="machine" name="machine" value="L型/76kW" style="width:200px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					车身型式：　　<input type="text" id="carType" name="carType" value="三厢" style="width:200px;"/>
				</td>
			</tr>
			<tr>
				<td>燃油：　<input type="text" name="oil" id="oil" value="汽油93号" style="width:70px;"/></td>
				<td>车门数：<input type="text" id="doorNum" name="doorNum" value="4" style="width:70px;"/></td>
				<td>最大功率：<input type="text" id="maxWat" name="maxWat" value="150kW" style="width:70px;"/></td>
			</tr>
			<tr>
				<td>排量：　　<input type="text" name="paiLiang" id="paiLiang" value="1.5L" style="width:100px;"/></td>
				<td>轴距：　　<input type="text" name="shaftDis" id="shaftDis" value="2000mm" style="width:100px;"/></td>
				<td>容积：　　<input type="text" name="volume" id="volume" value="50L" style="width:100px;"/></td>
			</tr>
			<tr>
				<td colspan="3">保修政策：<input type="text" name="keepPolicy" id="keepPolicy" value="三年或10万公里" style="width:100px;"/></td>
			</tr>
			<tr>
				<td>
					一级分类：<select name="pid" id="pid" onchange="loadChildren()">
						<option value="">====请选择1级分类====</option>
							<c:forEach items="${parents }" var="parent">
								<option value="${parent.cid }">${parent.catName }</option>
							</c:forEach>
					</select>
				</td>
				<td>
					二级分类：<select name="cid" id="cid">
						<option value="">====请选择2级分类====</option>
					</select>
				</td>
				<td></td>
			</tr>
			<tr>
				<td>
					<input type="button" id="btn" class="btn" value="配件上架">
				</td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
   </form>
  </div>

  </body>
</html>
