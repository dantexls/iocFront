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
   	<script src="js/echarts.js" type="text/javascript"></script>
	<script src="datareport/pillar.js" type="text/javascript"></script>
	<script src="datareport/cake.js" type="text/javascript"></script>
	<script src="datareport/line.js" type="text/javascript"></script>
	<script src="js/init.js" type="text/javascript"></script>
    <script src="js/common.js" type="text/javascript"></script>
    <script src="gridly/javascripts/jquery.gridly.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/js/common/ajaxfileupload.js"></script>
	<script type="text/javascript" src="assets/plugins/uploadPreview.js"></script>
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
    	        	var Stylestr=val.style;
    	        	var attrlist=getstylevalue(Stylestr);
    	        	var target="canvas";
    	        	new Dialog({Width:(attrlist[2].replace("px", ""))*2,Height:(attrlist[1].replace("px", ""))*2,Left:(attrlist[3].replace("px", "")-230)*2,Top:(attrlist[0].replace("px", "")-110)*2,Info:"",Content:val.content});
    	        	var content=val.content;
    	        	if(content.indexOf(target)!=-1){
        	        	var id=$(".dialogcontainter:eq("+index+ ") .dialogbody").children().attr("id");
        	    	        var x=$("#"+id).css("height");
        	    			var y=$("#"+id).css("width");
        	    			x=parseInt(x.replace("px", ""));
        	    			y=parseInt(y.replace("px", ""));
        	    			$("#"+id).css("height",x+"px");
        	    			$("#"+id).css("width",y+"px");
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
<!-- overflow:-Scroll;overflow-y:hidden;overflow:-Scroll;overflow-x:hidden; -->
<body style="background-color:#000000;height: 1080px;width: 1920px;">




<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script  src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/move.js"></script>

</body>
</html>

