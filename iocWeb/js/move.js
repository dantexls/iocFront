var z = 1, i = 1, left = 10
var isIE = (document.all) ? true : false;
var elementsdata = null;
var senseId = null;
var num = 0;
var magnetstatus = 0;
var $ = function(id) {
	return document.getElementById(id);
};

var Extend = function(destination, source) {
	for ( var property in source) {
		destination[property] = source[property];
	}
}

var Bind = function(object, fun, args) {
	return function() {
		return fun.apply(object, args || []);
	}
}

var BindAsEventListener = function(object, fun) {
	var args = Array.prototype.slice.call(arguments).slice(2);
	return function(event) {
		return fun.apply(object, [ event || window.event ].concat(args));
	}
}

var CurrentStyle = function(element) {
	return element.currentStyle
			|| document.defaultView.getComputedStyle(element, null);
}

function create(elm, parent, fn) {
	var element = document.createElement(elm);
	fn && fn(element);
	parent && parent.appendChild(element);
	return element
};
function addListener(element, e, fn) {
	element.addEventListener ? element.addEventListener(e, fn, false) : element
			.attachEvent("on" + e, fn)
};
function removeListener(element, e, fn) {
	element.removeEventListener ? element.removeEventListener(e, fn, false)
			: element.detachEvent("on" + e, fn)
};

var Class = function(properties) {
	var _class = function() {
		return (arguments[0] !== null && this.initialize && typeof (this.initialize) == 'function') ? this.initialize
				.apply(this, arguments)
				: this;
	};
	_class.prototype = properties;
	return _class;
};

