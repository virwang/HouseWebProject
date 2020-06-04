console.log("come out！");
$(function() {
	var searchword = document.getElementById("searchword"); // 抓
	var select_year = document.getElementById("select_year"); // 抓
//	var districtavg= document.getElementById("districtavg");// 抓
	var tblength = document.getElementById("tblength"); // 放
	var upricep = document.getElementById("upricep"); // 放

	// 抓搜尋的字串值
	$('.dataTables_filter input').keyup(function() {
		let value1 = $(this).val();
		console.log(".dataTables_filter input=" + value1); 
		var xhr1 = new XMLHttpRequest();
		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				console.log("xhr1="+xhr1);
				tblength.innerHTML = xhr1.responseText;
				upricep.innerHTML = xhr1.responseText;
			}
		};
		xhr1.open("GET", "/TotalBought.do", true);
		xhr1.send();
	})
	// 抓年分
	$('#select_year').change(function() {
		let value2 = $(this).val();
		console.log("select_year=" + value2); 
		var xhr2 = new XMLHttpRequest();
		xhr2.onreadystatechange = function() {
			if (xhr2.readyState == 4 && xhr2.status == 200) {
				tblength.innerHTML = xhr2.responseText;
				upricep.innerHTML = xhr2.responseText;
			}
		};
		xhr2.open("GET", "/TotalBought.do", true);
		xhr2.send();
	})

})

/*--	考慮要不要連上面都AJAX	--*/
// $('#select_city').change(function() {
// let value3 = $(this).val();
// console.log("select_city=" + value3); // <-- the value
// var xhr2 = new XMLHttpRequest();
// xhr1.onreadystatechange = function() {
// if (xhr1.readyState == 4 && xhr.status == 200) {
// tblength.innerHTML = xhr1.responseText;
// upricep.innerHTML = xhr1.responseText;
// }
// };
// xhr2.open("POST", "/TotalBought.do", true);
// xhr2.send();
// })
//	
// $('#selectcity').change(function() {
// let value4 = $(this).val();
// console.log("selectcity=" + value4); // <-- the value
// var xhr2 = new XMLHttpRequest();
// xhr1.onreadystatechange = function() {
// if (xhr1.readyState == 4 && xhr.status == 200) {
// tblength.innerHTML = xhr1.responseText;
// upricep.innerHTML = xhr1.responseText;
// }
// };
// xhr2.open("POST", "/TotalBought.do", true);
// xhr2.send();
// })
