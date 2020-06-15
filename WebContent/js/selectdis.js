//        var selectcity=document.getElementById("selectcity");
//        ;
//        console.log(selectcity);
$('#td1').val();
document.getElementById("districtavg").innerHTML = $('#td1').text();

var rowCount = $('#table1 tr').length-1;
console.log("rowCount="+rowCount);
$('#tblength1').html("交易"+rowCount+"件");


//$(function() {
	// 抓字的function
	$('#select_city').click(function() {
		let value1 = $(this).val();
		$("#area").text(value1);
		console.log("value1="+value1); 

	})

	
	
//})

