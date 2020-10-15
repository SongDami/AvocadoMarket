<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Avocado Market 아이디 찾기 결과</title>
</head>



<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/finded_id_style.css?ver=<%=System.currentTimeMillis()%>" />
    
    
<body>



  <div class="container">
    <h1>아이디 / 비밀번호 찾기</h1>

    <div class="tab-group">

      <div class="find-id" ><a href="#">아이디 찾기</a></div>
      <div class="find-pw"><a href="#">비밀번호 찾기</a></div>

    </div>
    <div class="clear"></div>

  <div class="finded-id-group">

    <span> 조*조님의 아이디는 choe****94 입니다.</span>



  </div>


  <div class="login-button-group">
    <div class="login-button">
      <button type="submit" class="login-btn"><a href="<%=request.getContextPath()%>/2depth/login.do">로그인 하기</button></a>
    </div>
  </div>


  </div>




<script src="https://kit.fontawesome.com/f78786fc85.js" crossorigin="anonymous"></script>


    <%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
</body>
</html>
