	//公共控制按钮默认状态
	var buildstatus=false;
	var peoplestatus=false;
	var lightstatus=false;
	var greenstatus=false;
	var speedstatus=false;
	var videostatus=false;
	var energystatus="0";
	var sceneid = "20";
	var nowNum = 1;
	//通过页数切换大屏内容
	function switchScreen(){
		var page = $('#pageNum').val();
		send('1@'+page);
	}
	//切换场景
	function switchScene(categoryId,obj,status){
		//将之前选中元素边框移除
		var imgs = $('#menu').find('img');
		$.each(imgs, function(index, val){
			if($(val).hasClass('img-border')){
				$(val).removeClass('img-border');
			}
		});
		//当前选中元素添加边框
		var img = $(obj).find("img");
		img.addClass("img-border");
		//添加页数
		/*var cateId = categoryId.split('@')[1];
		$.ajax({
    		url:'/Cm-pom/dispatcher/scenes/queryByCategoryId',
    		data:{"categoryId":cateId},
    	    type: 'POST',
    	    dataType:'JSON',
    	    async: false,
    		success:function(msg){
    			var size=msg.size;
    			var html="";
    			for(var i=0;i<size;i++){
    				var temp = "";
    				if(i==0){
    					temp = "<option value=\""+i+"\" selected=\"selected\">"+(i+1)+"</option>"
    				}else{
    					temp = "<option value=\""+i+"\">"+(i+1)+"</option>"
    				}
    				html=html+temp;
    			}
    			$("#pageNum").empty();
    			$("#pageNum").append(html);
    		}
    	});*/
		//切换显示按钮
		if(status == 1){
			$("#ereportDiv").hide();
			$("#ofoDiv").show();
			$("#fireDiv").hide();
			$("#carDiv").hide();
			$("#dustDiv").hide();
			$("#pmDiv").hide();
			$("#safetyDiv").hide();
			$("#communityDiv").hide();
		}else if(status == 2){
			$("#ereportDiv").hide();
			$("#ofoDiv").hide();
			$("#fireDiv").show();
			$("#carDiv").hide();
			$("#dustDiv").hide();
			$("#pmDiv").hide();
			$("#safetyDiv").hide();
			$("#communityDiv").hide();
		}else if(status == 3){
			$("#ereportDiv").hide();
			$("#ofoDiv").hide();
			$("#fireDiv").hide();
			$("#carDiv").show();
			$("#dustDiv").hide();
			$("#pmDiv").hide();
			$("#safetyDiv").hide();
			$("#communityDiv").hide();
		}else if(status == 4){
			$("#ereportDiv").hide();
			$("#ofoDiv").hide();
			$("#fireDiv").hide();
			$("#carDiv").hide();
			$("#dustDiv").show();
			$("#pmDiv").hide();
			$("#safetyDiv").hide();
			$("#communityDiv").hide();
		}else if(status == 5){
			$("#ereportDiv").hide();
			$("#ofoDiv").hide();
			$("#fireDiv").hide();
			$("#carDiv").hide();
			$("#dustDiv").hide();
			$("#pmDiv").show();
			$("#safetyDiv").hide();
			$("#communityDiv").hide();
		}else if(status == 6){
			$("#ereportDiv").hide();
			$("#ofoDiv").hide();
			$("#fireDiv").hide();
			$("#carDiv").hide();
			$("#dustDiv").hide();
			$("#pmDiv").hide();
			$("#safetyDiv").show();
			$("#communityDiv").hide();
		}else if(status == 7){
			$("#ereportDiv").hide();
			$("#ofoDiv").hide();
			$("#fireDiv").hide();
			$("#carDiv").hide();
			$("#dustDiv").hide();
			$("#pmDiv").hide();
			$("#safetyDiv").hide();
			$("#communityDiv").show();
		}
		
		var msg = categoryId.split('@');
		//alert(msg[1]);
		if(categoryId != null && categoryId != ""){
			send(categoryId);
			setsceneId(msg[1]);
		}
		
	}
	//事件上报
	function ereport(flag,screen,type,obj){
		dj(obj);
		var json = "{\"status\":\"4\",\"flag\":\""+flag+"\",\"screen\":\""+screen+"\",\"type\":\""+type+"\"}";
		send(json);
	}
	//控制视频播放
	function controlVideo(flag,screen,flashIndex,play){
		var json = "{\"status\":\"4\",\"flag\":\""+flag+"\",\"screen\":\""+screen+"\",\"flashIndex\":\""+flashIndex+"\",\"play\":\""+play+"\"}";
		send(json);
	}
	//测试socket
	function sendCom(unit,step,timeOut,option){
		var json = "{\"unit\":\""+unit+"\",\"step\":\""+step+"\",\"timeout\":\""+timeOut+"\",\"option\":\""+option+"\"}";
		send1(json);
	}
	//翻页
	function flip(message,obj){
		var msg = message.split('@');
		if(msg[0] == '5'){
			$("#ereportDiv").show();
			$("#ofoDiv").hide();
			$("#fireDiv").hide();
			$("#carDiv").hide();
			var imgs = $('#menu').find('img');
			$.each(imgs, function(index, val){
				if($(val).hasClass('img-border')){
					$(val).removeClass('img-border');
				}
			});
		}
		send(message);
		$(obj).attr("disabled",true);
		setTimeout(function(){
			$(obj).attr("disabled",false);
		}, 1*1500);
	}
	
	$(function() {
		//加载事件
		var collection = $(".ereport_button");
		$.each(collection, function() {
			$(this).addClass("start");
		});
	});
	//单击事件
	function dj(dom) {
		var collection = $(".ereport_button");
		$.each(collection, function() {
			$(this).removeClass("end");
			$(this).addClass("start");
		});
		$(dom).removeClass("start");
		$(dom).addClass("end");
	}
	function changeStatus(id){
		switch(id){
		case "buildstatus":
			if(!buildstatus){
				$("#"+id).attr('src','images/start.png');
				buildstatus=true;
				sendCom('building',1,0,'');
			}else if(buildstatus){
				$("#"+id).attr('src','images/close.png');
				buildstatus=false;
				sendCom('building',2,0,'');
			}
		    break;
		case "peoplestatus":
			if(!peoplestatus){
				$("#"+id).attr('src','images/start.png');
				peoplestatus=true;
				sendCom('human2',2,0,'');
			}else if(peoplestatus){
				$("#"+id).attr('src','images/close.png');
				peoplestatus=false;
				sendCom('human2',3,0,'');
			}
		    break;
		case "lightstatus":
			if(!lightstatus){
				$("#"+id).attr('src','images/start.png');
				lightstatus=true;
				sendCom('lamp',1,0,'');
			}else if(lightstatus){
				$("#"+id).attr('src','images/close.png');
				lightstatus=false;
				sendCom('lamp',2,0,'');
			}
		    break;
		case "greenstatus":
			if(!greenstatus){
				$("#"+id).attr('src','images/start.png');
				greenstatus=true;
				sendCom('car6',1,0,'');
			}else if(greenstatus){
				$("#"+id).attr('src','images/close.png');
				greenstatus=false;
				sendCom('car6',2,0,'');
			}
		    break;
		case "speedstatus":
			if(!speedstatus){
				$("#"+id).attr('src','images/start.png');
				speedstatus=true;
				sendCom('railway',1,0,'');
			}else if(speedstatus){
				$("#"+id).attr('src','images/close.png');
				speedstatus=false;
				sendCom('railway',2,0,'');
			}
		    break;
		case "videostatus":
			if(!videostatus){
				$("#"+id).attr('src','images/start.png');
				videostatus=true;
				sendCom('video',1,0,'');
				controlVideo(1,4,8,1);
			}else if(videostatus){
				$("#"+id).attr('src','images/close.png');
				videostatus=false;
				sendCom('video',2,0,'');
				controlVideo(1,4,8,0);
			}
		}
	}
	
	function getstatus(id){
		if(id=="1"){
			energystatus=="1";
			sendCom('energy',1,0,'');
			controlVideo(1,4,7,1);
		}else if(id=="2"){
			energystatus=="2";
			sendCom('energy',2,0,'');
			controlVideo(1,4,6,1);
		}else if(id=="3"){
			energystatus=="3";
			sendCom('energy',3,0,'');
			controlVideo(1,4,5,1);
		}
	}
	
	var websocket1 = null;
	//判断当前浏览器是否支持WebSocket
	if ('WebSocket' in window) {
		var ip = document.location.hostname;
		var port = document.location.port;
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
		if(websocket1.readyState !== 1){
			closeWebSocket1();
			websocket1 = new WebSocket("ws://192.168.1.90:8888/");
			//setTimeout(function() {
			//	websocket1.send(message);
	        //}, 250);
		}else{
			websocket1.send(message);
		}
		
	}
	
	var websocket = null;
	var ip = document.location.hostname;
	var port = document.location.port;
	//判断当前浏览器是否支持WebSocket
	if ('WebSocket' in window) {
		websocket = new WebSocket("ws://"+ip+":"+port+"/Cm-pom/websocket");
		//websocket = new WebSocket("ws://10.129.132.119:8080/Cm-pom/websocket");
	} else {
		alert('当前浏览器 Not support websocket');
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
		if(websocket.readyState !== 1){
			closeWebSocket();
			websocket = new WebSocket("ws://"+ip+":"+port+"/Cm-pom/websocket");
			setTimeout(function() {
				websocket.send(message);
	        }, 250);
		}else{
			websocket.send(message);
		}
	}
	function setsceneId(id){
		sceneid = id;
		nowNum = 1;
		controlStep(0);
	}
	//给地图发送消息
	function controlStep(num) {
		var screen = 1;
		if (sceneid == "20") {//共享单车治理
			screen = 1;
		} else if (sceneid == "25") {//火灾事件
			screen = 2;
		} else if (sceneid == "26") {//违章停车
			screen = 3;
		} else if (sceneid == "8a90e58d5f998421015f999056e50006"){//智慧工地
			screen = 5;
		} else if (sceneid == "8a90e58d5f998421015f9990110a0005"){//智慧环保
			screen = 6;
		} else if (sceneid == "8a90e58d5f998421015f998fb7cf0004"){//智慧安监
			screen = 7;
		} else if (sceneid == "8a90e58d5f998421015f998d20470003"){//智慧社区
			screen = 8;
		}
		//给地图发送消息
		nowNum = (nowNum + num);
		if(nowNum == 0){
			nowNum = 1;
		}
		var json = "{\"status\":\"4\",\"flag\":\"" + 1 + "\",\"screen\":\""
				+ screen + "\",\"step\":\"" + nowNum + "\"}";
		send(json);
		//alert(json);

	}
