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
		background-image:url(images/timg.jpg);
	}
	h3{
		color: white;
	}
	.img-border{
		border:4px solid #FFF;
	}
	</style>
</head>
<body>
	<div >
		<div id="menu" class="mypanel" style="">
			<div class="pbtn col-xs-offset-0 .container" style="margin-top: 30px;">
				<div class="row" style="margin: 10px;" >
					<div class="col-xs-4" onclick="switchScene('2@4',this);" style="text-align: center;">
						<img src="images/scenes/land.png" style="width: 80%;" class="img-border">
						<h3>城市体征-土地管理</h3>
					</div>
					<div class="col-xs-4" onclick="switchScene('2@5',this);" style="text-align: center;">
						<img src="images/scenes/environment.png" style="width: 80%;" >
						<h3>城市体征-环保监测</h3>
					</div>
					<div class="col-xs-4" onclick="switchScene('2@6',this);" style="text-align: center;">
						<img src="images/scenes/cityBuild.png" style="width: 80%;">
						<h3>城市体征-城市建设</h3>
					</div>
			 	</div>
			   <div class="row" style="margin: 10px;">
					<div class="col-xs-4" onclick="switchScene('2@7',this);" style="text-align: center;">
						<img src="images/scenes/green.png" style="width: 80%;">
						<h3>城管-绿化环境</h3>
					</div>
					<div class="col-xs-4" onclick="switchScene('2@8',this);" style="text-align: center;">
						<img src="images/scenes/cityAppearance.png" style="width: 80%;">
						<h3>城管-市容市貌</h3>
					</div>
					<div class="col-xs-4" onclick="switchScene('2@9',this);" style="text-align: center;">
						<img src="images/scenes/construction.png" style="width: 80%;">
						<h3>城管-施工管理</h3>
					</div>
				</div>
				<div class="row" style="margin: 10px;">
					<div class="col-xs-4" onclick="switchScene('2@10',this);" style="text-align: center;">
						<img src="images/scenes/security.png" style="width: 80%;">
						<h3>智慧园区-安防</h3>
					</div>
					<div class="col-xs-4" onclick="switchScene('2@11',this);" style="text-align: center;">
						<img src="images/scenes/energy.png" style="width: 80%;">
						<h3>智慧园区-能源</h3>
					</div>
					<div class="col-xs-4" onclick="switchScene('2@12',this);" style="text-align: center;">
						<img src="images/scenes/water.png" style="width: 80%;">
						<h3>智慧园区-环保</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="pbtn mypanel" style="margin-top: 40px;">
				<div class="col-xs-2">
					<button class="btn btn-block btn-success btn-lg" onclick="window.history.back()">返回</button>
				</div>
				<div class="col-xs-2">
					<button class="btn btn-block btn-primary btn-lg" onclick="send('0@f')">首页</button>
				</div>
				<div class="col-xs-2">
					<button class="btn btn-block btn-primary btn-lg" onclick="send('0@-1')">上一页</button>
				</div>
				<div class="col-xs-2">
					<select id="pageNum" style="width:150px;height: 47px;" onchange="switchScreen()">
						<option value="0" selected="selected">1</option>
						<option value="1">2</option>
						<option value="2">3</option>
						<option value="3">4</option>
						<option value="4">5</option>
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
	//判断当前浏览器是否支持WebSocket
	if ('WebSocket' in window) {
		websocket = new WebSocket("ws://localhost:8080/Cm-pom/websocket");
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
</script>
</html>