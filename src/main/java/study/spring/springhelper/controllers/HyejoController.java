package study.spring.springhelper.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.omg.CORBA.SystemException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import study.spring.springhelper.helper.PageData;
import study.spring.springhelper.helper.RegexHelper;
import study.spring.springhelper.helper.WebHelper;
import study.spring.springhelper.model.Black;
import study.spring.springhelper.model.Comment;
import study.spring.springhelper.model.GoodsDtl;
import study.spring.springhelper.model.GoodsUp;
import study.spring.springhelper.model.Like;
import study.spring.springhelper.model.Main;
import study.spring.springhelper.model.Members;
import study.spring.springhelper.model.UploadImage;
import study.spring.springhelper.service.BlackService;
import study.spring.springhelper.service.CommentService;
import study.spring.springhelper.service.GoodsDtlService;
import study.spring.springhelper.service.GoodsUpService;
import study.spring.springhelper.service.LikeService;
import study.spring.springhelper.service.MainService;
import study.spring.springhelper.service.MembersService;
import study.spring.springhelper.service.UploadService;

@Controller
public class HyejoController {

	@Autowired
	WebHelper webHelper;

	@Autowired
	RegexHelper regexHelper;

	@Autowired
	GoodsUpService goodsupService;

	@Autowired
	UploadService uploadService;

	@Autowired
	GoodsDtlService goodsDtlService;

	@Autowired
	CommentService commentService;

	@Autowired
	MainService mainService;

	@Autowired
	BlackService blackService;

	@Autowired
	LikeService likeService;

	@Autowired
	MembersService membersService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	public Members getSessionData(HttpServletRequest request) throws Exception {
		// 로그인 세션 가져오기
		HttpSession session = request.getSession();
		Members sessMembers = (Members) session.getAttribute("loginInfo");
		
		// 세션여부 체크
		if (null == sessMembers) {
			sessMembers = new Members();
			sessMembers.setMember_id(0);
		} else {
			sessMembers.getMember_id();
		}
		
		return sessMembers;
	}
	
