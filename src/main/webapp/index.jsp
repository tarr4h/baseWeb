<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/comm/header.jsp"/>

<!-- key visual -->
<div class="mobile">
	<div class="keyImg">
		<div class="keyImgTxtBox">
			<span class="keyImgTxt">
				WASH, DRY, DELIVER
			</span>
		</div>
	</div>
	<div class="contentBox">
	<div class="content bg-black1">
		<div class="innerContent">
			<div class="innerContent header">
				<div class="content-icon">
					<img src="<c:url value='/static/icon/index/color/idea.png' />" alt="" style="width:100%;"/>
				</div>
				<span class="blSp tit">요양시설 세탁전문</span>
			</div>
			<div class="content-text wd-lg">
				<span class="blSp cont">
					- 침구류 및 의류 전문세탁
				</span>						
				<span class="blSp cont">
					- 전문화된 세탁시설 및 공정
				</span>
				<span class="blSp cont">
					- 다년간의 노하우
				</span>
			</div>
		</div>
	</div>
	<div class="content bg-darkgreen1">
		<div class="innerContent">
			<div class="innerContent header">
				<div class="content-icon">
					<img src="<c:url value='/static/icon/index/color/trust.png' />" alt="" style="width:100%;"/>
				</div>
				<span class="blSp tit">한솔C&C만의 특별함</span>
			</div>
			<div class="content-text wd-lg">
				<span class="blSp cont">
					- 자극적이지 않은 세제사용
				</span>				
				<span class="blSp cont">
					- 섬유 유해성분 제거에 탁월한 고온살균처리
				</span>
				<span class="blSp cont">
					- 세탁물 수거에서 배송까지 특별한 서비스
				</span>
			</div>
		</div>
	</div>
	<div class="content bg-lightblue1">
		<div class="innerContent">
			<div class="innerContent header">
				<div class="content-icon">
					<img src="<c:url value='/static/icon/index/color/growth.png' />" alt="" style="width:100%;"/>
				</div>
				<span class="blSp tit">공정 작업단계</span>
			</div>
			<div class="content-text wd-lg">
				<span class="blSp cont">
					1. 세탁물 수거 및 분류
				</span>					
				<span class="blSp cont">
					2. 클리닝 및 고온살균건조
				</span>
				<span class="blSp cont">
					3. 밴딩 및 패킹 후 배송
				</span>
			</div>
		</div>
	</div>
	</div>
</div>
<script>
	let guideChk = 0;
	let windowWidth = $(window).width();
	let windowHeight = $(window).height();

	// scroll evt
	$(window).scroll(function(){
		if(guideChk != 0){
			return false;
		}

		var scrollLocation;
		if(windowWidth > 500){
			scrollLocation = windowHeight;
		} else {
			scrollLocation = windowHeight - (windowHeight * 2 / 30);
		}

		$('html, body').animate({scrollTop : scrollLocation}, 500);

		guideChk = 1;
	});

</script>

<jsp:include page="/WEB-INF/views/comm/footer.jsp"/>

