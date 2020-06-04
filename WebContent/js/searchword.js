
$(function() {
	// 抓字的function
	$('.dataTables_filter input').keyup(function() {
		let value1 = $(this).val();
		$("#searchword").text(value1);
		console.log("value1="+value1); 

	})

	// 選年的function
	$('#select_year').change(function() {
		let value2 = $(this).val();
		console.log("value2="+value2);
	})

//	// 字的function
//	$('.dataTables_filter input').keyup(function() {
//		let value3 = $("#table1_info").textContent;
//		console.log("value3="+value3);
//	})
})
