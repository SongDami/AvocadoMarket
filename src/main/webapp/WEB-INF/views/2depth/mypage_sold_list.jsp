<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<!doctype html>
<head>
    <meta charset="UTF-8" />
    <title>Avocado Market 마이페이지</title>
</head>

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/reset.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/mypage_sold_list_style.css?ver=<%=System.currentTimeMillis()%>" />



<body>



        <div class="sold-item-group">

            <div class="sold-item-list">
                <a href="<%= request.getContextPath()%>/2depth/goods_detail.do"><img src="//via.placeholder.com/250x250" class="img" /></a>
                <br/>
                <div class="name-price-group">
                <span class="name"><a href="#">물품 이름</a></span>
                <br/>
                <span class="price"><a href="#">8,000원</a></span>
                </div>
            <div class="clear"></div>
            <div class="sold-item-list-button-group">
                <div class="sold-item-list-button">
                    <div class="change">
                        <button type="submit" class="change-btn" onClick="item_update()">판매중으로 변경</button>
                        </div>
                    <div class="review">
                        <button type="submit" class="review-btn"><a href="<%= request.getContextPath()%>/3depth/review.do">후기 작성하기</a></button>
                    </div>
                    <div class="delete">
                        <button type="submit" class="delete-btn" onClick="item_delete()">삭제</button>
                    </div>
                </div>
            </div>
            </div>




            <div class="sold-item-list">
                <a href="<%= request.getContextPath()%>/2depth/goods_detail.do"><img src="//via.placeholder.com/250x250" class="img" /></a>
                <br/>
                <div class="name-price-group">
                <span class="name"><a href="#">물품 이름</a></span>
                <br/>
                <span class="price"><a href="#">8,000원</a></span>
                </div>
            <div class="clear"></div>
            <div class="sold-item-list-button-group">
                <div class="sold-item-list-button">

                    <div class="change">
                        <button type="submit" class="change-btn" onClick="item_update()">판매중으로 변경</button>
                        </div>
                    <div class="review">
                        <button type="submit" class="review-btn"><a href="<%= request.getContextPath()%>/3depth/review.do">후기 작성하기</a></button>
                    </div>
                    <div class="delete">
                        <button type="submit" class="delete-btn" onClick="item_delete()">삭제</button>
                    </div>
                </div>
            </div>
            </div>




            <div class="sold-item-list">
               <a href="<%= request.getContextPath()%>/2depth/goods_detail.do"><img src="//via.placeholder.com/250x250" class="img" /></a>
                <br/>
                <div class="name-price-group">
                <span class="name"><a href="#">물품 이름</a></span>
                <br/>
                <span class="price"><a href="#">8,000원</a></span>
                </div>
            <div class="clear"></div>
            <div class="sold-item-list-button-group">
                <div class="sold-item-list-button">

                    <div class="change">
                        <button type="submit" class="change-btn" onClick="item_update()">판매중으로 변경</button>
                        </div>
                    <div class="review">
                        <button type="submit" class="review-btn"><a href="<%= request.getContextPath()%>/3depth/review.do">후기 작성하기</a></button>
                    </div>
                    <div class="delete">
                        <button type="submit" class="delete-btn" onClick="item_delete()">삭제</button>
                    </div>
                </div>
            </div>
            </div>




            <div class="sold-item-list">
               <a href="<%= request.getContextPath()%>/2depth/goods_detail.do"><img src="//via.placeholder.com/250x250" class="img" /></a>
                <br/>
                <div class="name-price-group">
                <span class="name"><a href="#">물품 이름</a></span>
                <br/>
                <span class="price"><a href="#">8,000원</a></span>
                </div>
            <div class="clear"></div>
            <div class="sold-item-list-button-group">
                <div class="sold-item-list-button">

                    <div class="change">
                        <button type="submit" class="change-btn" onClick="item_update()">판매중으로 변경</button>
                        </div>
                    <div class="review">
                        <button type="submit" class="review-btn"><a href="<%= request.getContextPath()%>/3depth/review.do">후기 작성하기</a></button>
                    </div>
                    <div class="delete">
                        <button type="submit" class="delete-btn" onClick="item_delete()">삭제</button>
                    </div>
                </div>
            </div>
            </div>




            <div class="sold-item-list">
               <a href="<%= request.getContextPath()%>/2depth/goods_detail.do"><img src="//via.placeholder.com/250x250" class="img" /></a>
                <br/>
                <div class="name-price-group">
                <span class="name"><a href="#">물품 이름</a></span>
                <br/>
                <span class="price"><a href="#">8,000원</a></span>
                </div>
            <div class="clear"></div>
            <div class="sold-item-list-button-group">
                <div class="sold-item-list-button">

                    <div class="change">
                        <button type="submit" class="change-btn" onClick="item_update()">판매중으로 변경</button>
                        </div>
                    <div class="review">
                        <button type="submit" class="review-btn"><a href="<%= request.getContextPath()%>/3depth/review.do">후기 작성하기</a></button>
                    </div>
                    <div class="delete">
                        <button type="submit" class="delete-btn" onClick="item_delete()">삭제</button>
                    </div>
                </div>
            </div>
            </div>




            <div class="sold-item-list">
                <a href="<%= request.getContextPath()%>/2depth/goods_detail.do"><img src="//via.placeholder.com/250x250" class="img" /></a>
                <br/>
                <div class="name-price-group">
                <span class="name"><a href="#">물품 이름</a></span>
                <br/>
                <span class="price"><a href="#">8,000원</a></span>
                </div>
            <div class="clear"></div>
            <div class="sold-item-list-button-group">
                <div class="sold-item-list-button">

                    <div class="change">
                        <button type="submit" class="change-btn" onClick="item_update()">판매중으로 변경</button>
                        </div>
                    <div class="review">
                        <button type="submit" class="review-btn"><a href="<%= request.getContextPath()%>/3depth/review.do">후기 작성하기</a></button>
                    </div>
                    <div class="delete">
                        <button type="submit" class="delete-btn" onClick="item_delete()">삭제</button>
                    </div>
                </div>
            </div>
            </div>




            <div class="sold-item-list">
                <a href="<%= request.getContextPath()%>/2depth/goods_detail.do"><img src="//via.placeholder.com/250x250" class="img" /></a>
                <br/>
                <div class="name-price-group">
                <span class="name"><a href="#">물품 이름</a></span>
                <br/>
                <span class="price"><a href="#">8,000원</a></span>
                </div>
            <div class="clear"></div>
            <div class="sold-item-list-button-group">
                <div class="sold-item-list-button">

                    <div class="change">
                        <button type="submit" class="change-btn" onClick="item_update()">판매중으로 변경</button>
                        </div>
                    <div class="review">
                        <button type="submit" class="review-btn"><a href="<%= request.getContextPath()%>/3depth/review.do">후기 작성하기</a></button>
                    </div>
                    <div class="delete">
                        <button type="submit" class="delete-btn" onClick="item_delete()">삭제</button>
                    </div>
                </div>
            </div>
            </div>




            <div class="sold-item-list">
               <a href="<%= request.getContextPath()%>/2depth/goods_detail.do"><img src="//via.placeholder.com/250x250" class="img" /></a>
                <br/>
                <div class="name-price-group">
                <span class="name"><a href="#">물품 이름</a></span>
                <br/>
                <span class="price"><a href="#">8,000원</a></span>
                </div>
            <div class="clear"></div>
            <div class="sold-item-list-button-group">
                <div class="sold-item-list-button">

                    <div class="change">
                        <button type="submit" class="change-btn" onClick="item_update()">판매중으로 변경</button>
                        </div>
                    <div class="review">
                        <button type="submit" class="review-btn"><a href="<%= request.getContextPath()%>/3depth/review.do">후기 작성하기</a></button>
                    </div>
                    <div class="delete">
                        <button type="submit" class="delete-btn" onClick="item_delete()">삭제</button>
                    </div>
                </div>
            </div>
            </div>







        </div>
        <div class="clear"></div>


        <!-- 갤러리 하단 영역 -->
                        <div class="gallery-footer">
                            <div class="gallery-index">
                                <button class="prev-btn"><span>&lt;</span></button>
                                <ul class="index-list">
                                    <li><a class="index-indiv index-active">1</a></li>
                                    <li><a class="index-indiv">2</a></li>
                                    <li><a class="index-indiv">3</a></li>
                                    <li><a class="index-indiv">4</a></li>
                                    <li><a class="index-indiv">5</a></li>
                                    <li><a class="index-indiv">6</a></li>
                                    <li><a class="index-indiv">7</a></li>
                                </ul>
                                <button class="next-btn"><span>&gt;</span></button>
                            </div>
                        </div>
                        <!-- 갤러리 하단 영역 끝 -->




<script src="https://kit.fontawesome.com/f78786fc85.js" crossorigin="anonymous"></script>



<script type="text/javascript">

function item_update() { 
    
    var del = confirm("판매중으로 변경하시겠습니까?");
    
    if (del) {
        alert("판매중으로 변경되었습니다.");
        return true;
    }
    else {
        alert("취소되었습니다.");
        return false;
    }    
}


function item_delete() {
    
    var del = confirm("정말 삭제하시겠습니까?");
    
    if (del) {
        alert("삭제되었습니다.");
        return true;
    }
    else {
        alert("취소되었습니다.");
        return false;
    }
    
    
}


</script>



</body>