	// 판매자 프로필 페이지
	@RequestMapping(value = "/3depth/seller_list_page.do", method = RequestMethod.GET)
	public ModelAndView seller_list_page(Model model, HttpServletRequest request,
			@RequestParam(value = "member_id", defaultValue = "0") int member_id
	) throws Exception {
		Members input = new Members();
		
		input.setMember_id(member_id); // 선택한 판매자 아이디
		Members output = new Members();
		
		try {
			output = membersService.getselectgoods(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
	
		model.addAttribute("item", output);
		
		return new ModelAndView("3depth/seller_list_page");
	}
	
	
	// 1대1 질문
	@RequestMapping(value = "/2depth/personal_main.do", method = RequestMethod.GET)
	public String personal_main(Locale locale, Model model) throws Exception {
		return "/2depth/personal_main";
	}

	/**
	 * 마이페이지====================================================================================================
	 */

	/** 마이페이지 */
	@RequestMapping(value = "/2depth/mypage.do", method = RequestMethod.GET)
	public ModelAndView mypage(Model model, HttpServletRequest request,
			@RequestParam(value = "member_id", defaultValue = "0") int member_id,
			@RequestParam(value = "goods_id", defaultValue = "0") int goods_id
	) throws Exception {
		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
			//return webHelper.redirect(null, "로그인이 필요합니다.");
		}

		Members input = new Members();
		
		input.setMember_id(sessMembers.getMember_id()); // 로그인한 사람의 아이디
		Members output = new Members();
		
		try {
			output = membersService.getselectgoods(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
	
		model.addAttribute("item", output);
		
		// 마이페이지로 이동
		return new ModelAndView("2depth/mypage");
	}

	/**
	 * 상품====================================================================================================
	 */

	/** 상세페이지 */
	@RequestMapping(value = "/2depth/goods_detail.do", method = RequestMethod.GET)
	public ModelAndView goods_detail(Model model, HttpServletRequest request,
			@RequestParam(value = "goods_id", defaultValue = "0") int goods_id,
			@RequestParam(value = "page", defaultValue = "1") int nowPage) throws Exception {

		/** 1) 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (goods_id == 0) {
			return webHelper.redirect(null, "존재하지 않는 상품입니다. 다시 선택해주세요");
		}
		
		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			//return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
			//return webHelper.redirect(null, "로그인이 필요합니다.");
		}
		
		GoodsUp inputGoodsUp = new GoodsUp();
		UploadImage inputImage = new UploadImage();
//		Main inputMain = new Main();

		inputGoodsUp.setGoods_id(goods_id);
		inputGoodsUp.setMember_id(sessMembers.getMember_id());

		inputImage.setUpload_type("goods");
		inputImage.setUpload_id(goods_id);

		GoodsDtl output1 = null; // 상품 상세
		List<UploadImage> output2 = new ArrayList<UploadImage>(); // 업로드 이미지
//		List<Main> output4 = new ArrayList<Main>(); // 메인(인기,신규,추천)

		try {

			output1 = goodsDtlService.getGoodsDtl(inputGoodsUp);
			output2 = uploadService.getUploadImageList(inputImage);
//			output4 = mainService.getMainTopList(inputMain);
			goodsDtlService.updatehit(inputGoodsUp); // 조회수 1 증가
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// 3) View 처리 //
		model.addAttribute("output1", output1);
		model.addAttribute("output2", output2);
//		model.addAttribute("output4", output4);

		return new ModelAndView("2depth/goods_detail");
	}

	/** 작성 폼 페이지, 카테고리 조회 필요 */
	@RequestMapping(value = "/2depth/goods_up.do", method = RequestMethod.GET)
	public ModelAndView add(Model model, HttpServletRequest request) throws Exception {

		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
//			return webHelper.redirect(null, "로그인이 필요합니다.");
		}

		return new ModelAndView("2depth/goods_up");
	}

	/** 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/2depth/goods_up_ok.do", method = RequestMethod.POST)
	public ModelAndView goods_up_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "goods_name", required = false) String goods_name,
			@RequestParam(value = "goods_content", required = false) String goods_content,
			@RequestParam(value = "price", defaultValue = "0") int price,
			@RequestParam(value = "category_category_id", required = false) String category_category_id,
			@RequestParam(value = "state", required = false) String state,
			@RequestParam(value = "buyer_member_id", required = false) String buyer_member_id,
			@RequestParam(value = "hit", defaultValue = "0") int hit,
			@RequestParam(required = false) MultipartFile[] goods_img,
			@RequestParam(value = "created_at", required = false) String created_at,
			@RequestParam(value = "updated_at", defaultValue = "0") String updated_at,
			@RequestParam(value = "deleted_at", defaultValue = "0") String deleted_at,
			@RequestParam(value = "member_id", required = false, defaultValue = "1") int member_id,
			@RequestParam(value = "dong_dong_id", required = false, defaultValue = "1") int dong_dong_id,
			@RequestParam(value = "keyword_name", required = false, defaultValue = "키워드") String keyword_name
	) throws Exception {
		
		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			//return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
			return webHelper.redirect(null, "로그인이 필요합니다.");
		}
		

		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		if (goods_name.equals("")) {
			return webHelper.redirect(null, "제목을 입력하세요.");
		}
		if (goods_content.equals("")) {
			return webHelper.redirect(null, "내용을 입력하세요.");
		}
		if ("".equals(category_category_id)) {
			return webHelper.redirect(null, "카테고리를 선택하세요.");
		}

		// 숫자형으로 선언된 파라미터()
		if (price == 0) {
			return webHelper.redirect(null, "가격을 입력하세요.");
		}
		if (price < 0) {
			return webHelper.redirect(null, "가격은 0보다 작을 수 없습니다.");
		}

		String upload_type = "goods";

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		GoodsUp input = new GoodsUp();

		input.setGoods_name(goods_name);
		input.setGoods_content(goods_content);
		input.setPrice(price);
		input.setCategory_category_id(category_category_id);
		input.setState(state);
		input.setBuyer_member_id(buyer_member_id);
		input.setHit(hit);
		input.setCreated_at(created_at);
		input.setUpdated_at(updated_at);
		input.setDeleted_at(deleted_at);
		input.setMember_id(sessMembers.getMember_id());
		input.setDong_dong_id(dong_dong_id);
		input.setKeyword_name(keyword_name);

		try {
			// 데이터 저장 시작
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			goodsupService.addGoodsUp(input);

			/** 1) 이미지 업로드 처리 */
			List<UploadImage> list = null;
			list = webHelper.saveMultipartFile_avo(goods_img);

			/** 2) 이미지 업로드 된 항목 수 만큼 반복을 수행하면서 원본 파일 경로와 썸네일 이미지의 경로를 설정한다. */
			for (int i = 0; i < list.size(); i++) {
				UploadImage item = list.get(i);

				item.setUpload_type(upload_type);
				item.setUpload_id(input.getGoods_id());
				item.setFile_seq(i+1);

				// 컨텐츠 형식에 "image"라는 단어가 포함된 경우에만 진행
				if (item.getContentType().indexOf("image") > -1) {
					// 썸네일 이미지 생성
					String thumbnailPath = null;

					try {
						thumbnailPath = webHelper.createThumbnail(item.getFilePath(), 240, 240, true);
					} catch (Exception e) {
						e.printStackTrace();
						return webHelper.redirect(null, "썸네일 생성에 실패했습니다.");
					}

					// 썸네일 경로를 웹상에 노출 가능한 형태로 보정
					String thumbnailUrl = webHelper.getUploadUrl(thumbnailPath);
					item.setThumbnailPath(thumbnailPath);
					item.setThumbnailUrl(thumbnailUrl);
				}

				// 원본 파일의 경로를 웹상에 노출 가능한 형태로 보정
				String fileUrl = webHelper.getUploadUrl(item.getFilePath());
				item.setFileUrl(fileUrl);

				// 첨부파일 등록
				uploadService.addUploadItem(item);
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
			return webHelper.redirect(null, "업로드 된 파일이 없습니다.-밖-");
		} catch (Exception e) {
			e.printStackTrace();
			return webHelper.redirect(null, "업로드에 실패했습니다.-밖-");
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/2depth/goods_detail.do?goods_id=" + input.getGoods_id();
		return webHelper.redirect(redirectUrl, "저장되었습니다.");
//		return new ModelAndView("2depth/goods_up");
	}

	/** 상품수정 폼 /4depth/goods_edit.do?goods_id=1 */
	@RequestMapping(value = "/4depth/goods_edit.do", method = RequestMethod.GET)
	public ModelAndView goods_edit(Model model, HttpServletRequest request,
			@RequestParam(value = "goods_id", defaultValue = "0") int goods_id
	) throws Exception {
		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
			//return webHelper.redirect(null, "로그인이 필요합니다.");
		}

		/** 1) 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (goods_id == 0) {
			return webHelper.redirect(null, "존재하지 않는 상품입니다. 다시 선택해주세요");
		}

		GoodsUp inputGoodsUp = new GoodsUp();
		UploadImage inputImage = new UploadImage();

		inputGoodsUp.setGoods_id(goods_id);

		inputImage.setUpload_type("goods");
		inputImage.setUpload_id(goods_id);

		GoodsDtl output1 = null; // 상품 상세
		List<UploadImage> output2 = new ArrayList<UploadImage>(); // 업로드 이미지

		try {

			output1 = goodsDtlService.getGoodsDtl(inputGoodsUp);
			output2 = uploadService.getUploadImageList5(inputImage);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// 3) View 처리 //
		model.addAttribute("output1", output1);
		model.addAttribute("output2", output2);

		return new ModelAndView("4depth/goods_edit");

	}

	/** 상품 수정 액션 */
	@RequestMapping(value = "/4depth/goods_edit_ok.do", method = RequestMethod.POST)
	public ModelAndView goods_edit_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "goods_id", required = false) int goods_id,
			@RequestParam(value = "goods_name", required = false) String goods_name,
			@RequestParam(value = "goods_content", required = false) String goods_content,
			@RequestParam(value = "price", defaultValue = "0") int price,
			@RequestParam(value = "category_category_id", required = false) String category_category_id,
			@RequestParam(value = "state", required = false) String state,
			@RequestParam(value = "buyer_member_id", required = false) String buyer_member_id,
			@RequestParam(value = "hit", defaultValue = "0") int hit,
			@RequestParam(required = false) MultipartFile[] goods_img,
			@RequestParam(value = "created_at", required = false) String created_at,
			@RequestParam(value = "updated_at", defaultValue = "0") String updated_at,
			@RequestParam(value = "deleted_at", defaultValue = "0") String deleted_at,
			@RequestParam(value = "member_id", required = false, defaultValue = "1") int member_id,
			@RequestParam(value = "dong_dong_id", required = false, defaultValue = "1") int dong_dong_id,
			@RequestParam(value = "keyword_name", required = false, defaultValue = "키워드") String keyword_name,
			@RequestParam(value = "img_edit", required = false, defaultValue = "N") String img_edit
	) throws Exception {
		
		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			//return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
			return webHelper.redirect(null, "로그인이 필요합니다.");
		}

		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		if (goods_name.equals("")) {
			return webHelper.redirect(null, "제목을 입력하세요.");
		}
		if (goods_content.equals("")) {
			return webHelper.redirect(null, "내용을 입력하세요.");
		}
		if ("".equals(category_category_id)) {
			return webHelper.redirect(null, "카테고리를 선택하세요.");
		}

		// 숫자형으로 선언된 파라미터()
		if (price == 0) {
			return webHelper.redirect(null, "가격을 입력하세요.");
		}
		if (price < 0) {
			return webHelper.redirect(null, "가격은 0보다 작을 수 없습니다.");
		}

		String upload_type = "goods";

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		GoodsUp input = new GoodsUp();

		input.setGoods_id(goods_id);
		input.setGoods_name(goods_name);
		input.setGoods_content(goods_content);
		input.setPrice(price);
		input.setCategory_category_id(category_category_id);
		input.setState(state);
		input.setBuyer_member_id(buyer_member_id);
		input.setHit(hit);
		input.setCreated_at(created_at);
		input.setUpdated_at(updated_at);
		input.setDeleted_at(deleted_at);
		input.setMember_id(sessMembers.getMember_id());
		input.setDong_dong_id(dong_dong_id);
		input.setKeyword_name(keyword_name);

		try {
			// 데이터 저장 시작
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			goodsupService.editGoodsUp(input);

			// 수정하여 등록한 첨부파일이 있는 갯수 카운트
			int imgSize = 0;
			int delImgCnt = 0;
			
			for (int i=0; i<goods_img.length; i++) {
				if (!"".equals(goods_img[i].getOriginalFilename())) {
					imgSize++;
				} else {
					delImgCnt++;
				}
			}

			if (imgSize > 5) {
				return webHelper.redirect(null, "첨부파일은 5개까지 등록할 수 있습니다.");
			}
			
			if (imgSize > 0) { // 첨부파일이 있는 경우
				/** 1) 이미지 업로드 처리 */
				List<UploadImage> list = null;
				list = webHelper.saveMultipartFile_avo(goods_img);
				/** 2) 이미지 업로드 된 항목 수 만큼 반복을 수행하면서 원본 파일 경로와 썸네일 이미지의 경로를 설정한다. */

				// file 테이블 삭제
				UploadImage deleteItem = new UploadImage();
				deleteItem.setUpload_type("goods");
				deleteItem.setUpload_id(goods_id);
				uploadService.delUploadItem(deleteItem); // 해당 goods 의 file 테이블을 일괄 삭제
				
				// file 다시 등록
				for (int i = 0; i < list.size(); i++) {
					UploadImage item = list.get(i);

					item.setUpload_type(upload_type);
					item.setUpload_id(input.getGoods_id());
					item.setFile_seq(i+1);

					// 컨텐츠 형식에 "image"라는 단어가 포함된 경우에만 진행
					if (item.getContentType().indexOf("image") > -1) {
						// 썸네일 이미지 생성
						String thumbnailPath = null;

						try {
							thumbnailPath = webHelper.createThumbnail(item.getFilePath(), 240, 240, true);
						} catch (Exception e) {
							e.printStackTrace();
							return webHelper.redirect(null, "썸네일 생성에 실패했습니다.");
						}

						// 썸네일 경로를 웹상에 노출 가능한 형태로 보정
						String thumbnailUrl = webHelper.getUploadUrl(thumbnailPath);
						item.setThumbnailPath(thumbnailPath);
						item.setThumbnailUrl(thumbnailUrl);
					}

					// 원본 파일의 경로를 웹상에 노출 가능한 형태로 보정
					String fileUrl = webHelper.getUploadUrl(item.getFilePath());
					item.setFileUrl(fileUrl);

					// 첨부파일 등록
					uploadService.addUploadItem(item);
				}
			}
			
			if (delImgCnt == 5 && "Y".equals(img_edit)) {
				// file 테이블 삭제
				UploadImage deleteItem = new UploadImage();
				deleteItem.setUpload_type("goods");
				deleteItem.setUpload_id(goods_id);
				uploadService.delUploadItem(deleteItem); // 해당 goods 의 file 테이블을 일괄 삭제
				
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
			return webHelper.redirect(null, "업로드 된 파일이 없습니다.-밖-");
		} catch (Exception e) {
			e.printStackTrace();
			return webHelper.redirect(null, "업로드에 실패했습니다.-밖-");
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/2depth/goods_detail.do?goods_id=" + input.getGoods_id();
		return webHelper.redirect(redirectUrl, "저장되었습니다.");
//		return new ModelAndView("2depth/goods_up");
	}
}
