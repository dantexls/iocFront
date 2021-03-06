<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8"%>
<html style="background: white">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>数据可视化管理平台</title>
    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="css/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    <link href="css/css.css" rel="stylesheet" type="text/css">
    <link href="gridly/stylesheets/jquery.gridly.css" rel="stylesheet" type="text/css" />
    <link href="css/move.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/reveal.css">
    <script src="js/move.js" type="text/javascript"></script>
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/common.js" type="text/javascript"></script>
    <script src="js/divcon.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery.reveal.js"></script>
    <script src="gridly/javascripts/jquery.gridly.js" type="text/javascript"></script>
    <script type="text/javascript">
     function GetQueryString(name)
		{
		        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
		        var r = window.location.search.substr(1).match(reg);
		        if(r!=null)return  unescape(r[2]); return null;
		   }
    jQuery(function($) {
    	  var scid=GetQueryString("scenesId");
    	  $.ajax({
    		  url:'/Cm-pom/dispatcher/scenes/queryById',
      		data:{"id":scid},
      	    type: 'POST',
      	    dataType:'JSON',
      	    success:function(msg){
      	    	magnetstatus=msg.magnet;
      	    }
    	  })
    	   $("#senseId").val(scid);
    	$.ajax({
    		url:'/Cm-pom/dispatcher/layer/queryByScenesId',
    		data:{"scenesId":scid},
    	    type: 'POST',
    	    dataType:'JSON',
    	    success:function(msg){
    	    	var data=msg.data;
    	    	num=msg.size;
    	    	var target="canvas";
    	        $.each(data, function(index, val){
    	        	var Stylestr=val.style;
    	        	var attrlist=getstylevalue(Stylestr);
    	        	new Dialog({Width:attrlist[2].replace("px", ""),Height:attrlist[1].replace("px", ""),Left:attrlist[3].replace("px", ""),Top:attrlist[0].replace("px", ""),Info:"标题",Content:val.content});
    	        	var content=val.content;
    	        	$(".dialogcontainter:eq("+index+ ")").attr("area",val.channelId);
    	        	$(".dialogcontainter:eq("+index+ ")").attr("row",val.rowNumber);
    	        	$(".dialogcontainter:eq("+index+ ")").attr("column",val.columnNumber);
    	        	if(content.indexOf(target)!=-1){
    	        	var id=$(".dialogcontainter:eq("+index+ ") .dialogbody").children().attr("id");
    	    	        var x=$("#"+id).css("height");
    	    			var y=$("#"+id).css("width");
    	    			x=parseInt(x.replace("px", ""))/2;
    	    			y=parseInt(y.replace("px", ""))/2;
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
<body>

<div class="wapr">
<input id="senseId" type="hidden" value="">
	<%@ include file="top.jsp" %>
     <div class="mt15">
         <div style="width:100%">
                     <%@ include file="newleftPage.jsp"%>
                       <div id="div2">
                       <div class="m_position f18 bold" style="background-color: white;border-bottom-style: groove;">
                             <div class="w2 pull-left">模版修改</div>
                             <div class="w8 pull-right text-right f14 normal operation_icon ">
                                 <span> <a href="javascript:void(0)"onclick="getelementSstyle(1)"><img src="bannericon/htxt_03.png" width="24" height="24">修改</a></span>
                                   <span> <a href="#"><img src="bannericon/htxt_05.png" width="15px" height="15px">预览</a></span>
                                   <span> <a href="#"><img src="bannericon/htxt_07.png" width="15px" height="15px">帮助</a></span>
                             </div>
                             <div style=" clear:both;"></div>
                     </div>
                       <div class="mt10" style="background-color: white;">    
                             <div class="bac_white" style="width:960px;height:540px;">
                             <img src="images/background.png" height="540px" width="960px">
                                    <div class="gridly">
								    <div id='aa'></div> 
                                    </div>
                             </div> 
                       </div> 
                   </div>
                    <div style="float:right;position:fixed;left:1200px;top:150px;z-index:22">
                       <input type="hidden" id="reportids"/>
                       <div class="mydiv">
                       <input type="button" class="mybtn" value="开启磁贴"  onclick="startmagnet()">
                       <input type="button" class="mybtn" value="关闭磁贴"  onclick="stopmagnet()">
                       </div>
                       <div class="mydiv">
                       <a href="javascript:void(0)" class="mya" data-reveal-id="myModal2" data-animation="fade"><img src="bannericon/htxt_13.png" width="20" height="22">上移</a>
                       <a href="javascript:void(0)" class="mya" data-reveal-id="myModal3" data-animation="fade"><img src="bannericon/htxt_13.png" width="20" height="22">下移</a>
                       </div>
                       <div class="mydiv">
                       <a href="javascript:void(0)" class="mya" data-reveal-id="myModal5" data-animation="fade"><img src="bannericon/htxt_13.png" width="20" height="22">左移</a>
                       <a href="javascript:void(0)" class="mya" data-reveal-id="myModal4" data-animation="fade"><img src="bannericon/htxt_13.png" width="20" height="22">右移</a>
                       </div>
                       <div style="padding-top: 5px;">
                       		<span>横坐标:</span>
                       		<input type="text" id="disleft" style="width:50%" onblur="changecssvalue()"/>
                       </div>
                       <div style="padding-top: 5px;">
                       		<span>纵坐标:</span>
                       		<input type="text" id="distop" style="width:50%"  onblur="changecssvalue()" />
                       </div>
                       <div style="padding-top: 5px;">
                       		<span style="padding-right: 14px;">宽度:</span>
                       		<input type="text" id="diswidth" style="width:50%" onblur="changecssvalue()"/>
                       </div>
                       <div style="padding-top: 5px;">
                       		<span style="padding-right: 14px;">高度:</span>
                       		<input type="text" id="disheight" style="width:50%" onblur="changecssvalue()"/>
                       </div>
                   </div>
                  <div id="myModal2" class="reveal-modal">
                  <a class="close-reveal-modal">×</a>
                     <span style="color: white;">像素值：</span><input type="text" id="topa" name="move" >
                     <input type="button" id="top" onclick='movediv("top","a")' value="确认移动"/>
                  </div>
                  <div id="myModal3" class="reveal-modal">
                  <a class="close-reveal-modal">×</a>
                     <span style="color: white;">像素值：</span><input type="text" id="topb" name="move" >
                     <input type="button" id="bottom" onclick='movediv("top","b")' value="确认移动"/>
                  </div>
                   <div id="myModal4" class="reveal-modal">
                  <a class="close-reveal-modal">×</a>
                     <span style="color: white;">像素值：</span><input type="text" id="leftb" name="move" >
                     <input type="button" id="left" onclick='movediv("left","b")' value="确认移动"/>
                  </div>
                   <div id="myModal5" class="reveal-modal">
                  <a class="close-reveal-modal">×</a>
                     <span style="color: white;">像素值：</span> <input type="text" id="lefta" name="move">
                     <input type="button" id="right" onclick='movediv("left","a")' value="确认移动"/>
                  </div>  
</div>
    </div>
    
</div>	 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->

<script language="javascript" type="text/javascript">
	var div2Width;
	window.onload=function (){
	div2Width=document.getElementById("div2")
	div2Width.style.width=(document.body.clientWidth-230)+"px"
	}
	window.onresize=function(){
	div2Width.style.width=(document.body.clientWidth-230)+"px"
	}
</script>
<script src="js/index.js"></script>

<script type=text/javascript>

</script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script  src="bootstrap/js/bootstrap.min.js"></script>

</body>
</html>

