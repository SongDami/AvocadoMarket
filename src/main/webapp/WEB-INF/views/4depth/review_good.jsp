<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Avocado Market 후기 작성</title>
    
    </head>
    
    
    
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/review_good_style.css?ver=<%=System.currentTimeMillis()%>" />
    
    
<body>


    <div class="container">
    

        <!-- 후기 체크 리스트 -->
        <div class="good-review-list-group">
            <div class="good-review-list">
                <h3>남기고 싶은 칭찬을 선택해 주세요.</h3>
                <p>칭찬이 쌓이면 아보카도 등급이 올라갑니다.</p>

            </div>

            <div class="good-check-list-group">
                <div class="good-check-list">

                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">
                            무료로 나눠주셨어요.
                        </label>
                        </div>

                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">
                            상품상태가 설명한 것과 같아요.
                        </label>
                    </div>

                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">
                            상품설명이 자세해요.
                        </label>
                    </div>

                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">
                            좋은 상품을 저렴하게 판매해요.
                        </label>
                    </div>

                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">
                            시간 약속을 잘 지켜요.
                        </label>
                    </div>

                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">
                            응답이 빨라요.
                        </label>
                    </div>

                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">
                            친절하고 매너가 좋아요.
                        </label>
                    </div>

                </div>


            </div>


            <!-- 후기 완료 버튼 -->
            <div class="finish-button-group">
                <div class="finish-button">
                    <button class="finish" onClick="send_review()">후기 완료</button>

                </div>
            </div>
        </div>




        </div>




<script src="https://kit.fontawesome.com/f78786fc85.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">


function send_review() {            // 후기제출하기 버튼
    
    var del = confirm("후기를 완료하시겠습니까 ?");
    
    if (del) {
        alert("완료되었습니다.");
        return true;
    }
    
}

</script>

</body>
</html>
