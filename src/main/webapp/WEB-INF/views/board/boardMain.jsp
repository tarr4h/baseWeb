<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/comm/header.jsp"/>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- kakaomap api -->
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a77e005ce8027e5f3a8ae1b650cc6e09&libraries=services"></script>


<div class="content">
    <div class="keyVisual">
        <div class="key-title">
            <div class="labelBox">
                <div class="hdLabel label_bg_semilightBlue"></div>
            </div>
            <h1>오시는길</h1>
        </div>
        <div id="map"></div>
        <div class="key-text color-gray1">
            <p>* 경기 파주시 월롱산로 49-52</p>
            <img class="mapIco" onclick="toTmap()" src="<c:url value='/static/img/tmap_ico.png' />" alt="">
            <img class="mapIco" onclick="toNaverMap()" src="<c:url value='/static/img/nmap_ico.png' />" alt="">
            <img class="mapIco" onclick="toKakaoMap()" src="<c:url value='/static/img/kmap_ico.png' />" alt="">
        </div>
    </div>
</div>


<script>
    const lat = '37.7788319692414';
    const lng = '126.76319773548582';
    $(() => {

        let mapContainer = document.getElementById('map'),
            mapOption = {
                center : new kakao.maps.LatLng(lat, lng),
                level : 3
            };

        let map = new kakao.maps.Map(mapContainer, mapOption);


        let markerPosition = new kakao.maps.LatLng(lat, lng);
        marker = new kakao.maps.Marker({
            position: markerPosition,
        });

        let iwContent = '<div class="iwContent">한솔C&C</div>';
        let customOverlay = new kakao.maps.CustomOverlay({
            position : markerPosition,
            content : iwContent,
            xAnchor : 0.51,
            yAnchor : 2.6
        });

        marker.setMap(map);
        customOverlay.setMap(map);
    });

    function toTmap(){
        url = `tmap://route?goalname=한솔씨앤씨&goalx=\${lng}&goaly=\${lat}`;
        location.href = url;
    }

    function toNaverMap(){
        url = `nmap://place?lat=\${lat}&lng=\${lng}&name=한솔씨앤씨`;
        location.href = url;
    }

    function toKakaoMap(){
        url = `kakaomap://look?q=한솔씨앤씨&p=\${lat},\${lng}`;
        location.href = url;
    }
</script>












<jsp:include page="/WEB-INF/views/comm/footer.jsp"/>