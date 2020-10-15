<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<!-- 아래의 문장을 사용하면 검색어 노출이 안된다. -->
<!-- <meta name="robots" content="noindex"> -->

<!--SEO 태그들이다. 검색했을 때에 노출되는 검색어들이다. -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="description" content="좋은조의 아보카도마켓 프로젝트 페이지 입니다."/>
<meta name="keywords" content="조은조, 김혜조, 송다미, 임유빈, 이유경, 이젠IT아카데미,이젠컴퓨터아카데미" />
<meta name="author" content="조은조, 김혜조, 송다미, 임유빈, 이유경" />
<meta property="og:type" content="website" />
<meta property="og:title" content="Avocado Market" />
<meta property="og:description" content="좋은조의 아보카도마켓 프로젝트 페이지 입니다." />

<title>Avocado Market Director Header</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/non-responsive.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bs3-multi-columns-row.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/director_header_style.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/plugins/sweetalert/sweetalert2.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="//kit.fontawesome.com/79c58b9006.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>

<body>
<div class="directorheader">
    <header>

            <div class="logo">
                <a href="<%= request.getContextPath()%>/admin/1depth/director_main.jsp"><img src="<%= request.getContextPath() %>/assets/img/Logo.png" height="75px" />
                </a>

            </div>
            <div class="text">관리자 페이지</div>
            <div class="dropdown pull-right">
                <a href="<%= request.getContextPath()%>/admin/1depth/item_management.jsp"><button type="button" class="btn btn-success btn-lg">상품관리</button></a>
                <a href="<%= request.getContextPath()%>/admin/2depth/member_management.jsp"><button type="button" class="btn btn-success btn-lg">회원관리</button></a>
                <button type="button" class="btn btn-success btn-lg dropdown-toggle" data-toggle="dropdown">
                    아보카도님
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="<%= request.getContextPath()%>/admin/1depth/director_mypage.jsp">마이페이지</a></li>
                    <li id="dilogout"><a>로그아웃</a></li>
                </ul>
            </div>
            
    </header>
</div>
    <script src="<%=request.getContextPath()%>/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
    <script type="text/javascript">
    $(function(){
    	$("#dilogout").click(function(){
    		swal({
                html:'정말 로그아웃하겠습니까?',
                showCloseButton:true,
                confirmButton: true,
                confirmButtonText:'확인',
                confirmButtonColor:'#a00',
                showCancelButton:true,
                cancelButtonText:'취소',
                cancelButtonColor:'#f60'
            });
    			$('.swal2-confirm').click(function(){
    				window.location.href = "<%= request.getContextPath()%>/admin/1depth/director_logout.jsp"
              });
        });
    });
    </script>
   
</body>
</html>
