
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 중복검사 -->
<c:url var="idcheckURL" value="/restMenu/id_unique_check_jquery"></c:url>
<c:url var="nickcheckURL" value="/restMenu/nick_unique_check_jquery"></c:url>
<c:url var="emailcheckURL" value="/restMenu/email_unique_check_jquery"></c:url>

<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!-- ========== 컨텐츠 영역 시작 ========== -->
<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %> --%>
<!doctype html>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/join_style.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/plugins/sweetalert/sweetalert2.min.css" />


<body>
   <div class="container">
   
      <div class="join_body">
         <div class="title">
            <span class="title_name">
               회원가입&nbsp;</span>
            <span class="title_ect">
               필수 입력 항목 (*)</span>
         </div>
   <form id="join_form" method="post" action="${pageContext.request.contextPath}/3depth/join_ok.do">
         <input type="hidden" id="checked_user_id" value="">
         <input type="hidden" id="checked_email" value="">
         <input type="hidden" id="checked_nick" value="">
         <div class="userid">
            <p>*아이디:</p>
            <button class ="idcheck" id="idcheck" type="button">중복확인</button>
            <input type="text" id="user_id" name="user_id" placeholder="*5~20자의 영문 소문자, 숫자만 사용 가능합니다.">
             <p>&nbsp;</p>
         </div>
         <hr />
         <div class="userpw">
            <p>*비밀번호:</p>
            <input type="password"  id="user_pw" name="user_pw" placeholder="*비밀번호를 입력하세요.">
            <p>&nbsp;</p>
            <input class="pd" type="password"  id="userpw_re" name="userpw_re" placeholder="*비밀번호를 다시 입력하세요.">
             <p>&nbsp;</p>
         </div>
         <hr />
         <div class="useremail">
            <p>*이메일:</p>
            <button class ="emailcheck" id="emailcheck" type="button">중복확인</button>
            <input type="email"  id="email" name="email" >
            <p>&nbsp;</p>

         </div>
         <hr />
         <div class="username" >
            <p>*이름:</p>
            <input type="text"  id="name" name="name" >
             <p>&nbsp;</p>
         </div>
         <hr />
         <div class="usernick">
            <p>*닉네임:</p>
            <button class ="nickcheck" id="nickcheck" type="button">중복확인</button>
            <input type="text"  id="nick" name="nick"  placeholder="*8자 이내의 영문, 한글, 숫자만 사용 가능합니다.">
             <p>&nbsp;</p>
         </div>
         <hr />
         <div class="userphone">
            <p>*전화번호:</p>
            <input type="text"  id="tel" name="tel" placeholder="ex)01012345678">
             <p>&nbsp;</p>
         </div>
         <hr />
         <div class="userloc">
            <p>*지역선택:</p>
            <select id="sigugun">
               <option value="">구 선택</option>
            </select>
            <select id="dong" name="dong_name">
               <option value="" name="dong_dong_id">동 선택</option>
            </select>
         </div>
         <p>&nbsp;</p>
         <hr />
         <hr />
         <div class="join_button"><button type="submit" id="btn_save">회원가입하기</button></div>
         </form>
      </div>
      
   </div>
   
   <%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
   
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
      <!-- 구, 동 선택  -->
   <script type="application/javascript" src="<%=request.getContextPath()%>/assets/js/seouldong.js"></script>
   <!-- validate,sweetalert 플러그인 참조 -->
   <script src="<%=request.getContextPath()%>/assets/plugins/validate/jquery.validate.min.js"></script>
   <script src="<%=request.getContextPath()%>/assets/plugins/validate/additional-methods.min.js"></script>
   <script src="<%=request.getContextPath()%>/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>

   <script type="text/javascript">
   var contextPath = '<%= request.getContextPath() %>';
   /* ----------------- 구, 동 선택 시작 ------------------  */
   
   jQuery(document).ready(function(){
      //sigugun option 추가
      jQuery.each(hangjungdong.sigugun, function(idx, code){
         //append를 이용하여 option 하위에 붙여넣음
         jQuery('#sigugun').append(fn_optionGu(code.sigugun, code.codeNm));
      });

      //시군구 변경시 행정동 옵션추가
      jQuery('#sigugun').change(function(){
         //option 제거
         jQuery('#dong').empty();
         jQuery.each(hangjungdong.dong, function(idx, code){
//             if(code.sido && jQuery('#sigugun > option:selected').val() == code.sigugun)
            if(code.sido && jQuery('#sigugun > option:selected').val() == code.sigugun)
               jQuery('#dong').append(fn_optionDong(code.dong, code.codeNm));
         });
         //option의 맨앞에 추가
         jQuery('#dong').prepend(fn_optionDong('','동 선택'));
         //option중 '동 선택'을 기본으로 선택
         jQuery('#dong option:eq("")').attr('selected', 'selected');
      });
   });
   
   function fn_optionGu(code, name){
      return '<option value="' + code +'">' + name +'</option>';
   }
   
   function fn_optionDong(code, name){
      return '<option value="' + name +'">' + name +'</option>';
   }
     /* ----------------- 구, 동 선택 끝 ------------------  */
   
   
   /* ------------------ 유효성 검사 -------------------- */
   $(function() {

      /* 유효성 검사 추가 함수 */
      $.validator.addMethod("kor", function(value, element) {
         return this.optional(element) || /^[ㄱ-ㅎ가-힣0-9]*$/i.test(value);
      });

      $.validator.addMethod("tel", function(value, element) {
         return this.optional(element) || /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/i.test(value) ||
            /^\d{2,3}\d{3,4}\d{4}$/i.test(value);
      });
      
      $.validator.addMethod("nick", function(value, element) {
         return this.optional(element) || /^[ㄱ-ㅎ가-힣0-9]*$/i.test(value) || /^[a-zA-Z]*$/i.test(value) 
         || /^[0-9]*$/i.test(value);
      });

      /* form 태그에 부여한 id속성에 대한 유효성 검사 함수 호출 */
      $("#join_form").validate({
         /* 입력검사 규칙 */
         rules: {
                
                // [아이디] 필수 + 알파벳, 숫자 조합만 허용
                user_id: { required: true, alphanumeric: true },
   
               // [비밀번호] 필수 + 글자수 길이 제한
               user_pw: { required: true, minlength: 4, maxlength: 20 },
   
               // [비밀번호 확인] 필수 + 특정 항목과 일치 (id로 연결)
               userpw_re: { required: true, equalTo: "#user_pw" },
   
               // [이름] : 필수
               name: { required: true, kor: true },
   
               // [이메일] 필수 + 이메일 형식 일치 필요
               email: { required: true, email: true },
               
               // [닉네임] 필수
               nick: { required: true, maxlength: 8, nick: true},
               
               // [연락처] 필수
               tel: { required: true, tel: true },
   
               // 허용할 확장자 명시
               profile_img: { extension: "jpg|gif|png" }
         },
            /* 규칙이 맞지 않을 경우의 메시지 */
         messages: {
            
            userid: {
               required: "아이디를 입력하세요.",
               alphanumeric: "아이디는 영어, 숫자만 입력 가능합니다."
            },

            userpw: {
               required: "비밀번호를 입력하세요.",
               minlength: "비밀번호는 4글자 이상 입력하셔야 합니다.",
               maxlength: "비밀번호는 최대 20자까지 가능합니다."
            },

            userpw_re: {
               required: "비밀번호 확인값을 입력하세요.",
               equalTo: "비밀번호 확인이 잘못되었습니다."
            },

            username: {
               required: "이름을 입력하세요.",
               kor: "이름은 한글만 입력 가능합니다."
            },
            
            usernick: {
               required: "닉네임을 입력하세요.",
               nick: "닉네임은 8자 이내의 한글,영문,숫자 조합으로만 가능합니다.",
               maxlength: "8자 이내로 입력해주세요."
            },
            
            email: {
               required: "이메일을 입력하세요.",
               email: "이메일 형식이 잘못되었습니다."
            },

            userphone: {
               required: "연락처를 입력하세요.",
               tel: "연락처 형식이 잘못되었습니다."
            }
         } // end validate()
      });

     /*================중복검사 처리(아이디)====================*/
      $("#idcheck").click(function(e) {
         $("#user_id").val($("#user_id").val().trim());
         
         var paramData = {
            user_id : $("#user_id").val()
         };
         
         if ($("#user_id").val() == "") {
            alert("아이디를 입력하세요");
            return false;
         }
         
         $.ajax({
            url : "${idcheckURL}"
            , type : "POST"
            , dataType : "json"
            , data : paramData
            , success : function(result){
               console.log(result);
               if (result.status == "OK") {
                  alert(result.returnMsg);
                  $("#checked_user_id").val("Y");
               } else {
                  alert(result.returnMsg);
                  $("#user_id").val("");
                  $("#checked_user_id").val("N");
               }
            }
         });
      });
      /*================중복검사 처리(이메일)================*/
      $("#emailcheck").click(function(e) {
         $("#email").val($("#email").val().trim());
         
         var paramData = {
               email : $("#email").val()
         };

         if ($("#email").val() == "") {
            alert("이메일을 입력하세요");
            return false;
         }
         
         $.ajax({
            url : "${emailcheckURL}"
            , type : "POST"
            , dataType : "json"
            , data : paramData
            , success : function(result){
               console.log(result);
               if (result.status == "OK") {
                  alert(result.returnMsg);
                  $("#checked_email").val("Y");
               } else {
                  alert(result.returnMsg);
                  $("#email").val("");
                  $("#checked_email").val("N");
               }
            }
         });
      });
   /*================중복검사 처리(닉네임)================*/
      $("#nickcheck").click(function(e) {
         $("#nick").val($("#nick").val().trim());
         
         var paramData = {
            nick : $("#nick").val()
         };

         if ($("#nick").val() == "") {
            alert("닉네임을 입력하세요");
            return false;
         }
         
         $.ajax({
            url : "${nickcheckURL}"
            , type : "POST"
            , dataType : "json"
            , data : paramData
            , success : function(result){
               console.log(result);
               if (result.status == "OK") {
                  alert(result.returnMsg);
                  $("#checked_nick").val("Y");
               } else {
                  alert(result.returnMsg);
                  $("#nick").val("");
                  $("#checked_nick").val("N");
               }
            }
         });
      });

      // 중복검사여부 확인
      $("#btn_save").click(function(e) {
         if ($("#checked_user_id").val() != "Y") {
            alert('아이디 중복확인을 해주세요.');
            $("input[name='user_id']").focus();
            return false;
         }
         if ($("#checked_email").val() != "Y") {
            alert('이메일 중복확인을 해주세요.');
            $("input[name='email']").focus();
            return false;
         }
         if ($("#checked_nick").val() != "Y") {
            alert('닉네임 중복확인을 해주세요.');
            $("input[name='nick']").focus();
            return false;
         }
      });
   });
   </script>
</body>