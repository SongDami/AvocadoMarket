package study.spring.springhelper.controllers;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.springhelper.helper.RegexHelper;
import study.spring.springhelper.helper.WebHelper;
import study.spring.springhelper.model.Comment;
import study.spring.springhelper.model.GoodsDtl;
import study.spring.springhelper.model.GoodsUp;
import study.spring.springhelper.model.Main;
import study.spring.springhelper.model.UploadImage;
import study.spring.springhelper.service.MainService;
import study.spring.springhelper.service.UploadService;

@Slf4j
@Controller
public class HomeController {

    @Autowired WebHelper webHelper;
    @Autowired RegexHelper regexHelper;
    @Autowired SqlSession sqlSession;
    
	/** Service 패턴 구현체 주입 */
	@Autowired
	UploadService uploadService;
	
	/** Service 패턴 구현체 주입 */
	@Autowired
	MainService mainService;
    
	//메인페이지(home)- 인기상품,신규상품,추천상품 
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home(Locale locale, Model model,
    		@RequestParam(value = "goods_id", defaultValue = "0") int goods_id
    ) {
        
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
        String formattedDate = dateFormat.format(date);
        
        //=========인기상품,신규상품,추천상품 ===============//
        UploadImage inputImage = new UploadImage();
        Main inputMain = new Main();

        inputImage.setUpload_type("goods");
        inputImage.setUpload_id(goods_id);

        List<Main> output2 = new ArrayList<Main>();       //메인(인기)
        List<Main> output3 = new ArrayList<Main>();       //메인(신규)
        List<Main> output4 = new ArrayList<Main>();       //메인(추천)

        try {
	        output2 = mainService.getMainTopList(inputMain);
	        output3 = mainService.getMainNewList(inputMain);
	        output4 = mainService.getKeywordList(inputMain);
	        
        } 
        catch (Exception e) { 
        	return webHelper.redirect(null,e.getLocalizedMessage()); 
        }

       //   3) View 처리  // 
     	model.addAttribute("output2", output2); 
     	model.addAttribute("output3", output3); 
     	model.addAttribute("output4", output4); 
     	
     	//=========인기상품,신규상품,추천상품 ===============//
     	
        model.addAttribute("serverTime", formattedDate);
        
        return new ModelAndView("home");
    }

}