var Dialog = new Class(
		{
			options : {
				Width : 400,
				Height : 300,
				Left : 400,
				Top : 400,
				Titleheight : 2,
				Minwidth : 50,
				Minheight : 50,
				CancelIco : true,
				ResizeIco : true,
				Info : "新闻标题",
				Content : "无内容",
				Zindex : 2
			},
			initialize : function(options) {
				this._dragobj = null;
				this._resize = null;
				this._cancel = null;
				this._body = null;
				this._x = 0;
				this._y = 0;
				this._fM = BindAsEventListener(this, this.Move);
				this._fS = Bind(this, this.Stop);
				this._isdrag = null;
				this._Css = null;
				// //////////////////////////////////////////////////////////////////////////////
				this.Width = this.options.Width;
				this.Height = this.options.Height;
				this.Left = this.options.Left;
				this.Top = this.options.Top;
				this.CancelIco = this.options.CancelIco;
				this.Info = this.options.Info;
				this.Content = this.options.Content;
				this.Minwidth = this.options.Minwidth;
				this.Minheight = this.options.Minheight;
				this.Titleheight = this.options.Titleheight;
				this.Zindex = this.options.Zindex;
				Extend(this, options);
				Dialog.Zindex = this.Zindex
				// 构造dialog
				var obj = [ 'dialogcontainter', 'dialogtitleico', 'dialogbody',
						'dialogbottom', "mask" ];
				for (var i = 0; i < obj.length; i++) {
					obj[i] = create('div', null, function(elm) {
						elm.className = obj[i];
					});
				}
				obj[2].innerHTML = this.Content;

				obj[0].appendChild(obj[1]);
				obj[0].appendChild(obj[4]);
				obj[0].appendChild(obj[2]);
				obj[0].appendChild(obj[3]);
				document.body.appendChild(obj[0]);
				this._dragobj = obj[0];
				this._resize = obj[3];
				this._cancel = obj[1];
				this._body = obj[2];
				this._mask = obj[4];
				// o,x1,x2
				// 设置Dialog的长 宽 ,left ,top
				with (this._dragobj.style) {
					zIndex = this.Zindex;
					top = this.Top + "px";
					height = this.Height + "px";
					width = this.Width + "px";
					left = this.Left + "px";
				}
				this._body.style.height = this.Height - this.Titleheight
						- parseInt(CurrentStyle(this._body).paddingLeft) * 2
						+ 'px';
				// 添加事件
				addListener(this._dragobj, 'mousedown', BindAsEventListener(
						this, this.Start, true));
				addListener(this._cancel, 'mouseover',
						Bind(this, this.Changebg, [ this._cancel, '0px 0px',
								'-21px 0px' ]));
				addListener(this._cancel, 'mouseout', Bind(this, this.Changebg,
						[ this._cancel, '0px 0px', '-21px 0px' ]));
				addListener(this._cancel, 'mousedown', BindAsEventListener(
						this, this.Disappear));
				addListener(this._dragobj, 'mousedown', BindAsEventListener(
						this, this.Cancelbubble));
				addListener(this._resize, 'mousedown', BindAsEventListener(
						this, this.Start, false));
				// **自定义事件
				addListener(this._dragobj, 'mouseover', BindAsEventListener(
						this, this.Changecolor));
				/*
				 * addListener(this._dragobj, 'mouseout',
				 * BindAsEventListener(this, this.resetColor));
				 */
			},
			Disappear : function(e) {
				this.Cancelbubble(e);
				document.body.removeChild(this._dragobj);
				creatmathNum();
			},
			Cancelbubble : function(e) {
				this._dragobj.style.zIndex = ++Dialog.Zindex;
				document.all ? (e.cancelBubble = true) : (e.stopPropagation())
			},
			Changebg : function(o, x1, x2) {
				creatmathNum();
				o.style.backgroundPosition = (o.style.backgroundPosition == x1) ? x2
						: x1;
			},
			Changecolor : function(e) {
				$(".dialogcontainter").css("border", "");
				$(".dialogcontainter").attr("id", "noedit");
				$(".dialogtitleico").css("display", "none");
				$(".dialogbottom").css("display", "none");
				$(".mask").css("display", "none");
				this._dragobj.id = "edit";
				this._dragobj.style.border = "1px dashed #FF0000";
				this._mask.style.cursor = "move";
				this._mask.style.display = "block";
				this._cancel.style.display = "block";
				this._resize.style.display = "block";
				getcssvalue();
			},
			resetColor : function(e) {
				$(".dialogcontainter").css("border", "");
				$(".dialogcontainter").attr("id", "noedit");
				this._mask.style.display = "none";
				this._cancel.style.display = "none";
				this._resize.style.display = "none";
			},
			Start : function(e, isdrag) {
				creatmathNum();
				if (!isdrag) {
					this.Cancelbubble(e);
				}
				this._Css = isdrag ? {
					x : "left",
					y : "top"
				} : {
					x : "width",
					y : "height"
				}
				this._dragobj.style.zIndex = ++Dialog.Zindex;
				this._isdrag = isdrag;
				this._x = isdrag ? (e.clientX - this._dragobj.offsetLeft || 0)
						: (this._dragobj.offsetLeft || 0);
				this._y = isdrag ? (e.clientY - this._dragobj.offsetTop || 0)
						: (this._dragobj.offsetTop || 0);
				if (isIE) {
					addListener(this._dragobj, "losecapture", this._fS);
					this._dragobj.setCapture();
				} else {
					e.preventDefault();
					addListener(window, "blur", this._fS);
				}
				addListener(document, 'mousemove', this._fM);
				addListener(document, 'mouseup', this._fS);
			},
			Move : function(e) {
				creatmathNum();
				window.getSelection ? window.getSelection().removeAllRanges()
						: document.selection.empty();
				var i_x = e.clientX - this._x, i_y = e.clientY - this._y;
				this._dragobj.style[this._Css.x] = (this._isdrag ? Math.max(
						i_x, 0) : Math.max(i_x, this.Minwidth))
						+ 'px';
				this._dragobj.style[this._Css.y] = (this._isdrag ? Math.max(
						i_y, 0) : Math.max(i_y, this.Minheight))
						+ 'px'
				if (!this._isdrag)
					this._body.style.height = Math.max(i_y - this.Titleheight,
							this.Minheight - this.Titleheight)
							- 2
							* parseInt(CurrentStyle(this._body).paddingLeft)
							+ 'px';
				getcssvalue();

			},
			Stop : function() {
				reportreload();
				creatmathNum();
				removeListener(document, 'mousemove', this._fM);
				removeListener(document, 'mouseup', this._fS);
				if (isIE) {
					removeListener(this._dragobj, "losecapture", this._fS);
					this._dragobj.releaseCapture();
				} else {
					removeListener(window, "blur", this._fS);
				}
				if (magnetstatus == 1) {
					checkval();
				}
				getcssvalue();
				getchannelarea();
				getrowcolumn();
			}
		})
function creatmathNum() {
	var row = 0;
	$(".dialogcontainter").each(function() {
		row++;
	})
	num = row;
}

