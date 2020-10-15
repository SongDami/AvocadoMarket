<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Avocado Market 후기 작성</title>
    
    </head>
    
    
    
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/review_bad_style.css?ver=<%=System.currentTimeMillis()%>" />
    
<body>



    <div class="container">
        <!-- <div class="review-title-group">
            <div class="review-title">
                <h1>후기 작성</h1>
            </div>

            <div class="review-write">
                <h3>ㅇㅇ님과의 거래는 어떠셨나요 ? <br/><br/>후기를 남겨주세요.</h3>
            </div>

            </div>


        버튼
        <div class="review-button-group">
            <div class="good-button">

                <i class="far fa-thumbs-up"></i>

            </div>

            <div class="bad-button">

                <i class="far fa-thumbs-down"></i>

            </div>

        </div>
        <div class="clear"></div>
 -->


        <!-- 후기 체크 리스트 -->
        <div class="bad-review-list-group">
            <div class="bad-review-list">
                <h3>남기고 싶은 불만을 선택해 주세요.</h3>
                <p>불만이 쌓이면 아보카도 등급이 떨어집니다.</p>

            </div>

            <div class="bad-check-list-group">
                <div class="bad-check-list">

                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">
                            약속장소에 나타나지 않았어요.
                        </label>
                        </div>

                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">
                            시간약속을 안 지켜요.
                        </label>
                    </div>

                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">
                            무리하게 가격을 깎아요.
                        </label>
                    </div>

                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">
                            무조건 택배거래만 하려고 해요.
                        </label>
                    </div>

                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">
                            너무 늦은 시간,새벽에 연락해요.
                        </label>
                    </div>

                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">
                            질문해도 답이 없어요.
                        </label>
                    </div>

                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">
                            상품 가치없는 물건을 팔아요.
                        </label>
                    </div>

                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">
                            상품 상태가 설명과 달라요.
                        </label>
                    </div>

                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">
                            불친절해요.
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
