<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
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
                            <button class="search" type="submit"><i class="fas fa-search"></i></button>
                        </div>
                    </div>
                </form>
                <c:choose>
                <div class="mymenu">
                <c:when test="${sessionScope.user_id = null}">
                    <a href="<%= request.getContextPath()%>/2depth/goods_up.do">상품등록 </a>
                    </c:when>
                    <c:when test="${sessionScope.user_id = null}">
                        <a href="<%= request.getContextPath()%>/2depth/login.do">로그인 </a>
                    </c:when>
                    
                    <c:when test="${sessionScope.user_id != null}">
                        <a href="<%= request.getContextPath()%>/2depth/logout.do">로그아웃 </a>
                    </c:when>
                    <c:when test="${sessionScope.user_id = null}">
                    <a href="<%= request.getContextPath()%>/2depth/mypage.do">마이페이지 </a>
                    </c:when>
                    <c:when test="${sessionScope.user_id = null}">
                    <a href="#" onClick="goMessage()">쪽지 </a>
                    </c:when>
                    <!--  <a href="<%= request.getContextPath()%>/3depth/join.do">회원가입</a>   -->
                </c:choose>
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