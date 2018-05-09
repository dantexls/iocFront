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
	<link href="css/topbar.css" rel="stylesheet" type="text/css"/>
	<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	//通过页数切换大屏内容
	function switchScreen(){
		var page = $('#pageNum').val();
		send('1@'+page);
	}
	//切换场景
	function switchScene(categoryId,obj){
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
		//添加页数
		var cateId = categoryId.split('@')[1];
		$.ajax({
    		url:'/Cm-pom/dispatcher/scenes/queryByCategoryId',
    		data:{"categoryId":cateId},
    	    type: 'POST',
    	    dataType:'JSON',
    	    async: false,
    		success:function(msg){
    			var size=msg.size;
    			var html="";
    			for(var i=0;i<size;i++){
    				var temp = "";
    				if(i==0){
    					temp = "<option value=\""+i+"\" selected=\"selected\">"+(i+1)+"</option>"
    				}else{
    					temp = "<option value=\""+i+"\">"+(i+1)+"</option>"
    				}
    				html=html+temp;
    			}
    			$("#pageNum").empty();
    			$("#pageNum").append(html);
    		}
    	});
		send(categoryId);
	}
	</script>
	<style type="text/css">
	body{
	
	}
	h3{
		font-family: SimHei;
		color: #000;
	}
	h1{
		color: white;
	}
	.img-border{
		border:4px solid #0b85ff;
	}
	.ereport_button {
		width: 175px;
		height:40px;
	}
	</style>
</head>
<body>
	<div style="background:url(images/controlBackground2.jpg) 0px 650px;height: 650px;">
		<div id="menu" class="mypanel" style="">
			<div class="pbtn col-xs-offset-0 .container" style="margin-top: 30px;">
				<div class="row" style="margin: 10px;" >
					<!-- <div class="col-xs-2">
						<button class="btn btn-block btn-success btn-lg" onclick="window.history.back()">返回</button>
					</div>
					<div class="col-xs-8" style="text-align: center;">
						<h1>智慧园区管控中心</h1>
					</div> -->
					<div class="find_nav">
						<div class="col-xs-2" style="margin-top: 12px;" onclick="window.history.back()">
							<img src="images/back.png" style="width: 13px;margin-top: 10px;">
							<span style="font-size: 20px;padding-left: 5px;position: relative;top: 8px;color: white;">返回</span>
						</div>
					    <div class="find_nav_left">
					        <div class="find_nav_list" id="pagenavi1">
					            <ul>
					                <li style="margin-left: 346px;"><a style="color: white;">人防管控中心</a></li>
					            </ul>
					        </div>
					    </div>
					</div>
			 	</div>	
				<div class="row" style="margin: 10px;margin-top: 55px;">
					<div class="col-xs-4" onclick="switchScene('2@8a904d70608b40f901612210c9e8002d@0',this);" style="text-align: center;">
						<img src="images/scenes/security.png" style="width: 80%;">
						<h3>城市内涝</h3>
					</div>
					<!-- <div class="col-xs-4" onclick="switchScene('2@11',this);" style="text-align: center;">
						<img src="images/scenes/energy.png" style="width: 80%;">
						<h3>能源</h3>
					</div>
					<div class="col-xs-4" onclick="switchScene('2@12',this);" style="text-align: center;">
						<img src="images/scenes/water.png" style="width: 80%;">
						<h3>环保</h3>
					</div> -->
				</div>
				<div class="row" style="margin: 10px;margin-left: 70px;margin-top: 50px;">
						<div class="col-xs-2">
							<input id="startFire" class="btn btn-default btn-lg ereport_button" type="button" value="启动城市内涝监控" onclick="startWaterMonitor(this)" >
						</div>
						
				</div>   
			</div>
		</div>
		<div style="position: fixed;bottom: 25px;width: 100%;">
				<div class="col-xs-2" style="margin-left: 65px;">
					<button class="btn btn-block btn-primary btn-lg" onclick="send('0@f')">首页</button>
				</div>
				<div class="col-xs-2">
					<button class="btn btn-block btn-primary btn-lg" onclick="send('0@-1')">上一页</button>
				</div>
				<div class="col-xs-2">
					<select id="pageNum" style="width:150px;height: 47px;" onchange="switchScreen()">
						<option value="0" selected="selected">1</option>
						<option value="1">2</option>
					</select>
				</div>
				<div class="col-xs-2">
					<button class="btn btn-block btn-primary btn-lg" onclick="send('0@1')">下一页</button>
				</div>
				<div class="col-xs-2">
					<button class="btn btn-block btn-primary btn-lg" onclick="send('0@e')">尾页</button>
				</div>
				
		</div>
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
	
	//启动城市内涝监控
	function startWaterMonitor(val){
		$.ajax({
			url : 'http://'+ip+':8082/eventMonitor/startWaterMonitor',
			data : {},
			type : 'POST',
			dataType : 'JSON',
			success : function(msg) {
				var status = msg.data;
				console.log("启动城市内涝监控状态："+status);
			}
		})
		settime(val);
	}
	
	var countdown=70;
	//60秒后可重新启动
	function settime(val) {
		if (countdown == 0) {
			val.removeAttribute("disabled");
			val.value = "启动城市内涝监控";
			countdown = 70;
		} else {
			val.setAttribute("disabled", true);
			val.value = "重新启动(" + countdown + ")";
			countdown--;
			setTimeout(function() {
				settime(val)
			}, 1000)
		}
		
	}
</script>
</html>