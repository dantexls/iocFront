<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>客户端</title>
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
	<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	function enterScene(categoryId,url,obj){
		//将之前选中元素边框移除
		var imgs = $('#menu').find('img');
		$.each(imgs, function(index, val){
			if($(val).hasClass('img-border')){
				$(val).removeClass('img-border');
			}
		});
		//当前选中元素添加边框
		var img = $(obj).find("img");
		img.addClass("img-border");
		send(categoryId);
		window.location.href = url;
	}
	</script>
	<style type="text/css">
	body{
		background-image:url(images/timg.jpg);
	}
	h3{
		color: white;
	}
	h1{
		color: white;
		font-size: 50px;
	}
	.img-border{
		border:4px solid #FFF;
	}
	</style>
</head>
<body>
	<div >
		<!-- <div class="pbtn mypanel" style="margin-top: 40px;">
				<div class="col-xs-2">
					<button class="btn btn-block btn-success btn-lg" onclick="window.history.back()">返回</button>
				</div>
		</div> -->
		<div id="menu" class="mypanel" style="">
			<div class="pbtn col-xs-offset-0 .container" style="margin-top: 30px;">
				<div class="row" style="margin: 10px;" >
					<div class="col-xs-2">
						<button class="btn btn-block btn-success btn-lg" onclick="window.history.back()">返回</button>
					</div>
					<div class="col-xs-8" style="text-align: center;">
						<h1>应用中心</h1>
					</div>
			 	</div>
			   <div class="row" style="margin: 10px;margin-top: 160px;">
					<div class="col-xs-4" onclick="enterScene('2@1','tizheng.jsp',this);" style="text-align: center;">
						<img src="images/scenes/green.png" style="width: 80%;">
						<h3>城市体征管控中心</h3>
					</div>
					<div class="col-xs-4" onclick="enterScene('2@2','chengguan.jsp',this);" style="text-align: center;">
						<img src="images/scenes/cityAppearance.png" style="width: 80%;">
						<h3>智慧城管管控中心</h3>
					</div>
					<div class="col-xs-4" onclick="enterScene('2@3','yuanqu.jsp',this);" style="text-align: center;">
						<img src="images/scenes/construction.png" style="width: 80%;">
						<h3>智慧园区管控中心</h3>
					</div>
				</div>
				<div class="row" style="margin: 10px;margin-top: 20px;">
					<div class="col-xs-4" onclick="" style="text-align: center;">
						<img src="images/scenes/security.png" style="width: 80%;">
						<h3>智慧交通管控中心</h3>
					</div>
					<div class="col-xs-4" onclick="" style="text-align: center;">
						<img src="images/scenes/energy.png" style="width: 80%;">
						<h3>智慧环保管控中心</h3>
					</div>
					<div class="col-xs-4" onclick="" style="text-align: center;">
						<img src="images/scenes/water.png" style="width: 80%;">
						<h3>智慧安防管控中心</h3>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>

<script type="text/javascript">
	var websocket = null;
	//判断当前浏览器是否支持WebSocket
	if ('WebSocket' in window) {
		websocket = new WebSocket("ws://localhost:8080/Cm-pom/websocket");
		//websocket = new WebSocket("ws://10.129.132.119:8080/Cm-pom/websocket");
	} else {
		alert('当前浏览器 Not support websocket');
	}
	
	//连接发生错误的回调方法
	websocket.onerror = function() {
		setMessageInnerHTML("WebSocket连接发生错误");
	};
	
	//连接成功建立的回调方法
	websocket.onopen = function() {
		setMessageInnerHTML("WebSocket连接成功");
	}
	
	//连接关闭的回调方法
	websocket.onclose = function() {
		setMessageInnerHTML("WebSocket连接关闭");
	}
	
	//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
	window.onbeforeunload = function() {
		closeWebSocket();
	}
	
	//将消息显示在网页上
	function setMessageInnerHTML(innerHTML) {
		//document.getElementById('message').innerHTML += innerHTML + '<br/>';
	}
	
	//关闭WebSocket连接
	function closeWebSocket() {
		websocket.close();
	}
	
	//发送消息
	function send(message) {
		//var message = document.getElementById('text').value;
		websocket.send(message);
	}
</script>
</html>