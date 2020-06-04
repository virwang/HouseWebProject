//        var selectcity=document.getElementById("selectcity");
//        ;
//        console.log(selectcity);
$('#selecteddis').val();
document.getElementById("districtavg").innerHTML = $('#selecteddis').text();

//$(function() {
	// 抓字的function
	$('#select_city').click(function() {
		let value1 = $(this).val();
		$("#area").text(value1);
		console.log("value1="+value1); 

	})

//})

