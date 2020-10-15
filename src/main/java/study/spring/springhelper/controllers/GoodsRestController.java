package study.spring.springhelper.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.springhelper.helper.PageData;
import study.spring.springhelper.helper.RegexHelper;
import study.spring.springhelper.helper.WebHelper;
import study.spring.springhelper.model.Category;
import study.spring.springhelper.model.Goods;
import study.spring.springhelper.model.Like;
import study.spring.springhelper.model.Members;
import study.spring.springhelper.service.CategoryService;
import study.spring.springhelper.service.GoodsService;
import study.spring.springhelper.service.LikeService;

@RestController
public class GoodsRestController {
    /** WebHelper 주입 */
    // --> import org.springframework.beans.factory.annotation.Autowired;
    // --> import study.spring.springhelper.helper.WebHelper;
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    // --> import study.spring.springhelper.helper.RegexHelper;
    @Autowired  RegexHelper regexHelper;

    /** Service 패턴 구현체 주입 */
    @Autowired  GoodsService goodsService;
    
    @Autowired CategoryService categoryService;
    
    @Autowired LikeService likeService;
    
    /** 목록 페이지 */
    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public Map<String, Object> get_list(HttpServletRequest request,
            // 카테고리
            @RequestParam(value = "category", required = false) String category,
            // 검색어
            @RequestParam(value = "keyword", required = false) String keyword,
            // 페이지 구현에서 사용할 현재 페이지 번호
            @RequestParam(value = "page", defaultValue = "1") int nowPage,
            
            @RequestParam(value = "dong", required = false) String dong){
        
        /** 1) 페이지 구현에 필요한 변수값 생성 */
        int totalCount = 0; // 전체 게시글 수
        int listCount = 12; // 한 페이지당 표시할 목록 수
        int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

        List<Goods> dongCountList = null; // 동별 상품갯수
        List<Category> categoryList = null; // 카테고리 목록 리스트
        
        /*---세션 불러오기 ----*/
        HttpSession session = request.getSession();
        Members loginInfo = (Members) session.getAttribute("loginInfo");
        
        int memNo = 0;

        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Goods input = new Goods();
        Like like = new Like();
        
        input.setCategory_type(category);
        input.setDong_name(dong);
        input.setGoods_name(keyword);
        input.setMember_id(memNo);
        
        
        if (loginInfo != null) {
            memNo = loginInfo.getMember_id();
            
            input.setMember_id(memNo);
        }

        List<Goods> output = null; // 조회결과가 저장될 객체
        PageData pageData = null;
        
        
        if (category == "전체상품") {
            category = null;
        }  
        
        input.setCategory_type(category);


        try {
            //likeService.addLike(like);

            // 전체 게시글 수 조회
             totalCount = goodsService.getGoodsCount(input); 
             goodsService.getGoodsCountList(input);
             // 페이지 번호 계산
             pageData = new PageData(nowPage, totalCount, listCount, pageCount);
             
             
          // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
             Goods.setOffset(pageData.getOffset());
             if (nowPage== 1) {
                 Goods.setListCount(listCount);
             } else {
                 Goods.setListCount(pageData.getListCount());
             }

            output = goodsService.getGoodsList(input);
            
            categoryList = categoryService.getCategoryList();
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 3) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("item", output);
        data.put("pageData", pageData);
        data.put("loginInfo", loginInfo);
        

        return webHelper.getJsonData(data);
    }
    
    

   
}

