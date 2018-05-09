var sense =null;
var ip="49.4.5.118";
var port="30746";
function getchildren(id){
	var htm="";
	$.ajax({
		url:'http://'+ip+':'+port+'/category/findCategoryById/'+id,
	    type: 'POST',
	    dataType:'JSON',
	    async: false,
		success:function(msg){
			var scategory=msg.length;
			var scat=msg.data;
			if(scategory==0){
				var con=getContent(id);
				htm=htm+con;
			}
			if(scat.length!=0){
				$.each(scat,function(index,val){
					var temp="";
				    temp ='<li class="folder">'+val.cateGoryName;
				    var con=getchildren(val.id);
					htm=htm+temp+con;
				});
			}
		}
	})
	return '<ul>'+htm+'</ul>';
}

function getContent(id){
	var conhtm="";
	$.ajax({
		url:'http://'+ip+':'+port+'/scenes/queryByCategoryId/'+id,
	    type: 'POST',
	    dataType:'JSON',
	    async: false,
		success:function(msg){
			var sense=msg.data;
			var htm="";
			$.each(sense,function(index,val){
				var temp ='<li><div  onclick=loadMainContentUrl("./updateTemplate2.html?scenesId='+val.id+'")>'+val.scenesName+'</div></li>';
				conhtm=conhtm+temp;
			});
		}
	});
	return conhtm;
}

function getchildren2(id){
	var htm="";
	$.ajax({
		url:'http://'+ip+':'+port+'/category/findCategoryById/'+id,
	    type: 'POST',
	    dataType:'JSON',
	    async: false,
		success:function(msg){
			var scategory=msg.length;
			var scat=msg.data;
			if(scategory==0){
				
			}
			if(scat.length!=0){
				$.each(scat,function(index,val){
					var temp="";
				    temp ='<li class="folder" value="'+val.id+'"name="'+val.cateGoryName+'">'+val.cateGoryName;
				    var con=getchildren2(val.id);
					htm=htm+temp+con;
				});
			}
		}
	})
	return '<ul>'+htm+'</ul>';
}

function getchildren3(id){
	var htm="";
	$.ajax({
		url:'http://'+ip+':'+port+'/resourcetype/findResourceTypeList/'+id,
	    type: 'POST',
	    dataType:'JSON',
	    async: false,
		success:function(msg){
			var scategory=msg.length;
			var scat=msg.data;
			if(scategory==0){
				
			}
			if(scat.length!=0){
				$.each(scat,function(index,val){
					var temp="";
				    temp ='<li class="folder" value="'+val.id+'"name="'+val.resourceCategoryName+'">'+val.resourceCategoryName;
				    var con=getchildren3(val.id);
					htm=htm+temp+con;
				});
			}
		}
	})
	return '<ul>'+htm+'</ul>';
}


function installtree(){
	$.ajax({
		url:'http://'+ip+':'+port+'/category/findCategoryById/0',
	    type: 'POST',
	    dataType:'JSON',
	    async: false,
		success:function(msg){
			var sense=msg.data;
			var htm="";
			$.each(sense,function(index,val){
				var temp ='<li class="folder">'+val.cateGoryName;
				var child=getchildren(val.id);
				temp=temp+child;
				htm=htm+temp;
			});
			$("#level_1").append(""+htm);
		}
	});
}


function installtree2(){
	$.ajax({
		url:'http://'+ip+':'+port+'/category/findCategoryById/0',
	    type: 'POST',
	    dataType:'JSON',
	    async: false,
		success:function(msg){
			var sense=msg.data;
			var htm="";
			$.each(sense,function(index,val){
				var temp ='<li class="folder" value="'+val.id+'" name="'+val.cateGoryName+'">'+val.cateGoryName;
				var child=getchildren2(val.id);
				temp=temp+child;
				htm=htm+temp;
			});
			$("#addlevel").append(""+htm);
		}
	});
}

function installtree3(){
	$.ajax({
		url:'http://'+ip+':'+port+'/resourcetype/findResourceTypeList/0',
	    type: 'POST',
	    dataType:'JSON',
	    async: false,
		success:function(msg){
			var sense=msg.data;
			var htm="";
			$.each(sense,function(index,val){
				var temp ='<li class="folder" value="'+val.id+'" name="'+val.resourceCategoryName+'">'+val.resourceCategoryName;
				var child=getchildren3(val.id);
				temp=temp+child;
				htm=htm+temp;
			});
			$("#addtypelevel").append(""+htm);
		}
	});
}

