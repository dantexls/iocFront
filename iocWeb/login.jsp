<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>城市智慧中心</title>
<!-- Bootstrap core CSS -->
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="css/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function login() {
		var checkResult = $("#checkResult").val();
//			alert(checkResult);
		if(checkResult!="1"){
			alert("请输入验证码");
			return false;
		}
		
		var username = $("#username").val();
		var password = $("#password").val();
		var msg = "";
		if(username == ""){
			msg += "用户名不能为空！\n";
		}
		if(password == ""){
			msg += "密码不能为空！\n";
		}
		if(msg!=""){
			alert(msg);
			return false;
		}
		
		
		$.ajax({
			url : '/Cm-pom/dispatcher/iocUser/login',
			data : {
				"username" : username,
				"password" : password,
			},
			type : 'POST',
			success : function(data) {
				var json = JSON.parse(data);
				var msg = json["message"];
// 				alert(msg)
				if (msg) {//login successfully
					window.location.href = "./index3.jsp";
// 					window.parent.location.reload(true);
				} else {//login failed
					$("#msg").text(json.data).css("display", "block");
				}
			}
		})
	}
	
	function checkCodes(){
		var codes = $("#codes").val();
		$("#msg").text("").css("display", "none");
		$.ajax({
			url : '/Cm-pom/dispatcher/iocUser/checkCodes',
			data : {
				"codes" : codes
			},
			type : 'GET',
			success : function(data) {
				var json = JSON.parse(data);
				var data = json.data;
				if(!data){//验证码错误
					//alert(json.message);
					
					$("#msg").text(json.message).css("display", "block");
//						$("#msg").html(json.message);
					$("#checkResult").val(0);
					//return false;
				}else {//验证码正确
					$("#checkResult").val(1);
				}
			},

			failed : function(e) {
				alert(e);
			}
		})
	}
	
	/* 刷新验证码 */
	function refreshCodes(){
		var img = $(".yzm").find("img")[0];
		img.src = "/Cm-pom/dispatcher/iocUser/authImg?id="+Math.random();
	}
</script>
</head>
<body>
	<div id="login_bac">
		<div class="lon_box">
			<h2 class="f20 bold">用户登录</h2>
			<ul class="lon_ul">
				<form>
					<li style="margin-top: 20px;"><img src="images/po.png"
						width="24" height="24"><input type="text" name="username"
						id="username" class="form-control lon_srk" placeholder="请输入用户名">
					</li>
					<li>
						<img src="images/Pass.png" width="24" height="24"></li>
						<input type="password" name="password" id="password"
							class="form-control lon_srk" placeholder="请输入您的密码">
					</li>
					<li>
						<i class="fa fa-repeat pull-right Refresh" onclick="refreshCodes();"></i>
						<img src="images/ver.png" width="24" height="24">
						<input type="text" class="form-control lon_srk w5" id="codes" placeholder="验证码" onblur="checkCodes();">
						<span class="yzm">
							<img src="/Cm-pom/dispatcher/iocUser/authImg?id=Math.random()" width="80px" height="40px">
							<input type="hidden" id="checkResult">
						</span>
					</li>
					<li style="margin-top: 16px;"><span class="pull-right"><a
							href="#">忘记密码</a></span><input name="" type="checkbox" value="">记住密码</li>
					<li style="margin-top: 5px; display: none; color: red;" id="msg" class="bold"></li>
					<li style="margin-top: 15px;"><button type="button"
							class="btn btn-primary w10 " onclick="login();">登录</button></li>
				</form>
			</ul>
		</div>
		<div class="foot">-城市智慧中心让城市更美好 City clouds make life more
			beautiful-</div>
	</div>

</body>
</html>

