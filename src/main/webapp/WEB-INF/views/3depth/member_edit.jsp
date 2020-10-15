<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!-- ========== 컨텐츠 영역 시작 ========== -->
<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %> --%>
<!doctype html>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/member_edit_style.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />


<body>
    <div class="container">
        <div class="join_body">
            <div class="title">
                <span class="title_name">
                    회원정보 수정&nbsp;</span>
                <span class="title_ect">;
                    필수 입력 항목 (*)</span>
            </div>
            <form id="edit_form"  method="post" action="${pageContext.request.contextPath}/3depth/memer_edit_ok.do">
                    <div class="userid">
                        <p>*아이디:</p>
                        <input type="text"  value="${loginInfo.user_id}" class="readonly" readOnly />
                         <p>&nbsp;</p>
                    </div>
                    <hr />
                    <div class="userpw">
                        <p>*비밀번호:</p>
                        <input type="password" id="userpw" name="user_pw" placeholder="*비밀번호를 입력하세요.">
                        <p>&nbsp;</p>
                        <input class="pd" type="password" id="userpw_re" name="userpw_re" placeholder="*비밀번호를 다시 입력하세요.">
                        <p>&nbsp;</p>
                    </div>
                    <hr />
                    <div class="useremail">
                        <p>*이메일:</p>
                        <input type="email" id="email" name="email" value="${output.email}">
                        <button id="emailcheck">중복확인</button>
                        <!-- <button>인증하기</button>
                        <p>&nbsp;</p>
                        <input class="pd" id="email_number" name="email_number" type="text" placeholder="*메일로 발송된 인증번호를 입력하세요."> -->
                        <p>&nbsp;</p>
                    </div>
                    <hr />
                    <div class="username">
                        <p>*이름:</p>
                        <input type="text" id="username" name="username" value="${output.name}" class="readonly" readOnly>
                         <p>&nbsp;</p>
                    </div>
                    <hr />
                    <div class="usernick">
                        <p>*닉네임:</p>
                        <input type="text" id="usernick" name="nick" value="${output.nick}" class="readonly" readOnly>
                        <p>&nbsp;</p>
                    </div>
                    <hr />
                    <div class="userphone">
                        <p>*전화번호:</p>
                        <input type="text" id="userphone" name="tel" value="${output.tel}">
                        <p>&nbsp;</p>
                    </div>
                    <hr />
                    <div class="userloc">
                        <p>*지역선택:</p>
                        <select id="sigugun">
                            <option value="">구 선택</option>
                        </select>
                        <select id="dong" name="dong_name">
                            <option value="">동 선택</option>
                        </select>
                    </div>
                    <hr />
                     <p>&nbsp;</p>

                    <div type = submit class="join_button"><button>회원정보 수정하기</button></div>
            </form>
        </div>
        <hr />

    </div>

    <%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- validate 플러그인 참조 -->
    <script src="<%=request.getContextPath()%>/assets/plugins/validate/jquery.validate.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/plugins/validate/additional-methods.min.js"></script>
    <!-- 구, 동 선택  -->
    <script type="application/javascript" src="<%=request.getContextPath()%>/assets/js/seouldong.js"></script>
    <script type="text/javascript">

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
//              if(code.sido && jQuery('#sigugun > option:selected').val() == code.sigugun)
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
        $("#edit_form").validate({
            /* 입력검사 규칙 */
            rules: {
                // [비밀번호 변경] 글자수 길이 제한
                userpw: { required: true, minlength: 4, maxlength: 20 },

                // [비밀번호 확인]특정 항목과 일치 (id로 연결)
                userpw_re: { required: true, equalTo: "#userpw" },

                // [이메일] 필수 + 이메일 형식 일치 필요
                email: { required: true, email: true },
                
                // [닉네임] 필수
                usernick: { required: true, maxlength: 8 },
                
                // [연락처] 필수
                userphone: { required: true, tel: true }

            },
            /* 규칙이 맞지 않을 경우의 메시지 */
            messages: {

                userpw: {
                    required: "비밀번호를 입력하세요.",
                    minlength: "비밀번호는 4글자 이상 입력하셔야 합니다.",
                    maxlength: "비밀번호는 최대 20자까지 가능합니다."
                },

                userpw_re: {
                    equalTo: "비밀번호 확인이 잘못되었습니다."
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
            }
        }); // end validate()
    });
      </script>
     </body>   
</html>
