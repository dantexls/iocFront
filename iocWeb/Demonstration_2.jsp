<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
	<title>客户端</title>
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
	<link href="css/topbar.css" rel="stylesheet" type="text/css"/>
	<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	//公共控制按钮默认状态
	var buildstatus=false;
	var peoplestatus=false;
	var lightstatus=false;
	var greenstatus=false;
	var speedstatus=false;
	var videostatus=false;
	var energystatus="0";
	//通过页数切换大屏内容
	function switchScreen(){
		var page = $('#pageNum').val();
		send('1@'+page);
	}
	//切换场景
	function switchScene(categoryId,obj,status){
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
		//切换显示按钮
		if(status == 1){
			$("#ereportDiv").hide();
			$("#ofoDiv").show();
			$("#fireDiv").hide();
			$("#carDiv").hide();
		}else if(status == 2){
			$("#ereportDiv").hide();
			$("#ofoDiv").hide();
			$("#fireDiv").show();
			$("#carDiv").hide();
		}else if(status == 3){
			$("#ereportDiv").hide();
			$("#ofoDiv").hide();
			$("#fireDiv").hide();
			$("#carDiv").show();
		}
		send(categoryId);
	}
	//事件上报
	function ereport(flag,screen,type,obj){
		dj(obj);
		var json = "{\"status\":\"4\",\"flag\":\""+flag+"\",\"screen\":\""+screen+"\",\"type\":\""+type+"\"}";
		send(json);
	}
	//控制视频播放
	function controlVideo(flag,screen,flashIndex,play){
		var json = "{\"status\":\"4\",\"flag\":\""+flag+"\",\"screen\":\""+screen+"\",\"flashIndex\":\""+flashIndex+"\",\"play\":\""+play+"\"}";
		send(json);
	}
	//测试socket
	function sendCom(unit,step,timeOut,option){
		var json = "{\"unit\":\""+unit+"\",\"step\":\""+step+"\",\"timeout\":\""+timeOut+"\",\"option\":\""+option+"\"}";
		send1(json);
	}
	//翻页
	function flip(message,obj){
		var msg = message.split('@');
		if(msg[0] == '5'){
			$("#ereportDiv").show();
			$("#ofoDiv").hide();
			$("#fireDiv").hide();
			$("#carDiv").hide();
			var imgs = $('#menu').find('img');
			$.each(imgs, function(index, val){
				if($(val).hasClass('img-border')){
					$(val).removeClass('img-border');
				}
			});
		}
		send(message);
		$(obj).attr("disabled",true);
		setTimeout(function(){
			$(obj).attr("disabled",false);
		}, 1*1500);
	}
	
	$(function() {
		//加载事件
		var collection = $(".ereport_button");
		$.each(collection, function() {
			$(this).addClass("start");
		});
	});
	//单击事件
	function dj(dom) {
		var collection = $(".ereport_button");
		$.each(collection, function() {
			$(this).removeClass("end");
			$(this).addClass("start");
		});
		$(dom).removeClass("start");
		$(dom).addClass("end");
	}

	function changeStatus(id){
		switch(id){
		case "buildstatus":
			if(!buildstatus){
				$("#"+id).attr('src','images/start.png');
				buildstatus=true;
				sendCom('building',1,0,'');
			}else if(buildstatus){
				$("#"+id).attr('src','images/close.png');
				buildstatus=false;
				sendCom('building',2,0,'');
			}
		    break;
		case "peoplestatus":
			if(!peoplestatus){
				$("#"+id).attr('src','images/start.png');
				peoplestatus=true;
				sendCom('human2',2,0,'');
			}else if(peoplestatus){
				$("#"+id).attr('src','images/close.png');
				peoplestatus=false;
				sendCom('human2',3,0,'');
			}
		    break;
		case "lightstatus":
			if(!lightstatus){
				$("#"+id).attr('src','images/start.png');
				lightstatus=true;
				sendCom('lamp',1,0,'');
			}else if(lightstatus){
				$("#"+id).attr('src','images/close.png');
				lightstatus=false;
				sendCom('lamp',2,0,'');
			}
		    break;
		case "greenstatus":
			if(!greenstatus){
				$("#"+id).attr('src','images/start.png');
				greenstatus=true;
				sendCom('car6',1,0,'');
			}else if(greenstatus){
				$("#"+id).attr('src','images/close.png');
				greenstatus=false;
				sendCom('car6',2,0,'');
			}
		    break;
		case "speedstatus":
			if(!speedstatus){
				$("#"+id).attr('src','images/start.png');
				speedstatus=true;
				sendCom('railway',1,0,'');
			}else if(speedstatus){
				$("#"+id).attr('src','images/close.png');
				speedstatus=false;
				sendCom('railway',2,0,'');
			}
		    break;
		case "videostatus":
			if(!videostatus){
				$("#"+id).attr('src','images/start.png');
				videostatus=true;
				sendCom('video',1,0,'');
				controlVideo(1,4,8,1);
			}else if(videostatus){
				$("#"+id).attr('src','images/close.png');
				videostatus=false;
				sendCom('video',2,0,'');
				controlVideo(1,4,8,0);
			}
		}
	}
	
	function getstatus(id){
		if(id=="1"){
			energystatus=="1";
			sendCom('energy',1,0,'');
			controlVideo(1,4,7,1);
		}else if(id=="2"){
			energystatus=="2";
			sendCom('energy',2,0,'');
			controlVideo(1,4,6,1);
		}else if(id=="3"){
			energystatus=="3";
			sendCom('energy',3,0,'');
			controlVideo(1,4,5,1);
		}
	}
	</script>
