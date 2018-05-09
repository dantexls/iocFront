<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link href="gridly/stylesheets/jquery.gridly.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/echarts.min.js" type="text/javascript"></script>
    <script src="js/common.js" type="text/javascript"></script>
    <script type="text/javascript">
    jQuery(function($) {
    	$.ajax({
    		url:'/Cm-pom/dispatcher/scenes/queryAll',
    	    type: 'POST',
    	    dataType:'JSON',
    		success:function(msg){
    			var sense=msg.data;
    			var html="";
    			$.each(sense,function(index,val){
    				var temp ="<option value=\""+val.scenesName+"\">"+val.scenesName+"</option>"
    				html=html+temp;
    			});
    			$("#template").append(html);
    		}
    	});
    }); 
    
    function addTemplate (){
    	 var template = $('#template').val();
    	 var sort = $('#sort').val();
    	 if(sort){
    		 var addRow = "<tr><td>"+template+"</td><td>"+new Date().format("yyyy-MM-dd HH:mm:ss")+"</td><td>"+sort+"</td></tr>";
    		 $('#templateTable').append(addRow);
    	 }else{
    		 alert("排序不能为空!");
    	 }
     }
     
     /**       
      * 对Date的扩展，将 Date 转化为指定格式的String       
      * 月(M)、日(d)、12小时(h)、24小时(H)、分(m)、秒(s)、周(E)、季度(q) 可以用 1-2 个占位符       
      * 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)       
      * eg:       
      * (new Date()).format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423       
      * (new Date()).format("yyyy-MM-dd E HH:mm:ss") ==> 2009-03-10 二 20:09:04       
      * (new Date()).format("yyyy-MM-dd EE hh:mm:ss") ==> 2009-03-10 周二 08:09:04       
      * (new Date()).format("yyyy-MM-dd EEE hh:mm:ss") ==> 2009-03-10 星期二 08:09:04       
      * (new Date()).format("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18       
      */          
      Date.prototype.format=function(fmt) {           
          var o = {           
              "M+" : this.getMonth()+1, //月份           
              "d+" : this.getDate(), //日           
              "h+" : this.getHours()%12 == 0 ? 12 : this.getHours()%12, //小时           
              "H+" : this.getHours(), //小时           
              "m+" : this.getMinutes(), //分           
              "s+" : this.getSeconds(), //秒           
              "q+" : Math.floor((this.getMonth()+3)/3), //季度           
              "S" : this.getMilliseconds() //毫秒           
              };           
              var week = {           
              "0" : "/u65e5",           
              "1" : "/u4e00",           
              "2" : "/u4e8c",           
              "3" : "/u4e09",           
              "4" : "/u56db",           
              "5" : "/u4e94",           
              "6" : "/u516d"          
              };           
              if(/(y+)/.test(fmt)){           
                  fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));           
              }           
              if(/(E+)/.test(fmt)){           
                  fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "/u661f/u671f" : "/u5468") : "")+week[this.getDay()+""]);           
              }           
              for(var k in o){           
                  if(new RegExp("("+ k +")").test(fmt)){           
                      fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));           
                  }           
              }           
              return fmt;           
     }
    </script>
    <script src="gridly/javascripts/jquery.gridly.js" type="text/javascript"></script>
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
     <div class="mt15">
         <div style="width:100%">
                       <div id="div2" style="background-color: white;height: 750px;">
                       <div class="m_position f18 bold">
                             <div class="w2 pull-left">场景模版配置</div>
                             <div class="w8 pull-right text-right f14 normal operation_icon ">
                               <span> <a href="scenepageTemplate_main.jsp" target="_blank"><img src="images/op_3.png" width="24" height="24">预览场景</a></span>
                             </div>
                             <div style=" clear:both;"></div>
                       </div>
                       <div class="mt10" style="padding-left: 10px;padding-top: 10px;"> 
                          <form action="" class="form-horizontal">
                          	<div class="form-group">
							    <label class="col-sm-1 control-label">选择模板</label>
								<div class="col-sm-2">
							      	<select id="template" class="form-control" >
		                          		
	                          		</select>
							    </div>
							  </div>
							  <div class="form-group">
							    <label class="col-sm-1 control-label">排序</label>
							    <div class="col-sm-2">
							      <input id="sort" type="number" min="0" class="form-control"  placeholder="排序" />
							    </div>
							  </div>
                    	    <div style="padding-left: 15px;">
                    	    	<button class="btn btn-primary" type="button" onclick="addTemplate();">添加模板</button>
                    	    </div>                      	
                      
                          </form>
                       </div> 
                       <div style="padding-top: 100px;">
                       		<table id="templateTable" class="table table-bordered">
							  <thead>
							  	<tr>
							  		<td>模板名称</td>
							  		<td>添加时间</td>
							  		<td>排序</td>
							  	</tr>
							  </thead>
							  <tbody>
							  	
							  </tbody>
							</table>
                       </div>
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
$('.gridly').gridly({
    base: 60, // px 
    gutter: 20, // px
    columns: 10
  });
</script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script  src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

