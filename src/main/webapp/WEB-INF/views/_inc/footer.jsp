<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<footer>

    <div class="footer-container">

         	<div class="footer-group">
             	<a href="<%= request.getContextPath()%>/2depth/team.do">팀소개</a>
             	<span>|</span>
             	<a href="<%= request.getContextPath()%>/2depth/terms_of_use.do">이용약관</a>
             	<span>|</span>
             	<a href="<%= request.getContextPath()%>/2depth/notice_tab.do">공지사항</a>
             	<span>|</span>
             	<a href="<%= request.getContextPath()%>/2depth/personal_main.do">문의하기</a>
             	<span>|</span>
             	<a href="<%= request.getContextPath()%>/2depth/faq_tab.do">자주묻는질문</a>
             	<span>|</span>
             	<a href="<%= request.getContextPath()%>/2depth/privacy_statement.do">개인정보처리 방침</a>
         	</div>



            <div class="footer-copy">
                <small>
                Copyright ⓒ Avocado Market. All rights reserved
                </small>
            </div>
    </div>

</footer>
</body>
</html>