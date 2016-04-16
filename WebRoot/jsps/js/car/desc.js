$(function() {
	$("#cnt").blur(function() {
		var quantity = $("#cnt").val();
		if(!/^[1-9]\d*$/.test(quantity)) {
			alert("数量必须是合法整数！");
			$("#cnt").val("1");
		}
	});
	$("#btn").hover(
			function() {
				$("#btn").attr("src", "/CarParts/images/buy2.png");
			},
			function() {
				$("#btn").attr("src", "/CarParts/images/buy1.png");
			}
		);
});