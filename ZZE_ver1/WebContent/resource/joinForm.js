var pwOk = false;
var emailOk = false;

//비밀번호 체크
function pwChk(pw1, pw2){
	if(pw1.val().length < 5 || pw2.val().length < 5){
		pwOk = false;
		$(".pwChk").empty();
		$(".pwChk").append("<div class='alert'>비밀번호는 5자 이상이어야합니다.</div>");
	}else if (pw1.val() == pw2.val()){
		pwOk = true;
		$(".pwChk").empty();
		$(".pwChk").append("<div class='ok'>비밀번호가 서로 일치합니다.</div>");
	}else{
		pwOk = false;
		$(".pwChk").empty();
		$(".pwChk").append("<div class='alert'>비밀번호를 서로 일치시켜주세요.</div>");
	}
}

$(function(){
	//비밀번호 체크
	var pw1 = $("input").eq(1);
	var pw2 = $("input").eq(2);
	
	pw1.focusout(function(){
		pwChk(pw1, pw2);
	});
	
	pw2.focusout(function(){
		pwChk(pw1, pw2);
	});
	
	
	//아이콘 클릭
	$(".face").click(function(){
		$(".face").each(function(){
		    $(this).css("border", "");
		});
		$(this).css("border", "3px solid skyblue");
		$("input[name='face']").val($(this).attr("src"));
	});
	
	//아이디 체크
	$("input").eq(0).focusout(function(){
		//글자수 5글자 미만시 경고
		if($(this).val().length < 5){
			$(".idChk").empty();
			$(".idChk").append("<div class='alert'>아이디는 5글자 이상이어야 합니다.</div>");
			$(this).val("");
		} else {
			//id가 소문자 & 숫자로 이루어졌는지 check
			var name = $(this).val();
			var ok = true;
			for(var i=0; i<name.length; i++){
				var code = name.charCodeAt(i);
				if( !((97<=code && code<=122) || (48<=code && code <= 57)) ){
					ok=false;
					break;
				}
			}
			
			if(ok){
				//id가 소문자 & 숫자이면 id 중복체크
				var url = "Controller.do?command=idCheck&id="+$(this).val();
				httpRequest = new XMLHttpRequest();
				httpRequest.onreadystatechange = callbackId;
				httpRequest.open("GET", url, true);
				httpRequest.send();
			}else{
				//id가 소문자 & 숫자 아닐 때
				$(".idChk").empty();
				$(".idChk").append("<div class='alert'>아이디는 소문자/숫자로 이루어져야합니다.</div>");
				$(this).val("");
			}
			
		}
	});
	
	//이메일 중복 확인
	$("input").eq(7).focusout(function(){
		if($(this).val().indexOf("@")>0){
			var url = "Controller.do?command=emailCheck&email="+$(this).val();
			httpRequest = new XMLHttpRequest();
			httpRequest.onreadystatechange = callbackEmail;
			httpRequest.open("GET", url, true);
			httpRequest.send();
		}
	});
	
	//제출 시
	$("form").submit(function(){
		if(pwOk && emailOk){
			var tel = "";
			$(".tel").each(function(){
				tel += $(this).val();
			});
			$("input").eq(11).val(tel);
		}else if(!pwOk){
			alert("비밀번호를 확인해주세요!");
		}else if(!emailOk){
			alert("이메일을 확인해주세요!");
		}else{
			alert("비밀번호와 이메일을 확인해주세요!");
		}
		
		
		return pwOk && emailOk;
	});
});

var httpRequest = null;

//id 중복체크 콜백
function callbackId(){
	if(httpRequest.readyState == 4){
		if(httpRequest.status == 200){
			if(httpRequest.responseText.trim() == "ok"){
				$(".idChk").empty();
				$(".idChk").append("<div class='ok'>사용가능 합니다 ^_^</div>");
			}else{
				$(".idChk").empty();
				$(".idChk").append("<div class='alert'>아이디가 중복됩니다.</div>");
				$("input").eq(0).val("");
			}
		}
	}
}

//email 중복체크 콜백
function callbackEmail(){
	if(httpRequest.readyState == 4){
		if(httpRequest.status == 200){
			if(httpRequest.responseText.trim() == "ok"){
				$(".emailChk").empty();
				$(".emailChk").append("<div class='ok'>사용가능한 이메일입니다.</div>");
				emailOk = true;
			}else{
				emailOk = false;
				$(".emailChk").empty();
				$(".emailChk").append("<div class='alert'>이메일이 이미 존재합니다.</div>");
			}
		}
	}
}