//*******************************修改index2.jsp top menu：begin********************************
function setTopMenu(){

	//获取资源分类列表并且生成相应目录
	$.ajax({
		url:'http://'+ip+':'+port+'/resourcetype/findResourceTypeList/0',
	    type: 'POST',
	    dataType:'JSON',
	    async: false,
	    success:function(msg){
	    	var type=msg.data;
	    	var htm="";
	    	$.each(type,function(index,val){
	    		var temp="";
	    		if(val.resourceCategoryName == "图片"){
	    			temp='<li><a href="#"><span></span><i>'+val.resourceCategoryName+'</i></a>';
	    		}else if(val.resourceCategoryName == "视频"){
	    			temp='<li><a href="#"><span class="span01"></span><i>'+val.resourceCategoryName+'</i></a>';
	    		}else if(val.resourceCategoryName == "网页"){
	    			temp='<li><a href="#"><span class="span02"></span><i>'+val.resourceCategoryName+'</i></a>';
	    		}else {
	    			temp='<li><a href="#"><span></span><i>'+val.resourceCategoryName+'</i></a>';
	    		}
	    		
	    		var con=getSubMenuByTypeId(val.id);
	    		htm=htm+temp+con+"</li>";
	    	})
	    	$(".ul01").prepend(htm);
	    }
	})
	
}

function getSubMenuByTypeId(id){
	var htm="";
	$.ajax({
		url:'http://'+ip+':'+port+'/iocResource/findResourceByTypeId/'+id,
	    type: 'POST',
	    dataType:'JSON',
	    async: false,
	    success:function(msg){
	    	var resource=msg.data;
	    	var ul = '<ul class="ul02">';
	    	$.each(resource,function(index,val){
	    		if(val.resourceName!=""){
	                var temp;
	                if(id=="1"){
	                	temp ='<li><a href="#" onclick="replace(&#39<image src='+'http://'+ip+':'+port+'/'+val.resourcePath+' style=width:100%;height:100%;>&#39)"><span></span><i>'+val.resourceName+'</i></a></li>';
	                }else if(id=="2"){
	                	temp ='<li><a href="#" onclick="replace(&#39<video src='+'http://'+ip+':'+port+'/'+val.resourcePath+' loop=-1 autoplay=autoplay width=100% height=100%  style=object-fit:fill;>&#39)"><span></span><i>'+val.resourceName+'</i></a></li>';
	                }else {//改造后的网页
	                	temp='<li><a href="#" onclick="replace(&#39<iframe src='+val.resourcePath+' frameborder=0 scrolling=no height=100% width=100%></iframe>&#39)"><span></span><i>'+val.resourceName+'</i></a></li>';
	                }
		    		ul=ul+temp;
	    		}
	    	});
	    	ul += '</ul>';
	    	htm += ul;
	    }
	})
	return htm;
}

/**
 * 获取网页数据（临时方法）
 * 
 */



function callCreat(obj){
	window.frames["mainContent"].creat(obj);
}

//********************************修改修改index2.jsp top menu：end*******************************


function getResourceByTypeId(id){
	var htm="";
	$.ajax({
		url:'http://'+ip+':'+port+'iocResource/findResourceByTypeId/'+id,
	    type: 'POST',
	    dataType:'JSON',
	    async: false,
	    success:function(msg){
	    	var resource=msg.data;
	    	$.each(resource,function(index,val){
	    		if(id=="1"){
	    			var temp='<a href=javascript:void(0) onclick="creat(&#39<image src='+'http://'+ip+':'+port+'/'+val.resourcePath+' style=width:100%;height:100%;>&#39)">'+val.resourceName+'</a>';
	    		}
	    		if(id=="2"){
	    			var temp='<a href=javascript:void(0) onclick="creat(&#39<video src='+'http://'+ip+':'+port+'/'+val.resourcePath+' loop=-1 autoplay=autoplay width=100% height=100%  style=object-fit:fill;>&#39)">'+val.resourceName+'</a>';
	    		}
	    		htm=htm+temp;
	    	});
	    	
	    }
	})
	return htm+'</div>';
}