function fixtopleft(css) {
	var temp = css.split(";");
	var returnval = "";
	for (var i = 0; i < temp.length; i++) {
		if (temp[i] == "" || temp[i] == null) {
			continue;
		}
		var chart = temp[i].split(":");
		var data = parseInt(chart[1].replace("px", ""));
		if (temp[i].indexOf("left") != -1) {
			data = data + 227;
			data = chart[0] + ":" + data + "px";
		} else if (temp[i].indexOf("top") != -1) {
			data = data + 69;
			data = chart[0] + ":" + data + "px";
		} else {
			data = temp[i];
		}
		returnval = returnval + data + ";";
	}

	return returnval;
}

function getelementSstyle(a) {
	if (a == 0) {
		var name = $("#scenceName").val();
		var cateId = $("[name=scenceId]").attr("typeid");
		if (name) {
			if (reportIds != undefined) {
				var reportIds = $("#reportids").val();
				var x = $("#" + reportIds).css("height");
				var y = $("#" + reportIds).css("width");
				x = parseInt(x.replace("px", "")) * 2;
				y = parseInt(y.replace("px", "")) * 2;
				$("#" + reportIds).css("height", x + "px");
				$("#" + reportIds).css("width", y + "px");
			}
			$
					.ajax({
						//url : 'http://localhost:8081/scenes/saveScenes/'+name+'/'+cateId+'/'+magnetstatus,
						url : 'http://'+ip+':'+port+'/scenes/saveScenes/'+name+'/'+cateId+'/'+magnetstatus,
						type : 'POST',
						dataType : 'JSON',
						success : function(id) {
							var finId = id.id;
							var temp = new Array();
							for (i = 0; i < num; i++) {
								$(".dialogcontainter").css("border", "");
								var css = $(".dialogcontainter:eq(" + i + ")")
										.attr("style");
								var newcss = fixtopleft(css);
								var content = $(
										".dialogcontainter:eq(" + i
												+ ") div.dialogbody").html();
								var area = $(".dialogcontainter:eq(" + i + ")")
										.attr("area");
								var row = $(".dialogcontainter:eq(" + i + ")")
										.attr("row");
								var column = $(
										".dialogcontainter:eq(" + i + ")")
										.attr("column");
								temp[i] = newcss + "@" + content + "@" + area
										+ "@" + "1" + "@" + row + "@" + column;
								if (row * column != 1) {
									getchannellayer(finId, newcss, content,
											area, row, column);
								}
							}
							elementsdata = temp;
							var jsonString = JSON.stringify(elementsdata);
							$("#layerdivs").val(jsonString);
							$("#scenid").val(finId);
							$
									.ajax({
										data:$('#layerForm').serialize(),
										//url : 'http://localhost:8081/layer/saveLayer',
										url : 'http://'+ip+':'+port+'/layer/saveLayer',
										type : 'POST',
										success : function() {
									/*window.open("http://localhost:8080/Cm-pom/publicTemplate.jsp?scenesId="+ finId);*/
											window.location.reload();
										}
									})
						}
					})
		} else {
			alert("模版名称不能为空");
		}
	} else if (a == 1) {
		var sid = $("#senseId").val();
		$.ajax({
			url:'http://'+ip+':'+port+'/scenes/updateScense/'+sid+'/'+magnetstatus,
			//url : 'http://localhost:8081/scenes/updateScense/'+sid+'/'+magnetstatus,
			async : false,
			type : 'POST',
			success : function(msg) {
				$.ajax({
					url : 'http://'+ip+':'+port+'/layer/delLayer/'+sid,
					async : false,
					type : 'POST',
					success : function(msg) {
					}
				})
			}
		})

		var reportIds = $("canvas").parent().parent().attr("id");
		if (reportIds != undefined) {
			var x = $("#" + reportIds).css("height");
			var y = $("#" + reportIds).css("width");
			x = parseInt(x.replace("px", "")) * 2;
			y = parseInt(y.replace("px", "")) * 2;
			$("#" + reportIds).css("height", x + "px");
			$("#" + reportIds).css("width", y + "px");
		}

		var temp = new Array();
		for (i = 0; i < num; i++) {
			$(".dialogcontainter").css("border", "");
			var css = $(".dialogcontainter:eq(" + i + ")").attr("style");
			var newcss = fixtopleft(css);
			var content = $(".dialogcontainter:eq(" + i + ") div.dialogbody")
					.html();
			var area = $(".dialogcontainter:eq(" + i + ")").attr("area");
			var row = $(".dialogcontainter:eq(" + i + ")").attr("row");
			var column = $(".dialogcontainter:eq(" + i + ")").attr("column");
			temp[i] = newcss + "@" + content + "@" + area + "@" + "1" + "@"
					+ row + "@" + column;
			if (row * column != 1) {
				getchannellayer(sid, newcss, content, area, row, column);
			}
		}
		elementsdata = temp;
		var jsonString = JSON.stringify(elementsdata);
		$("#layerdivs").val(jsonString);
		$("#scenid").val(sid);
		$
				.ajax({
					//url : 'http://localhost:8081/layer/saveLayer',
				    url : 'http://'+ip+':'+port+'/layer/saveLayer',
					data:$('#layerForm').serialize(),
					async : false,
					type : 'POST',
					success : function() {
						/*window.open("http://localhost:8080/Cm-pom/publicTemplate.jsp?scenesId="+ sid);*/
						window.location.reload();
					}
				})
	} else if (a == 2) {
		var layoutName = $("#layoutName").val();
		if (layoutName == "" || layoutName == null) {
			alert("布局名称不能为空");
		} else {
			var temp = new Array();
			for (i = 0; i < num; i++) {
				$(".dialogcontainter").css("border", "");
				var css = $(".dialogcontainter:eq(" + i + ")").attr("style");
				var newcss = fixtopleft(css);
				// var content = $(
				// ".dialogcontainter:eq(" + i
				// + ") div.dialogbody").html();

				var content = '<img src="images/ioc/sense.png" style="width:100%;height:100%">';
				var area = $(".dialogcontainter:eq(" + i + ")").attr("area");
				var row = $(".dialogcontainter:eq(" + i + ")").attr("row");
				var column = $(".dialogcontainter:eq(" + i + ")")
						.attr("column");
				temp[i] = newcss + "@" + content + "@" + area + "@" + "1" + "@"
						+ row + "@" + column;
				if (row * column != 1) {
					getchannellayer_2(layoutName, newcss, content, area, row,
							column);
				}
			}
			elementsdata = temp;
			var jsonString = JSON.stringify(elementsdata);
			$("#divs").val(jsonString);
			$.ajax({
			     url :'http://'+ip+':'+port+'/layout/saveLayout',
				//url : 'http://localhost:8081/layout/saveLayout/',
				data: $('#layoutForm').serialize(),
				type : 'POST',
				success : function() {
					alert("布局保存成功");
					window.parent.location.reload();
				}
			})
		}
	} else if (a == 3) {
		var name = $("#LayoutName").val();
		$("#layoutName").val(name);
		$("#thenName").val(name);
		$
				.ajax({
					url :'http://'+ip+':'+port+'/layout/delLayout/'+name,
				  //url : 'http://localhost:8081/layout/delLayout/'+name,
					async : false,
					type : 'POST',
					success : function(msg) {
						var temp = new Array();
						for (i = 0; i < num; i++) {
							$(".dialogcontainter").css("border", "");
							var css = $(".dialogcontainter:eq(" + i + ")")
									.attr("style");
							var newcss = fixtopleft(css);
							var content = '<img src="images/ioc/sense.png" style="width:100%;height:100%">';
							var area = $(".dialogcontainter:eq(" + i + ")")
									.attr("area");
							var row = $(".dialogcontainter:eq(" + i + ")")
									.attr("row");
							var column = $(".dialogcontainter:eq(" + i + ")")
									.attr("column");
							temp[i] = newcss + "@" + content + "@" + area + "@"
									+ "1" + "@" + row + "@" + column;
							if (row * column != 1) {
								getchannellayer_2(name, newcss, content, area,
										row, column);
							}
						}
						elementsdata = temp;
						var jsonString = JSON.stringify(elementsdata);
						$("#divs").val(jsonString);
						$.ajax({
						  url :'http://'+ip+':'+port+'/layout/saveLayout',
							//url :'http://localhost:8081/layout/saveLayout',
							data: $('#layoutForm').serialize(),
							type : 'POST',
							success : function() {
								window.location.reload();
							}
						})

					}
				})
	}
}

