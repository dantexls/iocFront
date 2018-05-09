<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8"%>
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
	<script src="js/touchslider.js" type="text/javascript"></script>
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
		if(url){
			window.location.href = url;
		}
	}
	
	</script>
	<style type="text/css">
	body{
		background-image:url(images/controlBackground2.jpg);
	}
	.col-xs-4 h3{
		font-family: SimHei;
		color: #000;
		margin-top: -657px;
	}
	.col-xs-4 img{
		margin-top: -660px;
		width: 220px;
	}
	h1{
		color: white;
		font-size: 50px;
	}
	.img-border{
		border:4px solid #0b85ff;
	}
	.menu_div{
		margin-top: -716px;
    	margin-left: 20px;
	}
	.menu_div img{
		width: 24px;
		height: 24px;
		margin-left: -222px;
	}
	.menu_div h3{
		margin-top: -738px;
	}
	</style>
	<style type="text/css">
body,td,th,ul,li{
	font-family: "Helvetica Neue", Helvetica, Arial, Verdana, sans-serif;
	padding:0;
	margin:0;
}
a {
	color: #333;
	text-decoration:none;
	cursor:pointer;
}
.find_nav {
    width: 100%;
    height: 70px;
    background-color: #f9f9f9;
    position: fixed;
    top: 0;
    z-index: 9999;
    border-bottom: 1px solid #c8c8c8;
    display: -moz-box;
    display: -webkit-box;
    display: box;
    margin-left: -10px;
}
.find_nav_left {
    height: 70px;
    position: relative;
    overflow: hidden;
    -moz-box-flex: 1;
    -webkit-box-flex: 1;
    box-flex: 1;
}
.find_nav_list {
    position: absolute;
    left: 0;
}
.find_nav_list ul {
    position: relative;
    white-space: nowrap;
    font-size: 0;
}
.find_nav_list ul li {
    display: inline-block;
    padding: 0;
	margin:0 120px;
}
.find_nav_list ul li a {
    display: block;
    width: 100%;
    height: 100%;
    line-height: 70px;
    font-size: 24px;
    text-align: center;
    color: #666;
    text-decoration: none;
}
.find_nav_cur a {
    color: #48a5f4 !important;
}
.find_nav_list a.active{ color:#C00}
.sideline {
    display: block;
    position: absolute;
    border: 0;
    height: 2px;
    background-color: #48a5f4;
    left: 0;
    top: 68px;
    pointer-events: none;
}
.li_list{font-size:40px; line-height:800px; color:#fff; text-align:center}
.swipe{padding:10px 0 0 0;}
.row_li{width:25%;margin-left: 83px;}
.row_li img{}
</style>
</head>
<body>
	<div>
		<!-- <div class="pbtn mypanel" style="margin-top: 40px;">
				<div class="col-xs-2">
					<button class="btn btn-block btn-success btn-lg" onclick="window.history.back()">返回</button>
				</div>
		</div> -->
		<div id="menu" class="mypanel" style="">
			<div class="pbtn col-xs-offset-0 .container" style="margin-top: 30px;">
				<div class="row" style="margin: 10px;" >
					
					<!-- <div class="col-xs-8" style="text-align: center;">
						<h1>总控中心</h1>
					</div> -->
					<div class="find_nav">
						<div class="col-xs-2" style="margin-top: 12px;" onclick="window.location='controlHome.jsp'">
							<img src="images/back.png" style="width: 13px;margin-top: 10px;">
							<span style="font-size: 20px;padding-left: 5px;position: relative;top: 8px;">返回</span>
							<!-- <button class="btn btn-block btn-lg">返回</button> -->
						</div>
					    <div class="find_nav_left">
					        <div class="find_nav_list" id="pagenavi1">
					            <ul>
					                <li class="find_nav_cur"><a href="#" class="">总控中心</a></li>
					                <li class=""><a href="#" class="">分控中心</a></li>
					                <li class="sideline" style="left: 136px; width: 96px;"></li>
					            </ul>
					        </div>
					    </div>
					</div>
			 	</div>
			 	
			 	<div id="slider1" class="swipe" style="overflow: hidden; visibility: visible; list-style: none; position: relative;">
				  <ul class="box01_list" style="position: relative; transition: left 600ms ease-out; width: 100%;height: 660px;">
					<!-- <li class="li_list" style="width: 100%; height:100%; display: table-cell; padding: 0px; margin: 0px; float: left; vertical-align: top;">
						<div class="row" style="margin: 10px;margin-top: 30px;">
							<div class="col-xs-4 row_li" onclick="enterScene('2@6@0','',this);" style="text-align: center;">
								<img src="images/scenes/zk_rgzn.png">
								<h3>人工智能</h3>
							</div>
							<div class="col-xs-4 row_li" onclick="enterScene('2@28@0','',this);" style="text-align: center;">
								<img src="images/scenes/zk_wlw.png">
								<h3>物联网</h3>
							</div>
							<div class="col-xs-4 row_li" onclick="enterScene('2@29@0','',this);" style="text-align: center;">
								<img src="images/scenes/zk_jksp.png">
								<h3>视频监控</h3>
							</div>
						</div>
						<div class="row" style="margin: 10px;">
							<div class="col-xs-4 row_li" onclick="enterScene('2@30@0','',this);" style="text-align: center;">
								<img src="images/scenes/zk_rhtx.png">
								<h3>融合通信</h3>
							</div>
							<div class="col-xs-4 row_li" onclick="enterScene('2@32@0','',this);" style="text-align: center;">
								<img src="images/scenes/zk_ygjc.png">
								<h3>城市体征</h3>
							</div>
							<div class="col-xs-4 row_li" onclick="enterScene('2@4@0','',this);" style="text-align: center;">
								<img src="images/scenes/zk_zylc.png">
								<h3>SOP标准作业流程</h3>
							</div>
						</div>
						<div class="row" style="margin: 10px;">
							<div class="col-xs-4 row_li" onclick="enterScene('2@5@0','',this);" style="text-align: center;">
								<img src="images/scenes/zk_wgh.png">
								<h3>GIS</h3>
							</div>
							<div class="col-xs-4 row_li" onclick="enterScene('2@27@0','',this);" style="text-align: center;">
								<img src="images/scenes/zk_dsj.png">
								<h3>大数据</h3>
							</div>
							<div class="col-xs-4 row_li" onclick="enterScene('2@41@0','',this);" style="text-align: center;">
								<img src="images/scenes/zk_18da.png">
								<h3>十八大成果展首页</h3>
							</div>
						</div>
					</li> -->
					<li class="li_list" style="width: 100%; height:100%; display: table-cell; padding: 0px; margin: 0px; float: left; vertical-align: top;">
						<div class="row" style="margin: 10px;margin-top: 30px;">
							<div class="col-xs-4 row_li" onclick="enterScene('2@60@0','',this);" style="text-align: center;">
								<img src="images/scenes/zk_rgzn.png">
								<h3>宣传视频</h3>
							</div>
							<div class="col-xs-4 row_li" onclick="enterScene('2@30@0','',this);" style="text-align: center;">
								<img src="images/scenes/zk_wlw.png">
								<h3>背景综述</h3>
							</div>
							<div class="col-xs-4 row_li" onclick="enterScene('2@32@0','',this);" style="text-align: center;">
								<img src="images/scenes/zk_jksp.png">
								<h3>卫星遥感</h3>
							</div>
						</div>
						<div class="row" style="margin: 10px;">
							<div class="col-xs-4 row_li" onclick="enterScene('2@28@0','',this);" style="text-align: center;">
								<img src="images/scenes/zk_rhtx.png">
								<h3>城市综治</h3>
							</div>
							<div class="col-xs-4 row_li" onclick="enterScene('2@29@0','',this);" style="text-align: center;">
								<img src="images/scenes/zk_ygjc.png">
								<h3>运营监控</h3>
							</div>
							<div class="col-xs-4 row_li" onclick="enterScene('2@27@0','',this);" style="text-align: center;">
								<img src="images/scenes/zk_zylc.png">
								<h3>城市大数据</h3>
							</div>
						</div>
						<div class="row" style="margin: 10px;">
							<div class="col-xs-4 row_li" onclick="enterScene('2@6@0','',this);" style="text-align: center;">
								<img src="images/scenes/zk_wgh.png">
								<h3>人工智能</h3>
							</div>
							<div class="col-xs-4 row_li" onclick="enterScene('2@5@0','',this);" style="text-align: center;">
								<img src="images/scenes/zk_dsj.png">
								<h3>网格化</h3>
							</div>
							<div class="col-xs-4 row_li" onclick="enterScene('2@4@0','',this);" style="text-align: center;">
								<img src="images/scenes/zk_18da.png">
								<h3>通智</h3>
							</div>
						</div>
					</li>
					<li class="li_list" style="width: 100%; display: table-cell; padding: 0px; margin: 0px; float: left; vertical-align: top;">
						<div class="row" style="margin: 10px;margin-top: 30px;">
							<div class="col-xs-4" onclick="enterScene('2@41@0','tizheng.jsp',this);" style="text-align: center;">
								<img src="images/scenes/green.png">
								<div class="menu_div">
									<img src="images/control_logo1.png">
									<h3>消防管控中心</h3>
								</div>								
							</div>
							<div class="col-xs-4" onclick="enterScene('2@8a904d70608b40f901612210665e002c@0','chengguan.jsp',this);" style="text-align: center;">
								<img src="images/scenes/cityAppearance.png">
								<div class="menu_div">
									<img src="images/control_logo2.png">
									<h3>城市生命线</h3>
								</div>
							</div>
							<div class="col-xs-4" onclick="enterScene('2@8a904d70608b40f901612210c9e8002d@0','yuanqu.jsp',this);" style="text-align: center;">
								<img src="images/scenes/construction.png">
								<div class="menu_div">
									<img src="images/control_logo3.png">
									<h3>人防管控中心</h3>
								</div>
							</div>
						</div>
						<!-- <div class="row" style="margin: 10px;">
							<div class="col-xs-4" onclick="" style="text-align: center;">
								<img src="images/scenes/security.png">
								<div class="menu_div">
									<img src="images/control_logo4.png">
									<h3>环境管控中心</h3>
								</div>
							</div>
							<div class="col-xs-4" onclick="" style="text-align: center;">
								<img src="images/scenes/energy.png">
								<div class="menu_div">
									<img src="images/control_logo5.png">
									<h3>园区管控中心</h3>
								</div>
							</div>
							<div class="col-xs-4" onclick="" style="text-align: center;">
								<img src="images/scenes/water.png">
								<div class="menu_div">
									<img src="images/control_logo6.png">
									<h3>综合治理中心</h3>
								</div>
							</div>
						</div>
						<div class="row" style="margin: 10px;">
							<div class="col-xs-4" onclick="" style="text-align: center;">
								<img src="images/scenes/security.png">
								<div class="menu_div">
									<img src="images/control_logo4.png">
									<h3>应急指挥中心</h3>
								</div>
							</div>
							<div class="col-xs-4" onclick="" style="text-align: center;">
								<img src="images/scenes/energy.png">
								<div class="menu_div">
									<img src="images/control_logo5.png">
									<h3>遥感监测中心</h3>
								</div>
							</div>
							<div class="col-xs-4" onclick="" style="text-align: center;">
								<img src="images/scenes/water.png">
								<div class="menu_div">
									<img src="images/control_logo6.png">
									<h3>安全中心</h3>
								</div>
							</div>
						</div> -->
					</li>
				  </ul>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	var websocket = null;
	//判断当前浏览器是否支持WebSocket
	if ('WebSocket' in window) {
		var ip = document.location.hostname;
		var port = document.location.port;
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
		websocket.send(message);
	}
</script>

<script type="text/javascript">
$(".find_nav_list").css("left",0);

$(".find_nav_list li").each(function(){
		$(".sideline").css({left:0});
		$(".find_nav_list li").eq(0).addClass("find_nav_cur").siblings().removeClass("find_nav_cur");
});
var nav_w=$(".find_nav_list li").first().width();
$(".sideline").width(nav_w);
$(".find_nav_list li").on('click', function(){
	nav_w=$(this).width();
	$(".sideline").stop(true);
	$(".sideline").animate({left:$(this).position().left},300);
	$(".sideline").animate({width:nav_w});
	$(this).addClass("find_nav_cur").siblings().removeClass("find_nav_cur");
	var fn_w = ($(".find_nav").width() - nav_w) / 2;
	var fnl_l;
	var fnl_x = parseInt($(this).position().left);
	if (fnl_x <= fn_w) {
		fnl_l = 0;
	} else if (fn_w - fnl_x <= flb_w - fl_w) {
		fnl_l = flb_w - fl_w;
	} else {
		fnl_l = fn_w - fnl_x;
	}
	$(".find_nav_list").animate({
		"left" : fnl_l
	}, 300);
	
});
var fl_w=$(".find_nav_list").width();
var flb_w=$(".find_nav_left").width();
$(".find_nav_list").on('touchstart', function (e) {
	var touch1 = e.originalEvent.targetTouches[0];
	x1 = touch1.pageX;
	y1 = touch1.pageY;
	ty_left = parseInt($(this).css("left"));
});
$(".find_nav_list").on('touchmove', function (e) {
	var touch2 = e.originalEvent.targetTouches[0];
	var x2 = touch2.pageX;
	var y2 = touch2.pageY;
	if(ty_left + x2 - x1>=0){
		$(this).css("left", 0);
	}else if(ty_left + x2 - x1<=flb_w-fl_w){
		$(this).css("left", flb_w-fl_w);
	}else{
		$(this).css("left", ty_left + x2 - x1);
	}
	if(Math.abs(y2-y1)>0){
		e.preventDefault();
	}
});


for(n=1;n<9;n++){
	var page='pagenavi'+n;
	var mslide='slider'+n;
	var mtitle='emtitle'+n;
	arrdiv = 'arrdiv' + n;
	var as=document.getElementById(page).getElementsByTagName('a');
	var tt=new TouchSlider({id:mslide,'auto':'-1',fx:'ease-out',direction:'left',speed:600,timeout:5000,'before':function(index){
		var as=document.getElementById(this.page).getElementsByTagName('a');
		as[this.p].className='';
		this.p=index;
		
		fnl_x =  parseInt($(".find_nav_list li").eq(this.p).position().left);
		
		nav_w=$(".find_nav_list li").eq(this.p).width();
		$(".sideline").stop(true);
		$(".sideline").animate({left:$(".find_nav_list li").eq(this.p).position().left},300);
		$(".sideline").animate({width:nav_w},100);
		$(".find_nav_list li").eq(this.p).addClass("find_nav_cur").siblings().removeClass("find_nav_cur");
		var fn_w = ($(".find_nav").width() - nav_w) / 2;
		var fnl_l;
		if (fnl_x <= fn_w) {
			fnl_l = 0;
		} else if (fn_w - fnl_x <= flb_w - fl_w) {
			fnl_l = flb_w - fl_w;
		} else {
			fnl_l = fn_w - fnl_x;
		}
		$(".find_nav_list").animate({
			"left" : fnl_l
		}, 300);
	}});
	tt.page = page;
	tt.p = 0;
	//console.dir(tt); console.dir(tt.__proto__);

	for(var i=0;i<as.length;i++){
		(function(){
			var j=i;
			as[j].tt = tt;
			as[j].onclick=function(){
				this.tt.slide(j);
				return false;
			}
		})();
	}
}
</script>
</html>