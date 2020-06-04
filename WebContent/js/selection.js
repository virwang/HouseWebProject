district = new Array();
district[0] = [];
district[1] = [ "北投區", "士林區", "內湖區", "中山區", "松山區", "大同區", "萬華區", "中正區", "大安區",
		"信義區", "南港區", "文山區" ]; // 台北市
district[2] = [ "板橋區", "中和區", "新莊區", "土城區", "汐止區", "鶯歌區", "淡水區", "五股區", "林口區",
		"深坑區", "坪林區", "石門區", "萬里區", "雙溪區", "烏來區", "三重區", "永和區", "新店區", "蘆洲區",
		"樹林區", "三峽區", "瑞芳區", "泰山區", "八里區", "石碇區", "三芝區", "金山區", "平溪區", "貢寮區" ]; // 新北市

renew();

function renew(index) {
	for (var i = 0; i < district[index].length; i++) {
		document.myForm.selectcity.options[i] = new Option(district[index][i],
				district[index][i]);
		document.myForm.selectcity.length = district[index].length;
	}
}

