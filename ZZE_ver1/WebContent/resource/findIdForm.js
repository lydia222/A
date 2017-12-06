$(function(){
	$("button").click(function(){
		var name = $("input").eq(0).val();
		var email= $("input").eq(1).val();
		var url="Controller.do?command=findId&name="+name+"&email="+email;
		httpRequest = new XMLHttpRequest();
		httpRequest.onreadystatechange = callback;
		httpRequest.open("GET", url, true);
		httpRequest.send();
	});
});

var httpRequest = null;

function callback(){
	$(".result").empty();
	$(".result").append("확인 중입니다...");
	if(httpRequest.readyState == 4){
		if(httpRequest.status == 200){
			if(httpRequest.responseText.trim() == "ok"){
				$(".result").empty();
				$(".result").append("<div class='ok'>이메일로 아이디를 발송하였습니다!</div>");
			}else{
				$(".result").empty();
				$(".result").append("<div class='alert'>이름/이메일을 다시 확인해주세요!</div>");
			}
		}
	}
}