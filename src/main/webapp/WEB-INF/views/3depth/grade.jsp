<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Avocado Market 등급</title>
</head>


<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/grade_style.css?ver=<%=System.currentTimeMillis()%>" />



<body>
    <div class="mytool">
        <div class="title">
            <h1>등급 안내</h1>
        </div>
            <!--  탭 영역  -->
            <div class="tab">
                <!--  탭 버튼 영역  -->
                <ul class="tab-button clearfix">
                    <li class="tab-button-item pull-left">
                        <a class="tab-button-item-link selected" href="#tab-grade1-list">등급1</a>
                    </li>
                    
                    <li class="tab-button-item pull-left">
                        <a class="tab-button-item-link" href="#tab-grade2-list">등급2</a>
                    </li>
                    
                    <li class="tab-button-item pull-left">
                        <a class="tab-button-item-link" href="#tab-grade3-list">등급3</a>
                    </li>
                </ul>

                <!-- 내용 영역 -->
                <div class="tab-panel">
                    <div id="tab-grade1-list">
                        <span class="grade-content"> 등급1 판매완료 100개 이상 회원 </span>
                    </div>
                    
                    <div id="tab-grade2-list" class="hide">
                        <span class="grade-content"> 등급2 판매완료 50개 이상 회원 </span>
                    </div>
                    
                    <div id="tab-grade3-list" class="hide">
                        <span class="grade-content"> 등급3 판매완료 10개 이상 회원 </span>
                    </div>
                </div>
            </div>
    </div>



<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

$(function() {
   
    // 탭버튼의 클릭 처리
    $(".tab-button-item-link").click(function(e){
        e.preventDefault();
        
        // 클릭 된 요소를 제외한 나머지에게 seleced 클래스 제거하기. 
        $(".tab-button-item-link").not(this).removeClass("selected");
        
        // 클릭 된 요소에세 seleced 클래스 적용
        $(this).addClass("selected");
        
        var target = $(this).attr('href');
        $(target).removeClass('hide');
        $(".tab-panel > div").not($(target)).addClass('hide');
    });
});


</script>
    
</body>
</html>