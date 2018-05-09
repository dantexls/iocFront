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

    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/echarts.min.js" type="text/javascript"></script>
    <script src="js/move.js" type="text/javascript"></script>
    <script src="js/common.js" type="text/javascript"></script>
    <script src="gridly/javascripts/jquery.gridly.js" type="text/javascript"></script>
    <script type="text/javascript">
    jQuery(function($) {
    		   var url = location.search;
    		   var a=url.split("=");
    	$.ajax({
    		url:'/Cm-pom/dispatcher/layer/queryByScenesId',
    		data:{"scenesId":a[1]},
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
    	        	new Dialog({Width:attrlist[2],Height:attrlist[0],Left:attrlist[3]-230,Top:attrlist[1],Info:"",Content:"<img src=images/ioc/sense.png style=width:100%;height:100%;>"});  
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
<body style="background-color:#000000;height: 1080px;width: 1920px;">


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->




<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script  src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

