<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/comm/header.jsp"/>

<div class="content">
    <div class="keyVisual">
        <div class="key-title">
            <div class="labelBox">
                <div class="hdLabel label_bg_semilightBlue"></div>
            </div>
            <h1>서비스 안내</h1>
        </div>
        <div class="key-img">
            <img src="<c:url value='/static/img/img1/hands.png' />" alt="">
        </div>
        <div class="key-text color-gray1">
            <p>
                신뢰할 수 있는 요양원 세탁 파트너로써, 깨끗하고 위생적인 환경을 제공합니다.
            </p>
        </div>
    </div>
    
    <div class="pageContent">
        <!-- content1 -->
        <div class="page-content pc-flex pg-sm" id="content1">
            <div class="contentImg">
                <img src="<c:url value='/static/img/img1/laundry.png' />" alt="">
            </div>
            <div class="content-text">
                <div class="contentTit">
                    <span>무엇을 취급하나요?</span>
                </div>
                <p>
                    저희 한솔C&C는 요양시설만을 취급하며
                </p>
                <p>
                    보다 전문적인 서비스를 제공합니다.
                </p>
                <button class="descriptBtn color-black"
                        onclick="what2care();"
                >서비스 제공 품목 상세보기</button>
            </div>
        </div>

        <!-- content2 -->
        <div class="page-content pc-flex-rev pg-sm color-white bg-black" id="content2">
            <div class="contentImg">
                <img src="<c:url value='/static/img/img1/van.png' />" alt="">
            </div>
            <div class="content-text">
                <div class="contentTit">
                    <span>배송가능지역</span>
                </div>
                <p>
                    - 파주시, 김포시, 고양시<br/>
                    - 양주시, 의정부시<br/>
                    - 인천광역시
                </p>
                <p>
                    * 그 외 지역은 문의 부탁 드립니다.
                </p>
<%--                <button class="descriptBtn bg-black color-white bd-white"--%>
<%--                        onclick="openPop()"--%>
<%--                >배송 가능지역 보기</button>--%>
            </div>
        </div>

        <!-- content3 -->
        <div class="page-content pc-flex pg-sm" id="content3">
            <div class="contentImg">
                <img src="<c:url value='/static/img/img1/arrow.png' />" alt="">
            </div>
            <div class="content-text">
                <div class="contentTit">
                    <span>이렇게 문의하세요</span>
                </div>
                <p>
                    보다 많은 문의를 받고 싶었습니다.
                </p>
                <p class="mg-0">
                    다양한 채널을 열어두었습니다.
                </p>
                <p>
                    하단 버튼을 통해 전화 또는 문의글 작성이 가능합니다.
                </p>
                <button class="descriptBtn color-black"
                        onclick="locateQna()"
                >문의하러 가기</button>
            </div>
        </div>
    </div>
</div>

<script>
    let windowHeight = $(window).height();

    function tgContent(id){
        let $target = $(`#\${id}`);
        let $targetDp = $target.css('display');
        if($targetDp == 'none'){
            $target.css('display', 'flex');
            scrollBottom(id);
        } else {
            $target.hide();
        }
    }

    function openPop(){
        let url = '${pageContext.request.contextPath}/board/deliveryPop';
        window.open(url, '배송가능지역', "width=600,height=600, top=250, left=400, right=400");
    }

    function locateQna(){
        location.href = "<c:url value='/board/page?param=board/qnaBoard'/>";
    }

    function what2care(){
        alert('준비중입니다.\n자세한 내용은 문의를 통해 부탁드립니다.');
    }

    function scrollBottom(id){
        let targetHeight = $(`#\${id}`).height();
        let scrollTop = $('html').scrollTop();
        let scrollLocation = scrollTop + targetHeight;
        
        if(scrollTop > windowHeight/10){
            scrollLocation += windowHeight * 0.08;
        }
        console.log('scrollLocation : ', scrollLocation);
        
        $('html, body').animate({scrollTop : scrollLocation}, 100);
    }

</script>
<jsp:include page="/WEB-INF/views/comm/footer.jsp"/>