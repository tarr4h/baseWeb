<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/comm/header.jsp"/>

<style>
    .fileBox{
        height: 5vh;
        padding-bottom: 1.2vh;
        padding-top: 1.5vh;
    }
    .fileBox a{
        padding-left: 1em;
    }
    .fileTit{
        width: 68%;
        display: inline-block;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .fileSize{
        width: 20%;
        display: inline-block;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .fileDelBtn{
        background-color: inherit;
        border:none;
        float:right;
        margin-right: 1vw;
        width: 5%;
        color: red;
    }

    /*web*/
    @media (min-width: 992px) {
        .replyArea{
            width: 80%;
            margin: 1em auto auto;
            font-size: 0.8em;
            border: 1px solid #949494bf;
        }
    }
    /*mob*/
    @media (max-width: 991px){
        .replyArea{
            margin-top: 1em;
            font-size: 0.8em;
            border: 1px solid #949494bf;
        }
    }

    .replyTit{
        border: none;
        border-bottom: 1px solid #3A4454;
        height: 3em;
        padding-left: 1em;
        padding-top: 0.8em;
        background-color: #3A4454;
        color: white;
    }
    .replyContent{
        width: 100%;
        height: 100%;
        border: none;
        padding: 1em;
        resize: none;
        display:block;
    }
    /*web*/
    @media (min-width: 992px) {
        .replySubmitBtn{
            width: 80%;
            height: 3em;
            border: none;
            border-right: 1px solid #949494bf;
            border-left: 1px solid #949494bf;
            border-bottom: 1px solid #949494bf;
            border-radius: 0;
            font-size: 0.7rem;
            color: black;
            margin: auto;
            display: block;
        }
    }
    /*mob*/
    @media (max-width: 991px){
        .replySubmitBtn{
            width: 100%;
            height: 3em;
            border: none;
            border-right: 1px solid #949494bf;
            border-left: 1px solid #949494bf;
            border-bottom: 1px solid #949494bf;
            font-size: 0.7rem;
            color: black;
            border-radius: 0;
        }
    }

</style>

<div class="regPage">
    <div class="qna titleArea">
        <div class="key-title">
            <div class="labelBox" style="height: 2em">
                <div class="hdLabel label_bg_semilightBlue"></div>
            </div>
            <h3>등록 내용</h3>
        </div>
        <div class="explain">
            <div class="dotBox">
                <div class="listDot"></div>
            </div>
            <span class="explainTxt">수정 반영됩니다.</span>
        </div>
    </div>
    <form action='${pageContext.request.contextPath}/board/updateBoard' method="POST" enctype="multipart/form-data">
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
                        <input type="text" name="title" class="frmInput" placeholder="제목을 입력하세요" value="${board.title}">
                    </td>
                </tr>
                <tr>
                    <th>
                        작성자
                    </th>
                    <td>
                        <input type="text" name="writer" class="frmInput" placeholder="이름을 입력해주세요." value="${board.writer}">
                    </td>
                </tr>
                <tr>
                    <th>
                        내용
                    </th>
                    <td>
                        <textarea name="content" class="frmTextArea" cols="30" rows="10" placeholder="문의내용을 입력해주세요.">${board.content}</textarea>
                    </td>
                </tr>
                <tr>
                    <th>
                        연락처
                    </th>
                    <td>
                        <input type="text" name="contact" class="frmInput" placeholder="연락받으실 연락처를 입력해주세요." value="${board.contact}">
                    </td>
                </tr>
                <tr>
                    <th>
                        첨부파일
                    </th>
                    <td>
                        <c:forEach items="${board.fileList}" var="file">
                            <div class="fileBox">
                                <a class="fileTit" href="${pageContext.request.contextPath}/board/downloadFile?rfn=${file.renamed_filename}&seq=${board.seq}" download>${file.original_filename}</a>
                                <a class="fileSize">${Math.ceil(file.filesize/(1000*100)) / 10}MB</a>
                                <input type="button" class="fileDelBtn" value="X" onclick="deleteFile('${board.seq}', '${file.renamed_filename}');">
                            </div>
                        </c:forEach>
                        <c:if test="${auth == false && board.reply.content == null}">
                        <input type="file" class="frmInput fileInput" name="uploadFile" multiple>
                        </c:if>
                    </td>
                </tr>
                <c:if test="${auth == false && board.reply.content == null}">
                <tr>
                    <td colspan="2" style="padding:0;">
                            <button class="frmSubmitBtn">수정하기</button>
                    </td>
                </tr>
                </c:if>
            </tbody>
        </table>

        <input type="hidden" name="seq" value="${board.seq}">
    </form>

        <c:if test="${(auth == false) || (board.reply.content != null)}">
            <div class="replyArea">
                <div class="replyTit">답변</div>
                <textarea name="" class="replyContent" cols="30" rows="5">${board.reply.content != null ? board.reply.content : "답변 대기중입니다."}</textarea>
            </div>
            <c:if test="${auth == true}">
                <input type="button" class="replySubmitBtn" value="sms전송" onclick="sendSms();">
            </c:if>
        </c:if>

        <c:if test="${auth == true && board.reply.content == null}">
            <form action="" id="replyForm">
                <div class="replyArea">
                    <div class="replyTit">답변작성</div>
                    <textarea name="replyContent" class="replyContent" cols="30" rows="5"></textarea>
                    <input type="hidden" name="seq" value="${board.seq}">
                </div>
                <input type="button" class="replySubmitBtn" onclick="reply()" value="답변"/>
            </form>
        </c:if>


</div>

<script>
    function sendSms(){
        location.href = `sms:${board.contact}&body=한솔입니다.%0a문의주신 글에 답변이 작성되었습니다.%0a하단 링크를 통해 바로 확인하실 수 있습니다.%0ahttp://tarr4h0305.cafe24.com/board/showRegistered?seq=${board.seq}`;
    }
    function reply(){
        let formData = $("#replyForm").serialize();
        console.log('formData : ', formData);

        $.ajax({
            url: '${pageContext.request.contextPath}/board/reply',
            data:
                formData
            ,
            success(res){
                if(res == 1){
                    alert('답변 작성 완료');
                    location.reload();
                }
            },
            error: console.log
        })


    }

    function downloadFile(rfn){
        let seq = "${board.seq}";
        $.ajax({
            url : "${pageContext.request.contextPath}/board/downloadFile",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({
                rfn,
                seq
            }),
            success(res){
                console.log(res);
                location.href = res;
            },
            error: console.log
        })
    }

    function deleteFile(seq, rfn){
        if(!confirm('파일을 삭제하시겠습니까?')){
            return false;
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/board/deleteFile",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({
                seq,
                rfn
            }),
            success(res, status, jqXHR){
                if(res > 0){
                    alert('삭제되었습니다.');
                    location.reload();
                } else {
                    alert('삭제에 실패했습니다.');
                }
            },
            error: console.log
        });
    }

    $(".frmSubmitBtn").on('click', (e) => {
        if(checkNull() == false){
            e.preventDefault();
        } else {
            $(e).unbind().submit();
        }
    })

    function checkNull(){
        console.log($('textarea[name=content]').val());

        if($('input[name=title]').val() == null || $('input[name=title]').val() == ''){
            alert('제목을 입력해주세요');
            return false;
        }
        if($('input[name=writer]').val() == null || $('input[name=writer]').val() == ''){
            alert('작성자를 입력해주세요');
            return false;
        }
        if($('textarea[name=content]').val() == null || $('textarea[name=content]').val() == ''){
            alert('내용을 입력해주세요');
            return false;
        }
        if($('input[name=contact]').val() == '' && $('input[name=contact]').val() == null){
            alert('연락처를 입력해주세요');
            return false;
        }

        return true;
    }
</script>

<jsp:include page="/WEB-INF/views/comm/footer.jsp"/>