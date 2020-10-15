<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<!doctype html>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/goods_up_style.css?ver=<%=System.currentTimeMillis()%>" />


<body>
   <div class="container">
        <div class="join_body">
            <div class="title">
                <span class="title_name">상품 등록&nbsp;</span>
                <span class="title_ect">필수 입력 항목 (*)</span>
            </div>
            <form id="goods_up" class="goodsup" method="post" action="${pageContext.request.contextPath}/2depth/goods_up_ok.do" enctype="multipart/form-data">
                <div class="goods_title">
                    <p>*제목</p>
                    <input name="goods_name" type="text" maxlength="12" placeholder="제목을 입력해주세요.">
                </div>
                <hr />
                <div  class="goods_price">
                    <p>*가격</p>
                    <input name= "price" type="number" placeholder="가격입력"/>원
                </div>
                <div class="goods_category">
                    <p>*카테고리</p>
                    <select name="category_category_id">
                        <option name="category_category_id" value="3">디지털/가전</option>
                        <option name="category_category_id" value="4">가구/인테리어</option>
                        <option name="category_category_id" value="5">유아동</option>
                        <option name="category_category_id" value="6">생활/가공식품</option>
                        <option name="category_category_id" value="7">스포츠/레저</option>
                        <option name="category_category_id" value="8">잡화</option>
                        <option name="category_category_id" value="9">의류</option>
                        <option name="category_category_id" value="10">게임/취미 </option>
                        <option name="category_category_id" value="11">반려동물용품</option>
                        <option name="category_category_id" value="12">기타</option>
                        <option name="category_category_id" value="13">삽니다</option>
                    </select>
                </div>
                <div class="goods_content">
                    <p>*내용</p>
                    <textarea name= "goods_content" placeholder="내용을 입력해주세요"></textarea>
                </div>
                <hr/>
                 <div class="goods_img">
                    <p>이미지 첨부</p>
                    <div class="desc">
                    <input type="file" name="goods_img" class="imgup" id="file"  multiple/>
                    <input type="file" name="goods_img" class="imgup" id="file"  multiple/>
                    <input type="file" name="goods_img" class="imgup" id="file"  multiple/>
                    <input type="file" name="goods_img" class="imgup" id="file"  multiple/>
                    <input type="file" name="goods_img" class="imgup" id="file"  multiple/>
                        <p class="desc_top">상품 이미지는 최소 1장 최대 5장까지 업로드 가능합니다.</p>
                        <p class="desc_bottom">
                        - 파일 확장자가 jpg,jpeg,png 파일만 업로드하실 수 있습니다.<br/>
                          &nbsp;(파일명은 특수문자 *,#, $ 등 & 공백 사용금지!)<br/>
                        - 파일 업로드 시, 첨부파일 1개당 200MB 까지 가능합니다.</p>
                    </div>
                </div>
                 <div class="upload_button">
                    <button type="submit" id="upload">글 등록하기</button>
                 </div>
            </form>
            </div>
        </div>
       
    <%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- sweetalert, validate 플러그인 참조 -->
    <script src="<%=request.getContextPath()%>/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/plugins/validate/jquery.validate.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/plugins/validate/additional-methods.min.js"></script>   
    <script type="text/javascript">

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
                }else{
                    alert('등록되었습니다');
                }
            }
        });

        /* form 태그에 부여한 id속성에 대한 유효성 검사 함수 호출 */
        $("#goods_up").validate({
            /* 입력검사 규칙 */
            rules: {
                // [제목] 필수, 길이 제한
                title: { required: true, maxlength: 20 },

                // [가격] 필수 + 숫자만
                price: { required: true, number:true },
                
                // [본문] 필수
                content: { required : true },

                // 허용할 확장자 명시
                storeimg: { required: true, extension: "jpg|jpeg|png" }
            },
            /* 규칙이 맞지 않을 경우의 메시지 */
            messages: {
                title: {
                    required: "제목을 입력하세요.",
                    maxlength: "제목은 최대 20자까지 가능합니다."
                },

                price: {
                    required: "가격을 입력하세요.",
                    number: "가격은 숫자만 입력 가능합니다."
                },
                
                content: {
                    required: "내용을 입력해주세요"
                },

                storeimg: {
                    extension: "사진은 jpg, jpeg, png형식만 가능합니다.",
                    required: "사진을 등록해주세요."
                }
            }
        }); // end validate()
    });
    

    </script>
    
  

</body>