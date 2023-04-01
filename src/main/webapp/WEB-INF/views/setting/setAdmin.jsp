<%--
  Created by IntelliJ IDEA.
  User: taewoohan
  Date: 2022/08/17
  Time: 10:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/comm/header.jsp"/>

<style>
    .pageArea{
        height: 50vh;
        padding-top: 20vh;
        font-size: 20px;
        display: flex;
        align-items: center;
        flex-direction: column;
    }
    #tit{
        display: block;
    }
    #pwd{
        width: 300px;
        height: 40px;
        border-radius: 0;
        border: 1px solid gray;
        font-size: 15px;
        display:block;
    }
    #btn{
        width: 300px;
        border-radius: 0;
        border: 1px solid gray;
        color: white;
        background-color: #041C32;
        font-size: 15px;
        height: 40px;
        display: block;
    }
</style>

<div class="pageArea">
<span id="tit">관리자 설정</span>
<input type="password" name="" id="pwd" placeholder="input password">
<button id="btn" onclick="setAdminSession()">제출</button>
<%--<button onclick="chkAuth()">권한조회</button>--%>
</div>

<script>
    function setAdminSession(){
        $.ajax({
            url: '${pageContext.request.contextPath}/setting/setAdminSession',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                pwd : $('#pwd').val()
            }),
            success(res){
                console.log(res);
                if(res){
                    alert('관리자 설정이 완료되었습니다.\n30분간 유지됩니다.');
                    location.href = "${pageContext.request.contextPath}/";
                } else {
                    alert('잘못된 비밀번호입니다.');
                    $('#pwd').val('').focus();
                }
            },
            error: console.log
        })
    };

    function chkAuth(){
        $.ajax({
            url: '${pageContext.request.contextPath}/setting/chkAuth',
            success(res){
                console.log(res);
            },
            error: console.log
        })
    }
</script>
<jsp:include page="/WEB-INF/views/comm/footer.jsp"/>
