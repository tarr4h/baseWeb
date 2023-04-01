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
  <form action="${pageContext.request.contextPath}/setting/adminLogin" method="post" id="adminLoginFrm">
  <span id="tit">번호 설정</span>
    <input type="password" name="pwd" id="pwd" placeholder="input password">
    <button id="btn">확인</button>
  </form>
</div>


<script>
  <c:if test="${msg != null}">
    $(() => {
      alert('${msg}');
    });
  </c:if>

  $('#btn').on('click', function(e){
    e.preventDefault();
    if($('#pwd').val() === ''){
      alert('비밀번호를 입력해주세요.');
    } else{
      $('#adminLoginFrm').submit();
    };
  });

</script>



<jsp:include page="/WEB-INF/views/comm/footer.jsp"/>