'use strict';
// 禁止頁面滾動
var numCount; // 資料總數量
var columnsCounts; // 資料列數量
var pageCount; // 每頁顯示的數量
var pageNum; // 總頁數
var currPageNum; // 當前頁數

// 頁面標籤變數
var blockTable;
var preSpan;
var firstSpan;
var nextSpan;
var lastSpan;
var pageNumSpan;
var currPageSpan;
/** 首頁* */
function firstPage() {
	hide();
	currPageNum = 1;
	showCurrPage(currPageNum);
	showTotalPage();
	for (var i = 1; i < pageCount + 1; i++) {
		blockTable.rows[i].style.display = "";
	}

	firstText();
	preText();
	nextLink();
	lastLink();
}
/** 前一頁* */
function prePage() {
	hide();
	currPageNum--;
	showCurrPage(currPageNum);
	showTotalPage();
	var firstR = firstRow(currPageNum);
	var lastR = lastRow(firstR);
	for (var i = firstR; i < lastR; i++) {
		blockTable.rows[i].style.display = "";
	}

	if (1 == currPageNum) {
		firstText();
		preText();
		nextLink();
		lastLink();
	} else if (pageNum == currPageNum) {
		preLink();
		firstLink();
		nextText();
		lastText();
	} else {
		firstLink();
		preLink();
		nextLink();
		lastLink();
	}

}
/** 下一頁* */
function nextPage() {
	hide();
	currPageNum++;
	showCurrPage(currPageNum);
	showTotalPage();
	var firstR = firstRow(currPageNum);
	var lastR = lastRow(firstR);
	for (var i = firstR; i < lastR; i++) {
		blockTable.rows[i].style.display = "";
	}

	if (1 == currPageNum) {
		firstText();
		preText();
		nextLink();
		lastLink();
	} else if (pageNum == currPageNum) {
		preLink();
		firstLink();
		nextText();
		lastText();
	} else {
		firstLink();
		preLink();
		nextLink();
		lastLink();
	}
}
/** 尾頁* */
function lastPage() {
	hide();
	currPageNum = pageNum;
	showCurrPage(currPageNum);
	showTotalPage();
	var firstR = firstRow(currPageNum);
	for (var i = firstR; i < numCount + 1; i++) {
		blockTable.rows[i].style.display = "";
	}

	firstLink();
	preLink();
	nextText();
	lastText();
}

// 計算將要顯示的頁面的首行和尾行
function firstRow(currPageNum) {
	return pageCount * (currPageNum - 1) + 1;
}

function lastRow(firstRow) {
	var lastRow = firstRow + pageCount;
	if (lastRow > numCount + 1) {
		lastRow = numCount + 1;
	}
	return lastRow;
}

function showCurrPage(cpn) {
	currPageSpan.innerHTML = cpn;
}

function showTotalPage() {
	pageNumSpan.innerHTML = pageNum;
}
// 隱藏所有行
function hide() {
	for (var i = 1; i < numCount + 1; i++) {
		blockTable.rows[i].style.display = "none";
	}
}

// 控制首頁等功能的顯示與不顯示
function firstLink() {
	firstSpan.innerHTML = "<a href='javascript:firstPage();'>1</a>";
}
function firstText() {
	firstSpan.innerHTML = "First";
}

function preLink() {
	preSpan.innerHTML = "<a href='javascript:prePage();'>2</a>";
}
function preText() {
	preSpan.innerHTML = "Pre";
}

function nextLink() {
	nextSpan.innerHTML = "<a href='javascript:nextPage();'>...</a>";
}
function nextText() {
	nextSpan.innerHTML = "Next";
}

function lastLink() {
	lastSpan.innerHTML = "<a href='javascript:lastPage();'>末頁</a>";
}
function lastText() {
	lastSpan.innerHTML = "Last";
}
//(function($) {
//	// 外掛
//	$.extend($, {
//		// 名稱空間
//		sortTable : {
//			sort : function(tableId, Idx) {
//				var table = document.getElementById(tableId);
//				var tbody = table.tBodies[0];
//				var tr = tbody.rows;
//
//				var trValue = new Array();
//				for (var i = 0; i < tr.length; i++) {
//					trValue[i] = tr[i]; // 將表格中各行的資訊儲存在新建的陣列中
//				}
//
//				if (tbody.sortCol == Idx) {
//					trValue.reverse(); // 如果該列已經進行排序過了，則直接對其反序排列
//				} else {
//					// trValue.sort(compareTrs(Idx)); //進行排序
//					trValue.sort(function(tr1, tr2) {
//						var value1 = tr1.cells[Idx].innerHTML;
//						var value2 = tr2.cells[Idx].innerHTML;
//						return value1.localeCompare(value2);
//					});
//				}
//
//				var fragment = document.createDocumentFragment(); // 新建一個程式碼片段，用於儲存排序後的結果
//				for (var i = 0; i < trValue.length; i++) {
//					fragment.appendChild(trValue[i]);
//				}
//				tbody.appendChild(fragment); // 將排序的結果替換掉之前的值
//				tbody.sortCol = Idx;
//			}
//		}
//	});
//}
//)
(jQuery);
