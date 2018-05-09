<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<META    HTTP-EQUIV="Pragma"    CONTENT="no-cache">    
<META    HTTP-EQUIV="Cache-Control"    CONTENT="no-cache">    
<META    HTTP-EQUIV="Expires"    CONTENT="0">    
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>代理客户端</title>
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	var num = 0;
	var src = null;
	function GetQueryString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}
	function showImg() {
		var ip = GetQueryString("agentIp");
		
		num = Math.floor(new Date().getTime()/1000)-1;
		src = "http://" + ip + ":8080/upload/";
		
		$("#agentImg").attr("src", src + num + ".png");
	}

	var t_img; // 定时器
	var isLoad = true; // 控制变量

	// 判断图片加载状况，加载完成后回调
	isImgLoad(function() {
		showImg();
	});

	// 判断图片加载的函数
	function isImgLoad() {
		// 注意我的图片类名都是cover，因为我只需要处理cover。其它图片可以不管。
		// 查找所有封面图，迭代处理
		$('.cover').each(function() {
			// 找到为0就将isLoad设为false，并退出each
			if (this.height === 0) {
				isLoad = false;
				return false;
			}
		});
		// 为true，没有发现为0的。加载完毕
		if (isLoad) {
			clearTimeout(t_img); // 清除定时器
			showImg();
			// 为false，因为找到了没有加载完成的图，将调用定时器递归
		} else {
			isLoad = true;
			t_img = setTimeout(function() {
				isImgLoad(); // 递归扫描
			}, 1000); // 我这里设置的是500毫秒就扫描一次，可以自己调整
		}
	}

	jQuery(function($) {
		setInterval("isImgLoad()", 1000);
	});
</script>
</head>
<body>
	<div>
		<img id="agentImg" alt="" src="" style="height: 100%; width: 100%;">
	</div>
</body>

</html>