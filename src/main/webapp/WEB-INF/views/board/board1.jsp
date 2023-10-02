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
                <div class="hdLabel label_bg_lightBlue"></div>
            </div>
            <h1>회사소개</h1>
        </div>
        <div class="key-img">
            <img src="<c:url value='/static/img/board1-direct.jpg' />" alt="">
        </div>
        <div class="key-text color-gray1">
            <p>저희 한솔 C&C 홈페이지를 찾아주신 모든 파트너분들께 감사드립니다.</p>
            <p>다년간의 경험에서 발전된 기술, 그로부터 나오는 안전하고 깨끗한 서비스를 제공합니다.</p>
        </div>
    </div>

    <div class="pageContent color-white bg-black1">
        <div class="page-content pg-lg">
            <div class="content-title">
                <h2 class="color-yellow1">SPECIALITY</h2>
                <h3>-</h3>
                <h3>전문화된 공정</h3>
            </div>
            <div class="content-subtitle">
                <p>체계적인 서비스</p>
            </div>
            <div class="content-text pd-0">
                <p>저희 한솔C&C는 다년간의 세탁경험을 토대로, 전문화된 공정과 체계화된 프로세스를 통해 깨끗한 세탁을 약속드립니다.</p>
            </div>
        </div>
        <div class="page-content pg-lg pc-flex-col-rev">
            <div class="content-title">
                <h2 class="color-lightgreen1">PROFESSIONALITY</h2>
                <h3>-</h3>
                <h3>요양시설 전문</h3>
            </div>
            <div class="content-subtitle">
                <p>안전하고 깨끗한 세탁</p>
            </div>
            <div class="content-text pd-0">
                <p>외부환경에 민감한 어르신들의 피부를 고려하여, 자극적이지 않은 세제를 사용함으로써
                    보다 안전한 세탁 서비스를 제공합니다.</p>
            </div>
        </div>
        <div class="page-content pg-lg">
            <div class="content-title">
                <h2 class="color-lightgreen2">POSSIBILITY</h2>
                <h3>-</h3>
                <h3>끊임없는 연구</h3>
            </div>
            <div class="content-subtitle">
                <p>계속해서 깨끗하게</p>
            </div>
            <div class="content-text pd-0">
                <p>보다 나은 서비스를 꾸준히 제공하기 위해 끊임없이 시설개선과 연구를 고민하고, 실행하고 있습니다.</p>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/comm/footer.jsp"/>