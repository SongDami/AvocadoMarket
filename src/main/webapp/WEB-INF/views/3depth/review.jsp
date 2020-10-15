<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Avocado Market 후기 작성</title>
    
    </head>
    
    
    
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/review_style.css?ver=<%=System.currentTimeMillis()%>" />
    
    
<body>


<div class="mytool">

    <div class="title">
        <h1>후기 작성</h1>
    </div>
    
    <div class="review-write">
        <h3>ㅇㅇ님과의 거래는 어떠셨나요?<br/><br/>후기를 남겨주세요.</h3>
    </div>
    
    
    
    <!--탭 버튼 영역 -->
    <div class="tab">
    
        <ul class="tab-button clearfix">
        
            <li class="tab-button-item pull-left">
                <a class="tab-button-item-link selected" href="#tab-review-good-list"><i class="far fa-thumbs-up"></i></a>
            </li>
            
            <li class="tab-button-item pull-left">
                <a class="tab-button-item-link" href="#tab-review-bad-list"><i class="far fa-thumbs-down"></i></a>
            </li>
        
        </ul>
        
        
        
        <!-- 내용 영역 -->
        <div class="tab-panel">
        
            <div id="tab-review-good-list">
                <%@ include file="/WEB-INF/views/4depth/review_good.jsp" %>
            </div>
            
            
            <div id="tab-review-bad-list" class="hide">
                <%@ include file="/WEB-INF/views/4depth/review_bad.jsp" %>
            </div>
        
        </div>
    
    
    </div>


</div>



<script src="https://kit.fontawesome.com/f78786fc85.js" crossorigin="anonymous"></script>
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

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
</body>
</html>