var systemWidth = screen.width;
var arr = new Array();
var nowNum = null;
var cateId = null;
var addleft = 0;
var timer;
function getCateGory(cateid) {
	$.ajax({
		url : '/Cm-pom/dispatcher/scenes/queryByCategoryId',
		data : {
			"categoryId" : cateid
		},
		type : 'POST',
		dataType : 'JSON',
		async : false,
		success : function(msg) {
			arr = msg.data;
		}
	})
	cateId = cateid;
	 
}

jQuery(function($) {
	$("#condiv").css("height", "2160px");
	$("#condiv").css("width", "3840px");
	$("#num").val(0);
	nowNum = $("#num").val();
	getCateGory(20);
	$.ajax({
		url : '/Cm-pom/dispatcher/layer/queryByScenesId',
		data : {
			"scenesId" : arr[0].id
		},
		type : 'POST',
		dataType : 'JSON',
		async : false,
		success : function(msg) {
			var data = msg.data;
			var target = "canvas";
			$
					.each(data,
							function(index, val) {
								var Stylestr = val.style;
								var attrlist = getstylevalue(Stylestr);
								//分辨率适配计算开始
								var screenx = $("#condiv").css("width");
								var screeny = $("#condiv").css("height");
								var x_scale = accDiv(
										screenx.replace("px", "") / 2, 960);
								var y_scale = accDiv(
										screeny.replace("px", "") / 2, 540);
								var newWidth = attrlist[2].replace("px", "")
										* x_scale;
								var newHeight = attrlist[1].replace("px", "")
										* y_scale;
								var newleft = accDiv(((attrlist[3].replace(
										"px", "") - 230) * 2), 1920)
										* screenx.replace("px", "");
								var newtop = accDiv((attrlist[0].replace("px",
										"") - 110) * 2, 1080)
										* screeny.replace("px", "");
								//分辨率适配计算结束
								//设备屏幕适配开始
								if (systemWidth > screenx.replace("px", "")) {
									addleft = accDiv(systemWidth
											- screenx.replace("px", ""), 2);
								}
								//设备屏幕适配结束
								var content = val.content;
								if (content.indexOf("localhost") >= 0) {
									content = content.replace("localhost", ip);
								}
								new Dialog({
									Width : newWidth * 2,
									Height : newHeight * 2,
									Left : newleft + addleft,
									Top : newtop,
									Info : "",
									Content : content
								});
								if (content.indexOf(target) != -1) {
									var id = $(
											".dialogcontainter:eq(" + index
													+ ") .dialogbody")
											.children().attr("id");
									function init() {
										datainit(id)
									}
									window.setTimeout(init, 2000);
								}
							});

		}
	})
	getnewsize('map_div');
	getnewsize('index_div');
});

var mapheight = null;
var mapwidth = null;
function accDiv(arg1, arg2) {
	var t1 = 0, t2 = 0, r1, r2;
	try {
		t1 = arg1.toString().split(".")[1].length
	} catch (e) {
	}
	try {
		t2 = arg2.toString().split(".")[1].length
	} catch (e) {
	}
	with (Math) {
		r1 = Number(arg1.toString().replace(".", ""))
		r2 = Number(arg2.toString().replace(".", ""))
		return (r1 / r2) * pow(10, t2 - t1);
	}
}

function getnewsize(id) {
	//分辨率适配计算开始
	var screenx = $("#condiv").css("width");
	var screeny = $("#condiv").css("height");
	var x_scale = accDiv(screenx.replace("px", "") / 2, 960);
	var y_scale = accDiv(screeny.replace("px", "") / 2, 540);
	var divWidth = $("#" + id).css("width");
	var divHeight = $("#" + id).css("height");
	var divLeft = $("#" + id).css("left");
	var divTop = $("#" + id).css("top");
	var newWidth = divWidth.replace("px", "") * x_scale;
	var newHeight = divHeight.replace("px", "") * y_scale;
	var newleft = accDiv(((divLeft.replace("px", ""))), 1920)
			* screenx.replace("px", "");
	var newtop = accDiv((divTop.replace("px", "")), 1080)
			* screeny.replace("px", "");
	//分辨率适配计算结束
	//设备屏幕适配开始
	if (systemWidth > screenx.replace("px", "")) {
		addleft = accDiv(systemWidth - screenx.replace("px", ""), 2);
	}
	//设备屏幕适配结束
	$("#" + id).css("width", newWidth);
	$("#" + id).css("height", newHeight);
	$("#" + id).css("left", newleft + addleft);
	$("#" + id).css("top", newtop);
}

