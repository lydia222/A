
$(function(){
	var url = "https://openapi.gg.go.kr/HotSpringStatus?KEY=58ce374c6476493894a0dd36d9f6a3a9&Type=json&pIndex=1&pSize=100";
	$.getJSON(url, function(data){
		$.each(data.HotSpringStatus[1], function(key, val){
				if(key=="row"){
					var list = val;
					for(var i = 0; i < list.length; i++){
						var str = list[i];
						$("tbody").append(
								"<tr><td>"+str.HOTSPA_NM+
								"</td><td>"+str.REFINE_LOTNO_ADDR+
								"</td></tr>"
						)
					}
				}
		});
	});
});
