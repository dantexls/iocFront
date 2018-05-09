<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>socket测试页面</title>
<script type="text/javascript">
	var websocket = null;
	var ip = document.location.hostname;
	var port = document.location.port;
	//判断当前浏览器是否支持WebSocket
	if ('WebSocket' in window) {
		var ip = document.location.hostname;
		var port = document.location.port;
		websocket = new WebSocket("ws://"+ip+":"+port+"/Cm-pom/websocket");
	} else {
		alert('当前浏览器 Not support websocket')
	}
	
	//连接发生错误的回调方法
	websocket.onerror = function() {
		setMessageInnerHTML("WebSocket连接发生错误");
	};

	//连接成功建立的回调方法
	websocket.onopen = function() {
		setMessageInnerHTML("WebSocket连接成功");
	}
	
	//将消息显示在网页上
	function setMessageInnerHTML(innerHTML) {
		//document.getElementById('message').innerHTML += innerHTML + '<br/>';
	}
	
	//连接关闭的回调方法
	websocket.onclose = function() {
		setMessageInnerHTML("WebSocket连接关闭");
	}
	
	//接收到消息的回调方法
	websocket.onmessage = function(event) {
		var message = event.data;
		if(message.indexOf('@')<0){
			alert("接收到的消息为："+message);
			if(JSON.parse(message).status == "5"){
				alert("场景参数为："+JSON.parse(message).screen);
			}
		}
	}
	
	//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
	window.onbeforeunload = function() {
		closeWebSocket();
	}

	//关闭WebSocket连接
	function closeWebSocket() {
		websocket.close();
	}
	
</script>
</head>
<body>
	<h1>socket接收消息测试页面</h1>
</body>
</html>