function getnewmap(width, height) {
	//分辨率适配计算开始
	var screenx = $("#condiv").css("width");
	var screeny = $("#condiv").css("height");
	var x_scale = accDiv(screenx.replace("px", ""), 1920);
	var y_scale = accDiv(screeny.replace("px", ""), 1080);
	var newWidth = accDiv(screenx.replace("px", "") * width.replace("px", ""),
			1920);
	var newHeight = accDiv(
			screeny.replace("px", "") * height.replace("px", ""), 1080);
	//分辨率适配计算结束
	//设备屏幕适配开始
	if (systemWidth > screenx.replace("px", "")) {
		addleft = accDiv(systemWidth - screenx.replace("px", ""), 2);
	}
	//设备屏幕适配结束
	mapheight = newHeight;
	mapwidth = newWidth;
}

var websocket1 = null;
//判断当前浏览器是否支持WebSocket
if ('WebSocket' in window) {
	websocket1 = new WebSocket("ws://192.168.1.90:8888/");
	//websocket = new WebSocket("ws://10.129.132.119:8080/Cm-pom/websocket");
} else {
	alert('当前浏览器 Not support websocket');
}

//连接发生错误的回调方法
websocket1.onerror = function() {
	setMessageInnerHTML1("WebSocket连接发生错误");
};

//连接成功建立的回调方法
websocket1.onopen = function() {
	setMessageInnerHTML1("WebSocket连接成功");
}

//连接关闭的回调方法
websocket1.onclose = function() {
	setMessageInnerHTML1("WebSocket连接关闭");
}

//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
window.onbeforeunload = function() {
	closeWebSocket1();
}

//将消息显示在网页上
function setMessageInnerHTML1(innerHTML) {
	//document.getElementById('message').innerHTML += innerHTML + '<br/>';
}

//关闭WebSocket连接
function closeWebSocket1() {
	websocket1.close();
}

//发送消息
function send1(message) {
	//var message = document.getElementById('text').value;
	//websocket1.send(message);
	if (websocket1.readyState !== 1) {
		closeWebSocket1();
		websocket1 = new WebSocket("ws://192.168.1.90:8888/");
		setTimeout(function() {
			websocket1.send(message);
		}, 250);
	} else {
		websocket1.send(message);
	}

}

//连接ILC socket服务端
var websocket2 = null;
//判断当前浏览器是否支持WebSocket
if ('WebSocket' in window) {
	websocket2 = new WebSocket("ws://10.16.205.240:8082/websocket");
	//websocket2 = new WebSocket("ws://10.129.132.119:8080/websocket");
} else {
	alert('当前浏览器 Not support websocket')
}

//连接发生错误的回调方法
websocket2.onerror = function() {
	setMessageInnerHTML2("WebSocket连接发生错误");
};

//连接成功建立的回调方法
websocket2.onopen = function() {
	setMessageInnerHTML2("WebSocket连接成功");
}

//连接关闭的回调方法
websocket2.onclose = function() {
	setMessageInnerHTML2("WebSocket连接关闭");
}

//接收到消息的回调方法
websocket2.onmessage = function(event) {
	var message = event.data.split('@');
	if (message[0] == '0') {
		change(message[1]);
	} else if (message[0] == '1') {
		changeNum(message[1]);
	} else if (message[0] == '2') {
		getCateGory(message[1]);
		changeNum(parseInt(message[2]));
	} else if (message[0] == '5') {
		window.location.reload();
	} 
}

//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
window.onbeforeunload = function() {
	closeWebSocket2();
}

//将消息显示在网页上
function setMessageInnerHTML2(innerHTML) {
	//document.getElementById('message').innerHTML += innerHTML + '<br/>';
}

