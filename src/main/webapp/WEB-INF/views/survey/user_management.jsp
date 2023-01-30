<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/css/font.css" />
  </head>
  <body class="bg-light">
    <div class="container pb-5">
      <%@ include file="header.jsp" %>

      <main class="mt-5 p-1">
          <div class="mt-5">
            <div class="fs-3 text-center text-success opacity-75 mb-3">회원관리 페이지</div>
            <div class="row">
            <div class="col">
          <form action="/admin/userList">
            <select name="keyField" id="">
              <option value="NAME">이름</option>
              <option value="BIRTH_DATE">생년월일</option>
              <option value="PHONE">전화번호</option>
            </select>
            <input type="text" name="keyWord" id="">
            <button type="submit" class="btn btn-success opacity-75">검색</button>
          </form>
          </div>
            <div class="col ">
          <form action="/member/form" method="get">
	          <button class="btn btn-success opacity-75 ms-5">Form</button>
          </form>
          </div>
          </div>
            <table class="table text-center mt-3">
              <thead>
                <tr class="table-success opacity-75">
                  <th>아이디</th>
                  <th>이름</th>
                  <th>생년월일</th>
                  <th>전화번호</th>
                  <th>설문조사 결과 조회</th>
                  <th>회원수정</th>
                </tr>
              </thead>
              <tbody class="align-middle">
            		<c:forEach items="${resultMap.resultList}" var="resultData" varStatus="loop">
                  <tr>
                 <form action="/member/surveyResult" method="get">
                  <th>${resultData.USER_ID}</th>
                  <th>${resultData.NAME}</th>
                  <th>${resultData.BIRTH_DATE}</th>
                  <th>${resultData.PHONE}</th>
                  <th>
                      <input type="submit" class="btn btn-outline-secondary opacity-75" value="보기"/>
                      <input type="hidden" name="user_id" value="${resultData.USER_ID}"/>
                  </th>
                </form>
                  <th>
                  <form action="/edit/{uniqueId}" method="get">
					      	  <button class="btn btn-outline-primary"
					      		>수정</button>
				        	</form>
                  <form action="/member/delete" method="post">
					      	  <button class="btn btn-outline-danger"
					      		onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false">삭제</button>
                    <input type="hidden" name="user_id" value="${resultData.USER_ID}" />
				        	</form>
                  </th>
                </tr>
              		</c:forEach>
              </tbody>
            </table>
          </div>

          <%-- pagination --%>
          <nav aria-label="Page navigation example">
          <c:set var="_pagination" value="${resultMap.paginations}" />
          ${paginations}
          <span>총 갯수 : ${_pagination.totalCount}</span>
            <ul class="pagination">
              <li class="page-item">
                <a class="page-link" href="${_pagination.previousPage}" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                  <span class="sr-only">Previous</span>
                </a>
              </li>
            <%-- for(int i = 0; i > 9 i++){} --%>
            <c:forEach var="i" begin="${_pagination.blockStart}" end="${_pagination.blockEnd}" >
              <li class="page-item"><a class="page-link" href="/member/list/${i}">${i}</a></li>
            </c:forEach>
              <li class="page-item">
                <a class="page-link" href="${_pagination.nextPage}" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                  <span class="sr-only">Next</span>
                </a>
              </li>
            </ul>
          </nav>
      </main>
    </div>
    <hr />
    <%@ include file="footer.jsp" %>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
