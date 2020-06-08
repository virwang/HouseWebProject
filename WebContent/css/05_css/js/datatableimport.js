		$(function() {
			$("#table1").dataTable(
					{
						"iDisplayLength" : 10,
						"aLengthMenu" : [ [ 10, 25, 50, 100, -1 ],
								[ 10, 25, 50, 100, "全部" ] ]
					});

		});
