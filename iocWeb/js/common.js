var sense =null;
    jQuery(function($) {
    	$.ajax({
    		url:'/Cm-pom/dispatcher/scenes/queryAll',
    	    type: 'POST',
    	    dataType:'JSON',
    		success:function(msg){
    			var sense=msg.data;
    			var htm="";
    			$.each(sense,function(index,val){
    				var temp ='<a href="updateTemplate.jsp?scenesId='+val.id+'">'+val.scenesName+'</a>';
    				htm=htm+temp;
    			});
    			$("#create").append(""+htm);
    		}
    	});
    	
    	$.ajax({
    		url:'/Cm-pom/dispatcher/layer/queryByScenesId',
    		data:{"scenesId":'tempWeb'},
    	    type: 'POST',
    	    dataType:'JSON',
    		success:function(msg){
    			var sense=msg.data;
    			var htm="";
    			$.each(sense,function(index,val){
    				var temp ='<a href="javascript:void(0)" onclick="creat('+val.content+')">web资源'+(index+1)+'</a>';
    				htm=htm+temp;
    			});
    			$("#webDiv").append(""+htm);
    		}
    	});
    	
    	
    	$.ajax({
    		url:'/Cm-pom/dispatcher/layer/queryByScenesId',
    		data:{"scenesId":'agent'},
    	    type: 'POST',
    	    dataType:'JSON',
    		success:function(msg){
    			var sense=msg.data;
    			var htm="";
    			$.each(sense,function(index,val){
    				var temp ='<a href="javascript:void(0)" onclick="creat('+val.content+')">agent资源'+(index+1)+'</a>';
    				htm=htm+temp;
    			});
    			$("#agentDiv").append(""+htm);
    		}
    	});
    }); 

 