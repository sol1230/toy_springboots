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
      <%
        ArrayList<HashMap> question_list = (ArrayList<HashMap>) request.getAttribute("question_list");
        ArrayList<HashMap> surveyor_answerList = (ArrayList<HashMap>) request.getAttribute("surveyor_answerList");
        HashMap<String, Object> userWithUid = (HashMap<String, Object>) request.getAttribute("userWithUid");
        String msg = (String) request.getAttribute("msg");
      %>
    <div class="container pb-5">
      <%@ include file="header.jsp" %>

      <main class="mt-5 p-1">
        <form action="/admin/userManagementServlet" method="post">
          <div class="mt-5">
          <% if(msg != null){ %>
            <div class="fs-3 text-center text-success opacity-75 pt-5 mb-3"><%= msg %></div>
            <div class="text-center mt-3">
          <a href="/admin/userList" class="btn btn-success btn-lg opacity-75"
            >회원목록 페이지로</a
          >
        </div>
          <% } else { %>
            <div class="fs-3 text-center text-success opacity-75 mb-3">'<%= userWithUid.get("NAME") %>'님의 설문결과입니다.</div>
            <table class="table text-center" style="width: 90%">
              <thead>
                <tr class="table-success opacity-75">
                  <th>설문문항</th>
                  <th>설문답변</th>
                </tr>
              </thead>
            <tbody class="align-middle">
            <% 
                for (int i = 0; i < question_list.size(); i++){ 
                  HashMap<String,Object> question = question_list.get(i);
                  HashMap<String, Object> surveyor_answer = surveyor_answerList.get(i);
            %>
              <tr>                  
                  <th class="text-center"> 
                    <%-- 질문 출력 --%>
                     <%= question.get("QUESTION_LIST") %> 
                  </th>
                  <th>
                    <%-- 답변 출력 --%>
                    <%= surveyor_answer.get("ANSWER_LIST") %>
                  </th>
              </tr>
              <% } %>
              </tbody>
            </table>
            <% } %>
          </div>
        </form>
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
