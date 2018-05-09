function checkdivalive(id) {
	if ($("#" + id).length > 0)
		$("#"+id).remove();
}

function reportinit(id) {
	creat('<div id=' + id + ' style="width:500px;height:300px;"><div>');
	$("#reportids").val(id);
	var myChart = echarts.init(document.getElementById(id));
	var option = new Object();
	switch (id) {
	case 'cake':
		option = cake;
		break;
	case 'line':
		option = line;
		break;
	case 'pillar':
		option = pillar;
		break;
	}
	myChart.setOption(option);
	$(".dialogbody").css("background", "black");
}

function reportreload(){
	var width=$("#diswidth").val();
	var height=$("#disheight").val();
	var id=$("#edit canvas").parent().parent().attr("id");
	if(id!=undefined){
	checkdivalive(id);
	var htm='<div id='+id+' style=height:'+height+';width:'+width+'></div>';
	$("#edit .dialogbody").append(htm);
	var myChart = echarts.init(document.getElementById(id));
	var option = new Object();
	switch (id) {
	case 'cake':
		option = cake;
		break;
	case 'line':
		option = line;
		break;
	case 'pillar':
		option = pillar;
		break;
	}
	myChart.setOption(option);
	$(".dialogbody").css("background", "black");
	}
}


function datainit(id) {
	var myChart = echarts.init(document.getElementById(id));
	var option = new Object();
	switch (id) {
	case 'cake':
		option = cake;
		break;
	case 'line':
		option = line;
		break;
	case 'pillar':
		option = pillar;
		break;
	}
	myChart.setOption(option);
	$(".dialogbody").css("background", "black");
}