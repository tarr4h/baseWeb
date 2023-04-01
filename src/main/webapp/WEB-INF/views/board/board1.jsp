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
            <h1>Intro</h1>
        </div>
        <div class="key-text color-gray1">
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Minima, deleniti tempore possimus excepturi distinctio quos temporibus omnis dolor saepe magni! Suscipit voluptatibus facere impedit non amet natus animi autem consequatur.</p>
        </div>
    </div>

    <div class="pageContent color-white bg-black1">
        <div class="page-content pg-lg">
            <div class="content-title">
                <h2 class="color-yellow1">CONTENT1</h2>
                <h3>-</h3>
                <h3>TITLE</h3>
            </div>
            <div class="content-subtitle">
                <p>content1 subtitle</p>
            </div>
            <div class="content-text pd-0">
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Laudantium, eos? Quis esse itaque atque fugiat facere unde iste omnis dolorem</p>
            </div>
        </div>
        <div class="page-content pg-lg pc-flex-col-rev">
            <div class="content-title">
                <h2 class="color-lightgreen1">CONTENT2</h2>
                <h3>-</h3>
                <h3>TITLE</h3>
            </div>
            <div class="content-subtitle">
                <p>content3 subtitle</p>
            </div>
            <div class="content-text pd-0">
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Laudantium, eos? Quis esse itaque atque fugiat facere unde iste omnis dolorem</p>
            </div>
        </div>
        <div class="page-content pg-lg">
            <div class="content-title">
                <h2 class="color-lightgreen2">CONTENT3</h2>
                <h3>-</h3>
                <h3>TITLE</h3>
            </div>
            <div class="content-subtitle">
                <p>content3 subtitle</p>
            </div>
            <div class="content-text pd-0">
                <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Laudantium, eos? Quis esse itaque atque fugiat facere unde iste omnis dolorem</p>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/comm/footer.jsp"/>