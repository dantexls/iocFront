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
    <title>数据可视化管理平台</title>
    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <link href="css/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    <link href="css/css.css" rel="stylesheet" type="text/css">
    <link href="gridly/stylesheets/jquery.gridly.css" rel="stylesheet" type="text/css" />
    <script src="js/move.js" type="text/javascript"></script>
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/divcon.js" type="text/javascript"></script>
    <script src="js/common.js" type="text/javascript"></script>
    <script src="js/echarts.js" type="text/javascript"></script>
    <script src="datareport/pillar.js" type="text/javascript"></script>
	<script src="datareport/cake.js" type="text/javascript"></script>
	<script src="datareport/line.js" type="text/javascript"></script>
	<script src="js/init.js" type="text/javascript"></script>
    <script src="gridly/javascripts/jquery.gridly.js" type="text/javascript"></script>
    <script type="text/javascript">
    var arr=new Array();
    var nowNum=null;
    var cateId=null;
    var timer;
    function getCateGory(cateid){
    	$.ajax({
    		url:'/Cm-pom/dispatcher/scenes/queryByCategoryId',
    		data:{"categoryId":cateid},
    	    type: 'POST',
    	    dataType:'JSON',
    	    async: false,
    	    success:function(msg){
    	    	arr=msg.data;
    	    }
    	})
    	cateId=cateid;
    }
    
    jQuery(function($) {
    	$("#num").val(0);
    	nowNum=$("#num").val();
    	getCateGory('8a904d70615565f00161c595a153011a');
    	$.ajax({
    		url:'/Cm-pom/dispatcher/layer/queryByScenesId',
    		data:{"scenesId":arr[0].id},
    	    type: 'POST',
    	    dataType:'JSON',
    	    async: false,
    	    success:function(msg){
    	    	var data=msg.data;
    	    	var target="canvas";
    	        $.each(data, function(index, val){
    	        	var Stylestr=val.style;
    	        	var attrlist=getstylevalue(Stylestr);
    	        	var content = val.content;
    	        	if(content.indexOf("localhost") >= 0){
    	        		content = content.replace("localhost", ip);
    	        	}
    	        	new Dialog({Width:(attrlist[2].replace("px", ""))*2,Height:(attrlist[1].replace("px", ""))*2,Left:(attrlist[3].replace("px", "")-230)*2,Top:(attrlist[0].replace("px", "")-110)*2,Info:"",Content: content});
    	        	if(content.indexOf(target)!=-1){
    	        		var id=$(".dialogcontainter:eq("+index+ ") .dialogbody").children().attr("id");
    	        		function init(){ datainit(id) }
     	     	       window.setTimeout(init,2000);
    	        	}
    	        }); 
    	       
    	    }
    	})
    });
</script>
    <style type="text/css">
  .gridly
  {
    position: relative;
    width: 960px;
  }
  .brick.small
  {
    width: 60px;
    height: 60px;
  }
  .brick.large
  {
    width: 140px;
    height: 110px;
  }
