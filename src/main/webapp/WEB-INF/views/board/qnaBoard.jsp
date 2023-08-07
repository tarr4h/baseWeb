<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/comm/header.jsp"/>

<style>
    .boardWrapper{
        width: 100%;
        min-height: 10em;
        padding-top: 10vh;
    }

    #regBoard{
        display: block;
        width: 100%;
        height: 40px;
        margin: 2em auto auto;
        border: 1px solid black;
        font-size:14px;
        background-color: #2E4057;
        font-weight: 400;
        color: white;
    }

    #boardTable{
        width: 100%;
        min-height: 3em;
        text-align: center;
        font-size: 0.7em;
        border-spacing: 0 10px;
        border-collapse: separate;
    }
    #boardTable tbody td{
        height: 4em;
        border: 1px solid #80808066;
        border-radius: 0.8em;
        box-shadow: 0px 1px 1px 1px #8080802b;
    }

    /* board tr */
    .boardRow{
        display: flex;
        justify-content: space-between;
    }
    .bd_cont{
        /*font-size: 0.7rem;*/
        font-size: 0.8rem;
    }
    .bd_title{
        width: 55%;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        border-spacing: 0 10px;
        font-weight: 600;
    }
    .bd_author{
        width: 15%;
    }
    .bd_reg_dt{
        width: 30%;
    }
    .hiddenTr{
        display:none;
    }

    .pageBar{
        width: 30%;
        min-height: 1em;
        margin: 0.5em auto 1em auto;
        display: flex;
        justify-content: center;
    }
    .pageBtn{
        width: 2.3em;
        height: 2em;
        font-size: 0.8em;
        background-color: inherit;
        border: none;
        margin-right: 0.5em;
        color: black;
    }
    .pageBtn:hover{
        cursor: pointer;
    }

    /* search */
    .searchArea{
        display: flex;
        justify-content: flex-end;
        margin-bottom: 1em;
    }

    /*web*/
    @media (min-width: 992px) {
        .searchTitBox{
            padding-top: 0.5vh;
            width: 13%;
            font-size: 0.9rem;
        }
    }
    /*mob*/
    @media (max-width: 991px){
        .searchTitBox{
            padding-top: 0.5vh;
            width: 40%;
            font-size: 0.9rem;
        }
    }

    #searchTit{
        font-weight: 500;
    }
    #searchVal{
        width: 40%;
        border: none;
        border-bottom: 1px solid gray;
        margin-right: 1em;
        font-size: 0.7rem;
        padding-top: 0.5em;
        padding-left: 1em;
        border-radius: 0;
    }
    #srchBtn{
        border: 1px solid gray;
        background-color: inherit;
        font-size: 0.6rem;
        border-radius: 0;
        color: gray;
        width: 4em;
        font-size: 0.7rem;
    }

</style>

<div class="boardWrapper">
    <div class="qna titleArea">
        <div class="key-title">
            <div class="labelBox">
                <div class="hdLabel label_bg_semilightBlue"></div>
            </div>
            <h1>1:1 문의</h1>
        </div>
        <div class="explain">
            <div class="dotBox">
                <div class="listDot"></div>
            </div>
            <span class="explainTxt">견적 등 문의를 남겨주세요.</span>
        </div>
        <div class="explain">
            <div class="dotBox">
                <div class="listDot"></div>
            </div>
            <span class="explainTxt">답변 후 문자로 안내드립니다.</span>
        </div>
        <button id="regBoard" onclick="regBoard();">등록하기</button>
    </div>

    <div class="boardArea">
        <table id="boardTable">
            <thead>
                <tr>
                    <th>
                        <div class="searchArea">
                            <div class="searchTitBox">
                                <span id="searchTit">나의 게시글 조회</span>
                            </div>
                            <input type="number" pattern="\d*" id="searchVal" placeholder="전화번호를 입력하세요.">
                            <input type="button" id="srchBtn" value="검색" onclick="searchBoard();">
                        </div>
                    </th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <div class="pageBar">

        </div>
    </div>
</div> 

