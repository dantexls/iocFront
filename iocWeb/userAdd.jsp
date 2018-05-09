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
	function saveUser() {
		var username = $("#username").val();
		var password = $("#password").val();
		
		var nickname = $("#nickname").val();
		var phone = $("#phone").val();
		var str = "";
		if(username==""){
			str+="用户名不能为空!\n";
		} else {
			var uPattern = /^[a-zA-Z]{1}([a-zA-Z0-9]|[-_]){4,19}$/;
			//alert(uPattern.test(username))
			if(!uPattern.test(username)){
				str+="用户名只能字母数字下滑线!\n";
			}
		}
		if(password==""){
			str+="密码不能为空!\n";
		}
		if(phone!=""){
			if(!(/^1[34578]\d{9}$/.test(phone))){ 
				str+="电话号码不符合要求!\n";
			}
		}
		if(str!=""){
			alert(str);
			return;
		}
		
		$.ajax({
			url : '/Cm-pom/dispatcher/iocUser/saveUser',
			//url: 'http://localhost:8080/Cm-pom/dispatcher/iocUser/saveUser',
			data : {
				"username" : username,
				"password" : password,
				"nickname" : nickname,
				"phone" : phone,
				"userType" : 1,
				"roleId" : 1
			},
			type : 'POST',
			success : function(msg) {
				alert("已保存信息");
				window.location.reload();
			}
		})
	}
	
	function checkUsername(){
		var username = $("#username").val();
		$("#isUsed").css("display", "none");
		
		var uPattern = /^[a-zA-Z]{1}([a-zA-Z0-9]|[-_]){4,19}$/;
		var str = "";
		if(!uPattern.test(username)){
			str="用户名只能字母数字下滑线!\n";
			$("#isUsed").css("display", "block");
			$("#isUsed").text(str);
			return;
		}
		
		$.ajax({
			url : '/Cm-pom/dispatcher/iocUser/findUser',
			//url: 'http://localhost:8080/Cm-pom/dispatcher/iocUser/saveUser',
			data : {
				"username" : username,
			},
			type : 'POST',
			success : function(msg) {
				var json = JSON.parse(msg);
				var size = json["size"];
				if(size > 0){
					$("#isUsed").css("display", "block");
					//
					str = "用户名已使用!";
					$("#isUsed").text(str);
				}
			}
		})
	}
	
	function checkPwd(){
		$("#pwd").css("display", "none");
		var password = $("#password").val();
		var password2 = $("#password2").val();
		var str = "";
		if(password!=password2){
			$("#pwd").css("display", "block");
		}
	}
	
	function checkPhone(){ 
		$("#ph").css("display", "none");
	    var phone = document.getElementById('phone').value;
	    if(!(/^1[34578]\d{9}$/.test(phone))){ 
	        //alert("手机号码有误，请重填");  
	        $("#ph").css("display", "block");
	    } 
	}
	</script>
</head>
<body>
	<div class="wapr">
	<%@ include file="top.jsp" %> 
		<table>
			<tr>
				<td>用户名</td>
				<td>
					<input type="text" name="username" id="username" onblur="checkUsername();">
					<span id="isUsed" style="color:red; display: none;"></span>
				</td>
			</tr>
			
			<tr>
				<td>密码</td>
				<td>
					<input type="password" name="password" id="password">
				</td>
			</tr>
			
			<tr>
				<td>确认密码</td>
				<td>
					<input type="password" name="password2" id="password2" onblur="checkPwd();">
					<span id="pwd" style="color:red; display: none;">两次密码不一致!</span>
				</td>
			</tr>
			
			<tr>
				<td>昵称</td>
				<td>
					<input type="text" name="nickname" id="nickname">
				</td>
			</tr>
			
			<tr>
				<td>电话</td>
				<td>
					<input type="text" name="phone" id="phone" onblur="checkPhone();">
					<span id="ph" style="color:red; display: none;">电话号码不符合要求!</span>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="button" value="Submit" onclick="saveUser();">
				</td>
			</tr>
		</table>
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