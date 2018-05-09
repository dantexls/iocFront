<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	final String CONTEXT_PATH = request.getContextPath();
	final String DISPATCHER_PATH = CONTEXT_PATH + "/dispatcher" ;

	final String JQUERY_PATH = CONTEXT_PATH + "/js/jquery";
	final String JS_LIB_PATH = CONTEXT_PATH + "/js/jsLibrary";
	final String JS_MODULES_PATH = CONTEXT_PATH + "/js/modules";
	
	final String IMAGE_PATH = CONTEXT_PATH + "/css/images";
	final String IMAGE_DEFAULT_PATH = CONTEXT_PATH + "/css/default/images";
	final String CSS_PATH = CONTEXT_PATH + "/css";
	
	final String UPLOAD_PATH = "/talent-cloud/upload";
	
	final String title = "人才云";
	
	final String keyWords="广东,广东兴业云,政企云,云平台,广东兴业云平台,薪酬通,简讯通,会议助理,云计算,外勤通";
%>
<!--密码加密  -->
<script src="../../login/js/md5.js"></script>
<script type="text/javascript">

	"use strict";	
    var CONTEXT_PATH = "${pageContext.request.contextPath}";
    var DISPATCHER_PATH = CONTEXT_PATH + "/dispatcher";
    var UPLOAD_PATH = "/talent-cloud/upload";
    var LOGIN_PATH = "http://202.85.212.9:9080/Userweb/dispatcher/user/login.page?current=login";
    var OLD_URL = "http://202.85.212.9:9080/talent-cloud/dispatcher/home?current=login";
    var DOMAIN = "10.9.80.254";
    	
    //用于$.html(str)前替换str中的特殊符号
    String.prototype.escape=function(){
		var str = this;
		var before = str;
		if(str==null||str==undefined){
			
		}else{
			//console.log("替换 str="+str);
			str = str.replace(/&/g, '&amp;');
			str = str.replace(/"/g, '&quot;');
			str = str.replace(/'/g, '&apos;');
			str = str.replace(/</g, '&lt;');
			str = str.replace(/>/g, '&gt;');
		}
		if(str != before){
			//console.log('替换前 str='+before);
			//console.log('替换后 str='+str);
		}
		return str;
    }
    
    
    if(typeof window.console === "undefined") {
   		//浏览器不支持console，则禁用日志
        window.console = {
            log:function(){}
        };
    }else if('${log}'=='on'){
    	//浏览器支持console,并且启用了日志
    }else{
    	//浏览器支持console,但没有启用日志
    	window.console = {
            log:function(){}
        };
	}
    
    //判断输入日期（字符）与当前系统时间相差天数
    function daysBetween(DateOne)  
    {   
        var OneMonth = DateOne.substring(5,DateOne.lastIndexOf ('-'));  
        var OneDay = DateOne.substring(DateOne.length,DateOne.lastIndexOf ('-')+1);  
        var OneYear = DateOne.substring(0,DateOne.indexOf ('-'));  
      	
        var now = new Date() ;
        var DateTwo = now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate();
        var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ('-'));  
        var TwoDay = DateTwo.substring(DateTwo.length,DateTwo.lastIndexOf ('-')+1);  
        var TwoYear = DateTwo.substring(0,DateTwo.indexOf ('-'));  
      
        var cha=((Date.parse(OneMonth+'/'+OneDay+'/'+OneYear)- Date.parse(TwoMonth+'/'+TwoDay+'/'+TwoYear))/86400000);   
        return Math.abs(cha);  
    } 
    
</script>