//关闭WebSocket连接
function closeWebSocket2() {
	websocket2.close();
}

//发送消息
function send2(message) {
	if (websocket2.readyState !== 1) {
		closeWebSocket2();
		websocket2 = new WebSocket("ws://10.16.205.240:8082/websocket");
		setTimeout(function() {
			websocket2.send(message);
		}, 250);
	} else {
		websocket2.send(message);
	}
}

var websocket = null;
var ip = document.location.hostname;
var port = document.location.port;
//判断当前浏览器是否支持WebSocket
if ('WebSocket' in window) {
	websocket = new WebSocket("ws://" + ip + ":" + port + "/Cm-pom/websocket");
	//websocket = new WebSocket("ws://10.129.132.119:8080/Cm-pom/websocket");
} else {
	alert('当前浏览器 Not support websocket')
}

//连接发生错误的回调方法
websocket.onerror = function() {
	setMessageInnerHTML("WebSocket连接发生错误");
};

//连接成功建立的回调方法
websocket.onopen = function() {
	setMessageInnerHTML("WebSocket连接成功");
}

//连接关闭的回调方法
websocket.onclose = function() {
	setMessageInnerHTML("WebSocket连接关闭");
}

//接收到消息的回调方法
websocket.onmessage = function(event) {
	var message = event.data.split('@');
	if (message[0] == '0') {
		change(message[1]);
	} else if (message[0] == '1') {
		changeNum(message[1]);
	} else if (message[0] == '2') {
		getCateGory(message[1]);
		changeNum(parseInt(message[2]));
	} else if (message[0] == '5') {
		window.location.reload();
	} else if (message[0] == '6') {
		if (message[1] == '1') {
			window.location.href = "scenepageTemplate_main.jsp";
		}
	}
}

//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
window.onbeforeunload = function() {
	closeWebSocket();
}

//将消息显示在网页上
function setMessageInnerHTML(innerHTML) {
	//document.getElementById('message').innerHTML += innerHTML + '<br/>';
}

//关闭WebSocket连接
function closeWebSocket() {
	websocket.close();
}

//发送消息
function send(message) {
	//var message = document.getElementById('text').value;
	//websocket.send(message);
	if (websocket.readyState !== 1) {
		closeWebSocket();
		websocket = new WebSocket("ws://" + ip + ":" + port
				+ "/Cm-pom/websocket");
		setTimeout(function() {
			websocket.send(message);
		}, 250);
	} else {
		websocket.send(message);
	}
}
function check(n) {
	if (nowNum == n && nowNum == 0) {
		//alert("这已经是第一页");
		return false;
	}
	if (nowNum == n && nowNum == arr.length - 1) {
		//alert("这已经是最后一页");
		return false;
	}
	return true;
}

