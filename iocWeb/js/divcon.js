$(document).keypress(function(e) {
	switch (e.which) {
	case 97:
		movedivs("left", "a");
		break;
	case 115:
		movedivs("top", "b");
		break;
	case 100:
		movedivs("left", "b");
		break;
	case 119:
		movedivs("top", "a");
		break;
	}
});

function trim(str){ //删除左右两端的空格
    return str.replace(/(^\s*)|(\s*$)/g, "");
}
function ltrim(str){ //删除左边的空格
    return str.replace(/(^\s*)/g,"");
}
function rtrim(str){ //删除右边的空格
    return str.replace(/(\s*$)/g,"");
}

function getstylevalue(arrays){
	var temp=arrays.split(';');
	var attrlist = new Array();
	for(var x=0;x<temp.length-1;x++){
		var finaldata=temp[x].split(':');
		if(trim(finaldata[0])=="top"){
			attrlist[0]=trim(finaldata[1]);
		}
		if(trim(finaldata[0])=="height"){
			attrlist[1]=trim(finaldata[1]);
		}
		if(trim(finaldata[0])=="width"){
			attrlist[2]=trim(finaldata[1]);
		}
		if(trim(finaldata[0])=="left"){
			attrlist[3]=trim(finaldata[1]);
		}
	}
	return attrlist;
}


function startmagnet(){
	magnetstatus=1;
}

function stopmagnet(){
	magnetstatus=0;
}