function creat(con) {
	new Dialog({
		Info : title = "标题" + i,
		Left : 150 + left,
		Top : 100 + left,
		Content : con,
		Zindex : (++Dialog.Zindex)
	});
	i++;
	left += 10;
	creatmathNum();
}

function saveCateGroy() {
	var categoryId = $("[name=scenceId]").attr("typeid");
	var cateGoryName = $("#categoryName").val();
	if (cateGoryName == "") {
		alert("分类名称不能为空");
		return;
	}
	$.ajax({
		url : 'http://'+ip+':'+port+'/category/saveCategory/'+categoryId+'/'+cateGoryName,
		type : 'POST',
		success : function(msg) {
			alert("分类已保存");
			window.location.reload();
		}
	})
}

function saveResourceType() {
	var typeId = $("[name=typeId]").attr("id");
	var typeName = $("#typeName").val();
	if (typeName == "") {
		alert("资源分类名称不能为空");
		return;
	}
	$.ajax({
		url : 'http://'+ip+':'+port+'/resourcetype/saveResourceType/'+typeId+'/'+typeName,
		type : 'POST',
		success : function(msg) {
			alert("资源分类已保存");
			window.location.reload();
		}
	})
}

function movediv(direction, act) {
	var finalval = null;
	var cssvalue = $("#edit").css(direction);
	var action = direction + act;
	var name = document.getElementById("value").value;
	var pxes = name; // 感觉错误在这，这个应该是固定的那个input的ID
	console.log(pxes);
	var temp = cssvalue.replace("px", "");
	if (act == "b") {
		finalval = parseInt(temp) + parseInt(pxes);
	} else {
		finalval = parseInt(temp) - parseInt(pxes);
	}
	$("#edit").css(direction, finalval + "px");
	getcssvalue();
	if (magnetstatus == 1) {
		checkval();
	}
	getcssvalue();
	getchannelarea();
	getrowcolumn();
}
/*
 * function movediv(direction, act) { console.log(direction); console.log(act);
 * var finalval = null; var cssvalue = $("#edit").css(direction); var action =
 * direction + act; var pxes = $("#" + action).val(); var temp =
 * cssvalue.replace("px", ""); if (act == "b") { finalval = parseInt(temp) +
 * parseInt(pxes); } else { finalval = parseInt(temp) - parseInt(pxes); }
 * $("#edit").css(direction, finalval + "px"); getcssvalue(); if (magnetstatus ==
 * 1) { checkval(); } getcssvalue(); getchannelarea(); getrowcolumn(); }
 */