<style type="text/css">
body {
	font-family: SimHei;
}

h3 {
	color: #000;
	margin-top: 8px;
}

.img-border {
	border: 4px solid #0b85ff;
}

.div-border{
	border: 1px solid #dadada;
	border-radius: 6px;
}

.second_title {
	margin-top: -18px;
	margin-left: -55px;
}

.second_title img {
	width: 24px;
	height: 24px;
	margin-left: 100px;
	margin-top: 30px;
}

.second_title h2 {
	margin-left: 133px;
	margin-top: -29px;
}

.ereport_button {
	/* background: #deebf9; */
	width: 160px;
	padding: 2px;
}

.ereport_menu_div {
	margin-left: 67px;
}

.start {
	cursor: pointer;
}

.end {
	cursor: pointer;
	color: #fff;
	background: #b1b0b0;
	border: none;
}
span {
	font-size: 28px;
}
</style>
</head>
<body style="background-color:#000000;overflow:-Scroll;overflow-y:hidden;overflow:-Scroll;overflow-x:hidden;">
	<div style="background:url(images/controlBackground3.jpg) 0px 1080px;width: 1920px;height: 1080px;">
	<!-- <div style="background: #f3f6fb;width: 1920px;height: 1080px;"> -->
		<div id="menu" class="mypanel">
			<div class="pbtn col-xs-offset-0 .container" style="margin-top: 30px;">
				<div class="row" style="margin: 10px;">
					<div class="find_nav">
						<!-- <div class="col-xs-2" style="margin-top: 12px;" onclick="window.history.back()">
							<img src="images/back.png" style="width: 13px;margin-top: 10px;">
							<span style="font-size: 20px;padding-left: 5px;position: relative;top: 8px;">返回</span>
						</div> -->
					    <div class="find_nav_left">
					        <div class="find_nav_list" style="" id="pagenavi1">
					            <ul>
					                <li style="margin-left: 860px;"><a style="color: white;font-size: 40px;">场&nbsp;景&nbsp;演&nbsp;示</a></li>
					            </ul>
					        </div>
					    </div>
					</div>
			 	</div>
			 	<div class="div-border" style="width: 1880px;height: 325px;margin-left: 23px;margin-top: 57px;background: white;">
				 	<div class="row second_title">
				 		<img src="images/scenes_demo.png">
				 		<h2>场景演示</h2>
				 	</div>
					<div class="row" style="margin: 10px;" >
						<div class="col-xs-4" onclick="switchScene('2@20@0',this,1);" style="text-align: center;width: 500px;margin-left: 164px;">
							<img src="images/ofo/1.jpg" style="width: 80%;">
							<h3>共享单车治理</h3>
						</div>
						<div class="col-xs-4" onclick="switchScene('2@25@0',this,2);" style="text-align: center;width: 500px;margin-left: 20px;">
							<img src="images/fire/fire2.png" style="width: 80%;">
							<h3>火灾事件</h3>
						</div>
						<div class="col-xs-4" onclick="switchScene('2@26@0',this,3);" style="text-align: center;width: 500px;margin-left: 20px;">
							<img src="images/car/car2.jpg" style="width: 80%;">
							<h3>违章停车</h3>
						</div>
				 	</div>
			 	</div>
			 	<div id="ereportDiv" class="div-border" style="display: block;width: 1880px;height: 225px;margin-left: 23px;margin-top: 12px;background: white;">
				 	<div class="row second_title">
				 		<img src="images/e_report.png">
				 		<h2>事件上报</h2>
				 	</div>
					<div class="row" style="margin: 10px;margin-left: 220px;">
						<div class="col-xs-2">
							<button class="btn btn-default btn-lg ereport_button" style="height:60px;width:300px" onclick="ereport(1,0,0,this)"><span>违章停车上报</span></button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-default btn-lg ereport_button" style="height:60px;width:300px;margin-left:20px" onclick="ereport(1,0,1,this)"><span>治安事件上报</span></button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-default btn-lg ereport_button" style="height:60px;width:300px;margin-left:45px" onclick="ereport(1,0,2,this)"><span>市政设施上报</span></button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-default btn-lg ereport_button" style="height:60px;width:300px;margin-left:70px" onclick="ereport(1,0,3,this)"><span>道路维护上报</span></button>
						</div>
					</div>
					<div class="row" style="margin: 10px;margin-left: 220px;">
						<div class="col-xs-2">
							<button class="btn btn-default btn-lg ereport_button" style="height:60px;width:300px" onclick="ereport(1,0,4,this)"><span>交通拥堵上报</span></button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-default btn-lg ereport_button" style="height:60px;width:300px;margin-left:20px" onclick="ereport(1,0,5,this)"><span>违法犯罪上报</span></button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-default btn-lg ereport_button" style="height:60px;width:300px;margin-left:45px" onclick="ereport(1,0,6,this)"><span>突发事件上报</span></button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-default btn-lg ereport_button" style="height:60px;width:300px;margin-left:70px" onclick="ereport(1,0,7,this)"><span>环境污染上报</span></button>
						</div>
					</div>
				</div>

                <div id="ereportDiv2" class="div-border" style="display: block;width: 1880px;height: 190px;margin-left: 23px;margin-top: 12px;background: white;">
                     <div class="row second_title">
				 		<img src="images/global_control.png">
				 		<h2>全局控制</h2>
				 	 </div>
                     <div class="row" style="margin: 10px;margin-left: 220px;">
                          <div class="col-xs-3">
                          <span>建筑控制：降</span>
                          <img id="buildstatus" src="images/close.png" onclick="changeStatus(this.id)"><span>升</span>
                          </div>
                          <div class="col-xs-3">
                          <span>公仔控制：停</span>
                          <img id="peoplestatus" src="images/close.png" onclick="changeStatus(this.id)" ><span>动</span>
                          </div>
                           <div class="col-xs-3">
                          <span>灯光控制：关</span>
                          <img id="lightstatus" src="images/close.png" onclick="changeStatus(this.id)"><span>开</span>
                          </div>
                          <div class="col-xs-3">
                          <span>绿灯控制：停</span>
                          <img id="greenstatus" src="images/close.png" onclick="changeStatus(this.id)"><span>跑</span>
                          </div>
                     </div>
                     <!-- <div class="row" style="margin: 10px;margin-left: 220px;">
                          <div class="col-xs-2">
                          <span>灯光控制：</span>
                          <img id="lightstatus" src="images/close.png" onclick="changeStatus(this.id)">
                          </div>
                          <div class="col-xs-2 ereport_menu_div">
                          <span>绿灯控制：</span>
                          <img id="greenstatus" src="images/close.png" onclick="changeStatus(this.id)">
                          </div>
                     </div> -->
                     <!-- <div class="row" style="margin: 10px;margin-left: 220px;">
                      	  <div class="col-xs-2">
                          <span>高铁控制：</span>
                          <img id="speedstatus" src="images/close.png" onclick="changeStatus(this.id)">
                          </div>
                          <div class="col-xs-2 ereport_menu_div">
                          <span>视频控制：</span>
                          <img id="videostatus" src="images/close.png" onclick="changeStatus(this.id)">
                          </div>
                     </div> -->
					 <div class="row" style="margin: 10px;margin-left: 220px;">
                          <!-- <div class="col-xs-2">
                               <button class="btn btn-block btn-lg ereport_button" style="height:40px;width:300px;" onclick="sendCom('energy',1,0,'');">能耗：高</button>
                          </div>
                          <div class="col-xs-2 ereport_menu_div">
                               <button class="btn btn-block btn-lg ereport_button" style="height:40px;width:300px;margin-left:20px" onclick="sendCom('energy',2,0,'');">能耗：中</button>
                          </div>
                          <div class="col-xs-2 ereport_menu_div">
                               <button class="btn btn-block btn-lg ereport_button" style="height:40px;width:300px;margin-left:45px" onclick="sendCom('energy',3,0,'');">能耗：低</button>
                          </div>  -->
                          <div class="col-xs-3">
	                          <span>高铁控制：停</span>
	                          <img id="speedstatus" src="images/close.png" onclick="changeStatus(this.id)"><span>动</span>
                          </div>
                          <div class="col-xs-3">
	                          <span>视频控制：停</span>
	                          <img id="videostatus" src="images/close.png" onclick="changeStatus(this.id)"><span>播</span>
                          </div>
   						  <div class="col-xs-5">
   						  		<span>能耗：</span>
   						  		<input id="1" type="radio" name="radio" style="width: 20px;height: 20px;" onclick="getstatus(this.id)">&nbsp;<label for="1" style="font-size: 28px;">高&nbsp;&nbsp;&nbsp;&nbsp;</label>
   						  		<input id="2" type="radio" name="radio" style="width: 20px;height: 20px;" onclick="getstatus(this.id)">&nbsp;<label for="2" style="font-size: 28px;">中&nbsp;&nbsp;&nbsp;&nbsp;</label>
   						  		<input id="3" type="radio" name="radio" style="width: 20px;height: 20px;" onclick="getstatus(this.id)">&nbsp;<label for="3" style="font-size: 28px;">低&nbsp;&nbsp;&nbsp;&nbsp;</label>
   						  </div>
                     </div>
                </div>

				<!-- 共享单车操作按钮 -->
				<div id="ofoDiv" class="div-border" style="display:none;width: 1880px;height: 348px;margin-left: 23px;margin-top: 12px;background: white;">
				 	<div class="row second_title">
				 		<img src="images/sand_table.png">
				 		<h2>共享单车</h2>
				 	</div>
					<div class="row" style="margin: 10px;margin-left: 220px;">
						<!-- <div class="col-xs-2">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px;" onclick="sendCom('car5',1,0,'');">运营车出发</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px;margin-left:20px" onclick="sendCom('human3',1,0,'');">公仔1拍照</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px;margin-left:45px" onclick="sendCom('human4',1,0,'');">公仔2拍照</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px;margin-left:70px"  onclick="sendCom('human5',1,0,'');">公仔3拍照</button>
						</div> -->
						<div class="col-xs-2">
							<img src="images/icon/icon_06.png" style="width: 40%;" onclick="sendCom('car5',1,0,'');">
							<h3>运营车出发</h3>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_06.png" style="width: 40%;" onclick="sendCom('car5',2,0,'');">
							<h3>运营车归位</h3>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_09.png" style="width: 40%;" onclick="sendCom('human3',1,0,'');">
							<h3>公仔1拍照</h3>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_11.png" style="width: 40%;" onclick="sendCom('human4',1,0,'');">
							<h3>公仔2拍照</h3>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_13.png" style="width: 40%;" onclick="sendCom('human5',1,0,'');">
							<h3>公仔3拍照</h3>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_15.png" style="width: 40%;" onclick="sendCom('human6',1,0,'');">
							<h3>公仔4拍照</h3>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_17.png" style="width: 40%;" onclick="sendCom('human7',1,0,'');">
							<h3>公仔5拍照</h3>
						</div>
					</div>
					<!-- <div class="row" style="margin: 10px;margin-left: 220px;">
						<div class="col-xs-2">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px" onclick="sendCom('human6',1,0,'');">公仔4拍照</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px;margin-left:20px" onclick="sendCom('human7',1,0,'');">公仔5拍照</button>
						</div>
					</div> -->
				</div>
				<!-- 火灾操作按钮 -->
				<div id="fireDiv" class="div-border" style="display:none;width: 1880px;height: 348px;margin-left: 23px;margin-top: 12px;background: white;">
				 	<div class="row second_title">
				 		<img src="images/sand_table.png">
				 		<h2>火灾事件</h2>
				 	</div>
					<div class="row" style="margin: 10px;margin-left: 220px;">
						<!-- <div class="col-xs-2">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px" onclick="sendCom('building',3,0,'');">建筑冒烟</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px;margin-left:20px" onclick="sendCom('building',4,0,'');">建筑停止冒烟</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px;margin-left:45px" onclick="sendCom('car1',3,0,'');">警车出发</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px;margin-left:70px" onclick="sendCom('car1',4,0,'');">警车归位</button>
						</div> -->
						<div class="col-xs-2">
							<img src="images/icon/icon_41.png" style="width: 40%;" onclick="sendCom('building',3,0,'');">
							<h3>建筑冒烟</h3>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_42.png" style="width: 40%;" onclick="sendCom('building',4,0,'');">
							<h3 style="margin-left: -23px;">建筑停止冒烟</h3>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_52.png" style="width: 40%;" onclick="sendCom('car1',3,0,'');">
							<h3>警车出发</h3>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_53.png" style="width: 40%;" onclick="sendCom('car1',4,0,'');">
							<h3>警车归位</h3>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_55.png" style="width: 40%;" onclick="sendCom('car3',1,0,'');">
							<h3 style="margin-left: -8px;">消防车出发</h3>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_57.png" style="width: 40%;" onclick="sendCom('car3',2,0,'');">
							<h3 style="margin-left: -8px;" >消防车归位</h3>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_72.png" style="width: 40%;" onclick="sendCom('car4',1,0,'');">
							<h3 style="margin-left: -8px;">救护车出发</h3>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_74.png" style="width: 40%;" onclick="sendCom('car4',2,0,'');">
							<h3 style="margin-left: -8px;">救护车归位</h3>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_76.png" style="width: 40%;">
							<h3>公仔拍照</h3>
						</div>
					</div>
					<!-- <div class="row" style="margin: 10px;margin-left: 220px;">
						<div class="col-xs-2">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px" onclick="sendCom('car3',1,0,'');">消防车出发</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px;margin-left:20px"  onclick="sendCom('car3',2,0,'');">消防车归位</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px;margin-left:45px" onclick="sendCom('car4',1,0,'');">救护车出发</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px;margin-left:70px"  onclick="sendCom('car4',2,0,'');">救护车归位</button>
						</div>
					</div>
					<div class="row" style="margin: 10px;margin-left: 220px;">
						<div class="col-xs-2">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px" onclick="sendCom('human1',1,0,'');">公仔拍照</button>
						</div>
					</div> -->
				</div>
				<!-- 违章停车操作按钮 -->
				<div id="carDiv" class="div-border" style="display:none;width: 1880px;height: 230px;margin-left: 23px;margin-top: 12px;background: white;">
				 	<div class="row second_title">
				 		<img src="images/sand_table.png">
				 		<h2>违章停车</h2>
				 	</div>
					<div class="row" style="margin: 10px;margin-left: 220px;">
						<!-- <div class="col-xs-2">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px" onclick="sendCom('car2',1,0,'');">违章车违停</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px;margin-left:20px" onclick="sendCom('car2',2,0,'');">违章车归位</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px;margin-left:45px" onclick="sendCom('car1',1,0,'');">警车出发</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px;margin-left:70px" onclick="sendCom('car1',2,0,'');">警车归位</button>
						</div> -->
						<div class="col-xs-2">
							<img src="images/icon/icon30_27.png" style="width: 40%;" onclick="sendCom('car2',1,0,'');">
							<h3 style="margin-left: -8px;">违章车违停</h3>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_27.png" style="width: 40%;" onclick="sendCom('car2',2,0,'');">
							<h3 style="margin-left: -8px;">违章车归位</h3>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_28.png" style="width: 40%;" onclick="sendCom('car1',1,0,'');">
							<h3>警车出发</h3>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_29.png" style="width: 40%;" onclick="sendCom('car1',2,0,'');">
							<h3>警车归位</h3>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_30.png" style="width: 40%;" onclick="sendCom('human2',1,0,'');">
							<h3>公仔拍照</h3>
						</div>
					</div>
					<!-- <div class="row" style="margin: 10px;margin-left: 220px;">
						<div class="col-xs-2">
							<button class="btn btn-block btn-lg ereport_button" style="height:60px;width:300px" onclick="sendCom('human2',1,0,'');">公仔拍照</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" style="margin-left:20px;height:60px;width:300px" onclick="sendCom('car2',3,0,'');">违章车跑环</button>
						</div>
					</div> -->
				</div>
			</div>
		</div>
		<div style="position: fixed;bottom: -1px;width: 101%;height: 70px;margin-left: -3px;background: white;" class="div-border">
				<div class="col-xs-2" style="margin-top: 10px;margin-left: 240px;">
					<!-- <button class="btn btn-block btn-primary btn-lg" onclick="flip('0@f',this)" >首页</button> -->
					<img alt="" src="images/icon/anniu_69.png" onclick="flip('0@f',this)">
				</div>
				<div class="col-xs-2" style="margin-top: 10px;">
					<!-- <button class="btn btn-block btn-primary btn-lg" onclick="flip('0@-1',this)" >上一页</button> -->
					<img alt="" src="images/icon/anniu_71.png" onclick="flip('0@-1',this)">
				</div>
				<!-- <div class="col-xs-2">
					<select id="pageNum" style="width:220px;height: 47px;" onchange="switchScreen()">
						<option value="0" selected="selected">1</option>
						<option value="1">2</option>
						<option value="2">3</option>
						<option value="3">4</option>
						<option value="4">5</option>
					</select>
				</div> -->
				<div class="col-xs-2" style="margin-top: 10px;">
					<!-- <button class="btn btn-block btn-primary btn-lg" onclick="flip('0@1',this)">下一页</button> -->
					<img alt="" src="images/icon/anniu_73.png" onclick="flip('0@1',this)">
				</div>
				<div class="col-xs-2" style="margin-top: 10px;">
					<!-- <button class="btn btn-block btn-primary btn-lg" onclick="flip('0@e',this)" >尾页</button> -->
					<img alt="" src="images/icon/anniu_75.png" onclick="flip('0@e',this)">
				</div>
				<div class="col-xs-2" style="margin-top: 10px;">
					<!-- <button class="btn btn-block btn-primary btn-lg" onclick="flip('5@1',this);sendCom('state',1,0,'');" >日常监控</button> -->
					<img alt="" src="images/icon/anniu_77.png" onclick="flip('5@1',this);sendCom('state',1,0,'');">
				</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	var websocket1 = null;
	//判断当前浏览器是否支持WebSocket
	if ('WebSocket' in window) {
		var ip = document.location.hostname;
		var port = document.location.port;
		websocket1 = new WebSocket("ws://192.168.1.90:8888/");
		//websocket = new WebSocket("ws://10.129.132.119:8080/Cm-pom/websocket");
	} else {
		alert('当前浏览器 Not support websocket');
	}

	//连接发生错误的回调方法
	websocket1.onerror = function() {
		setMessageInnerHTML1("WebSocket连接发生错误");
	};

	//连接成功建立的回调方法
	websocket1.onopen = function() {
		setMessageInnerHTML1("WebSocket连接成功");
	}

	//连接关闭的回调方法
	websocket1.onclose = function() {
		setMessageInnerHTML1("WebSocket连接关闭");
	}

	//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
	window.onbeforeunload = function() {
		closeWebSocket1();
	}

	//将消息显示在网页上
	function setMessageInnerHTML1(innerHTML) {
		//document.getElementById('message').innerHTML += innerHTML + '<br/>';
	}

	//关闭WebSocket连接
	function closeWebSocket1() {
		websocket1.close();
	}

	//发送消息
	function send1(message) {
		//var message = document.getElementById('text').value;
		//websocket1.send(message);
		if(websocket1.readyState !== 1){
			closeWebSocket1();
			websocket1 = new WebSocket("ws://192.168.1.90:8888/");
			setTimeout(function() {
				websocket1.send(message);
	        }, 250);
		}else{
			websocket1.send(message);
		}
		
	}
	
	var websocket = null;
	var ip = document.location.hostname;
	var port = document.location.port;
	//判断当前浏览器是否支持WebSocket
	if ('WebSocket' in window) {
		//websocket = new WebSocket("ws://192.168.1.101:8888/");
		websocket = new WebSocket("ws://"+ip+":"+port+"/Cm-pom/websocket");
	} else {
		alert('当前浏览器 Not support websocket');
	}

	//连接发生错误的回调方法
	websocket.onerror = function() {
		//setMessageInnerHTML("WebSocket连接发生错误");
		
	};

	//连接成功建立的回调方法
	websocket.onopen = function() {
		//setMessageInnerHTML("WebSocket连接成功");
		//heartCheck.start();
	}
	
	//接收到消息的回调方法
	websocket.onmessage = function(event) {
		//heartCheck.reset();
	}
	
	//连接关闭的回调方法
	websocket.onclose = function() {
		//setMessageInnerHTML("WebSocket连接关闭");
		
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
		//alert(websocket.readyState);
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
	
	var heartCheck = {
	    timeout: 60000,//60s
	    timeoutObj: null,
	    serverTimeoutObj: null,
	    reset: function(){
	        clearTimeout(this.timeoutObj);
	        clearTimeout(this.serverTimeoutObj); 
			this.start();
	    },	    
	    start: function(){
			var	self = this;	        
			this.timeoutObj = setTimeout(function(){
				send("HeartBeat");
		       	self.serverTimeoutObj = setTimeout(function(){
		       			closeWebSocket(); //如果onclose会执行reconnect，我们执行ws.close()就行了.如果直接执行reconnect 会触发onclose导致重连两次
		            }, self.timeout)
		        }, this.timeout);
		},
	}
</script>
</html>