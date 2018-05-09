<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    
    <style type="text/css">
    	table {
    		margin: 0 auto;
    	}
    </style>
    
	<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	
	function dateFormat(sng) {
		var fmat = "yyyy-MM-dd hh:mm:ss";
        return (new Date(parseInt(sng))).format(fmat);
    }


	//对日期时间进行格式 化
	Date.prototype.format = function(format) {
		var o = {
		    "M+" : this.getMonth()+1, //month
		    "d+" : this.getDate(), //day
		    "h+" : this.getHours(), //hour
		    "m+" : this.getMinutes(), //minute
		    "s+" : this.getSeconds(), //second
		    "q+" : Math.floor((this.getMonth()+3)/3), //quarter
		    "S" : this.getMilliseconds() //millisecond
		}
		if(/(y+)/.test(format))
		    format=format.replace(RegExp.$1,(this.getFullYear()+"").substr(4 - RegExp.$1.length));
		for(var k in o)
		    if(new RegExp("("+ k +")").test(format))
		        format = format.replace(RegExp.$1,RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
		return format;
	}

	
	/* get all objects list */
	function list() {
		$.ajax({
			url : '/Cm-pom/dispatcher/iocUser/findAll',
			type : 'POST',
			success : function(msg) {
				var json = JSON.parse(msg);
				var result = json.data;
				var html="";
				for(var i=0;i<result.length;i++){
					html+="<tr>"+
						"<td>"+(i+1)+"</td>"+
						"<td>"+result[i].username+"</td>"+
						"<td>"+result[i].nickname+"</td>"+
						"<td>"+result[i].phone+"</td>"+
						"<td>"+result[i].userType+"</td>"+
						"<td>"+result[i].roleId+"</td>"+
						
						"<td>"+dateFormat(result[i].regTime)+"</td>"+
						"<td>"+
							"<a href='javascript:' onclick=delStu('"+result[i].id+"')>删除</a>&nbsp;&nbsp;"+
							"<a href='#' onclick=popup('"+result[i].id+"','"+result[i].username+"','"+result[i].nickname+"','"+result[i].phone+"','"+result[i].userType+"','"+result[i].roleId+"')>更新</a>"+
						"</td>"+
						"</tr>";
				}
				var old = $("#table").html();
				$("#table").html(old+html);
			}
		})
	}
	
	function delStu(id){
		$.ajax({
			url : '/Cm-pom/dispatcher/iocUser/delUser',
			type : 'POST',
			data : {
				"id" : id,
			},
			success : function(msg) {
				window.location.reload();
			},
			failed: function(e){
				console.log(e);
			}
		})
	}
	
	function update(){
		var id = $("#id").val();
		var username = $("#username").val();
		var password = $("#password").val();
		var nickname = $("#nickname").val();
		var phone = $("#phone").val();
		var userType = $("#userType").val();
		var roleId = $("#roleId").val();
		$.ajax({
			url : '/Cm-pom/dispatcher/iocUser/update',
			type : 'POST',
			data : {
				"id" : id,
				"username" : username,
				"password" : password,
				"nickname" : nickname,
				"phone" : phone,
				"userType" : userType,
				"roleId" : roleId,
			},
			success : function(msg) {
				window.location.reload();
			}
		})
	}
	list();
	
	function popup(id, username, nickname, phone, userType, roleId) {
		$("#id").val(id);
		$("#username").val(username);
		$("#nickname").val(nickname);
		$("#phone").val(phone);
		$("#userType").val(userType);
		$("#roleId").val(roleId);
		
        document.getElementById('ceng').style.display = 'block';
        document.getElementById('close').style.display = 'block';
        return false;
    }
    function closeCeng() {
        document.getElementById('ceng').style.display = 'none';
        document.getElementById('close').style.display = 'none';
        return false;
         
    }
	</script>
</head>
<body>
	<div class="wapr">
	<%@ include file="top.jsp" %> 
		<h2>用户管理</h2>
		<table id="table" border=1>
			<tr>
				<td>编号</td>
				<td>用户名</td>
				<td>昵称</td>
				<td>联系方式</td>
				<td>用户类型</td>
				<td>角色</td>
				<td>注册时间</td>
				<td>操作</td>
			</tr>
			
			
		</table>
	</div>
	<div>
		<!-- <input type="button" value="GetStu" onclick="stuList();"> -->
	</div>
	
	<div>
		
	</div>
	
	<!-- <a href="#" onclick="popup()">点击弹出</a> -->
	<div id="ceng" style="position:absolute;z-index:2;left:0;top:0;right:0;background-color:#ccc;filter:alpha(opacity=50);margin:1px 1px;display:none;width:100%;height:100%;text-align:center;">
	</div>
	<div id="close" style="position:absolute !important;left:30%;top:0px;z-index:3;border:1px solid #ff6600;background-color:#fff;margin:100px auto;padding:0px;display:none;width:400px;height:300px;text-align:right">
	<a href="#" onclick="closeCeng()">关闭</a>
	<div style="text-align:center;">
		<input type="hidden" name="id" id="id">
		<div>用户名:<input type="text" name="username" id="username" readonly="readonly"></div>
		<div>昵称:<input type="text" name="nickname" id="nickname"></div>
		<div>联系方式:<input type="text" name="phone" id="phone"></div>
		<div>用户类型:<input type="text" name="userType" id="userType" readonly="readonly"></div>
		<div>角色:<input type="text" name="roleId" id="roleId" readonly="readonly"></div>
		<div><input type="button" value="Update" onclick="update();"></div> 
	</div>
	</div>
	
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