function getcssvalue() {
	var top = $("#edit").css("top");
	var height = $("#edit").css("height");
	var width = $("#edit").css("width");
	var left = $("#edit").css("left");
	$("#distop").val(top);
	$("#disheight").val(height);
	$("#disleft").val(left);
	$("#diswidth").val(width);
}

function getchannelarea() {
	var areax = 0;
	var areay = 0;
	var top = parseInt($("#edit").css("top"));
	var left = parseInt($("#edit").css("left"));
	if (left < 220 + 192) {
		areax = 1;
	} else if (left >= 220 + 192 && left < 220 + 192 * 2) {
		areax = 2;
	} else if (left >= 220 + 192 * 2 && left < 220 + 192 * 3) {
		areax = 3;
	} else if (left >= 220 + 192 * 3 && left < 220 + 192 * 4) {
		areax = 4;
	} else {
		areax = 5;
	}

	if (top < 100 + 108) {
		areay = 1;
	} else if (top >= 100 + 108 && top < 100 + 108 * 2) {
		areay = 2;
	} else if (top >= 100 + 108 * 2 && top < 100 + 108 * 3) {
		areay = 3;
	} else if (top >= 100 + 108 * 3 && top < 100 + 108 * 4) {
		areay = 4;
	} else {
		areay = 5;
	}
	$("#edit").attr("area", areay + "_" + areax);
}

function getrowcolumn() {
	var row = 0;
	var column = 0;
	var height = parseInt($("#edit").css("height"));
	var width = parseInt($("#edit").css("width"));
	if (height / 108 <= 1) {
		row = 1;
	} else {
		row = Math.round(height / 108);
	}
	if (width / 192 <= 1) {
		column = 1;
	} else {
		column = Math.round(width / 192);
	}
	$("#edit").attr("column", column);
	$("#edit").attr("row", row);
}

/**
 * 保存
 */

