<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 	<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui.custom.js" type="text/javascript"></script>
	<script src="js/newcommon.js" type="text/javascript"></script>
	<link href="css/ui.fancytree.css" rel="stylesheet" type="text/css">
	<script src="js/jquery.fancytree.js" type="text/javascript"></script>
	<script src="js/sample.js" type="text/javascript"></script>
	<script src="js/echarts.js" type="text/javascript"></script>
	<script src="datareport/pillar.js" type="text/javascript"></script>
	<script src="datareport/cake.js" type="text/javascript"></script>
	<script src="datareport/line.js" type="text/javascript"></script>
	<script src="js/init.js" type="text/javascript"></script>
	<style type="text/css">
div#tree {
	position: absolute;
	height: 95%;
	width: 95%;
	padding: 5px;
	margin-right: 16px;
}
ul.fancytree-container {
	height: 100%;
	width: 100%;
	background-color: transparent;
}
span.fancytree-title {
	color: white;
	text-decoration: none;
}
span.fancytree-focused span.fancytree-title {
	outline-color: white;
}
span.fancytree-node:hover span.fancytree-title,
span.fancytree-active span.fancytree-title,
span.fancytree-active.fancytree-focused span.fancytree-title,
.fancytree-treefocus span.fancytree-title:hover,
.fancytree-treefocus span.fancytree-active span.fancytree-title {
	color: #39414A;
}
span.external span.fancytree-title:after {
	content: "";
	background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAMAAAC67D+PAAAAFVBMVEVmmcwzmcyZzP8AZswAZv////////9E6giVAAAAB3RSTlP///////8AGksDRgAAADhJREFUGFcly0ESAEAEA0Ei6/9P3sEcVB8kmrwFyni0bOeyyDpy9JTLEaOhQq7Ongf5FeMhHS/4AVnsAZubxDVmAAAAAElFTkSuQmCC") 100% 50% no-repeat;
	padding-right: 13px;
}
/* Remove system outline for focused container */
.ui-fancytree.fancytree-container:focus {
	outline: none;
}
.ui-fancytree.fancytree-container {
	border: none;
}
.footer{
	width:100%;
	height:30px;
	background: #20335d;
	color:#FFF;
	position:fixed;
	bottom:0px;
	left:0px;
	text-align: center;
}
.footer div{
	margin-top: 5px;
}
</style>
<script type="text/javascript">
function createWeb(){
	var address = prompt("请输入web地址", "");
	if(address){
		var temp =new Array();
		var css="temp";
		var content="'<iframe src=http://"+address+" frameborder=0 scrolling=no height=100% width=100%></iframe>'";
		temp[0]=css+"@"+content;
		var jsonString = JSON.stringify(temp);
		$.ajax({
			url:'/Cm-pom/dispatcher/layer/saveLayer',
    		data:{"scenesId":"tempWeb","divs":jsonString},
    	    type: 'POST',
    	    success:function(data){
    	    	alert("添加资源成功");
    	    	window.location.reload();
    	    }
		});
	}else{
		alert("地址不能为空");
	}
}


function createAgent(){
	var address = prompt("请输入代理IP地址(请以“.”隔开)", "");
	if(address){
		var temp =new Array();
		var css="agent";
		var content="'<iframe src=http://localhost:8080/Cm-pom/agentClient.jsp?agentIp="+address+" frameborder=0 scrolling=yes height=100% width=100%></iframe>'";
		temp[0]=css+"@"+content;
		var jsonString = JSON.stringify(temp);
		$.ajax({
			url:'/Cm-pom/dispatcher/layer/saveLayer',
    		data:{"scenesId":"agent","divs":jsonString},
    	    type: 'POST',
    	    success:function(data){
    	    	alert("添加资源成功");
    	    	window.location.reload();
    	    }
		});
	}else{
		alert("地址不能为空");
	}
}

