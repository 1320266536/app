$().ready(function() {
	validateRule();
});

$.validator.setDefaults({
	submitHandler : function() {
		save();
	}
});
function save() {
	$.ajax({
		cache : true,
		type : "POST",
		url : "/app/meeting/save",
		data : $('#signupForm').serialize(),// 你的formid
		async : false,
		error : function(request) {
			parent.layer.alert("Connection error");
		},
		success : function(data) {
			if (data.code == 0) {
				parent.showImg(data.msg)
				parent.reLoad();
				var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
				parent.layer.close(index);
				// $("button[type='submit']").attr("disabled", true);
			} else {
				parent.layer.alert(data.msg)
			}

		}
	});

}


function validateRule() {
	var icon = "<i class='fa fa-times-circle'></i> ";
	$("#signupForm").validate({
		rules : {
			name : {
				required : true
			}
		},
		messages : {
			name : {
				required : icon + "请输入姓名"
			}
		}
	})
}





//初始化地图对象，加载地图
var map = new BMap.Map("container");
map.centerAndZoom("北京", 11);      // 初始化地图,用城市名设置地图中心点
map.enableInertialDragging();
map.enableContinuousZoom();

function changeCity(city) {
	map = new BMap.Map("container");
	map.centerAndZoom(city, 11);      // 初始化地图,用城市名设置地图中心点
	map.enableInertialDragging();
	map.enableContinuousZoom();
}

function changeMapStyle(style) {
	map.setMapStyle({style: style});

}

// 百度地图API功能
function G(id) {
	return document.getElementById(id);
}

var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
	{
		"input": "adress"
		, "location": map
	});
ac.addEventListener("onhighlight", function (e) {  //鼠标放在下拉列表上的事件
	var str = "";
	var _value = e.fromitem.value;
	var value = "";
	if (e.fromitem.index > -1) {
		value = _value.province + _value.city + _value.district + _value.street + _value.business;
	}
	str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
	value = "";
	if (e.toitem.index > -1) {
		_value = e.toitem.value;
		value = _value.province + _value.city + _value.district + _value.street + _value.business;
	}
	str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
	G("searchResultPanel").innerHTML = str;
});

var myValue;
ac.addEventListener("onconfirm", function (e) {    //鼠标点击下拉列表后的事件
	var _value = e.item.value;
	myValue = _value.province + _value.city + _value.district + _value.street + _value.business;
	G("searchResultPanel").innerHTML = "onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
	setPlace();
});

function setPlace() {
	map.clearOverlays();    //清除地图上所有覆盖物
	function myFun() {
		var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
		$("#coordinates").val(pp.lng + "," + pp.lat);
		map.centerAndZoom(pp, 18);
		map.addOverlay(new BMap.Marker(pp));    //添加标注
	}

	var local = new BMap.LocalSearch(map, { //智能搜索
		onSearchComplete: myFun
	});
	local.search(myValue);
}