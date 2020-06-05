$(function() {
	// 抓字的function
	$('.dataTables_filter input').keyup(function() {
		let value1 = $(this).val();
		$("#searchword").text(value1);
		console.log("value1=" + value1);
	})

	// 選年的function
	$('#select_year').change(function() {
		let value2 = $(this).val();
		console.log("value2=" + value2);
	})
	
	$('#linebot img').hover(function() {
					this.src = "css/css_13/pics_13_/line-meG.png";
				}, function() {
					this.src = "css/css_13/pics_13_/line-meBW.png";
				});
	
	$("#linebot").click(
			
			function() {
				var src="css/css_13/pics_13_/好家在QR.png";
				$("#linebot img").empty().attr("src", src).attr("width", 300);
			}
	);
	
})

