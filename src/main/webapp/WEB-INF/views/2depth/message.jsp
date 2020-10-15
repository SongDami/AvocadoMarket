<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%-- <%@ include file="/_inc/header.jsp"%> --%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Avocado Market 쪽지</title>
</head>

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/message_style.css?ver=<%=System.currentTimeMillis()%>" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet" />


<body>
    

<div class="container">

<div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>쪽지</h4>
            </div>
            <div class="top_bar">
              <div class="delete-group">
                <button class="delete" onclick="check()">삭제</button>
                </div>
            </div>
          </div>

          <div class="inbox_chat">



<form name="myform" action="" id="myform">
            <div class="chat_list active_chat">
                <div class="message-checkbox">
                    <input type="checkbox" value="" class="checkbox" name="check-list">
                </div>
              <div class="chat_people">
                <div class="chat_img"><img src="<%= request.getContextPath() %>/assets/img/user-blue.png" alt="photo"> </div>
                <div class="chat_ib">
                  <h5>헤조시 <span class="chat_date">방금 전</span></h5>
                  <p>그럼 1000원만 깎아드릴게요.</p>
                </div>
              </div>
            </div>



            <div class="chat_list">
              <div class="message-checkbox">
                    <input type="checkbox" value="" class="checkbox" name="check-list">
                </div>
              <div class="chat_people">
                <div class="chat_img"><img src="<%= request.getContextPath() %>/assets/img/user.png" alt="photo"> </div>
                <div class="chat_ib">
                  <h5>꼼꼼이 <span class="chat_date">10분 전</span></h5>
                  <p>저 꼼꼼인데요.. 그냥 무료로 주세요.</p>
                </div>
              </div>
            </div>





            <div class="chat_list">
              <div class="message-checkbox">
                    <input type="checkbox" value="" class="checkbox" name="check-list">
                </div>
              <div class="chat_people">
                <div class="chat_img"><img src="<%= request.getContextPath() %>/assets/img/user.png" alt="photo"> </div>
                <div class="chat_ib">
                  <h5>담칙잉 <span class="chat_date">2시간 전</span></h5>
                  <p>오천원에 주세요. 제가 계시는 곳 까지 갈게요 퓨ㅠㅠ제발요...제발요.....</p>
                </div>
              </div>
            </div>





            <div class="chat_list">
              <div class="message-checkbox">
                    <input type="checkbox" value="" class="checkbox" name="check-list">
                </div>
              <div class="chat_people">
                <div class="chat_img"><img src="<%= request.getContextPath() %>/assets/img/user.png" alt="photo"></div>
                <div class="chat_ib">
                  <h5>유경쓰 <span class="chat_date">1일 전</span></h5>
                  <p>다른 사진은 없나요 ? 제대로 안보여요</p>
                </div>
              </div>
            </div>





            <div class="chat_list">
              <div class="message-checkbox">
                    <input type="checkbox" value="" class="checkbox" name="check-list">
                </div>
              <div class="chat_people">
                <div class="chat_img"><img src="<%= request.getContextPath() %>/assets/img/user.png" alt="photo"></div>
                <div class="chat_ib">
                  <h5>아조시<span class="chat_date">1일 전</span></h5>
                  <p>자전거가 너무 타고 싶어요. 좀 싸게 깎아주세요ㅜㅜ </p>
                </div>
              </div>
            </div>





            <div class="chat_list">
              <div class="message-checkbox">
                    <input type="checkbox" value="" class="checkbox" name="check-list">
                </div>
              <div class="chat_people">
                <div class="chat_img"><img src="<%= request.getContextPath() %>/assets/img/user.png" alt="photo"> </div>
                <div class="chat_ib">
                  <h5>박씨<span class="chat_date">3일 전</span></h5>
                  <p>킹콩부대찌개 앞에서 봬요</p>
                </div>
              </div>
            </div>





            <div class="chat_list">
              <div class="message-checkbox">
                    <input type="checkbox" value="" class="checkbox" name="check-list">
                </div>
              <div class="chat_people">
                <div class="chat_img"><img src="<%= request.getContextPath() %>/assets/img/user.png" alt="photo"></div>
                <div class="chat_ib">
                  <h5>하늘보리맛있<span class="chat_date">7일 전</span></h5>
                  <p>저기요. 새 책이 아니잖아요 !!! </p>
                </div>
              </div>
            </div>




            <div class="chat_list">
              <div class="message-checkbox">
                    <input type="checkbox" value="" class="checkbox" name="check-list">
                </div>
              <div class="chat_people">
                <div class="chat_img"> <img src="<%= request.getContextPath() %>/assets/img/user.png" alt="photo"> </div>
                <div class="chat_ib">
                  <h5>훈규는훈규다<span class="chat_date">2주 전</span></h5>
                  <p>저기요.</p>
                </div>
              </div>
            </div>
            
            <div id="result"></div>
