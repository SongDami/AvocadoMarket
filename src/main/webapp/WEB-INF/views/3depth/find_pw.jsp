<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Avocado Market 비밀번호 찾기</title>
    
    </head>
    
    
    
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/find_pw_style.css?ver=<%=System.currentTimeMillis()%>" />
    
    
    
    
<body>

  <div class="container">
    <h1>비밀번호 찾기</h1>

    <!-- <div class="tab-group">

      <div class="find-id" ><a href="#">아이디 찾기</a></div>
      <div class="find-pw"><a href="#">비밀번호 찾기</a></div>

    </div> -->
    <div class="clear"></div>
<form id="find_pw">
  <div class="input-group">
    <span>이&nbsp;&nbsp;&nbsp;&nbsp;름</span>
     <input type="text" class="name-control" name="name" id="inputName" placeholder="&nbsp;&nbsp;이름을 입력하세요.">
     <br/>
     <span>이메일</span>
     <input type="text" class="email-control" name="email" id="inputEmail" placeholder="&nbsp;&nbsp;이메일을 입력하세요.">
     <br/>
     <span>아이디</span>
     <input type="text" class="id-control" name="user_id" id="inputId" placeholder="&nbsp;&nbsp;아이디를 입력하세요.">
  </div>


  <div class="find-id-button-group">
    <div class="find-id-button">
      <button type="submit" class="find-pw-btn">비밀번호 찾기</button>
    </div>
  </div>
</form>

  </div>






<script src="https://kit.fontawesome.com/f78786fc85.js" crossorigin="anonymous"></script>


 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- validate,sweetalert 플러그인 참조 -->
    <script src="<%=request.getContextPath()%>/assets/plugins/validate/jquery.validate.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/plugins/validate/additional-methods.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
    <script type="text/javascript">
    
    /* ------------------ 유효성 검사 -------------------- */
    $(function() {
        /* 플러그인의 기본 설정 옵션 */
        jQuery.validator.setDefaults({
            onkeyUp:false,
            onclick:false,
            onfocusout:false,
            showErrors:function(errorMap, errorList){
                // 에러가 있을 때만
                if(this.numberOfInvalids()){
                    alert(errorList[0].message);
                    $(errorList[0].element).focus();
                }
            }
        });

      /* 유효성 검사 추가 함수 */
      $.validator.addMethod("kor", function(value, element) {
          return this.optional(element) || /^[ㄱ-ㅎ가-힣0-9]*$/i.test(value);
      });

      /* form 태그에 부여한 id속성에 대한 유효성 검사 함수 호출 */
      $("#find_pw").validate({
          /* 입력검사 규칙 */
          rules: {
              
              // [아이디] 필수 + 알파벳, 숫자 조합만 허용
              inputId: { required: true, alphanumeric: true },

              // [이름] : 필수
              inputName: { required: true, kor: true },

              // [이메일] 필수 + 이메일 형식 일치 필요
              inputEmail: { required: true, email: true }

          },
          /* 규칙이 맞지 않을 경우의 메시지 */
          messages: {
              
              inputId: {
                  required: "아이디를 입력하세요.",
                  alphanumeric: "아이디는 영어, 숫자만 입력 가능합니다."
              },

              inputName: {
                  required: "이름을 입력하세요.",
                  kor: "이름은 한글만 입력 가능합니다."
              },
              

              inputEmail: {
                  required: "이메일을 입력하세요.",
                  email: "이메일 형식이 잘못되었습니다."
              }

          }
          
      }); // end validate()
  });
    
    </script>
    
    
    </body>
</html>
