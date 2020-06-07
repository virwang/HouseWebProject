console.log("come out！");

$(function() {
	$("#searchword").on('DOMSubtreeModified', function() {
		year();
	});
	
	// 選年的function
	$('#select_year').change(function() {
		let select_year = $(this).val();
		console.log("value2=" + select_year);
		showyear(select_year);
	})

	showdetail()

	close()
	
});

function showdetail() {
	$("#table1 tbody tr").click(function() {
		var str1 = $(this)
		var id = $(":first-child", str1).text();
		console.log("id=" + id);
		$("#light").toggle();
		$("#fade").toggle();
		showhousedetail(id);
	});
}

function map(loc) {
	const s = loc;
	const addr = s.slice(0, s.lastIndexOf("~"));
	var addriframe = "https://www.google.com/maps/embed/v1/place?key=AIzaSyA4c-7grG5oe2iPX13lXjZaeaZytTFDp70&q="
			+ addr;
	console.log("addriframe=" + addriframe);
	$("#map").attr("src", addriframe).attr("width", 200).attr("hight", 300)
			.attr("framborder", 0).attr("border", 1);
}

function close() {
	$(document).on('keydown', function(e) {
		if (e.keyCode === 27) { // ESC
			$("#light").hide();
			$("#fade").hide();
		}
	});
}