function change(id) {
	wantTOnum = null;
	if (id == 'f') {
		wantTOnum = 0;
		if (check(wantTOnum)) {
			nowNum = 0;
		} else {
			return;
		}
	}
	if (id == 'e') {
		wantTOnum = arr.length - 1;
		if (check(wantTOnum)) {
			nowNum = arr.length - 1;
		} else {
			return;
		}
	}

	wantTOnum = id;

	if (id == "1") {
		nowNum++;
		if (nowNum > arr.length - 1) {
			//alert("这已经是最后一页");
			nowNum = arr.length - 1;
			return;
		}
	}

	if (id == "-1") {
		nowNum--;
		if (nowNum < 0) {
			//alert("这已经是第一页");
			nowNum = 0;
			return;
		}
	}

	//height: 810px; top: 2px; width: 960px; left: 480px;
	if ((cateId == "20" || cateId == "25") && nowNum == 2) {
		$("#map_div").animate({
			height : '798px',
			width : '960px'
		});
		getnewmap('960', '798');
		$("#map_div").animate({
			height : mapheight + 'px',
			width : mapwidth + 'px'
		});
	} else if ((cateId == "20" || cateId == "25") && nowNum == 0) {
		$("#map_div").animate({
			height : '798px',
			width : '1438px'
		});
		getnewmap('1438', '798');
		$("#map_div").animate({
			height : mapheight + 'px',
			width : mapwidth + 'px'
		});
	} else if ((cateId == "20" || cateId == "25") && nowNum == 1) {
		$("#map_div").animate({
			height : '798px',
			width : '1648px'
		});
		getnewmap('1648', '798');
		$("#map_div").animate({
			height : mapheight + 'px',
			width : mapwidth + 'px'
		});
	} else if ((cateId == "20" || cateId == "25") && nowNum == 3) {
		$("#map_div").animate({
			height : '795px',
			width : '1518px'
		});
		getnewmap('1518', '798');
		$("#map_div").animate({
			height : mapheight + 'px',
			width : mapwidth + 'px'
		});
	} else {
		$("#map_div").animate({
			height : '798px',
			width : '1438px'
		});
		getnewmap('1438', '798');
		$("#map_div").animate({
			height : mapheight + 'px',
			width : mapwidth + 'px'
		});
	}
	$(".dialogcontainter").remove();
	$.ajax({
		url : '/Cm-pom/dispatcher/layer/queryByScenesId',
		data : {
			"scenesId" : arr[nowNum].id
		},
		type : 'POST',
		dataType : 'JSON',
		success : function(msg) {
			var data = msg.data;
			var target = "canvas";
			$
					.each(data,
							function(index, val) {
								var Stylestr = val.style;
								var attrlist = getstylevalue(Stylestr);
								//分辨率适配计算开始
								var screenx = $("#condiv").css("width");
								var screeny = $("#condiv").css("height");
								var x_scale = accDiv(
										screenx.replace("px", "") / 2, 960);
								var y_scale = accDiv(
										screeny.replace("px", "") / 2, 540);
								var newWidth = attrlist[2].replace("px", "")
										* x_scale;
								var newHeight = attrlist[1].replace("px", "")
										* y_scale;
								var newleft = accDiv(((attrlist[3].replace(
										"px", "") - 230) * 2), 1920)
										* screenx.replace("px", "");
								var newtop = accDiv((attrlist[0].replace("px",
										"") - 110) * 2, 1080)
										* screeny.replace("px", "");
								//分辨率适配计算结束
								//设备屏幕适配开始
								if (systemWidth > screenx.replace("px", "")) {
									addleft = accDiv(systemWidth
											- screenx.replace("px", ""), 2);
								}
								//设备屏幕适配结束
								var content = val.content;
								if (content.indexOf("localhost") >= 0) {
									content = content.replace("localhost", ip);
								}
								new Dialog({
									Width : newWidth * 2,
									Height : newHeight * 2,
									Left : newleft + addleft,
									Top : newtop,
									Info : "",
									Content : content
								});
								if (content.indexOf(target) != -1) {
									var id = $(
											".dialogcontainter:eq(" + index
													+ ") .dialogbody")
											.children().attr("id");
									function init() {
										datainit(id)
									}
									window.setTimeout(init, 2000);
								}
							});
			var screen = null;
			if (cateId == "20") {//共享单车治理
				screen = 1;
			} else if (cateId == "25") {//火灾事件
				screen = 2;
			} else if (cateId == "26") {//违章停车
				screen = 3;
			} else if (cateId == "8a90e58d5f998421015f999056e50006"){//智慧工地
				screen = 5;
			} else if (cateId == "8a90e58d5f998421015f9990110a0005"){//智慧环保
				screen = 6;
			} else if (cateId == "8a90e58d5f998421015f998fb7cf0004"){//智慧安监
				screen = 7;
			} else if (cateId == "8a90e58d5f998421015f998d20470003"){//智慧社区
				screen = 8;
			}
			var step = (nowNum + 1);
			//给地图发送消息
			controlStep(1, screen, step);
			//给沙盘发送消息
			if (screen == 1) {
				if (step == 2) {
					sendCom('human4', 1, 0, '');
				} else if (step == 4) {
					sendCom('car5', 1, 0, '');
				}
			} else if (screen == 2) {
				if (step == 2) {
					sendCom('building', 3, 0, '');
					sendCom('human1', 1, 0, '');
				} else if (step == 4) {
					sendCom('car1', 3, 0, '');
					sendCom('car3', 1, 0, '');
					sendCom('car4', 1, 0, '');
				} else if (step == 5) {
					sendCom('building', 4, 0, '');
					sendCom('car1', 4, 0, '');
					sendCom('car3', 2, 0, '');
					sendCom('car4', 2, 0, '');
				}
			} else if (screen == 3) {
				if (step == 2) {
					sendCom('car2', 1, 0, '');
					sendCom('human2', 1, 0, '');
				} else if (step == 3) {
					sendCom('car1', 1, 0, '');
				} else if (step == 4) {
					sendCom('car2', 2, 0, '');
					sendCom('car1', 2, 0, '');
				}
			}
			//sendCom('state',1,0,'');
		}
	})

}

