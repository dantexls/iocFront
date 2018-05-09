<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>左侧菜单demo</title>
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<style type="text/css">
	.nav_left{background: #232b35;height: 100%;width: 220px;min-height: 600px;position: fixed;top: 100px;left: 0;}
	.nav_leftlist{}
	.nav_leftlist h2{height: 50px;line-height: 50px;padding-left: 40px;font-size: 16px;background: #3b444f;color: #999999;position: relative;cursor: pointer;}
	.nav_leftlist h2 b{position: absolute;top: 20px;left: 13px;width: 16px;height: 9px;background: url(../images/icon04.png) no-repeat;background-position: 0 0;cursor: pointer;}
	.nav_leftlist h2 b.cur{background-position: -16px 0;}
	.nav_leftlist dl{}
	.nav_leftlist dl dt{height: 50px;line-height: 50px;background: #2c3643;font-size: 16px;color: #ffffff;padding-left: 60px;position: relative;cursor: pointer;}
	.nav_leftlist dl dt b{position: absolute;top: 20px;left: 34px;width: 16px;height: 9px;background: url(../images/icon04.png) no-repeat;background-position: 0 -10px;}
	.nav_leftlist dl dt b.cur{background-position: -16px -10px;}
	.nav_leftlist dl dd{}
	.nav_leftlist dl dd a{display: block;height: 50px;line-height: 50px;color: #fff;padding-left: 80px;font-size: 16px;position: relative;text-decoration: none;}
	.nav_leftlist dl dd a.cur{color: #ee581c;}
	.nav_leftlist dl dd a.cur b{display: block;position: absolute;top: 16px;right: -1px;width: 11px;height: 18px;background: url(../images/icon04.png) no-repeat;background-position: 0 -20px;}
	</style>
	<script type="text/javascript" >
    $(function(){
        $('.nav_leftlist').on('click', 'h2', function(event) {
            $(this).siblings('dl').toggle();
            if($(this).siblings('dl').css('display')=='none'){
                $(this).find('b').addClass('cur');
            }else{
                $(this).find('b').removeClass('cur');
            }
        });
        $('.nav_leftlist').on('click', 'dl dt', function(event) {
            $(this).siblings('dd').toggle();
            if($(this).siblings('dd').css('display')=='none'){
                $(this).find('b').addClass('cur');
            }else{
                $(this).find('b').removeClass('cur');
            }
        });
        $('.nav_leftlist').on('click','dd a', function(event){
        	var as = $('.nav_leftlist a');
        	$.each(as, function(index, val){
    			if($(val).hasClass('cur')){
    				$(val).removeClass('cur');
    			}
    		});
        	$(this).addClass('cur');
        });
    })
</script>
</head>
<body>
<!-- 三级菜单导航 -->
<div class="nav_left">
    <div class="nav_leftlist">
        <h2><b></b>用户系统</h2>
        <dl>
            <dt><b></b>用户管理</dt>
            <dd>
                <a href="#">商户信息<b></b></a>
                <a href="#">用户信息<b></b></a>
            </dd>
        </dl>
    </div>
    <div class="nav_leftlist">
        <h2><b></b>财务系统</h2>
        <dl>
            <dt><b></b>系统账务</dt>
            <dd>
                <a href="#">平台账单<b></b></a>
                <a href="#">账单明细<b></b></a>
            </dd>
        </dl>
        <dl>
            <dt><b></b>商户账务</dt>
            <dd>
                <a href="#">商户账单<b></b></a>
                <a href="#">提现管理<b></b></a>
            </dd>
        </dl>
        <dl>
            <dt><b></b>用户账务</dt>
            <dd>
                <a href="#">用户账单<b></b></a>
                <a href="#">提现管理<b></b></a>
            </dd>
        </dl>
    </div>
</div>
        
</body>
</html>