</script>
</head>
<body>
         <div id="min_left">
             <!-- <div class="left_head">
                   <div class="Head_img pull-left"><img src="images/logo03.jpg" ></div>
                   <div class="Head_text pull-right">
                         <p>城市治理智库</p>
                         <p>运营管理中心</p>
                   </div>
                   <div style="clear:both;"></div>
		     </div> -->
                   <div id="firstpane" class="menu_list" style="float:right;overflow-y:scroll;">
                              <p class="menu_head"><i class="fa"></i><img src="images/icon/xitong_03.png" style="margin-left: -15px;padding-right: 10px;">模版</p>
                              <div style="display:none" class="menu_body" >
	                              <a href="publicSense.jsp?scenesId=8a90e5a05d4f5271015d4fb5e694001c" target="_blank">模版1</a>
	                              <a href="publicSense.jsp?scenesId=8a90e5a05d4f5271015d4fbf6a6e0025" target="_blank">模版2</a>
	                              <a href="publicSense.jsp?scenesId=8a90e5a05d4f5271015d4fc6cd49002c" target="_blank">模版3</a>
                              </div>
                              <p class="menu_head"><i class="fa"></i><img src="images/icon/xitong_06.png" style="margin-left: -15px;padding-right: 10px;">智库场景</p>
                              <div id="tree" style="display:none;background-color:#111b34; position:absolute;z-index:100;width: 213px;height: 620px;" class="menu_body">
                              	<ul id="level_1"></ul>
                              </div>
                                        <p class="menu_head "><i class="fa"></i><img src="images/icon/xitong_08.png" style="margin-left: -15px;padding-right: 10px;">业务库</p>
                                        <div style="display:none" class="menu_body">
                                        	<a href="editSceneTemplate.jsp">城管管控中心</a>
                                          	<a href="#">城市体征管控中心</a>
                                          	<a href="#">园区管控中心</a>
                                        </div>  
