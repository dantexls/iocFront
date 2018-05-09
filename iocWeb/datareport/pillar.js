var dataAxis = [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12',
		'13', '14', '15', '16', '17', '18', '19', '20' ];
var data = [ 120, 182, 144, 156, 137, 166, 144, 176, 148, 132,161, 115, 141, 153, 146, 121,
		189, 111, 121, 131 ];
var yMax = 200;
var dataShadow = [];

for (var i = 0; i < data.length; i++) {
	dataShadow.push(yMax);
}

var pillar = {
	title : {
		text : '',
		subtext : ''
	},
	xAxis : {
		data : dataAxis,
		axisLabel : {
			inside : true,
			textStyle : {
				color : '#fff'
			}
		},
		splitLine : {
			show : false
		},
		axisTick : {
			show : false
		},
		axisLine : {
			show : false
		},
		z : 10
	},
	yAxis : {
		splitLine : {
			show : false
		},
		axisLine : {
			show : false
		},
		axisTick : {
			show : false
		},
		axisLabel : {
			textStyle : {
				color : '#999'
			}
		}
	},
	dataZoom : [ {
		type : 'inside'
	} ],
	series : [ { // For shadow
		type : 'bar',
		itemStyle : {
			normal : {
				color : 'rgba(0,0,0,0.05)'
			}
		},
		barGap : '-100%',
		barCategoryGap : '40%',
		data : dataShadow,
		animation : false
	}, {
		type : 'bar',
		itemStyle : {
			normal : {
				color : new echarts.graphic.LinearGradient(0, 0, 0, 1, [ {
					offset : 0,
					color : '#83bff6'
				}, {
					offset : 0.5,
					color : '#188df0'
				}, {
					offset : 1,
					color : '#188df0'
				} ])
			},
			emphasis : {
				color : new echarts.graphic.LinearGradient(0, 0, 0, 1, [ {
					offset : 0,
					color : '#2378f7'
				}, {
					offset : 0.7,
					color : '#2378f7'
				}, {
					offset : 1,
					color : '#83bff6'
				} ])
			}
		},
		data : data
	} ]
};

// Enable data zoom when user click bar.
// var zoomSize = 6;
// myChart.on('click', function (params) {
// console.log(dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)]);
// myChart.dispatchAction({
// type: 'dataZoom',
// startValue: dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)],
// endValue: dataAxis[Math.min(params.dataIndex + zoomSize / 2, data.length -
// 1)]
// });
// });
