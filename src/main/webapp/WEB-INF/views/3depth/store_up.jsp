
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<!doctype html>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/store_up_style.css?ver=<%=System.currentTimeMillis()%>" />


<body>
    <div class="container">
        <div class="storeup_body">
            <div class="title">
                <span class="title_name">
                    업체 등록&nbsp;</span>
                <span class="title_ect">
                    필수 입력 항목 (*)</span>
            </div>
            <form class="storeup" name="form" id="form" method="post">
                <div class="store_category">
                    <p>*카테고리</p>
                    <select>
                       <!--  <option value="전체">카테고리 선택</option> --> 
                        <option value="음식점">음식점</option>
                        <option value="쇼핑/유통">쇼핑/유통</option>
                        <option value="생활/편의">생활/편의</option>
                        <option value="서비스/산업">서비스/산업</option>
                        <option value="기타">기타</option>
                    </select>
                </div>
                <div class="store_number">
                    <p>*사업자등록번호</p>
                    <input  name="store_number" type="text" placeholder="ex)123-45-67890">
                </div>
                <div class="store_name" >
                    <p>*상호명</p>
                    <input name="store_name"type="text" placeholder="상호명을 입력해주세요.">
                </div>
                <hr />
                <div class="store_phone">
                    <p>*연락처</p>
                    <input name="store_phone" type="phone" placeholder="ex)010-1234-5678">
                </div>
                <div class="store_email">
                    <p>*이메일</p>
                    <input name="store_email" type="email" placeholder="ex)avocado@gmail.com">
                </div>
                <div class="store_loc">
                    <p>*업체주소</p>
                    <input name="store_loc1" type="text" id="roadAddrPart1" name="roadAddrPart1" placeholder="주소검색을 클릭하여 '동/리/도로명'으로 검색하세요.">
                    <input name="store_loc2" type="text" id="addrDetail" name="addrDetail" placeholder="상세주소를 입력해주세요.">
                    <button  type="button" onClick="goPopup();" class="address_search">주소검색</button>
                </div>
                <div class="store_content">
                    <p>*업체 소개</p>
                    <textarea name = "content" placeholder="업체 소개 내용을 입력해주세요"></textarea> </div>
                <hr />
                
                <div class="goods_img">
                    <p>*이미지 첨부</p>
                    <div class="desc">
                    <input name="goods_img" type="file" class="imgup" id=file multiple>
                        <p class="desc_top">상품 이미지는 최소 1장 최대 5장까지 업로드 가능합니다.</p>
                        <p class="desc_bottom">
                        - Shift 혹은 Ctrl 버튼을 눌러 파일 다중 선택이 가능합니다. <br>
                        - 파일 확장자가 jpg,jpeg,png 파일만 업로드하실 수 있습니다.
                                            <br>   (파일명은 특수문자 *,#, $ 등 & 공백 사용금지!)<br>
                                            - 파일 업로드 시, 첨부파일 1개당 200MB 까지 가능합니다.</p>
                    </div>
                    
                </div>
                
                <div class="upload_button">
                    <button type="submit">업체 신청하기</button>
                </div>
                <div class="desc_result">아보카도 마켓 기준에 따라 심사 후, <br/> 메일로 신청 결과를 발송해드립니다.</div>
                </form>
                
                
            </div>
        </div>
    <%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    
    <!-- validate, sweetalert 플러그인 참조 -->
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
                    } else {
                        alert("신청되었습니다.");
                    }
                }
            });

          /* 유효성 검사 추가 함수 */
          $.validator.addMethod("kor", function(value, element) {
              return this.optional(element) || /^[ㄱ-ㅎ가-힣0-9]*$/i.test(value);
          });

          $.validator.addMethod("tel", function(value, element) {
              return this.optional(element) || /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/i.test(value) ||
                  /^\d{2,3}\d{3,4}\d{4}$/i.test(value);
          });

      /* form 태그에 부여한 id속성에 대한 유효성 검사 함수 호출 */
      $("#form").validate({
          /* 입력검사 규칙 */
          rules: {
              // [사업자등록번호] 필수, 숫자, 하이픈 조합만 허용
              store_number: { required: true},

              // [상호명] 필수 + 글자수 길이 제한
              store_name: { required: true, maxlength: 30 },
              
              // [연락처] 필수
              store_phone: { required: true },
              
              // [이메일] 필수 + 이메일 형식 일치 필요
              store_email: { required: true, email: true },
              
              // [주소1] 필수 
              store_loc1: { required: true},
              
              // [주소2-상세주소] 필수
              store_loc2: { required: true},
              
              // [본문] 필수
              content: { required : true },

              // 허용할 확장자 명시
              goods_img: { extension: "jpg|jpeg|png" }
          },
          /* 규칙이 맞지 않을 경우의 메시지 */
          messages: {
              store_number: {
                  required: "사업자번호를 입력하세요.",
              },

              store_name: {
                  required: "상호명을 입력하세요.",
                  maxlength: "상호명은 최대 30자까지 가능합니다."
              },

              store_phone: {
                  required: "연락처를 입력하세요.",
                  tel: "연락처 형식이 잘못되었습니다."
              },
              
              store_email: {
                  required: "이메일을 입력하세요.",
                  email: "이메일 형식이 잘못되었습니다."
              },
              
              store_loc1: {
                  required: "도로명 주소를 입력하세요.",
                  
              },
              
              store_loc2: {
                  required: "상세 주소를 입력하세요.",
                  
              },
              
              content: {
                  required: "내용을 입력해주세요"
              },
              
              goods_img: {
                  extension: "사진은 jpg, jpeg, png형식만 가능합니다."
              
              }
          }
      }); // end validate()

    
      });
    
        function goPopup(){
            // 주소검색을 수행할 팝업 페이지를 호출합니다.
            // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
            var pop = window.open("../assets/js/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
            }

            function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
                // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
                document.form.roadAddrPart1.value = roadAddrPart1;
                document.form.addrDetail.value = addrDetail;
               
                }

</script>
</body>
</html>