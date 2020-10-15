  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/plugins/sweetalert/sweetalert2.min.css">
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Avocado Market 로그인</title>
    
    
    <!-- ajax-helper -->
    
<!--     
    <link rel="stylesheet" href="../plugins/ajax/ajax/helper.css" />
    <script src="../plugins/ajax/ajax_helper.js"></script>
 -->

</head>


<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/login_style.css?ver=<%=System.currentTimeMillis()%>" />





<body>

    <form class="login-form" id="login-form" method="post" action="${pageContext.request.contextPath}/2depth/login_ok.do">
        <h1>로그인</h1>
  <div class="id-group">
    <div class="id">
        <div class="user">
        <i class="fas fa-user"></i></div>
      <input type="text" name="user_id" class="id-control" id="user_id" placeholder="&nbsp;&nbsp;아이디">
    </div>
  </div>
  <div class="pw-group">

    <div class="pw">
        <div class="key">
        <i class="fas fa-key"></i></div>
      <input type="password" name="user_pw" class="pw-control" id="user_pw" placeholder="&nbsp;&nbsp;비밀번호">
    </div>
  </div>

  <div class="login-button-group">
    <div class="login-button">
      <button type="submit" class="btn login-btn">로그인</button>
    </div>
  </div>
  <div class="join-button-group">
    <div class="join-button">
        <button type="button" class="btn join-btn"><a href="<%=request.getContextPath()%>/3depth/join.do">회원가입</button></a>
    </div>
  </div>
</form>

<script src="<%=request.getContextPath()%>/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<script type="text/javascript">
window.onload = function () {
	swal({
        html:'<p>안녕하세요!</br>회원가입 하기 힘드시죠?</br>아래의 아이디로 홈페이지를 이용해보세요.</br>ID : abc</br>PW : 1234</p>',
        showCloseButton:true,
        confirmButton: true,
        confirmButtonText:'확인',
        confirmButtonColor:'#a00',
        showCancelButton:true,
        cancelButtonText:'취소',
        cancelButtonColor:'#f60'
    });
}

$(function() {
    $("#login-form").ajaxForm(function(json) {
        if(json.result == "FAIL") {
            alert ("아이디나 비밀번호를 확인하세요.");
            return false;
        }
        
        alert("로그인 되셨습니다.")
        
        // 새로고침 수행
        window.location.reload();
    });
});

</script>


<script src="https://kit.fontawesome.com/f78786fc85.js" crossorigin="anonymous"></script>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
</body>