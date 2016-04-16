<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>配件描述</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/car/desc.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/jquery/jquery.datepick.css'/>">
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick-zh-CN.js'/>"></script>

<script type="text/javascript" src="<c:url value='/adminjsps/admin/js/car/desc.js'/>"></script>

<script type="text/javascript">

$(function() {
	$("#box").attr("checked", false);
	$("#formDiv").css("display", "none");
	$("#show").css("display", "");	
	
	// 操作和显示切换
	$("#box").click(function() {
		if($(this).attr("checked")) {
			$("#show").css("display", "none");
			$("#formDiv").css("display", "");
		} else {
			$("#formDiv").css("display", "none");
			$("#show").css("display", "");		
		}
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

/*
 * 点击编辑按钮时执行本函数
 */
function editForm() {
	$("#method").val("edit");
	$("#form").submit();
}
/*
 * 点击删除按钮时执行本函数
 */
 function deleteForm() {
	$("#method").val("delete");
	$("#form").submit();	
}

</script>
  </head>
  
  <body>
    <input type="checkbox" id="box"><label for="box">编辑或删除</label>
    <br/>
    <br/>
  <div id="show">
    <div class="sm">${car.cname }</div>
    <img align="top" src="<c:url value='/${car.image_w }'/>" class="tp"/>
    <div id="car" style="float:left;">
	    <ul>
	    	<li>配件编号：${car.carId }</li>
	    	<li>当前价：<span class="price_n">&yen;${car.currPrice }</span></li>
	    	<li>定价：<span style="text-decoration:line-through;">&yen;${car.price }</span>　折扣：<span style="color: #c30;">${car.discount }</span>折</li>
	    </ul>
		<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
		<table class="tab">
			<tr>
				<td colspan="3">
					发动机：${car.machine }
				</td>
			</tr>
			<tr>
				<td colspan="3">
					车身型式：${car.carType }
				</td>
			</tr>
			<tr>
				<td>燃油：${car.oil }</td>
				<td>车门数：${car.doorNum }</td>
				<td>最大功率：${car.maxWat }</td>
			</tr>
			<tr>
				<td>排量：${car.paiLiang }</td>
				<td>轴距：${car.shaftDis }</td>
				<td>容积：${car.volume }</td>
			</tr>
			<tr>
				<td colspan="3">保修政策：${car.keepPolicy }</td>
			</tr>
		</table>
	</div>
  </div>
  
  
  <div id='formDiv'>
   <div class="sm">&nbsp;</div>
   <form action="<c:url value='/admin/AdminCarServlet'/>" method="post" id="form">
    <input type="hidden" name="method" id="method"/>
   	<input type="hidden" name="carId" value="${car.carId }"/>
    <img align="top" src="<c:url value='/${car.image_w }'/>" class="tp"/>
    <div style="float:left;">
	    <ul>
	    	<li>配件编号：${car.carId }</li>
	    	<li>名称：　<input id="cname" type="text" name="cname" value="${car.cname }" style="width:500px;"/></li>
	    	<li>当前价：<input id="currPrice" type="text" name="currPrice" value="${car.currPrice }" style="width:100px;"/></li>
	    	<li>定价：　<input id="price" type="text" name="price" value="${car.price }" style="width:100px;"/>
	    	折扣：<input id="discount" type="text" name="discount" value="${car.discount }" style="width:50px;"/>折</li>
	    </ul>
		<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
		<table class="tab">
			<tr>
				<td colspan="3">
					发动机：　　<input id="machine" type="text" name="machine" value="${car.machine }" style="width:200px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					车身型式：　　<input id="carType" type="text" name="carType" value="${car.carType }" style="width:200px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					保修政策：　<input id="keepPolicy" type="text" name="keepPolicy" value="${car.keepPolicy }" style="width:300px;"/>
				</td>
			</tr>
			<tr>
				<td>燃油：　　<input id="oil" type="text" name="oil" value="${car.oil }" style="width:70px;"/></td>
				<td>车门数：　　<input id="doorNum" type="text" name="doorNum" value="${car.doorNum }" style="width:70px;"/></td>
				<td>最大功率：　　<input id="maxWat" type="text" name="maxWat" value="${car.maxWat }" style="width:70px;"/></td>
			</tr>
			<tr>
				<td width="250px">排量：<input id="paiLiang" type="text" name="paiLiang" value="${car.paiLiang }" style="width:100px;"/></td>
				<td width="250px">轴距：　　<input id="shaftDis" type="text" name="shaftDis" value="${car.shaftDis }" style="width:100px;"/></td>
				<td>容积：　　<input id="volume" type="text" name="volume" value="${car.volume }" style="width:100px;"/></td>
			</tr>
			<tr>
				<td>
					一级分类：<select name="pid" id="pid" onchange="loadChildren()">
						<option value="">==请选择1级分类==</option>
							<c:forEach items="${parents }" var="parent">
							  <option value="${parent.cid }" <c:if test="${car.category.parent.cid eq parent.cid }">selected="selected"</c:if>>${parent.catName }</option>
							</c:forEach>
					</select>
				</td>
				<td>
					二级分类：<select name="cid" id="cid">
						<option value="">==请选择2级分类==</option>
							<c:forEach items="${children }" var="child">
							  <option value="${child.cid }" <c:if test="${car.category.cid eq child.cid }">selected="selected"</c:if>>${child.catName }</option>
							</c:forEach>
					</select>
				</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2">
					<input onclick="editForm()" type="button" name="method" id="editBtn" class="btn" value="编　　辑">
					<input onclick="deleteForm()" type="button" name="method" id="delBtn" class="btn" value="删　　除">
				</td>
				<td></td>
			</tr>
		</table>
	</div>
   </form>
  </div>

  </body>
</html>
