<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8"%>
<html>
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
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/move.js" type="text/javascript"></script>
</head>
<body>

<div class="wapr">
	<%@ include file="top.jsp" %> 
     <div class="mt15">
        <div style="width:100%">
                <%@ include file="newleftPage.jsp"%>
                       <div id="div2">
                       <div class="m_position f18 bold">
                             <div class="w2 pull-left">场景分类添加</div>
                             <div class="w8 pull-right text-right f14 normal operation_icon ">
                                 <span><a href="#"><img src="images/op_2.png" width="24" height="24">帮助</a></span>
                             </div>
                             <div style=" clear:both;"></div>
                       </div>
                                                        分类名称：<input type="text" id="categoryName"/><br/>
                                                        父级分类：<input type="text" name="scenceId" value="" disabled="disabled"/><br/>                       
                       <div id="addtree" style="background-color:#39414A">
                              <ul id="addlevel"></ul>
                       </div>
                       <input type="button" value="分类保存" onclick="saveCateGroy()"/>
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