<!--                                    <p class="menu_head "><i class="fa"></i><img src="images/icon/xitong_10.png" style="margin-left: -15px;padding-right: 10px;">图片</p> -->
<!--                                         <div style="display:none" class="menu_body" > -->
<%--                                         	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img1.png style=width:100%;height:100%;></image>')">资源1</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img2.png style=width:100%;height:100%;></image>')">资源2</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img3.png style=width:100%;height:100%;></image>')">资源3</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img4.png style=width:100%;height:100%;></image>')">资源4</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img5.png style=width:100%;height:100%;></image>')">资源5</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img6.png style=width:100%;height:100%;></image>')">资源6</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img7.png style=width:100%;height:100%;></image>')">资源7</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img8.png style=width:100%;height:100%;></image>')">资源8</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img9.png style=width:100%;height:100%;></image>')">资源9</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img10.png style=width:100%;height:100%;></image>')">资源10</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img11.png style=width:100%;height:100%;></image>')">资源11</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img12.png style=width:100%;height:100%;></image>')">资源12</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img13.png style=width:100%;height:100%;></image>')">资源13</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img14.png style=width:100%;height:100%;></image>')">资源14</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img15.png style=width:100%;height:100%;></image>')">资源15</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img16.png style=width:100%;height:100%;></image>')">资源16</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img17.png style=width:100%;height:100%;></image>')">资源17</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img20.gif style=width:100%;height:100%;></image>')">资源18</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img21.png style=width:100%;height:100%;></image>')">资源19</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img22.png style=width:100%;height:100%;></image>')">资源20</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img23.png style=width:100%;height:100%;></image>')">资源21</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img24.png style=width:100%;height:100%;></image>')">资源22</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img25.png style=width:100%;height:100%;></image>')">资源23</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img26.png style=width:100%;height:100%;></image>')">资源24</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img27.png style=width:100%;height:100%;></image>')">资源25</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img28.gif style=width:100%;height:100%;></image>')">资源26</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img29.gif style=width:100%;height:100%;></image>')">资源27</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img30.png style=width:100%;height:100%;></image>')">资源28</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img31.png style=width:100%;height:100%;></image>')">资源29</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img33.png style=width:100%;height:100%;></image>')">资源30</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img34.png style=width:100%;height:100%;></image>')">资源31</a> --%>
<%--                                             <a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img35.png style=width:100%;height:100%;></image>')">资源32</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img36.png style=width:100%;height:100%;></image>')">资源33</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img37.png style=width:100%;height:100%;></image>')">资源34</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img38.png style=width:100%;height:100%;></image>')">资源35</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img39.png style=width:100%;height:100%;></image>')">资源36</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img40.png style=width:100%;height:100%;></image>')">资源37</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img41.png style=width:100%;height:100%;></image>')">资源38</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/beijing.jpg style=width:100%;height:100%;></image>')">资源39</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ofo/1.jpg style=width:100%;height:100%;></image>')">资源40</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ofo/2.jpg style=width:100%;height:100%;></image>')">资源41</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ofo/3.jpg style=width:100%;height:100%;></image>')">资源42</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ofo/4.jpg style=width:100%;height:100%;></image>')">资源43</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ofo/5.jpg style=width:100%;height:100%;></image>')">资源44</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ofo/6.jpg style=width:100%;height:100%;></image>')">资源45</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img50.jpg style=width:100%;height:100%;></image>')">资源46</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img51.jpg style=width:100%;height:100%;></image>')">资源47</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img52.jpg style=width:100%;height:100%;></image>')">资源48</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img53.jpg style=width:100%;height:100%;></image>')">资源49</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img54.jpg style=width:100%;height:100%;></image>')">资源50</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img55.jpg style=width:100%;height:100%;></image>')">资源51</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ioc/img56.jpg style=width:100%;height:100%;></image>')">资源52</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/fire/fire2.png style=width:100%;height:100%;></image>')">资源53</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/fire/fire3.png style=width:100%;height:100%;></image>')">资源54</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/fire/fire4.png style=width:100%;height:100%;></image>')">资源55</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/fire/fire5.png style=width:100%;height:100%;></image>')">资源56</a> --%>
<%-- 											<a href="javascript:void(0)" onclick="creat('<image src=images/ofo/ofo_bottom2.png style=width:100%;height:100%;></image>')">共享单车2</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ofo/ofo_bottom3.png style=width:100%;height:100%;></image>')">共享单车3</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ofo/ofo_bottom3_2.png style=width:100%;height:100%;></image>')">共享单车3_2</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ofo/ofo_bottom5.png style=width:100%;height:100%;></image>')">共享单车5</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/ofo/ofo_bottom6.png style=width:100%;height:100%;></image>')">共享单车6</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/fire/fire_bottom2.png style=width:100%;height:100%;></image>')">火灾2</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/fire/fire_bottom3.png style=width:100%;height:100%;></image>')">火灾3</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/fire/fire_bottom3_2.png style=width:100%;height:100%;></image>')">火灾3_2</a> --%>
<%-- 											<a href="javascript:void(0)" onclick="creat('<image src=images/fire/fire_bottom4.png style=width:100%;height:100%;></image>')">火灾4</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/fire/fire_bottom5.png style=width:100%;height:100%;></image>')">火灾5</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<image src=images/car/car1.jpg style=width:100%;height:100%;></image>')">违章停车1</a> --%>
<%-- 											<a href="javascript:void(0)" onclick="creat('<image src=images/car/car2.jpg style=width:100%;height:100%;></image>')">违章停车2</a> --%>
<%-- 											<a href="javascript:void(0)" onclick="creat('<image src=images/car/car3.jpg style=width:100%;height:100%;></image>')">违章停车3</a> --%>
<%-- 											<a href="javascript:void(0)" onclick="creat('<image src=images/car/car4.jpg style=width:100%;height:100%;></image>')">违章停车4</a> --%>
<!-- <!--                                         </div> -->
<!--                                          <p class="menu_head "><i class="fa"></i><img src="images/icon/xitong_12.png" style="margin-left: -15px;padding-right: 10px;">视频</p> -->
<!--                                         <div style="display:none" class="menu_body" > -->
<%--                                         	<a href="javascript:void(0)" onclick="creat('<video src=video/1.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">视频资源1</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/2.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">视频资源2</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/3.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">视频资源3</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/4.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">视频资源4</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/5.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">视频资源5</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/6.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">视频资源6</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/7.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">视频资源7</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/8.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">视频资源8</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/ai3.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">视频资源9</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/introduce/1.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">城市综合治理</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/introduce/2.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">城市运行监控</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/introduce/3.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">城市大数据</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/introduce/4.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">网格化运营管理</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/introduce/5.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">城市大脑</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/introduce/6.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">城市通智应用</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/introduce/7.mp4 loop=-1 autoplay=autoplay width=100% height=100%  style=object-fit:fill></video>')">城市安防</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/introduce/8.mp4 loop=-1 autoplay=autoplay width=100% height=100%  style=object-fit:fill></video>')">灾难应急</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/introduce/9.mp4 loop=-1 autoplay=autoplay width=100% height=100%  style=object-fit:fill></video>')">城市环保</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/introduce/fin.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">城市体征</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/introduce/yaogan.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">卫星遥感</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/introduce/CityIOC.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">CityIOC介绍</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/jiankkong.mp4 loop=-1 autoplay=autoplay width=100% height=100% style=object-fit:fill></video>')">监控视频</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/bigdata.mp4 loop=-1 autoplay=autoplay width=100% height=100%  style=object-fit:fill></video>')">大数据</a> --%>
<%--                                           	<a href="javascript:void(0)" onclick="creat('<video src=video/bigdata2.mp4 loop=-1 autoplay=autoplay width=100% height=100%  style=object-fit:fill></video>')">大数据2</a> --%>
<%--                                             <a href="javascript:void(0)" onclick="creat('<video src=video/fire.mp4 loop=-1 autoplay=autoplay width=100% height=100%  style=object-fit:fill></video>')">火灾</a> --%>
<!--                                         </div> -->
                                        <p class="menu_head "><i class="fa"></i><img src="images/icon/xitong_14.png" style="margin-left: -15px;padding-right: 10px;">页面资源</p>
                                        <div style="display:none;" class="menu_body"  id="webDiv">
                                            <a href="javascript:void(0)" onclick="createWeb()">添加Web页面资源</a>
                                            <a href="addResource.jsp" >添加页面资源</a>
                                          	<a href="javascript:void(0)" onclick="creat('<iframe src=http://180.97.203.1:6011/Home/Index/center frameborder=0 scrolling=yes height=100% width=100%></iframe>')">ofoGIS</a>
                                          	<a href="javascript:void(0)" onclick="creat('<iframe src=http://localhost:8080/Cm-pom/demo/center2.html frameborder=0 scrolling=yes height=100% width=100%></iframe>')">ofoGIS2</a>
                                          	<a href="javascript:void(0)" onclick="creat('<iframe src=http://localhost:8080/Cm-pom/demo/center3.html frameborder=0 scrolling=yes height=100% width=100%></iframe>')">ofoGIS3</a>
                                          	<a href="javascript:void(0)" onclick="creat('<iframe src=http://localhost:8080/Cm-pom/frameTemplate.jsp frameborder=0 scrolling=yes height=100% width=100%></iframe>')">内嵌页面</a>
                                          	<a href="javascript:void(0)" onclick="creat('<iframe src=http://180.97.203.1:6011/Home/Index/left frameborder=0 scrolling=yes height=100% width=100%></iframe>')">bikeleft</a>
                                          	<a href="javascript:void(0)" onclick="creat('<iframe src=http://180.97.203.1:6011/Home/Index/bottom frameborder=0 scrolling=yes height=100% width=100%></iframe>')">bottom</a>
                                          	<a href="javascript:void(0)" onclick="creat('<iframe src=http://localhost:8080/Cm-pom/demo/bottom.html frameborder=0 scrolling=yes height=100% width=100%></iframe>')">bottom2</a>
                                        </div>
                                         <p class="menu_head "><i class="fa"></i><img src="images/icon/xitong_14.png" style="margin-left: -15px;padding-right: 10px;">Agent代理</p>
                                        <div style="display:none;" class="menu_body"  id="agentDiv">
                                            <a href="javascript:void(0)" onclick="createAgent()">添加Agent</a>
                                        </div>
                                         <p class="menu_head "><i class="fa"></i><img src="images/icon/xitong_16.png" style="margin-left: -15px;padding-right: 10px;">常规图表</p>
                                        <div style="display:none" class="menu_body" >
                                             <a href="javascript:void(0)" onclick="reportinit('pillar')">基本柱图</a>
                                             <a href="javascript:void(0)" onclick="reportinit('cake')">基本饼图</a>
                                             <a href="javascript:void(0)" onclick="reportinit('line')">基本线图</a>
                                        	<!-- <a href="#">弧形柱图</a>
                                          	<a href="#">基本柱图</a>
                                          	<a href="#">垂直胶囊柱图</a>
                                          	<a href="#">折线区域图</a>
                                          	<a href="#">区域翻牌器</a>
                                          	<a href="#">垂直基本柱图</a>
                                          	<a href="#">水平基本柱图</a>
                                          	<a href="#">水平胶囊柱图</a>
                                          	<a href="#">分组柱图</a>
                                          	<a href="#">梯形柱图</a>
                                          	<a href="#">折线柱图</a>
                                          	<a href="#">斑马柱图</a>
                                          	<a href="#">气泡图</a>
                                          	<a href="#">基本水位图</a>
                                          	<a href="#">基本折线图</a>
                                          	<a href="#">双轴折线图</a>
                                          	<a href="#">基本饼图</a>
                                          	<a href="#">标注对比饼图</a>									
                                          	<a href="#">带图饼图</a>
                                          	<a href="#">多维度饼图</a>
                                          	<a href="#">指标占比饼图</a>
                                          	<a href="#">基本雷达图</a>
                                          	<a href="#">散点图</a>
                                          	<a href="#">基础款饼图</a>
                                          	<a href="#">目标占比饼图</a>
                                          	<a href="#">指标对比饼图</a>
                                          	<a href="#">单值百分饼图</a>
                                          	<a href="#">轮播饼图</a>-->
                                        </div> 
