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
				<span class="blSp tit">한솔만의 특별함</span>
			</div>
			<div class="content-text wd-lg">
				<span class="blSp cont">
					- 저는 세탁 장인입니다.
				</span>						
				<span class="blSp cont">
					- 우주는 넓고 한솔의 기술은 끝이없다.
				</span>
				<span class="blSp cont">
					- 특별한 날에는 흰색 와이셔츠를 입어보세요
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
				<span class="blSp tit">믿음에 증명합니다.</span>
			</div>
			<div class="content-text wd-lg">
				<span class="blSp cont">
					- 믿음, 소망, 사랑 그 중 제일은 믿음입니다.
				</span>				
				<span class="blSp cont">
					- 과연 진짜일까요?
				</span>
				<span class="blSp cont">
					- 증명해 보이겠습니다.
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
				<span class="blSp tit">효율이 증대됩니다.</span>
			</div>
			<div class="content-text wd-lg">
				<span class="blSp cont">
					- 가파른 산비탈을 오르는 호랑이
				</span>					
				<span class="blSp cont">
					- 사자는 오르지 못합니다.
				</span>
				<span class="blSp cont">
					- 이것은 사실입니다.(아마도)
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

