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
	<script src="js/scene/demonstration.js" type="text/javascript"></script>
	<script type="text/javascript">
	
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
		margin-top: -3px;
		margin-left: -55px;
	}
	
	.second_title img {
		width: 24px;
		height: 24px;
		margin-left: 100px;
		margin-top: 16px;
	}
	
	.second_title h2 {
		margin-left: 133px;
		margin-top: -29px;
		color: #0a84ff;
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
		font-size: 17px;
	}
	
	.col-xs-3 img {
		width: 42px;
	} 
</style>
</head>
<body>
	<div style="background:url(images/controlBackground2.jpg) 0px 718px;width: 1024px;height: 768px;">
	<!-- <div style="background: #f3f6fb;width: 1024px;height: 700px;"> -->
		<div id="menu" class="mypanel">
			<div class="pbtn col-xs-offset-0 .container" style="margin-top: 30px;">
				<div class="row" style="margin: 10px;">
					<div class="find_nav">
						<!-- <div class="col-xs-2" style="margin-top: 12px;" onclick="window.location='controlHome.jsp'">
							<img src="images/back.png" style="width: 13px;margin-top: 10px;">
							<span style="font-size: 20px;padding-left: 5px;position: relative;top: 8px;color: white;">返回</span>
						</div> -->
					    <div class="find_nav_left">
					        <div class="find_nav_list" id="pagenavi1">
					            <ul>
					                <li style="margin-left: 422px;"><a style="color: white;font-size: 35px;">场景演示</a></li>
					            </ul>
					        </div>
					    </div>
					</div>
			 	</div>
			 	<div class="div-border" style="width: 977px;height: 218px;margin-left: 23px;margin-top: 57px;background: white;">
				 	<div class="row second_title" style="margin-left: -55px;">
				 		<img src="images/scenes_demo.png">
				 		<h2>场景演示</h2>
				 	</div>
					<div class="row" style="margin-left: 10px;" >
						<div class="col-xs-4" onclick="switchScene('2@20@0',this,1);" style="text-align: center;width: 300px;">
							<img src="images/ofo/1.jpg" style="width: 80%;">
							<h3>共享单车治理</h3>
						</div>
						<div class="col-xs-4" onclick="switchScene('2@25@0',this,2);" style="text-align: center;width: 300px;margin-left: 20px;">
							<img src="images/fire/fire2.png" style="width: 80%;">
							<h3>火灾事件</h3>
						</div>
						<div class="col-xs-4" onclick="switchScene('2@26@0',this,3);" style="text-align: center;width: 300px;margin-left: 20px;">
							<img src="images/car/car2.jpg" style="width: 80%;">
							<h3>违章停车</h3>
						</div>
				 	</div>
			 	</div>
			 	<!-- 事件上报操作按钮 -->
			 	<div id="ereportDiv" class="div-border" style="display: block;width: 977px;height: 150px;margin-left: 23px;margin-top: 12px;background: white;">
				 	<div class="row second_title">
				 		<img src="images/e_report.png">
				 		<h2>事件上报</h2>
				 	</div>
					<div class="row" style="margin: 10px;margin-left: 70px;">
						<div class="col-xs-2">
							<button class="btn btn-default btn-lg ereport_button" onclick="ereport(1,0,0,this)">违章停车上报</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-default btn-lg ereport_button" onclick="ereport(1,0,1,this)">治安事件上报</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-default btn-lg ereport_button" onclick="ereport(1,0,2,this)">市政设施上报</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-default btn-lg ereport_button" onclick="ereport(1,0,3,this)">道路维护上报</button>
						</div>
					</div>
					<div class="row" style="margin: 10px;margin-left: 70px;">
						<div class="col-xs-2">
							<button class="btn btn-default btn-lg ereport_button" onclick="ereport(1,0,4,this)">交通拥堵上报</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-default btn-lg ereport_button" onclick="ereport(1,0,5,this)">违法犯罪上报</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-default btn-lg ereport_button" onclick="ereport(1,0,6,this)">突发事件上报</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-default btn-lg ereport_button" onclick="ereport(1,0,7,this)">环境污染上报</button>
						</div>
					</div>
				</div>
			 	
				<!-- 全局控制操作按钮 -->
			 	<div id="" class="div-border" style="display: block;width: 977px;height: 131px;margin-left: 23px;margin-top: 12px;background: white;">
				 	<div class="row second_title">
				 		<img src="images/global_control.png">
				 		<h2>全局控制</h2>
				 	</div>
					<div class="row" style="margin-left: 50px;">
						<!-- <div class="col-xs-2">
							<button class="btn btn-block btn-lg ereport_button" onclick="">建筑升起</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="">建筑落下</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="">公仔移动</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="">公仔停止</button>
						</div> -->
						<div class="col-xs-3">
							<span>建筑控制：降</span> <img id="buildstatus" src="images/close.png"
								onclick="changeStatus(this.id)"><span>升</span>
						</div>
						<div class="col-xs-3">
							<span>公仔控制：停</span> <img id="peoplestatus" src="images/close.png"
								onclick="changeStatus(this.id)"><span>动</span>
						</div>
						<div class="col-xs-3">
							<span>灯光控制：关</span> <img id="lightstatus" src="images/close.png"
								onclick="changeStatus(this.id)"><span>开</span>
						</div>
						<div class="col-xs-3">
							<span>绿灯控制：停</span> <img id="greenstatus" src="images/close.png"
								onclick="changeStatus(this.id)"><span>跑</span>
						</div>
					</div>
					<div class="row" style="margin: 10px;margin-left: 50px;">
						<!-- <div class="col-xs-2">
							<button class="btn btn-block btn-lg ereport_button" onclick="">灯光开启</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="">灯光关闭</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="">红绿灯跑环</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="">红绿灯停止</button>
						</div> -->
                          <div class="col-xs-3">
	                          <span>高铁控制：停</span>
	                          <img id="speedstatus" src="images/close.png" onclick="changeStatus(this.id)"><span>动</span>
                          </div>
                          <div class="col-xs-3" style="margin-left: 6px;">
	                          <span>视频控制：停</span>
	                          <img id="videostatus" src="images/close.png" onclick="changeStatus(this.id)"><span>播</span>
                          </div>
   						  <div class="col-xs-5" style="margin-top: -5px;margin-left: 6px;">
   						  		<span>能耗：</span>
   						  		<input id="1" type="radio" name="radio" style="width: 20px;height: 20px;" onclick="getstatus(this.id)">&nbsp;<label for="1">高&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
   						  		<input id="2" type="radio" name="radio" style="width: 20px;height: 20px;" onclick="getstatus(this.id)">&nbsp;<label for="2">中&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
   						  		<input id="3" type="radio" name="radio" style="width: 20px;height: 20px;" onclick="getstatus(this.id)">&nbsp;<label for="3">低&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
   						  </div>
					</div>
					<!-- <div class="row" style="margin: 10px;margin-left: 70px;">
						<div class="col-xs-2">
							<button class="btn btn-block btn-lg ereport_button" onclick="">高铁出发</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="">高铁归位</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="">视频播放</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="">视频停止</button>
						</div>
					</div> -->
				</div>
				
				<!-- 共享单车操作按钮 -->
				<div id="ofoDiv" class="div-border" style="display:none;width: 977px;height: 236px;margin-left: 23px;margin-top: 12px;background: white;">
				 	<div class="row second_title">
				 		<img src="images/sand_table.png">
				 		<h2>共享单车</h2>
				 	</div>
					<div class="row" style="margin: 10px;margin-left: 70px;">
						<!-- <div class="col-xs-2">
							<button class="btn btn-block btn-lg ereport_button" onclick="">运营车出发</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="">公仔1拍照</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="">公仔2拍照</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="">公仔3拍照</button>
						</div> -->
						<div class="col-xs-2">
							<img src="images/icon/icon_06.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('car5',1,0,'');">
							<h4>运营车出发</h4>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_06.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('car5',2,0,'');">
							<h4>运营车归位</h4>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_09.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('human3',1,0,'');">
							<h4>公仔1拍照</h4>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_11.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('human4',1,0,'');">
							<h4>公仔2拍照</h4>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_13.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('human5',1,0,'');">
							<h4>公仔3拍照</h4>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_15.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('human6',1,0,'');">
							<h4>公仔4拍照</h4>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_17.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('human7',1,0,'');">
							<h4>公仔5拍照</h4>
						</div>
					</div>
					<!-- <div class="row" style="margin: 10px;margin-left: 70px;">
						<div class="col-xs-2">
							<button class="btn btn-block btn-lg ereport_button" onclick="">公仔4拍照</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="">公仔5拍照</button>
						</div>
					</div> -->
				</div>
				<!-- 火灾操作按钮 -->
				<div id="fireDiv" class="div-border" style="display:none;width: 977px;height: 236px;margin-left: 23px;margin-top: 12px;background: white;">
				 	<div class="row second_title">
				 		<img src="images/sand_table.png">
				 		<h2>火灾事件</h2>
				 	</div>
					<!-- <div class="row" style="margin: 10px;margin-left: 70px;">
						<div class="col-xs-2">
							<button class="btn btn-block btn-lg ereport_button" onclick="controlVideo(1,4,5,1);">能耗低视频播放</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="controlVideo(1,4,5,0);">能耗低视频停止</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="controlVideo(1,4,6,1);">能耗中视频播放</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="controlVideo(1,4,6,0);">能耗中视频停止</button>
						</div>
					</div>
					<div class="row" style="margin: 10px;margin-left: 70px;">
						<div class="col-xs-2">
							<button class="btn btn-block btn-lg ereport_button" onclick="controlVideo(1,4,7,1);">能耗高视频播放</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="controlVideo(1,4,7,0);">能耗高视频停止</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="controlVideo(1,4,8,1);">建筑视频播放</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="controlVideo(1,4,8,0);">建筑视频停止</button>
						</div>
					</div> -->
					<div class="row" style="margin: 10px;margin-left: 70px;">
						<div class="col-xs-2">
							<img src="images/icon/icon_41.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('building',3,0,'');">
							<h4 style="margin-left: 10px;">建筑冒烟</h4>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_42.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('building',4,0,'');">
							<h4 style="margin-left: -9px;">建筑停止冒烟</h4>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_52.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('car1',3,0,'');">
							<h4 style="margin-left: 10px;">警车出发</h4>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_53.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('car1',4,0,'');">
							<h4 style="margin-left: 10px;">警车归位</h4>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_55.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('car3',1,0,'');">
							<h4>消防车出发</h4>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_57.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('car3',2,0,'');">
							<h4>消防车归位</h4>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_72.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('car4',1,0,'');">
							<h4>救护车出发</h4>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_74.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('car4',2,0,'');">
							<h4>救护车归位</h4>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_76.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('human1',1,0,'');">
							<h4 style="margin-left: 10px;">公仔拍照</h4>
						</div>
					</div>
				</div>
				<!-- 违章停车操作按钮 -->
				<div id="carDiv" class="div-border" style="display:none;width: 977px;height: 160px;margin-left: 23px;margin-top: 12px;background: white;">
				 	<div class="row second_title">
				 		<img src="images/sand_table.png">
				 		<h2>违章停车</h2>
				 	</div>
					<div class="row" style="margin: 10px;margin-left: 70px;">
						<!-- <div class="col-xs-2">
							<button class="btn btn-block btn-lg ereport_button" onclick="">违章车违停</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="">违章车归位</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="">警车出发</button>
						</div>
						<div class="col-xs-2 ereport_menu_div">
							<button class="btn btn-block btn-lg ereport_button" onclick="">警车归位</button>
						</div> -->
						<div class="col-xs-2">
							<img src="images/icon/icon30_27.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('car2',1,0,'');">
							<h4>违章车违停</h4>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_27.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('car2',2,0,'');">
							<h4>违章车归位</h4>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_28.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('car1',1,0,'');">
							<h4 style="margin-left: 10px;">警车出发</h4>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_29.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('car1',2,0,'');">
							<h4 style="margin-left: 10px;">警车归位</h4>
						</div>
						<div class="col-xs-2">
							<img src="images/icon/icon_30.png" style="width: 40%;margin-left: 20px;" onclick="sendCom('human2',1,0,'');">
							<h4 style="margin-left: 10px;">公仔拍照</h4>
						</div>
					</div>
					<!-- <div class="row" style="margin: 10px;margin-left: 70px;">
						<div class="col-xs-2">
							<button class="btn btn-block btn-lg ereport_button" onclick="">公仔拍照</button>
						</div>
					</div> -->
				</div>
			</div>
		</div>
		<div style="position: fixed;bottom: -1px;width: 101%;height: 60px;margin-left: -3px;background: white;" class="div-border">
				<div class="col-xs-2" style="margin-top: 10px;margin-left: 100px;">
					<!-- <button class="btn btn-block btn-primary btn-lg" onclick="flip('0@f',this)" >首页</button> -->
					<img style="width: 40px;" src="images/icon/anniu_69.png" onclick="flip('0@f',this)">
				</div>
				<div class="col-xs-2" style="margin-top: 10px;">
					<!-- <button class="btn btn-block btn-primary btn-lg" onclick="flip('0@-1',this);controlStep(-1);" >上一页</button> -->
					<img style="width: 40px;" src="images/icon/anniu_71.png" onclick="flip('0@-1',this);controlStep(-1);">
				</div>
				<!-- <div class="col-xs-2">
					<select id="pageNum" style="width:130px;height: 47px;" onchange="switchScreen()">
						<option value="0" selected="selected">1</option>
						<option value="1">2</option>
						<option value="2">3</option>
						<option value="3">4</option>
						<option value="4">5</option>
					</select>
				</div> -->
				<div class="col-xs-2" style="margin-top: 10px;">
					<!-- <button class="btn btn-block btn-primary btn-lg" onclick="flip('0@1',this);controlStep(1);">下一页</button> -->
					<img style="width: 40px;" src="images/icon/anniu_73.png" onclick="flip('0@1',this);controlStep(1);">
				</div>
				<div class="col-xs-2" style="margin-top: 10px;">
					<!-- <button class="btn btn-block btn-primary btn-lg" onclick="flip('0@e',this)" >尾页</button> -->
					<img style="width: 40px;" src="images/icon/anniu_75.png" onclick="flip('0@e',this)">
				</div>
				<div class="col-xs-2" style="margin-top: 10px;">
					<!-- <button class="btn btn-block btn-primary btn-lg" onclick="flip('5@1',this)" >日常监控</button> -->
					<img style="width: 40px;" src="images/icon/anniu_77.png" onclick="flip('5@1',this);sendCom('state',1,0,'');">
				</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	
</script>
</html>