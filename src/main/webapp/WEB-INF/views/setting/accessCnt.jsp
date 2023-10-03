<%--
  @author : 한태우 
  @date: 2023/10/03
  @time: 8:22 PM
  @description :
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
</style>

<div class="pageArea">
    <h1>금일 접속자수</h1><br>
    <h3>${accessCnt}명</h3>
</div>

<jsp:include page="/WEB-INF/views/comm/footer.jsp"/>