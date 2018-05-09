jQuery(function($) {
	$
			.ajax({
				url : 'http://'+ip+':'+port+'/scenes/querySort',
				type : 'POST',
				dataType : 'JSON',
				success : function(msg) {
					var sense = msg.data;
					var htm = "";
					$
							.each(
									sense,
									function(index, val) {
										var temp = '<li><img src="images/index/img1.png" alt="" /><p class="edit"><a href=javascript:void(0) onclick=window.parent.loadMainContentUrl("updateTemplate2.jsp?scenesId='+val.id+'")></a>'
												+ val.scenesName
												+ '</p><p class="tool_P"><a href="#"><span></span><i>复制</i></a> <a href="#"><span class="span1"></span><i>预览</i></a> <a href="#"><span class="span2"></span><i>发布</i></a></p></li>';
										htm = htm + temp;
									});
					$("#scenediv").append("" + htm);
				}
			});
});