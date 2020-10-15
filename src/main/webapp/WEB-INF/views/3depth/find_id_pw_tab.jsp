<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Avocado Market 아이디,비밀번호 찾기</title>
</head>

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/find_id_pw_tab_style.css?ver=<%=System.currentTimeMillis()%>" />




<body>
<body>
    
    
    <div class="mytool">
    
    
    <div class="tab">
            
            <!-- 탭 버튼 영역 -->
            <ul class="tab-button clearfix">
            
                <li class="tab-button-item pull-left">
                    <a class="tab-button-item-link selected" href="#tab-find-id" >아이디 찾기</a>
                </li>
                
                <li class="tab-button-item pull-left">
                    <a class="tab-button-item-link" href="#tab-find-pw">비밀번호 찾기</a>
                </li>
            </ul>
            
            
            
            <!-- 내용 영역 -->
            <div class="tab-panel">
            
                <div id="tab-find-id">
                <%@ include file="/WEB-INF/views/3depth/find_id.jsp"%>
                
                

                </div>
                
                
                
                <div id="tab-find-pw" class="hide">
                    
                    <%@ include file="/WEB-INF/views/3depth/find_pw.jsp"%>
                    

                </div>
                
                
            </div>
            
        </div>
    
    </div>
    

 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- validate,sweetalert 플러그인 참조 -->
    <script src="<%=request.getContextPath()%>/assets/plugins/validate/jquery.validate.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/plugins/validate/additional-methods.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>

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