</form>



        <!-- 오른쪽 쪽지 화면 -->
          </div>
        </div>
        <div class="mesgs">

          <div class="message-header-box">
        <div class="message-content-name">
          <strong>헤조시</strong>
        </div>

        <div class="message-content-about">
          '자전거'에 대한 문의입니다.
        </div>
      </div>

          <div class="msg_history">
            <div class="history-group">
            <div class="incoming_msg">
              <div class="incoming_msg_img"><img src="<%= request.getContextPath() %>/assets/img/user-blue.png" alt="photo"></div>
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>안녕하세요. 자전거 사고 싶어요. 깎아주세요. ~~~~~~~~~!</p>
                  <span class="time_date"> 11:01 AM    |    June 9</span></div>
              </div>
            </div>
            <div class="outgoing_msg">
              <div class="sent_msg">
                <p>싫어요.</p>
                <span class="time_date"> 11:01 AM    |    June 9</span> </div>
            </div>
            <div class="incoming_msg">
              <div class="incoming_msg_img"><img src="<%= request.getContextPath() %>/assets/img/user-blue.png" alt="photo"></div>
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>왜요 ? 제가 가지러 갈게요.</p>
                  <span class="time_date"> 11:01 AM    |    Yesterday</span></div>
              </div>
            </div>
            <div class="outgoing_msg">
              <div class="sent_msg">
                <p>원래 가지러 오셔야 해요. 제가 어캐 들고 가죠 ????</p>
                <span class="time_date"> 11:01 AM    |    Today</span> </div>
            </div>
            <div class="incoming_msg">
              <div class="incoming_msg_img"><img src="<%= request.getContextPath() %>/assets/img/user-blue.png" alt="photo"> </div>
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>그럼 안살래요. ㅃㅇ</p>
                  <span class="time_date"> 11:01 AM    |    Today</span></div>
              </div>
            </div>

            <div class="outgoing_msg">
              <div class="sent_msg">
                <p>그럼 1000원만 깎아드릴게요.</p>
                <span class="time_date"> 11:01 AM    |    Today</span> </div>
            </div>



            </div>
                          <div class="type_msg">
                            <div class="input_msg_write">
                              <input type="text" class="write_msg" placeholder=" 메세지를 입력하세요." />
                              <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>

                            </div>
                            <button class="black-button" type="button" onClick="black_button()">차단</button>
                          </div>

          </div>

        </div>

      </div>

    </div>
  </div>

<%-- <%@ include file="/_inc/footer.jsp"%> --%>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">

function check() {
    
    var checkbox = document.getElementsByName('check-list');
    var chk = false;
    
    for (var i = 0 ; i < checkbox.length ; i++) {
        
        if(checkbox.length == 0) {
            
            alert("선택된 항목이 없습니다.");
            return false;
        }
        
        else {
            var result = confirm("정말 삭제하시겠습니까?");
            
            if(result) {
                alert("삭제되었습니다.");
                
                return true;
                
                
            } 
            else {
                alert("취소되었습니다.");
                
                return false;
            }
        }
    }
}



function black_button() {            // 차단 버튼 alert
    
    var del = confirm("정말 차단하시겠습니까?");
    
    if (del) {
        alert("차단되었습니다.");
        return true;
    }

    
    
}



</script>

</body>
</html>
