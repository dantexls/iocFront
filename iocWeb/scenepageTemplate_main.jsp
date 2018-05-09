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
    <script src="js/move.js" type="text/javascript"></script>
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/divcon.js" type="text/javascript"></script>
    <script src="js/common.js" type="text/javascript"></script>
    <script src="js/echarts.js" type="text/javascript"></script>
    <script src="datareport/pillar.js" type="text/javascript"></script>
	<script src="datareport/cake.js" type="text/javascript"></script>
	<script src="datareport/line.js" type="text/javascript"></script>
	<script src="js/init.js" type="text/javascript"></script>
    <script src="js/scene/scenepage_main.js" type="text/javascript"></script>
    <script type="text/javascript">
    
	</script>
</head>
<body style="background-color:#000000;overflow:-Scroll;overflow-y:hidden;overflow:-Scroll;overflow-x:hidden;">
<div  style="position:absolute;z-index:3">
<input id="num" type="hidden" value=""/>
</div>

<div id="condiv" style="margin:0 auto;border:solid;">
</div><!-- 
<div id="map_div" style="position:absolute;height: 798px; top: 2px; width: 1438px; left: 480px; z-index: 10000;">
<iframe src="http://127.0.0.1:8080/Cm-pom/demo/map.html" frameborder="0" scrolling="yes" height="100%" width="100%"></iframe>
</div>
<div id="index_div" style="position:absolute;height: 1080px; top: 0px; width:1920px; left: 0px; z-index: -1;">
<iframe src="http://127.0.0.1:8080/Cm-pom/demo/index.html" frameborder="0" scrolling="yes" height="100%" width="100%"></iframe>
</div>
 -->
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script  src="bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">

</script>
</body>
</html>