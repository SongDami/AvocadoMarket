<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Avocado Market 아이디 찾기</title>
    </head>
    
    
    

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/find_id_style.css?ver=<%=System.currentTimeMillis()%>" />
    
    
    
    <body>

    <div class="container">
    <h1>아이디 찾기</h1>

    <!-- <div class="tab-group">

      <div class="find-id" ><a href="#">아이디 찾기</a></div>
      <div class="find-pw"><a href="#">비밀번호 찾기</a></div>

    </div> -->
    <div class="clear"></div>
    <form id="find_id" method="post" action="${pageContext.request.contextPath}/3depth/find_id_ok.do" onsubmit="return formCheck()">
    <div class="input-group">
    <span>이&nbsp;&nbsp;&nbsp;&nbsp;름</span>
     <input type="text" class="name-control" name = "name" id="inputName" placeholder="&nbsp;&nbsp;이름을 입력하세요.">
     <br/>
     <span>이메일</span>
     <input type="text" class="email-control" name = "email"  id="inputEmail" placeholder="&nbsp;&nbsp;이메일을 입력하세요.">
    </div>


   <div class="find-id-button-group">
    <div class="find-id-button">
      <button type="submit" class="find-id-btn" name="find_id_button">아이디 찾기</button>
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
    
    $(function() {
        $("#btnFindId").click(find_id_button);
    });
    
    
    function btnFindId(event) {
        var email = $("#email");
        
        if (email.val() == "") {
            alert("이메일을 입력하세요.");
            return;
        }
        
        var name = $("#name");
        
        if (name.val() == "") {
            alert("이름을 입력하세요.");
            return;
        }
        
        $.post("found_id.do", {
            email : email.val(),
            name : name.val()
        }, function(data){
            alert(eval(data).result);
        });
        
        }
    
    
    
    
    
    
    /* ------------------ 유효성 검사 -------------------- */
    
    /* 
    $(function() {
        // 플러그인의 기본 설정 옵션 
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
    }
        
        // 유효성 검사
        function formCheck() {
            var data = $("#name").val();
            if(data==null || data.trim().length==0) {
                alert('이름은 반드시 입력해야 합니다.')
                $("#name").val("");
                $("#name").focus();
                return false;
            }

            var data = $("#email").val();
            if(data==null || data.trim().length==0) {
                alert('이메일은 반드시 입력해야 합니다.')
                $("#email").val("");
                $("#email").focus();
                return false;
            }
            
            return true;    
        } 

 */
 
    /* 
    
    // 아이디 찾기 버튼 (아이디,이메일)
    function find_id {

        var frm = document.idfindscreen;

        if (frm.name.value.length < 1) {
         alert("이름을 입력해주세요");
         return;
        }
        if (frm.email.value.length < 1 || frm.e_domain.value.length < 1) {
         alert("이메일을 입력해주세요");
         return;
        }
 
        frm.method = "post";
        frm.action = "./4depth/found_id.do"; //넘어간화면
        frm.submit();  }

       */​
    
    </script>
</body>
</html>