<script>
    <c:if test="${not empty msg}" >
        alert("${msg}");
    </c:if>

    $(() => {
        getBoard(1);
    });

    let srchSeqList = null;

    function searchBoard(){
        let num = $('#searchVal').val();

        if(num == ""){
            srchSeqList = null;
        }

        $.ajax({
            url: "${pageContext.request.contextPath}/board/searchBoard",
            data: {
                num
            },
            success(res){
                console.log(res);
                srchSeqList = res;
                getBoard(1);
            },
            error: console.log
        });
    }

    function validateNumber(param){
        return new Promise(function(resolve, reject){
            $.ajax({
                url : '${pageContext.request.contextPath}/board/validateNumber',
                method : "POST",
                contentType: "application/json",
                data: JSON.stringify(
                    param
                ),
                success(res){
                    resolve(res);
                },
                error: console.log
            });
        })
    }

    async function showRegistered(seq){
        if(await chkAuth() == true){
            location.href = `${pageContext.request.contextPath}/board/showRegistered?seq=\${seq}`;
        } else {
            let phNum = prompt('등록시 입력한 핸드폰번호를 입력해주세요');
            if(phNum == '' || phNum == null){
                return false;
            }

            let param = {
                seq,
                phNum
            }

            if(await validateNumber(param)){
                location.href = `${pageContext.request.contextPath}/board/showRegistered?seq=\${seq}`;
            } else {
                alert('번호가 일치하지 않습니다.');
                return false;
            };
        }
    }

    function chkAuth(){
        return new Promise(function(resolve, reject){
            $.ajax({
                url: '${pageContext.request.contextPath}/setting/chkAuth',
                success(res){
                    resolve(res);
                },
                error: console.log
            })
        })
    }

    function getBoard(page){
        if(page <= 0){
            return false;
        }

        let seqList = srchSeqList;

        $("#boardTable tbody").empty();
        $.ajax({
            url : '${pageContext.request.contextPath}/board/getBoard',
            method: "POST",
            contentType: "application/json",
            data : JSON.stringify({
                page,
                seqList
            }),
            success(res){
                let pageBlock = (page - 1) * 5; //
                $.each(res, (i, e) => {
                    let no = pageBlock + i + 1;

                    let date = new Date(e.regDate);
                    let fullYear = date.getFullYear();
                    let thisYear = fullYear.toString().slice(2, 4);
                    let thisMonth = date.getMonth() < 10 ? `0\${date.getMonth()+1}` : date.getMonth() + 1;
                    let thisDate = date.getDate() < 10 ? `0\${date.getDate()}` : date.getDate();
                    let dateForm = `\${thisYear}/\${thisMonth}/\${thisDate}`;

                    const name = e.writer;
                    const lastName = name.substr(0, 1);
                    const firstName = name.substr(1);

                    // 성 부분과 '*'를 합쳐서 새로운 이름을 생성합니다.
                    const hiddenLastName = lastName + '*'.repeat(name.length - 1);

                    let tr = `
                        <tr onclick="showRegistered('\${e.seq}');">
                            <td>
                                <div class="boardRow">
                                    <div class="bd_cont bd_title">\${e.title}</div>
                                    <div class="bd_cont bd_author">\${hiddenLastName}</div>
                                    <div class="bd_cont bd_reg_dt">\${dateForm}</div>
                                </div>
                            </td>
                        </tr>
                    `;

                    $("#boardTable tbody").append(tr);
                });

               if(res.length < 5){ //
                    let appendTr = '<tr class="hiddenTr"></tr>';
                    for(let i = 0; i < 5 - res.length; i++){
                        $("#boardTable tbody").append(appendTr);
                    }
                }

            },
            error:console.log,
            complete(){
                getPageBar(page);
            }
        })
    };

    function getPageBar(page){
        let seqList = srchSeqList;

        $.ajax({
            url : '${pageContext.request.contextPath}/board/getTotalBoardCount',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
               seqList
            }),
            success(res){
                $(".pageBar").empty();
                
                if(res%5 == 0){
                	res -= 1;
                }
                
                let pageStart = (Math.floor(page/5) * 5) + 1;
                let pageEnd = pageStart + 4;
                let realEnd = Math.floor(res/5 + 1);


                console.log('page : ', page);
                console.log('pageStart : ', pageStart);
                console.log('pageEnd : ', pageEnd);
                console.log('realEnd : ', realEnd);


                if(page%5 == 0){
                    pageStart = pageStart - 5;
                    pageEnd = pageEnd - 5;
                }
                
                if(page > 5){
                    let prevBtn = `
                        <button class="pageBtn pageStep" onclick="getBoard(\${pageStart - 1})">
                            &lt;
                        </button>
                    `;
    
                    $(".pageBar").append(prevBtn);
                }



                for(var i = pageStart;i <= pageEnd; i++){
                    if(i > realEnd){
                        break;
                    }
                    let bar = `
                        <button class="pageBtn" id="page\${i}" onclick="getBoard(\${i})">
                            \${i}
                        </button>
                    `;
                    $(".pageBar").append(bar);
                }

                if(realEnd > pageEnd){
                    let nextBtn = `
                        <button class="pageBtn pageStep" onclick="getBoard(\${pageEnd + 1})">
                            &gt;
                        </button>
                    `;
    
                    $(".pageBar").append(nextBtn);
                }

                $(`#page\${page}`).css('color', 'red');
            },
            error:console.log
        })
    }

    function regBoard(){
        location.href = '${pageContext.request.contextPath}/board/page?param=counsel/regBoard';
    }

</script>

<jsp:include page="/WEB-INF/views/comm/footer.jsp"/>