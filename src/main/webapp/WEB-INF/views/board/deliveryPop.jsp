<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
    body{
        background-color: #24232B;
    }
    table{
        width: 100%;
        border-collapse: collapse;
    }
    th, td{
        border: 1px solid #F2F2F2;
        text-align: center;
        font-family: 'Gothic A1', sans-serif;
        color: #FFF;
    }
    thead th{
        height: 9vh;
    }
    tbody td{
        height: 7vh;
    }
    span{
        color: #FFF;
        font-family: 'Gothic A1', sans-serif;
    }

</style>
<div id="popMain">
    <table>
        <colgroup>
            <col width="25%"/>
            <col width="75%"/>
        </colgroup>
        <thead>
            <tr>
                <th colspan="2"
                    style="background-color: #24232B;color: #FFF"
                >
                    배송가능지역
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th rowspan="5"
                    style="background-color: #164194;color: #FFF"
                >경기</th>
                <td>파주시</td>
            </tr>
            <tr>
                <td>김포시</td>
            </tr>
            <tr>
                <td>고양시</td>
            </tr>
            <tr>
                <td>양주시</td>
            </tr>
            <tr>
                <td>의정부시</td>
            </tr>
            <tr>
                <th style="background-color: #455F54;color: #FFF">인천광역시</th>
                <td>전체</td>
            </tr>
        </tbody>
    </table>
    <div style="margin-top: 2vh;text-align: center;">
        <span>* 그 외 지역은 문의 부탁 드립니다.</span>
    </div>

</div>
