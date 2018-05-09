<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
	<title>总控中心</title>
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
	<link href="css/mainmenu.css" rel="stylesheet" type="text/css">
	<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	function enterPage(url,message){
		send(message);
		if(url){
			window.location.href = url;
		}
	}
	</script>
</head>
<body>
	<div id="main" class="main-menu">
		<div class="main-top">
			<img src="images/logo04.png">
			<div class="title_div">
				<span>城市治理智库控制管理中心</span>
			</div>
		</div>
		<div>
			<div class="button_div" onclick="enterPage('controlCenter.jsp','6@1');"> 
				<a href="controlCenter.jsp"><img src="images/home_button1.png"></a>
				<div class="menu_div">
					<span>大屏控制</span>
				</div>
			</div>
			<div class="button_div"> 
				<img src="images/home_button2.png">
				<div class="menu_div">
					<span>沙盘控制</span>
				</div>
			</div>
			<div class="button_div" onclick="enterPage('Demonstration.jsp','6@3');"> 
				<a href="Demonstration.jsp"><img src="images/home_button3.png"></a>
				<div class="menu_div">
					<span>场景演示</span>
				</div>
			</div>
			<div class="button_div"> 
				<img src="images/home_button4.png">
				<div class="menu_div">
					<span>参数设置</span>
				</div>
			</div>
		</div>
		<!-- <span> 
			<a href="controlCenter.jsp"><img src="images/1.png"></a>
		</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<span>
			<img src="images/2.png">
		</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<span>
			<a href="Demonstration.jsp"><img src="images/3.png"></a>
		</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<span>
			<img src="images/4.png">
		</span> -->
	</div>
</body>

<script type="text/javascript">
var websocket = null;
var ip = document.location.hostname;
var port = document.location.port;
//判断当前浏览器是否支持WebSocket
if ('WebSocket' in window) {
	websocket = new WebSocket("ws://"+ip+":"+port+"/Cm-pom/websocket");
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
	//websocket.send(message);
	if(websocket.readyState !== 1){
		closeWebSocket();
		websocket = new WebSocket("ws://"+ip+":"+port+"/Cm-pom/websocket");
		setTimeout(function() {
			websocket.send(message);
        }, 250);
	}else{
		websocket.send(message);
	}
}
</script>
</html>