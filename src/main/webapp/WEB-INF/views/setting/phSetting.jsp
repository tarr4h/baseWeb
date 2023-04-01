<%--
  Created by IntelliJ IDEA.
  User: taewoohan
  Date: 2022/08/07
  Time: 9:32 PM
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
        height: 60vh;
        padding-top: 20vh;
        font-size: 20px;
        display: flex;
        align-items: center;
        flex-direction: column;
    }
    #phTb {
        border-collapse: collapse;
        width: 90%;
    }
    #phTb th{
        text-align: center;
        width: 20%;
        border: 1px solid gray;
    }
    #phTb td{
        border: 1px solid gray;
        text-align: center;
        width: 80%;
    }
    .phVal{
        border: none;
        width: 100%;
        text-align: center;
        background-color: #a9a9a91f;
    }
    #btn{
        border-radius: 0;
        border: 1px solid gray;
        color: white;
        background-color: #041C32;
        font-size: 15px;
        height: 40px;
        display: block;
        width: 90%;
    }
</style>


<div class="pageArea">
    <h3>변경하기</h3>
    <table id="phTb">
        <thead>
            <tr>
                <th>대상</th>
                <th>번호</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <c:forEach items="${phInfo}" var="item">
                    <tr>
                        <th>
                            ${item.target}
                        </th>
                        <td>
                            <input type="text" class="phVal" id="" value="${item.ph}" data-target="${item.target}">
                        </td>
                    </tr>
                </c:forEach>
            </tr>
        </tbody>
    </table>

    <button id="btn" onclick="updatePh();">저장</button>
</div>

<script>
    function updatePh(){
        let phValArr = $('.phVal');

        let list = new Array();

        $.each(phValArr, (i, e) => {
            let param = {
                ph : $(e).val(),
                target : $(e).data('target')
            };

            list.push(param);
        });

        $.ajax({
            url: '${pageContext.request.contextPath}/setting/updatePh',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
              list
            }),
            success(res){
                if(res > 0){
                    alert('변경되었습니다.');
                } else {
                    alert('변경사항이 없습니다.');
                }
            },
            error: console.log
        });
    }
</script>

<jsp:include page="/WEB-INF/views/comm/footer.jsp"/>