//添加资源页面控制 上传文件 和 网页链接 两个标签的显示或隐藏
function toggleUploadBtn(name){
	if(name=="图片" || name=="视频"){
		$("#uploadFile").css("display", "block");
		$("#url").css("display", "none");
	}else {
		$("#uploadFile").css("display", "none");
		$("#url").css("display", "block");
	}
}

    jQuery(function($) {
    	installtree();
    	installtree2();
    	installtree3();
    	$("#tree").fancytree({
//			autoFocus: true,
			minExpandLevel: 2,
			clickFolderMode: 3, // expand with single click
			autoActivate: false,
			autoCollapse: true,
			autoScroll: true,
			tabbable: false, // we don't want the focus frame
			focus: function(event, data) {
				var node = data.node;
				// Auto-activate focused node after 1 second
				if(node.data.href){
					node.scheduleAction("activate", 1000);
				}
			},
			blur: function(event, data) {
				data.node.scheduleAction("cancel");
			},
			activate: function(event, data){
				var node = data.node;
				if(node.data.href){
					window.open(node.data.href, node.data.target);
				}
			},
			click: function(event, data){ // allow re-loads
				var node = data.node;
				if(node.isActive() && node.data.href){
					data.tree.reactivate();
				}
			}
		});
    	
    	$("#addtree").fancytree({
//			autoFocus: true,
			minExpandLevel: 2,
			clickFolderMode: 3, // expand with single click
			autoActivate: false,
			autoCollapse: true,
			autoScroll: true,
			tabbable: false, // we don't want the focus frame
			focus: function(event, data) {
				var node = data.node;
				// Auto-activate focused node after 1 second
				if(node.data.href){
					node.scheduleAction("activate", 1000);
				}
			},
			blur: function(event, data) {
				data.node.scheduleAction("cancel");
			},
			activate: function(event, data){
				var node = data.node;
				var nodename = $("#addtree").fancytree("getActiveNode");
				var nodeId=$("[name="+nodename.title+"]").attr("value");
				$("[name=scenceId]").val(nodename.title);
				$("[name=scenceId]").attr("typeid",nodeId);
				if(node.data.href){
					console.log(node.data.href+" " + node.data.target);
					window.open(node.data.href, node.data.target);
				}
			},
			click: function(event, data){ // allow re-loads
				var node = data.node;

				if(node.isActive() && node.data.href){
					data.tree.reactivate();
				}
			}
		});
    	
    	$("#addtypetree").fancytree({
//			autoFocus: true,
			minExpandLevel: 2,
			clickFolderMode: 3, // expand with single click
			autoActivate: false,
			autoCollapse: true,
			autoScroll: true,
			tabbable: false, // we don't want the focus frame
			focus: function(event, data) {
				var node = data.node;
				// Auto-activate focused node after 1 second
				if(node.data.href){
					node.scheduleAction("activate", 1000);
				}
			},
			blur: function(event, data) {
				data.node.scheduleAction("cancel");
			},
			activate: function(event, data){
				var node = data.node;
				var nodename = $("#addtypetree").fancytree("getActiveNode");
				var nodeId=$("[name="+nodename.title+"]").val();
				toggleUploadBtn(nodename.title);
				$("[name=typeId]").val(nodename.title);
				$("[name=typeId]").attr("id",nodeId);
				$("[name=typeIdval]").val(nodeId);
				if(node.data.href){
					window.open(node.data.href, node.data.target);
				}
			},
			click: function(event, data){ // allow re-loads
				var node = data.node;

				if(node.isActive() && node.data.href){
					data.tree.reactivate();
				}
			}
		});
    	
    	//获取资源分类列表并且生成相应目录
    	$.ajax({
    		url:'http://'+ip+':'+port+'/resourcetype/findResourceTypeList/0',
    	    type: 'POST',
    	    dataType:'JSON',
    	    async: false,
    	    success:function(msg){
    	    	var type=msg.data;
    	    	var htm="";
    	    	$.each(type,function(index,val){
    	    		var temp='<p class="menu_head"><i class="fa"></i><img src="images/icon/xitong_24.png" style="margin-left: -15px;padding-right: 10px;">'+val.resourceCategoryName+'</p><div style="display:none;" class="menu_body">'
    	    		var con=getResourceByTypeId(val.id);
    	    		htm=htm+temp+con;
    	    	})
    	    	$("#firstpane").append(htm);
    	    }
    	})
    	
    }); 



    function getLayoutData(){
    	$.ajax({
    		url:'http://'+ip+':'+port+'/layout/queryLayoutdistinct',
    	    type: 'POST',
    	    dataType:'JSON',
    	    success:function(msg){
    	    	var layout=msg.data;
    	    	var htm="";
    	    	$.each(layout,function(index,val){
    	    		var temp='<li><a class="item" href=javascript:void(0) onclick=window.parent.loadMainContentUrl("./updatelayout.html?layoutName='+val.layoutName+'")> <i class="fa-circle-o"></i>-&nbsp;&nbsp;'+val.layoutName+'</a></li>';
    	    		htm=htm+temp;
    	    	})
    	    	$("#layoutlist").append(htm);
    	    }
    	})
    }
  /**
   * 搜索
   */  
    function serachResourceName(){
		var resourceName = $("#name").val();
		if (resourceName == "") {
			alert("请添加搜索内容");
			return;
		}
			$.ajax({
				url : 'http://'+ip+':'+port+'/iocResource/queryResourceByName/'+resourceName,
				type : 'POST',
				dataType:'JSON',
				success : function(msg) {
					var resourceLength=msg.length;
					var type=msg.data;
					console.log(type);
					if(resourceLength==0){
						alert("无此类资源");
					}
					if(resourceLength!=0){
					var htm="";
					var ul03 = $(".ul03"); 
					ul03.html("");
					$.each(type,function(index,val){
						var temp = temp ='<li><a onclick="window.parent.callCreat(&#39<image src='+'http://'+ip+':'+port+'/'+val.resourcePath+' style=width:100%;height:100%;>&#39)"><span></span><i><img src="images/icon/xitong_24.png" style="margin-left: 5px;padding-right: 10px;">'+val.resourceName+'</i></a></li>';
				    		htm=htm+temp;
				    });
			    	 $(window.frames["mainContent"].document).find("#ResourceName").append(htm);
				  }
				}
			})
		}

    
    
    