function getchannellayer(sid, css, content, area, row, column) {
	var channelids = area.split("_");
	var locationNum = 1;
	var tempchannel0 = parseInt(channelids[0]);
	var tempchannel1 = parseInt(channelids[1]);
	// ***保存元素从第二个开始*/
	var element;
	columtime = 2;
	$("#sid").val(sid);
	for (rowtime = 0; rowtime < row; rowtime++) {
		for (columtime; columtime <= column; columtime++) {
			locationNum++;
			tempchannel1 = tempchannel1 + 1;
			var temp = new Array();
			temp[0] = css + "@" + content + "@" + tempchannel0 + "_"
					+ tempchannel1 + "@" + locationNum + "@" + row + "@"
					+ column;
			var jsonString = JSON.stringify(temp);
			$("#thenlayer").val(jsonString);
			$.ajax({
			      url : 'http://'+ip+':'+port+'/layer/saveLayer',
				//url :'http://localhost:8081/layer/saveLayer',
				data: $('#layerFormThen').serialize(),
				type : 'POST',
				success : function() {
				}
			})
		}
		columtime = 1;
		tempchannel0++;
		tempchannel1 = parseInt(channelids[1]) - 1;
	}
}

function getchannellayer_2(name, css, content, area, row, column) {
	var channelids = area.split("_");
	var locationNum = 1;
	var tempchannel0 = parseInt(channelids[0]);
	var tempchannel1 = parseInt(channelids[1]);
	// ***保存元素从第二个开始*/
	var element;
	columtime = 2;
	$("#thenName").val(name);
	for (rowtime = 0; rowtime < row; rowtime++) {
		for (columtime; columtime <= column; columtime++) {
			locationNum++;
			tempchannel1 = tempchannel1 + 1;
			var temp = new Array();
			temp[0] = css + "@" + content + "@" + tempchannel0 + "_"
					+ tempchannel1 + "@" + locationNum + "@" + row + "@"
					+ column;
			var jsonString = JSON.stringify(temp);
			$("#thenlayout").val(jsonString);
			$.ajax({
			//url : 'http://localhost:8081/layout/saveLayout/',
			  url : 'http://'+ip+':'+port+'/layout/saveLayout',
				data: $('#layoutFormThen').serialize(),
				type : 'POST',
				success : function() {
				}
			})
		}
		columtime = 1;
		tempchannel0++;
		tempchannel1 = parseInt(channelids[1]) - 1;
	}
}

function changecssvalue() {
	if (magnetstatus == 1) {
		checkval();
	}
	getcssvalue();
	getchannelarea();
	getrowcolumn();
}

function movedivs(direction, act) {
	var finalval = null;
	var cssvalue = $("#edit").css(direction);
	var action = direction + act;
	var temp = cssvalue.replace("px", "");
	if (act == "b") {
		finalval = parseInt(temp) + 1;
	} else {
		finalval = parseInt(temp) - 1;
	}
	$("#edit").css(direction, finalval + "px");
	getcssvalue();
	if (magnetstatus == 1) {
		checkval();
	}
	getcssvalue();
	getchannelarea();
	getrowcolumn();
}

function checkval() {
	var top = $("#distop").val();
	var height = $("#disheight").val();
	var width = $("#diswidth").val();
	var left = $("#disleft").val();
	var widthval = parseInt(width.replace("px", ""));
	var topval = parseInt(top.replace("px", ""));
	var heightval = parseInt(height.replace("px", ""));
	var leftval = parseInt(left.replace("px", ""));
	if (widthval > 960) {
		widthval = 960;
	}
	if (heightval > 540) {
		heightval = 540;
		$("#edit .dialogbody").css("height", "540px");
	}
	if (topval < 40) {
		topval = 40;
	}
	if (leftval < 0) {
		leftval = 0;
	}
	if (widthval + leftval > 960) {
		leftval = 960 - widthval;
	}
	if (heightval + topval > 580) {
		topval = 580 - heightval;
	}
	$("#distop").val(topval);
	$("#disheight").val(heightval);
	$("#disleft").val(leftval);
	$("#diswidth").val(widthval);
	$("#edit").css("top", topval + "px");
	$("#edit").css("height", heightval + "px");
	$("#edit .dialogbody").css("height", heightval);
	$("#edit").css("width", widthval + "px");
	$("#edit").css("left", leftval + "px");
}
