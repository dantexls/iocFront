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
    <script src="js/common.js" type="text/javascript"></script>
    <script src="gridly/javascripts/jquery.gridly.js" type="text/javascript"></script>
    <script type="text/javascript">
    var arr=new Array();
    var nowNum=null;
    function getCateGory(cateId){
    	$.ajax({
    		url:'/Cm-pom/dispatcher/scenes/queryByCategoryId',
    		data:{"categoryId":cateId},
    	    type: 'POST',
    	    dataType:'JSON',
    	    async: false,
    	    success:function(msg){
    	    	arr=msg.data;
    	    }
    	})
    }
    
    jQuery(function($) {
    	$("#num").val(0);
    	nowNum=$("#num").val();
    	getCateGory(4);
    	$.ajax({
    		url:'/Cm-pom/dispatcher/layer/queryByScenesId',
    		data:{"scenesId":arr[0].id},
    	    type: 'POST',
    	    dataType:'JSON',
    	    async: false,
    	    success:function(msg){
    	    	var data=msg.data;
    	        $.each(data, function(index, val){
    	        	var Stylestr=val.style.split(';');
    	        	var attrlist = new Array();
    	        	for(var x=0;x<Stylestr.length-1; x++){
    	        		var finaldata=Stylestr[x].split(':');
    	        		attrlist[x] = finaldata[1].replace("px","");
    	        	}
    	        	new Dialog({Width:attrlist[2]*2,Height:attrlist[0]*2,Left:(attrlist[3]-230)*2,Top:(attrlist[1]-39)*2,Info:"",Content:val.content});
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
	//判断当前浏览器是否支持WebSocket
	if ('WebSocket' in window) {
		websocket = new WebSocket("ws://localhost:8080/Cm-pom/websocket");
		//websocket = new WebSocket("ws://10.129.132.119:8080/Cm-pom/websocket");
	} else {
		alert('当前浏览器 Not support websocket')
	}
	
	//接收到消息的回调方法
	websocket.onmessage = function(event) {
		var message = event.data.split('@');
		if(message[0] =='3'){
			getCateGory(message[1]);
			changeNum(0);
		}
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
			return;
		}
	}
	
	if(id=="-1"){
		nowNum--;
		if(nowNum<0){
			//alert("这已经是第一页");
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
	        $.each(data, function(index, val){
	        	var Stylestr=val.style.split(';');
	        	var attrlist = new Array();
	        	for(var x=0;x<Stylestr.length-1; x++){
	        		var finaldata=Stylestr[x].split(':');
	        		attrlist[x] = finaldata[1].replace("px","");
	        	}
	        	new Dialog({Width:attrlist[2]*2,Height:attrlist[0]*2,Left:(attrlist[3]-230)*2,Top:(attrlist[1]-39)*2,Info:"",Content:val.content});
	        }); 
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
	        	var Stylestr=val.style.split(';');
	        	var attrlist = new Array();
	        	for(var x=0;x<Stylestr.length-1; x++){
	        		var finaldata=Stylestr[x].split(':');
	        		attrlist[x] = finaldata[1].replace("px","");
	        	}
	        	new Dialog({Width:attrlist[2]*2,Height:attrlist[0]*2,Left:(attrlist[3]-230)*2,Top:(attrlist[1]-39)*2,Info:"",Content:val.content});
	        }); 
	    }
	})
}


</script>
</body>
</html>

