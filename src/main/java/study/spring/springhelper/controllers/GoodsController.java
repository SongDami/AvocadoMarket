package study.spring.springhelper.controllers;

import java.util.List;


import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.springhelper.helper.PageData;
import study.spring.springhelper.helper.RegexHelper;
import study.spring.springhelper.helper.WebHelper;
import study.spring.springhelper.model.Category;
import study.spring.springhelper.model.Goods;
import study.spring.springhelper.model.Members;
import study.spring.springhelper.model.UploadImage;
import study.spring.springhelper.service.CategoryService;
import study.spring.springhelper.service.GoodsService;
import study.spring.springhelper.service.UploadService;

@Controller
public class GoodsController {
    /** WebHelper 주입 */
    // --> import org.springframework.beans.factory.annotation.Autowired;
    // --> import study.spring.springhelper.helper.WebHelper;
    @Autowired
    WebHelper webHelper;

    /** RegexHelper 주입 */
    // --> import study.spring.springhelper.helper.RegexHelper;
    @Autowired
    RegexHelper regexHelper;

    /** Service 패턴 구현체 주입 */
    // --> import study.spring.springhelper.service.GoodsService;
    @Autowired
    GoodsService goodsService;
    
    @Autowired
    CategoryService categoryService;
    
    @Autowired
    UploadService uploadService;


    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    // --> import org.springframework.beans.factory.annotation.Value;
    @Value("#{servletContext.contextPath}")
    String contextPath;

    /** 목록 페이지 */
    @RequestMapping(value = "/2depth/map.do", method = RequestMethod.GET)
    public ModelAndView list(Model model,HttpServletRequest request,
            // 카테고리
            @RequestParam(value = "category", required = false) String category,
            // 검색어
            @RequestParam(value = "keyword", required = false) String keyword,
            // 페이지 구현에서 사용할 현재 페이지 번호
            @RequestParam(value = "page", defaultValue = "1") int nowPage,
            // 동
            @RequestParam(value = "dong", required = false) String dong) {

        /** 1) 페이지 구현에 필요한 변수값 생성 */
        int totalCount = 0; // 전체 게시글 수
        int listCount = 12; // 한 페이지당 표시할 목록 수
        int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수
        
        Goods goods = new Goods();

        List<Goods> dongCountList = null; // 동별 상품갯수
        List<Category> categoryList = null; // 카테고리 목록 리스트
        
        
        /*---세션 불러오기 ----*/
        HttpSession session = request.getSession();
        Members loginInfo = (Members) session.getAttribute("loginInfo");
        
        int memNo = 0;
        String memDong = null;
        int goodsId = goods.getGoods_id();

        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)과 카테고리를 Beans에 담는다.
        Goods input = new Goods();
        UploadImage inputImage = new UploadImage();
        
        inputImage.setUpload_type("goods");
        inputImage.setUpload_id(goodsId);
        
        input.setGoods_name(keyword);
        input.setCategory_type(category);
        input.setMember_id(memNo);
        input.setDong_name(dong);

        if (loginInfo != null) {
            memNo = loginInfo.getMember_id();
            memDong = loginInfo.getDong_name();
            
            input.setMember_id(memNo);
            input.setDong_name(memDong);
        }

        List<Goods> output = null; // 조회결과가 저장될 객체
        PageData pageData = null; // 페이지 번호를 계산한 결과가 저장될 객체
        
        if (category == "전체상품") {
            category = null;
        }  
        
        input.setCategory_type(category);
        

        try {

            // 전체 게시글 수 조회
            totalCount = goodsService.getGoodsCount(input);
            dongCountList = goodsService.getGoodsCountList(input);

            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Goods.setOffset(pageData.getOffset()); 
            Goods.setListCount(pageData.getListCount());

            output = goodsService.getGoodsList(input);
            
            categoryList = categoryService.getCategoryList();
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) View 처리 */
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("keyword", keyword);
        model.addAttribute("output", output);
        model.addAttribute("pageData", pageData);
        model.addAttribute("category", category);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("loginInfo", loginInfo);
        model.addAttribute("dongN", input.getDong_name());
        
        return new ModelAndView("2depth/map");
    }


}
