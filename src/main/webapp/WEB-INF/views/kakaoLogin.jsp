<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
Kakao.init("b29c4bcaabe590d66acd1deef6bf8246"); // 내 어플리케이션 고유 키
// Kakao.Auth.authorize({
// 	  	redirectUri: 'http://localhost:8080/web/main.do'
// 	});

Kakao.Auth.login({
	scope:'profile_nickname, account_email',
	success: function(authObj){
		
// 		Kakao.API.request({
// 		    url: '/v2/user/revoke/scopes',
// 		    scopes: 'profile_nickname, account_email, gender, birthday'
// 		});
		Kakao.API.request({ // 카카오 로그인 후 유저 정보들 받기
			url : '/v2/user/me',
			success : function(res){
				console.log(res);
				
				var id = res.id; // DB 의 primary Key 값 속성 즉 기본키의 식별성
				var email = res.kakao_account.email;
				var name = res.properties.nickname;
// 				var birthday = res.kakao_account.birthday;
// 				var gender = res.kakao_account.gender;
// 						var html = '<br>' + email + '<br>' + name + '<br>' + birthday + '<br>' + gender + '<br>' + age_range;
// 						alert(html);
// 				location.href = "kakaoData.do?name=" + name + "&email=" + email +  "&gender=" + gender;
				
				var form = document.createElement('form'); // 폼객체 생성
	           var objs;
	           objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
	           objs.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	           objs.setAttribute('name', 'name'); // 객체이름
	           objs.setAttribute('value', name); //객체값
	           form.appendChild(objs);
	           var objs1;
	           objs1 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	           objs1.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
	           objs1.setAttribute('name', 'email'); // 객체이름
	           objs1.setAttribute('value', email); //객체값
	           form.appendChild(objs1);
	           form.setAttribute('method', 'post'); //get,post 가능
	           form.setAttribute('action', "kakaoData.do"); //보내는 url
	           document.body.appendChild(form);
	           form.submit();
			}
		}); 
//				console.log(authObj);
		var token = authObj.access_token;
	},
	fail: function(error) {
        alert(JSON.stringify(err));
    }
});
</script>

</body>
</html>