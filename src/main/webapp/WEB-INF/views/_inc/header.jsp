<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<!-- 아래의 문장을 사용하면 검색어 노출이 안된다. -->
<!-- <meta name="robots" content="noindex"> -->

<!--SEO 태그들이다. 검색했을 때에 노출되는 검색어들이다. -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="description" content="4조의 아보카도마켓 프로젝트 페이지 입니다."/>
<meta name="keywords" content="김혜조, 송다미, 임유빈 이젠IT아카데미,이젠컴퓨터아카데미" />
<meta name="author" content="김혜조, 송다미, 임유빈" />
<meta property="og:type" content="website" />
<meta property="og:title" content="Avocado Market" />
<meta property="og:description" content="4조의 아보카도마켓 프로젝트 페이지 입니다." />


<title>Avocado Market</title>
<!-- 웹브라우저에 뜨는 url기준이다. -->
<!--http://localhost:8080/프로젝트이름/폴더1/폴더2/파일이름 -->


<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/non-responsive.css" /> --%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bs3-multi-columns-row.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<!--Faviticon Chrome, Safari, IE --> 
<link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/img/favicon.ico">



<script type="text/javascript" src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//kit.fontawesome.com/79c58b9006.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

    <header>
    <div class="header-container">
        <div id="top1" class="clear">
            <div class="star">
                <a href="#" id="favorite" class="star"><i class="fas fa-star"></i>즐겨찾기</a>
                <script src="https://kit.fontawesome.com/15bed712b0.js" crossorigin="anonymous"></script>

            </div>

        </div>
        <div id="top2" class="clear">
            <div class="clear top-2">
                <div class="logo">
                    <a href="<%= request.getContextPath()%>/"><img src="<%= request.getContextPath() %>/assets/img/Logo.png" width="220px" height="150px"></a>
                </div>
                
                <form method="get" action="${pageContext.request.contextPath}/2depth/map.do">
                    <div class="search_bar">
                        <div class="inbar">
                            <input type="search" name="keyword" id="keyword" placeholder=" 상품명으로 검색" value="${keyword}">
                            <c:choose>
                                <c:when test="${param.dong != null && param.dong != '' }">
                                    <input type="hidden" name ="dong" value="${param.dong}">
                                </c:when>
                                <c:when test="${loginInfo != null && loginInfo != '' }">
                                    <input type="hidden" name ="dong" value="${loginInfo.dong_name}">
                                </c:when>
                            </c:choose>
                            <button class="search" type="submit"><i class="fas fa-search"></i></button>
                        </div>
                    </div>
                </form>
                <div class="mymenu">
                              
                    
                    <c:choose>
                        <c:when test="${loginInfo != null && loginInfo != '' }">
                        <a href="<%= request.getContextPath()%>/2depth/goods_up.do">상품등록 </a>
                         <a href="<%= request.getContextPath()%>/2depth/logout.do">로그아웃 </a>
                         <a href="<%= request.getContextPath()%>/2depth/mypage.do">마이페이지 </a>
                        </c:when>
                        <c:otherwise>
                        <a href="<%= request.getContextPath()%>/2depth/login.do">상품등록 </a>
                        <a href="<%= request.getContextPath()%>/2depth/login.do">로그인 </a>
                        <a href="<%= request.getContextPath()%>/2depth/login.do">마이페이지 </a>                  
                    </c:otherwise>
                    </c:choose>
                    
                    
 

                    <!--  <a href="<%= request.getContextPath()%>/3depth/join.do">회원가입</a>   -->
                </div>
            </div>
        </div>
        </div>
    </header>

    <script src="https://kit.fontawesome.com/f78786fc85.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
    
    function goMessage(){      
        var pop = window.open("<%= request.getContextPath() %>/2depth/message.do","pop","width=1200,height=810, scrollbars=yes, resizable=yes"); 
        }
    
    /* 즐겨찾기 추가 */
    $('#favorite').on('click', function(e) { 
        var bookmarkURL = window.location.href; 
        var bookmarkTitle = document.title;
        var triggerDefault = false;
        
        if (window.sidebar && window.sidebar.addPanel) { 
            // Firefox version < 23 
            window.sidebar.addPanel(bookmarkTitle, bookmarkURL, ''); 
        } else if ((window.sidebar && (navigator.userAgent.toLowerCase().indexOf('firefox') > -1)) || (window.opera && window.print)) { 
            // Firefox version >= 23 and Opera Hotlist 
            var $this = $(this); 
            $this.attr('href', bookmarkURL); 
            $this.attr('title', bookmarkTitle); 
            $this.attr('rel', 'sidebar'); 
            $this.off(e); 
            triggerDefault = true; 
        } else if (window.external && ('AddFavorite' in window.external)) { 
            // IE Favorite 
            window.external.AddFavorite(bookmarkURL, bookmarkTitle); 
        } else { 
            // WebKit - Safari/Chrome 
            alert((navigator.userAgent.toLowerCase().indexOf('mac') != -1 ? 'Cmd' : 'Ctrl') + '+D 키를 눌러 즐겨찾기에 등록하실 수 있습니다.'); 
        } 
        return triggerDefault; 
    });
    
    
    
    </script>