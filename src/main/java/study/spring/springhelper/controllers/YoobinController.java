package study.spring.springhelper.controllers;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import study.spring.springhelper.helper.WebHelper;

@Controller
public class YoobinController {
	
	@Autowired
    WebHelper webHelper;
	
	 @RequestMapping(value = "/2depth/notice_tab.do", method = RequestMethod.GET)
	    public String notice_tab(Locale locale, Model model) {
        
		 return "2depth/notice_tab";
    }
	 
	 @RequestMapping(value = "/2depth/faq_tab.do", method = RequestMethod.GET)
	    public String faq_tab(Locale locale, Model model) {
     
		 return "2depth/faq_tab";
 }
	 
	 
	 @RequestMapping(value = "/4depth/noticeDetail.do", method = RequestMethod.GET)
	    public String noticeContents(Locale locale, Model model) {
     
		 return "4depth/noticeDetail";
 }
	 @RequestMapping(value = "/4depth/noticeDetail2.do", method = RequestMethod.GET)
	    public String noticeContents2(Locale locale, Model model) {
  
		 return "4depth/noticeDetail2";
}

	 @RequestMapping(value = "/4depth/noticeDetail3.do", method = RequestMethod.GET)
	    public String noticeContents3(Locale locale, Model model) {
  
		 return "4depth/noticeDetail3";
}

	 @RequestMapping(value = "/4depth/noticeDetail4.do", method = RequestMethod.GET)
	    public String noticeContents4(Locale locale, Model model) {
  
		 return "4depth/noticeDetail4";
}

	 @RequestMapping(value = "/4depth/noticeDetail5.do", method = RequestMethod.GET)
	    public String noticeContents5(Locale locale, Model model) {
  
		 return "4depth/noticeDetail5";
}
	 @RequestMapping(value = "/4depth/noticeDetail6.do", method = RequestMethod.GET)
	    public String noticeContents6(Locale locale, Model model) {

		 return "4depth/noticeDetail6";
}
	 @RequestMapping(value = "/4depth/noticeDetail7.do", method = RequestMethod.GET)
	    public String noticeContents7(Locale locale, Model model) {

		 return "4depth/noticeDetail7";
}
	 @RequestMapping(value = "/4depth/noticeDetail8.do", method = RequestMethod.GET)
	    public String noticeContents8(Locale locale, Model model) {

		 return "4depth/noticeDetail8";
}
	 @RequestMapping(value = "/4depth/noticeDetail9.do", method = RequestMethod.GET)
	    public String noticeContents9(Locale locale, Model model) {

		 return "4depth/noticeDetail9";
}
	 @RequestMapping(value = "/4depth/noticeDetail10.do", method = RequestMethod.GET)
	    public String noticeContents10(Locale locale, Model model) {

		 return "4depth/noticeDetail10";
}
	
	 @RequestMapping(value = "/2depth/terms_of_use.do", method = RequestMethod.GET)
	    public String termsOfUse(Locale locale, Model model) {
  
		 return "2depth/terms_of_use";
}

	 @RequestMapping(value = "/2depth/privacy_statement.do", method = RequestMethod.GET)
	    public String privacyStatement(Locale locale, Model model) {
  
		 return "2depth/privacy_statement";
}
	 @RequestMapping(value = "/2depth/team.do", method = RequestMethod.GET)
	    public String team(Locale locale, Model model) {

		 return "2depth/team";
}
}
