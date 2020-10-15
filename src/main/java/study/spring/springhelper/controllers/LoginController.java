package study.spring.springhelper.controllers;

import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.springhelper.helper.RegexHelper;
import study.spring.springhelper.helper.WebHelper;
import study.spring.springhelper.model.Members;
import study.spring.springhelper.service.MembersService;

@Slf4j
@Controller

public class LoginController {

    @Inject
    @Autowired
    MembersService membersService;
    @Autowired
    WebHelper webHelper;
    @Autowired
    RegexHelper regexHelper;
    @Autowired
    SqlSession sqlSession;

    @Value("#{servletContext.contextPath}")
    String contextPath;


    // 리뷰(후기)
    @RequestMapping(value = "/3depth/review.do", method = RequestMethod.GET)
    public String review(Locale locale, Model model) {

        return "3depth/review";
    }

    // 회원가입
    // 화면
    @RequestMapping(value = "/3depth/join.do", method = RequestMethod.GET)
    public ModelAndView join(Locale locale, Model model) {

        return new ModelAndView("3depth/join");
    
    }
    // 액션
    @RequestMapping(value = "/3depth/join_ok.do", method = RequestMethod.POST)
    public ModelAndView join_ok(Model model,

            @RequestParam(value = "user_id", required = false) String user_id, 
            @RequestParam(value = "name", required = false) String name, 
            @RequestParam(value = "nick", required = false) String nick, 
            @RequestParam(value = "tel", required = false) String tel, 
            @RequestParam(value = "email", required = false) String email, 
            @RequestParam(value = "email_code", required = false) String email_code, 
            @RequestParam(value = "user_pw", required = false) String user_pw, 
            @RequestParam(value = "member_type", required = false) String member_type, 
            @RequestParam(value = "created_at", required = false) String created_at, 
            @RequestParam(value = "updated_at", required = false) String updated_at,
            @RequestParam(value = "deleted_at", required = false) String deleted_at, 
            @RequestParam(value = "dong_name", defaultValue = "0") String dong_name, 
            @RequestParam(value = "keyword_keyword_id", defaultValue = "0") int keyword_keyword_id) {

        // 파라미터 유효성 검사
        if (user_id.equals("")) { return webHelper.redirect(null, "아이디를 입력하세요."); }
        if (name.equals("")) { return webHelper.redirect(null, "이름을 입력하세요."); }
        if (nick.equals("")) { return webHelper.redirect(null, "닉네임을 입력하세요."); }
        if (!regexHelper.isKor(name)) { return webHelper.redirect(null, "이름은 한글만 가능합니다."); }
        if (!regexHelper.isEngNum(user_id)) { return webHelper.redirect(null, "아이디는 영어와 숫자로만 가능합니다."); }
        if (!regexHelper.isCellPhone(tel)) { return webHelper.redirect(null, "휴대폰 형식으로 입력하세요."); }

        // 데이터 저장 - 빈즈에 저장
        Members input = new Members();

        input.setUser_id(user_id);
        input.setName(name);
        input.setNick(nick);
        input.setTel(tel);
        input.setEmail(email);
        input.setEmail_code(email_code);
        input.setUser_pw(user_pw);
        input.setMember_type(member_type);
        input.setCreated_at(created_at);
        input.setUpdated_at(updated_at);
        input.setDeleted_at(deleted_at);
        input.setDong_name(dong_name);
        System.out.println("==dong_dong_id== : " + dong_name);

        try {
            membersService.addMembers(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        String redirectUrl = contextPath + "/2depth/login.do";
        return webHelper.redirect(redirectUrl, "회원가입 되었습니다.");
    }

    // 로그인
    // 화면
    @RequestMapping(value = "/2depth/login.do", method = RequestMethod.GET)
    public ModelAndView login(Model model, HttpServletRequest request) {

        return new ModelAndView("2depth/login");
    }

    // 액션
    @RequestMapping(value = "/2depth/login_ok.do", method = RequestMethod.POST)
    public ModelAndView login_ok(Model model, HttpServletRequest request,
            @RequestParam(value = "user_id", required = false) String user_id, 
            @RequestParam(value = "user_pw", required = false) String user_pw) {

        // 아이디
        if (user_id == null || user_id.contentEquals("")) 
        { return webHelper.redirect(null, "아이디를 입력하세요."); }
        // 비밀번호
        if (user_pw == null || user_pw.contentEquals("")) 
        { return webHelper.redirect(null, "비밀번호를 입력하세요."); }

        Members input = new Members();

        input.setUser_id(user_id);
        input.setUser_pw(user_pw);

        Members output = null;

        try {
            output = membersService.login(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        // 세션 객체 만들기
        HttpSession session = request.getSession();
        session.setAttribute("loginInfo", output);


        // 로그인 후 메인페이지로 이동함.
        request.getContextPath();
        String referer = (String) request.getContextPath();
        return webHelper.redirect(referer, "로그인 되었습니다.");

    }

    // 아이디,비밀번호 찾기 (탭)
    // 화면
    @RequestMapping(value = "/3depth/find_id_pw_tab.do", method = RequestMethod.GET)
    public ModelAndView find_id_pw_tab(Locale locale, Model model) {

        return new ModelAndView("3depth/find_id_pw_tab");

    }

    @RequestMapping(value = "/3depth/find_id_ok.do", method = RequestMethod.POST)
    public String find_id(Model model, HttpServletResponse response) {

        return "4depth/found_id";
    }

    @RequestMapping(value = "/3depth/find_id.do", method = RequestMethod.POST)
    public ModelAndView find_id_ok(Model model,

            @RequestParam(value = "name", required = false) String name, 
            @RequestParam(value = "email", required = false) String email) {

        if (name.equals("")) { return webHelper.redirect(null, "이름을 입력하세요."); }
        if (email.equals("")) { return webHelper.redirect(null, "이메일을 입력하세요."); }

        Members input = new Members();

        input.setName(name);
        input.setEmail(email);

        Members output = null;

        try {
            output = membersService.findId(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        return new ModelAndView("4depth/found_id");
    }

    // 비밀번호 찾기
    // 화면
    @RequestMapping(value = "/3depth/find_pw_ok.do", method = RequestMethod.POST)
    public ModelAndView find_pw(Model model, HttpServletResponse response) {

        return new ModelAndView("home");
    }

    // 액션 (비밀번호 찾기 )
    @RequestMapping(value = "/2depth/find_pw.do", method = RequestMethod.POST)
    public ModelAndView find_pw(Model model,

            @RequestParam(value = "name", required = false) String name, 
            @RequestParam(value = "email", required = false) String email, 
            @RequestParam(value = "user_id", required = false) String user_id) {

        if (name.equals("")) { return webHelper.redirect(null, "이름을 입력하세요."); }
        if (email.equals("")) { return webHelper.redirect(null, "이메일을 입력하세요."); }
        if (user_id.equals("")) { return webHelper.redirect(null, "아이디를 입력하세요."); }

        // 데이터 조회
        Members input = new Members();

        input.setName(name);
        input.setEmail(email);
        input.setUser_id(user_id);

        Members output = null;

        // 예외처리
        try {
            output = membersService.findId(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        // 리턴 값
        return new ModelAndView("2depth/login");
    }

    // 아이디 찾기 완료
    @RequestMapping(value = "/4depth/found_id.do", method = RequestMethod.GET)
    public String found_id(Locale locale, Model model) {

        return "4depth/found_id";
    }


    // 메세지
    @RequestMapping(value = "/2depth/message.do", method = RequestMethod.GET)
    public String message(Locale locale, Model model) {

        return "2depth/message";
    }

    
 // 회원정보 수정
    // 폼
    @RequestMapping(value = "/3depth/member_edit.do", method = RequestMethod.GET)
    public ModelAndView member_edit(Model model, HttpServletRequest request,
            @RequestParam(value = "member_id", defaultValue = "0") int member_id
            )throws Exception {

        HttpSession session = request.getSession();
        Members loginInfo = (Members) session.getAttribute("loginInfo");
        if (loginInfo == null) {
            return webHelper.redirect(null, "로그인이 필요합니다."); }

        int memNo = loginInfo.getMember_id();

        Members input = new Members();
        input.setMember_id(memNo);

       Members output = null;

        try {
            output = membersService.getMembersItem(input);

        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        // 3) View 처리 //
        model.addAttribute("output", output);
        model.addAttribute("loginInfo", loginInfo);
        return new ModelAndView("3depth/member_edit");

    }

      // 액션
       @RequestMapping(value = "/3depth/memer_edit_ok.do", method =RequestMethod.POST) 
       public ModelAndView member_edit_ok(Model model, HttpServletRequest request,
           @RequestParam(value = "nick", required = false) String nick, 
           @RequestParam(value = "tel", required = false) String tel, 
           @RequestParam(value = "email", required = false) String email, 
           @RequestParam(value = "user_pw", required = false) String user_pw, 
           @RequestParam(value = "updated_at", required = false) String updated_at,
           @RequestParam(value = "dong_name", required = false) String dong_name) {
           
           // 파라미터 유효성 검사
           if (nick.equals("")) { return webHelper.redirect(null, "닉네임을 입력하세요."); }
           if (tel.equals("")) { return webHelper.redirect(null, "전화번호를 입력하세요."); }
           if (!regexHelper.isCellPhone(tel)) { return webHelper.redirect(null, "휴대폰 형식으로 입력하세요."); }
           
           HttpSession session = request.getSession();
           Members loginInfo = (Members) session.getAttribute("loginInfo");
           
           int memNo = loginInfo.getMember_id();
       
           // 데이터 저장 - 빈즈에 저장 Members input = new Members();
           Members input = new Members();
           
           input.setMember_id(memNo);
           input.setNick(nick); 
           input.setTel(tel); 
           input.setEmail(email);           
           input.setUser_pw(user_pw);
           /* input.setMember_type(member_type); */
           input.setUpdated_at(updated_at);
           input.setDong_name(dong_name);

       try { 
               membersService.editMembers(input); 
           } catch (Exception e) { 
               return webHelper.redirect(null, e.getLocalizedMessage()); }
       
       String redirectUrl = contextPath + "/2depth/mypage.do"; 
       
       return webHelper.redirect(redirectUrl, "회원정보가 수정 되었습니다."); 
       }

    // 로그아웃
    @RequestMapping(value = "/2depth/logout.do", method = RequestMethod.GET)

    public String logout(HttpSession session) {
        // m으로 선언된 세션을 삭제시킨다.
        session.removeAttribute("loginInfo");
        // /페이지로 리다이렉트 시킨다.
        return "2depth/login";
    }

}