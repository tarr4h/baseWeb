<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/comm/header.jsp"/>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- kakao script  -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>



<label for="bTitle">연락처를 입력하세요</label>


<input type="text" name="" id="bTitle" />
<input type="button" value="문의 접수" onclick="regBoard();"/>
<br />
<br />
<button id="kakaoLogin" onclick="kakaoLogin();">카카오로그인</button>
<br />
<button id="kakao" onclick="kakaoRequest();">카카오 메시지 전송</button>
<br />
<br />
<br />
<button id="kakaoFr" onclick="getKakaoFriends()">친구목록</button>

<script>
	$(() => {
		Kakao.init('a77e005ce8027e5f3a8ae1b650cc6e09');
		console.log(Kakao.isInitialized());
		kakaoLogin();
	})
	
	function getKakaoFriends(){
		Kakao.API.request({
			url : '/v1/api/talk/friends',
			success : function(res){
				console.log(res);
			}
		})
	}
	//jh67952 naver
	//rmstkd12!
	//8601!
	
	function kakaoLogin(){
		Kakao.Auth.login({
			scope: 'talk_message, friends',
			success: function(res){
				var token = Kakao.Auth.getAccessToken();
				console.log(token);
				Kakao.Auth.setAccessToken(token);
				Kakao.API.request({
					url: '/v2/user/me',
					success : function(res){
						console.log(res);
					},
					fail : function(err) {
						console.log(err)
					}
				})
			},
			fail : function(err){
				console.log(err)
			}
		})
	}
	
	function kakaoRequest(){
		Kakao.API.request({
			  url: '/v1/api/talk/friends/message/default/send',
			  data: {
				receiver_uuids: ["aFFoUWNSYFBmSnhNfkd1RHRAcl5oUWZTY1oB"],
			    template_object: {
			      object_type: 'feed',
			      content: {
			        title: 'test',
			        description: 'test',
			        image_url:
			          'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
			        link: {
			          web_url: 'https://developers.kakao.com',
			          mobile_web_url: 'https://developers.kakao.com',
			        },
			      },
			      
			      button_title: '바로 확인',
			    },
			  },
			  success: function(response) {
			    console.log(response);
			  },
			  fail: function(error) {
			    console.log(error);
			  },
			});
	}


	function regBoard(){
		var title = $("#bTitle").val();
		console.log(title);
		
		$.ajax({
			url: '${pageContext.request.contextPath}/board/regBoard',
			method: 'POST',
			data:{
				title : title
			},
			success(res){
				console.log(res)
			},
			error: console.log
		})
	}

</script>


















<jsp:include page="/WEB-INF/views/comm/footer.jsp"/>