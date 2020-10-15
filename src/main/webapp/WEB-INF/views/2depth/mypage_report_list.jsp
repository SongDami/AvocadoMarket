<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="getreportListURL" value="/restMenu/getreportList"></c:url>
<c:url var="deletereportURL" value="/restMenu/deletereport"></c:url>


<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Avocado Market 마이페이지</title>
</head>

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/mypage_report_list_style.css?ver=<%=System.currentTimeMillis()%>" />

<body>
   <div id="report_list"></div>
   <div class="clear"></div>

   <!-- 갤러리 하단 영역 -->
   <div class="report_board-pager">
   </div>
   <!-- 갤러리 하단 영역 끝 -->
   
<!--Google CDN 서버로부터 jQuery 참조 -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/pager.js"></script>
<script>
   var reportNowPgNum = 1;
   
   $(function() {
      mypage_report_list(reportNowPgNum);
   });

   function mypage_report_list(pg) {
      var contextPath = '<%= request.getContextPath() %>';
      
      var paramData = {
            nowPage      : pg,
            perPgLine    : 8
      };
      
      reportNowPgNum = pg;
      
      $.ajax({
         url : "${getreportListURL}"
         , type : "POST"
         , dataType :  "json"
         , data : paramData
         , success : function(result){
            console.log(result);
            if (result.status == "OK"){
               
               reportupdatePaging("mypage_report_list", pg, result.totalCount, result.perPgLine, 5);
   
               var htmls = "";
               
               if ( result.menuList.length > 0 ) {
                  result.menuList.forEach(function(e) {
         htmls += '<div class="report-item-group">'
         htmls += '<div class="report-item-list">'
         htmls += '<button type="submit" class="report-clear-btn" onClick="deletereport('+ e.???? +')">상품 삭제</button>'
         htmls += '<form action="'+contextPath+'/3depth/seller_list_page.do">'
         htmls += '<img src="'+contextPath+'/uploadimage'+e.thumbnailPath+'" class="img" />'
          htmls += '<input name="goods_id" type="hidden" value="'+e.member_id_to+'">'                      
          htmls += '</form>'
         htmls += '<br/>'
         htmls += '<div class="name-group">'
         htmls += '<span class="user-name"><a href="#">'+e.nick+'</a></span>'
         htmls += '</div>'
         htmls += '<div class="clear"></div>'
         htmls += '</div>'
         htmls += '</div>'
         
                  });
   
               } else {
                  htmls = '<p>조회결과가 없습니다.</p>';
               }
   
               $('#report_list').html(htmls);
            }
         },
         error : function(e) {
            console.log(e);
         }
      });
   }

   function reportupdatePaging(callFunc, page, allRowCnt, perPgLine, pgGrpCnt){
      var boardPager   = $('.report_board-pager');
      var   pager      = drawPager(callFunc, page, allRowCnt, perPgLine, pgGrpCnt);
            
      boardPager.empty();
      boardPager.append(pager);
   }

   // 신고 상품 삭제 버튼 alert
   function deletereport(value1) {

      if(!confirm("정말 신고 상품 삭제 하시겠습니까?")) {
         return false;
      }
      
      var paramData = {
         report_id : value1
      };
      
      $.ajax({
         url : "${deletereportURL}"
         , type : "POST"
         , dataType : "json"
         , data : paramData
         , success : function(result){
            console.log(result);
            if (result.status == "OK") {
               alert(result.returnMsg);
               mypage_report_list(reportNowPgNum);
            } else {
               alert(result.returnMsg);
               console.log("조회실패");
            }
         }
      });
   }



</script>

</body>