<!--                                     <p class="menu_head"> <i class="fa"></i><img src="images/icon/xitong_18.png" style="margin-left: -15px;padding-right: 10px;">地图</p> -->
<!--                       							<div style="display:none" class="menu_body" > -->
<!--                           							<a href="#">2D平面地图</a> -->
<!--                           							<a href="#">3D平面世界地图</a> -->
<!--                           							<a href="#">3D平面中国地图</a> -->
<!--                           							<a href="#">3D球形地图</a> -->
<!--             									      </div> -->
<!--                                      <p class="menu_head"><i class="fa"></i><img src="images/icon/xitong_20.png" style="margin-left: -15px;padding-right: 10px;">指标</p> -->
<!--                                     <div style="display:none" class="menu_body"> -->
<!--                                            <a href="#">轮播列表柱状图</a> -->
<!--                                            <a href="#">数字翻牌器</a> -->
<!--                                            <a href="#">条形占比图</a> -->
<!--                                            <a href="#">状态卡片</a> -->
<!--                                            <a href="#">文字标签</a> -->
<!--                                     </div> -->
                                    
<!--                                      <p class="menu_head"><i class="fa"></i><img src="images/icon/xitong_22.png" style="margin-left: -15px;padding-right: 10px;">文字</p> -->
<!--                                     <div style="display:none" class="menu_body" > -->
<!--                                            <a href="#">轮播列表</a> -->
<!--                                            <a href="#">键值表格</a> -->
<!--                                            <a href="#">通用标题</a> -->
<!--                                            <a href="#">跑马灯</a> -->
<!--                                            <a href="#">多行文本</a> -->
<!--                                     </div> -->
<!--                                     <p class="menu_head"><i class="fa"></i><img src="images/icon/xitong_24.png" style="margin-left: -15px;padding-right: 10px;">辅助图形</p> -->
<!--                                     <div style="display:none" class="menu_body" > -->
<!--                                            <a href="#">自定义背景块</a> -->
<!--                                            <a href="#">边框</a> -->
<!--                                            <a href="#">装饰</a> -->
<!--                                            <a href="#">iframe</a> -->
<!--                                            <a href="#">单张图片</a> -->
<!--                                            <a href="#">事件轴</a> -->
<!--                                            <a href="#">词云</a> -->
<!--                                            <a href="#">轮播图</a> -->
<!--                                            <a href="#">Tab列表</a> -->
<!--                                            <a href="#">时间器</a> -->
<!--                                            <a href="#">视频</a> -->
<!--                                     </div> -->
      </div>
    </div>
    <div class="footer">
    	<div>Copyright © 2002-2017 isoftstone. All rights reserved.</div>
    </div>
<script type=text/javascript>
$(document).ready(function(){
	$("#firstpane p.menu_head").click(function(){
		//var h = $(this).next("div.menu_body").is(":hidden");
		$(this).addClass("current").next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
		$(this).siblings().removeClass("current");
		/* if(!h){
			$(this).removeClass("current");
		} */
		
	});
});
</script>
</body>
</html>