function changeNum(arrId) {
	nowNum = arrId;
	$(".dialogcontainter").remove();
	$.ajax({
		url : '/Cm-pom/dispatcher/layer/queryByScenesId',
		data : {
			"scenesId" : arr[nowNum].id
		},
		type : 'POST',
		dataType : 'JSON',
		success : function(msg) {
			var data = msg.data;
			$
					.each(data,
							function(index, val) {
								var Stylestr = val.style;
								var attrlist = getstylevalue(Stylestr);
								//分辨率适配计算开始
								var screenx = $("#condiv").css("width");
								var screeny = $("#condiv").css("height");
								var x_scale = accDiv(
										screenx.replace("px", "") / 2, 960);
								var y_scale = accDiv(
										screeny.replace("px", "") / 2, 540);
								var newWidth = attrlist[2].replace("px", "")
										* x_scale;
								var newHeight = attrlist[1].replace("px", "")
										* y_scale;
								var newleft = accDiv(((attrlist[3].replace(
										"px", "") - 230) * 2), 1920)
										* screenx.replace("px", "");
								var newtop = accDiv((attrlist[0].replace("px",
										"") - 110) * 2, 1080)
										* screeny.replace("px", "");
								//分辨率适配计算结束
								//设备屏幕适配开始
								if (systemWidth > screenx.replace("px", "")) {
									addleft = accDiv(systemWidth
											- screenx.replace("px", ""), 2);
								}
								//设备屏幕适配结束
								var content = val.content;
								if (content.indexOf("localhost") >= 0) {
									content = content.replace("localhost", ip);
								}
								new Dialog({
									Width : newWidth * 2,
									Height : newHeight * 2,
									Left : newleft + addleft,
									Top : newtop,
									Info : "",
									Content : content
								});
							});
			var screen = null;
			if (cateId == "20") {//共享单车治理
				screen = 1;
			} else if (cateId == "25") {//火灾事件
				screen = 2;
			} else if (cateId == "26") {//违章停车
				screen = 3;
			} else if (cateId == "8a90e58d5f998421015f999056e50006"){//智慧工地
				screen = 5;
			} else if (cateId == "8a90e58d5f998421015f9990110a0005"){//智慧环保
				screen = 6;
			} else if (cateId == "8a90e58d5f998421015f998fb7cf0004"){//智慧安监
				screen = 7;
			} else if (cateId == "8a90e58d5f998421015f998d20470003"){//智慧社区
				screen = 8;
			}
			var step = (nowNum + 1);
			//给地图发送消息
			controlStep(1, screen, step);
			//给沙盘发送消息
			//sendCom('state',1,0,'');
		}
	})
}

//给地图发送消息
function controlStep(flag, screen, step) {
	var json = "{\"status\":\"4\",\"flag\":\"" + flag + "\",\"screen\":\""
			+ screen + "\",\"step\":\"" + step + "\"}";
	setTimeout(function() {
		//send(json);
	}, 1 * 1000);
}

//给沙盘发送消息
function sendCom(unit, step, timeOut, option) {
	var json = "{\"unit\":\"" + unit + "\",\"step\":\"" + step
			+ "\",\"timeout\":\"" + timeOut + "\",\"option\":\"" + option
			+ "\"}";
	send1(json);
}