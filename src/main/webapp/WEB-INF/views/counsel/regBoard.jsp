<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/comm/header.jsp"/>

<div class="regPage">
    <div class="qna titleArea">
        <div class="key-title">
            <div class="labelBox" style="height: 2em">
                <div class="hdLabel label_bg_semilightBlue"></div>
            </div>
            <h3>문의 등록하기</h3>
        </div>
        <div class="explain">
            <div class="dotBox">
                <div class="listDot"></div>
            </div>
            <span class="explainTxt">관리자 확인 후 피드백이 전송됩니다.</span>
        </div>
        <div class="explain">
            <div class="dotBox">
                <div class="listDot"></div>
            </div>
            <span class="explainTxt">입력하신 연락처는 추후 수정 시 사용</span>
        </div>
        <div class="explain mt-0">
            <div class="dotBox vhd">
                <div class="listDot"></div>
            </div>
            <span class="explainTxt">됩니다. 올바른 번호를 입력해주세요.</span>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/board/regBoard" method="POST" enctype="multipart/form-data">
        <table id="regTable">
            <colgroup>
                <col width="20%">
                <col width="80%">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                        제목
                    </th>
                    <td>
                        <input type="text" name="title" class="frmInput" placeholder="제목을 입력하세요">
                    </td>
                </tr>
                <tr>
                    <th>
                        작성자
                    </th>
                    <td>
                        <input type="text" name="writer" class="frmInput" placeholder="이름을 입력해주세요.">
                    </td>
                </tr>
                <tr>
                    <th>
                        내용
                    </th>
                    <td>
                        <textarea name="content" class="frmTextArea" cols="30" rows="10" placeholder="문의내용을 입력해주세요."></textarea>
                    </td>
                </tr>
                <tr>
                    <th>
                        연락처
                    </th>
                    <td>
                        <input type="text" name="contact" class="frmInput" placeholder="연락받으실 연락처를 입력해주세요." value="">
                    </td>
                </tr>
                <tr>
                    <th>
                        첨부파일
                    </th>
                    <td>
                        <input type="file" class="frmInput fileInput" name="uploadFile" multiple>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="padding:0;">
                        <button class="frmSubmitBtn">제출</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</div>

<script>
    $(".frmSubmitBtn").on('click', (e) => {
        if(checkNull() == false){
            e.preventDefault();
        } else {
            $(e).unbind().submit();
        }
    })

    function checkNull(){
        console.log('contact length : ', $('input[name=contact]').val().length);
        if($('input[name=title]').val() == null || $('input[name=title]').val() == ''){
            alert('제목을 입력해주세요');
            $('input[name=title]').focus();
            return false;
        }
        if($('input[name=writer]').val() == null || $('input[name=writer]').val() == ''){
            alert('작성자를 입력해주세요');
            $('input[name=writer]').focus();
            return false;
        }
        if($('textarea[name=content]').val() == null || $('textarea[name=content]').val() == ''){
            alert('내용을 입력해주세요');
            $('textarea[name=content]').focus();
            return false;
        }
        if($('input[name=contact]').val() == '' || $('input[name=contact]').val() == null){
            alert('연락처를 입력해주세요');
            $('input[name=contact]').focus();
            return false;
        }
        if($('input[name=contact]').val().length != 11){
            alert('연락처 11자리를 정상적으로 입력해주세요.');
            $('input[name=contact]').focus();
            return false;
        }

        return true;
    }
</script>

<jsp:include page="/WEB-INF/views/comm/footer.jsp"/>