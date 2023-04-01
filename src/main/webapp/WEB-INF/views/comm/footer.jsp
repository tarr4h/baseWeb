<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
    .phDirect{
        position: fixed;
        bottom: 0;
        width: 100%;
        display: flex;
        justify-content: flex-end;
        display: none;
        margin-top:0.3em;
        padding-bottom: 1em;
    }
    .phSection{
        font-size: 13px;
        width: 13%;
        height: 2em;
        display: inline-block;
        position: relative;
    }
    .footer-icon img{
        height: 2em;
        filter: invert(100%) sepia(100%) saturate(0%) hue-rotate(269deg) brightness(101%) contrast(104%);
    }

    /* companyInfo */
    .companyInfo{
        width: 100%;
        background-color: black;
        padding: 2em;
        display: flex;
        justify-content: space-between;
    }
    .infoTxt{
        width: 80%;
    }
    .compTxt{
        display: block;
        color: white;
        font-size: 0.7em;
        text-decoration: none;
    }
    .compTit{
        font-size : 1em;
        margin-bottom: 0.3em;
        font-weight: 700;
    }
    .qnaBtn{
        color: white;
        background-color: inherit;
        border: 1px solid white;
        width: 7em;
        height: 1.8em;
        font-size: 0.8em;
    }

</style>

</section>

<div class="phDirect">
    <a href="" class="phSection tel">
        <div class="footer-icon">
            <img src="<c:url value='/static/icon/call-icon.png' />" alt=""/>
        </div>
    </a>
    <a href="" class="phSection sms">
        <div class="footer-icon">
            <img src="<c:url value='/static/icon/sms-icon.png' />" alt=""/>
        </div>
    </a>
</div>

<div class="companyInfo">
    <div class="infoTxt">
        <span class="compTxt compTit">Hansol C&C Corporation</span>
        <span class="compTxt">사업자번호 : 12341234</span>
        <span class="compTxt">대표 : 박종훈</span>
        <span class="compTxt">주소 : 경기 파주시 월롱산로 49-9 파주야동산업단지</span>
        <span class="compTxt" style="margin-top:0.5em;">copyrightⓒ2022 All rights reserved by tarr4h</span>
    </div>
    <button class="qnaBtn" onclick="locateQna();">문의하기</button>
</div>


<script>
    getPh();

    function getPh(){
        $.ajax({
            url : "<c:url value='/setting/getPh'/>",
            success(res){
                $.each(res, (i, e) => {
                    $(`.phSection.\${e.target}`).prop('href', `\${e.target}:\${e.ph}`);
                });
            },
            error: console.log
        })
    }

	function locateQna(){
        location.href = "<c:url value='/board/page?param=board/qnaBoard'/>";
    }
</script>