</style>
</head>
<body style="background-color:#000000;overflow:-Scroll;overflow-y:hidden;overflow:-Scroll;overflow-x:hidden;">
<div  style="position:absolute;z-index:3">
<!-- <input type="button" value="首页" onclick='change("f")'/>
<input type="button" value="上一页" onclick='change("-1")'/>
<input type="button" value="下一页" onclick='change("1")'/>
<input type="button" value="尾页" onclick='change("e")'> -->
<input id="num" type="hidden" value=""/>
</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script  src="bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
	var websocket = null;
	var ip = document.location.hostname;
	var port = document.location.port;
	//判断当前浏览器是否支持WebSocket
	if ('WebSocket' in window) {
		var ip = document.location.hostname;
		var port = document.location.port;
		websocket = new WebSocket("ws://"+ip+":"+port+"/Cm-pom/websocket");
		//websocket = new WebSocket("ws://10.129.132.119:8080/Cm-pom/websocket");
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

	//连接关闭的回调方法
	websocket.onclose = function() {
		setMessageInnerHTML("WebSocket连接关闭");
	}
	
	//接收到消息的回调方法
	websocket.onmessage = function(event) {
		var message = event.data.split('@');
		if(message[0] =='robot'){
			getCateGory(message[1]);
			changeNum(parseInt(message[2]));
		}
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

<script type="text/javascript">
function check(n){
	if(nowNum==n&&nowNum==0){
		//alert("这已经是第一页");
		return false;
	}
	if(nowNum==n&&nowNum==arr.length-1){
		//alert("这已经是最后一页");
		return false;
	}
	return true;
}

function change(id){
	wantTOnum=null;
	if(id=='f'){
		wantTOnum=0;
		if(check(wantTOnum)){
			nowNum=0;
		}else{
			return;
		}
	}
	if(id=='e'){
		wantTOnum=arr.length-1;
		if(check(wantTOnum)){
			nowNum=arr.length-1;
		}else{
			return;
		}
	}
	
	wantTOnum=id;
	
	if(id=="1"){
		nowNum++;
		if(nowNum>arr.length-1){
			//alert("这已经是最后一页");
			nowNum=arr.length-1;
			return;
		}
	}
	
	if(id=="-1"){
		nowNum--;
		if(nowNum<0){
			//alert("这已经是第一页");
			nowNum=0;
			return;
		}
	}
	
	$(".dialogcontainter").remove();
	$.ajax({
		url:'/Cm-pom/dispatcher/layer/queryByScenesId',
		data:{"scenesId":arr[nowNum].id},
	    type: 'POST',
	    dataType:'JSON',
	    success:function(msg){
	    	var data=msg.data;
	    	var target="canvas";
	    	 $.each(data, function(index, val){
 	        	var Stylestr=val.style;
 	        	var attrlist=getstylevalue(Stylestr);
 	        	var content = val.content;
	        	if(content.indexOf("localhost") >= 0){
	        		content = content.replace("localhost", ip);
	        	}
 	        	new Dialog({Width:(attrlist[2].replace("px", ""))*2,Height:(attrlist[1].replace("px", ""))*2,Left:(attrlist[3].replace("px", "")-230)*2,Top:(attrlist[0].replace("px", "")-110)*2,Info:"",Content: content});
 	        	if(content.indexOf(target)!=-1){
	        		var id=$(".dialogcontainter:eq("+index+ ") .dialogbody").children().attr("id");
	        		function init(){ datainit(id) }
 	     	       window.setTimeout(init,2000);
	        	}
 	        }); 
	        var screen =null;
        	if(cateId=="20"){
        		screen=1;
        	}else if(cateId=="25"){
        		screen=2;
        	}else if(cateId=="26"){
        		screen=3;
        	}
        	var step= (nowNum+1);
        	controlStep(1,screen,step);
	    }
	})
	
}

function changeNum(arrId){
	nowNum = arrId;
	$(".dialogcontainter").remove();
	$.ajax({
		url:'/Cm-pom/dispatcher/layer/queryByScenesId',
		data:{"scenesId":arr[nowNum].id},
	    type: 'POST',
	    dataType:'JSON',
	    success:function(msg){
	    	var data=msg.data;
	    	 $.each(data, function(index, val){
 	        	var Stylestr=val.style;
 	        	var attrlist=getstylevalue(Stylestr);
 	        	var content = val.content;
	        	if(content.indexOf("localhost") >= 0){
	        		content = content.replace("localhost", ip);
	        	}
 	        	new Dialog({Width:(attrlist[2].replace("px", ""))*2,Height:(attrlist[1].replace("px", ""))*2,Left:(attrlist[3].replace("px", "")-230)*2,Top:(attrlist[0].replace("px", "")-110)*2,Info:"",Content: content});
 	        });
	        var screen =null;
        	if(cateId=="20"){
        		screen=1;
        	}else if(cateId=="25"){
        		screen=2;
        	}else if(cateId=="26"){
        		screen=3;
        	}
        	var step= (nowNum+1);
        	controlStep(1,screen,step);
	    }
	})
}

function controlStep(flag,screen,step){
	var json = "{\"status\":\"4\",\"flag\":\""+flag+"\",\"screen\":\""+screen+"\",\"step\":\""+step+"\"}";
	setTimeout(function() {
			send(json);
		}, 1 * 1000);
	}
</script>
</body>
</html>

