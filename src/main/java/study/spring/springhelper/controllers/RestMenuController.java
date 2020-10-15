package study.spring.springhelper.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import study.spring.springhelper.helper.PageData;
import study.spring.springhelper.helper.WebHelper;
import study.spring.springhelper.model.Black;
import study.spring.springhelper.model.Comment;
import study.spring.springhelper.model.GoodsUp;
import study.spring.springhelper.model.Like;
import study.spring.springhelper.model.Main;
import study.spring.springhelper.model.Members;
import study.spring.springhelper.model.UploadImage;
import study.spring.springhelper.service.BlackService;
import study.spring.springhelper.service.CommentService;
import study.spring.springhelper.service.GoodsUpService;
import study.spring.springhelper.service.LikeService;
import study.spring.springhelper.service.MainService;
import study.spring.springhelper.service.MembersService;
import study.spring.springhelper.service.UploadService;

@RestController
@RequestMapping("/restMenu")
public class RestMenuController {

	@Autowired
	WebHelper webHelper;

	@Autowired
	GoodsUpService goodsupService;

	@Autowired
	UploadService uploadService;

	@Autowired
	BlackService blackService;

	@Autowired
	LikeService likeService;

	@Autowired
	CommentService commentService;
	
	@Autowired
	MembersService membersService;

	@Autowired
	MainService mainService;

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
	
	/** =======================중복검사=========================== */
	
    /** 아이디 중복검사 (jQuery Form Validate 플러그인용) */
    // controller에서 out 객체의 출력결과를 웹브라우저에게 전달할 수 있게 하는 옵션
    @RequestMapping(value = "/id_unique_check_jquery", method = RequestMethod.POST)
    public Map<String, Object> id_unique_check_jquery(HttpServletResponse response,
            // 아이디
            @RequestParam(value = "user_id", required = false) String user_id) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();

        Members input = new Members();
        input.setUser_id(user_id);

        try {
            membersService.idUniqueCheck(input);

    		result.put("status", "OK");
    		result.put("returnMsg", "사용 가능합니다.");
        } catch (Exception e) {
			result.put("status", "False");
			result.put("returnMsg", "중복되었습니다.");
        }
        
        return result;

    }
    
    /** 닉네임 중복검사 (jQuery Form Validate 플러그인용) */
    // controller에서 out 객체의 출력결과를 웹브라우저에게 전달할 수 있게 하는 옵션
    @RequestMapping(value = "/nick_unique_check_jquery", method = RequestMethod.POST)
    public Map<String, Object> nick_unique_check_jquery(HttpServletResponse response,
            @RequestParam(value = "nick", required = false) String nick) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();

        Members input = new Members();
        input.setNick(nick);

        try {
            membersService.nickCheck(input);
    		result.put("status", "OK");
    		result.put("returnMsg", "사용 가능합니다.");
    		
        } catch (Exception e) {
			result.put("status", "False");
			result.put("returnMsg", "중복되었습니다.");
        }
        
        return result;
    }
    
    /** 이메일 중복검사 (jQuery Form Validate 플러그인용) */
    @RequestMapping(value = "/email_unique_check_jquery", method = RequestMethod.POST)
    public Map<String, Object> email_unique_check_jquery(HttpServletResponse response,
            @RequestParam(value = "email", required = false) String email) {
    	
		Map<String, Object> result = new HashMap<String, Object>();

        Members input = new Members();
        input.setEmail(email);

        try {
            membersService.emailUniqueCheck(input);
    		result.put("status", "OK");
    		result.put("returnMsg", "사용 가능합니다.");
    		
        } catch (Exception e) {
			result.put("status", "False");
			result.put("returnMsg", "중복되었습니다.");
        }
        
        return result;
    }
	/** =======================마이페이지=========================== */

	/** 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/editMypage", method = RequestMethod.POST)
	public Map<String, Object> editMypage(Model model, HttpServletRequest request,
			@RequestParam(required = false) MultipartFile[] image_Input,
			@RequestParam(value = "member_id", required = false, defaultValue = "1") int member_id
	) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		
		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			result.put("status", "False");
			result.put("returnMsg", "로그인이 필요합니다.");

			return result;
		}
		System.out.println("member_id가 넘어와야함" + member_id);
		System.out.println("image_Input.length?" + image_Input.length);
		
		String upload_type = "member";

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		GoodsUp input = new GoodsUp();

		input.setMember_id(sessMembers.getMember_id());

		try {
			/** 1) 이미지 업로드 처리 */
			List<UploadImage> list = null;
			list = webHelper.saveMultipartFile_avo(image_Input);

			/** 2) 이미지 업로드 된 항목 수 만큼 반복을 수행하면서 원본 파일 경로와 썸네일 이미지의 경로를 설정한다. */
			for (int i = 0; i < list.size(); i++) {
				UploadImage item = list.get(i);

				item.setUpload_type(upload_type);
				item.setUpload_id(sessMembers.getMember_id());
				item.setFile_seq(i+1);

				// 컨텐츠 형식에 "image"라는 단어가 포함된 경우에만 진행
				if (item.getContentType().indexOf("image") > -1) {
					// 썸네일 이미지 생성
					String thumbnailPath = null;

					try {
						thumbnailPath = webHelper.createThumbnail(item.getFilePath(), 240, 240, true);
					} catch (Exception e) {
						e.printStackTrace();
						result.put("status", "False");
						result.put("returnMsg", "썸네일 생성에 실패했습니다.");

						return result;
					}

					// 썸네일 경로를 웹상에 노출 가능한 형태로 보정
					String thumbnailUrl = webHelper.getUploadUrl(thumbnailPath);
					item.setThumbnailPath(thumbnailPath);
					item.setThumbnailUrl(thumbnailUrl);
				}

				// 원본 파일의 경로를 웹상에 노출 가능한 형태로 보정
				String fileUrl = webHelper.getUploadUrl(item.getFilePath());
				item.setFileUrl(fileUrl);

				// file 테이블 삭제
				UploadImage deleteItem = new UploadImage();
				deleteItem.setUpload_type(upload_type);
				deleteItem.setUpload_id(sessMembers.getMember_id());
				uploadService.delUploadItem(deleteItem); // 해당 goods 의 file 테이블을 일괄 삭제
				
				// 첨부파일 등록
				uploadService.addUploadItem(item);
			}
			result.put("status", "OK");
		} catch (NullPointerException e) {
			e.printStackTrace();
			result.put("status", "False");
			result.put("returnMsg", "업로드 된 파일이 없습니다.-밖-");

			return result;
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
			result.put("returnMsg", "업로드에 실패했습니다.-밖-");

			return result;
		}
		
		return result;
	}
	
	/** =======================판매자프로필=========================== */
	// 판매목록 조회 화면
	@RequestMapping(value = "/getSellerSaleList", method = RequestMethod.POST)
	public Map<String, Object> getSellerSaleList(HttpServletRequest request,
			@RequestParam(value = "member_id", defaultValue = "0") int member_id,
			@RequestParam(value = "nowPage", defaultValue = "1") int nowPage,
			@RequestParam(value = "perPgLine", defaultValue = "8") int perPgLine
	) throws Exception {

		Members sessMembers = getSessionData(request);

		Map<String, Object> result = new HashMap<String, Object>();

		int totalCount = 0; // 전체 게시글 수

		List<GoodsUp> output = null; // 조회결과가 저장될 객체

		GoodsUp input = new GoodsUp();

		input.setMember_id(member_id); // 판매자 프로필 id
		input.setLogin_id(sessMembers.getMember_id()); // 로그인한 사람의 id

		try {

			// 전체 게시글 수 조회
			totalCount = goodsupService.getSaleListCnt(input);

			int startRow = (nowPage - 1) * 8;

			input.setStartRow(startRow);
			input.setPerPgLine(perPgLine);

			// 데이터 조회하기
			output = goodsupService.getGoodsUpListSale(input);

			result.put("menuList", output);
			result.put("status", "OK");
			result.put("totalCount", totalCount);
			result.put("perPgLine", perPgLine);
		} catch (Exception e) {
			result.put("status", "False");
		}

		return result;
	}

	/** =======================신고하기=========================== */
	// 신고리스트 등록
	@RequestMapping(value = "/reportcomment", method = RequestMethod.POST)
	public Map<String, Object> reportcomment(HttpServletRequest request,
			@RequestParam(value = "member_id", required = false) int member_id,
			@RequestParam(value = "goods_id", required = false, defaultValue = "1") int goods_id) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			result.put("status", "False");
			result.put("returnMsg", "로그인이 필요합니다.");

			return result;
		}

		Comment input = new Comment();

		input.setMember_id(member_id);
		input.setGoods_id(goods_id);
		input.setMember_id(sessMembers.getMember_id());

		try {
			commentService.addComment(input);
			result.put("status", "OK");
			result.put("returnMsg", "댓글이 등록 되었습니다.");
		} catch (Exception e) {
			result.put("status", "False");
			result.put("returnMsg", "댓글 등록에 실패하였습니다.");
		}

		return result;
	}
	
	
	
	// 신고리스트 조회 화면
	@RequestMapping(value = "/getreportList", method = RequestMethod.POST)
	public Map<String, Object> getreportList(HttpServletRequest request,
			@RequestParam(value = "nowPage", defaultValue = "1") int nowPage,
			@RequestParam(value = "perPgLine", defaultValue = "8") int perPgLine) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			// return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
			// return webHelper.redirect(null, "로그인이 필요합니다.");
			result.put("status", "False");
			result.put("returnMsg", "로그인이 필요합니다.");

			return result;
		}

		int totalCount = 0; // 전체 게시글 수

		List<Black> output = null; // 조회결과가 저장될 객체

		Black input = new Black();

		input.setMember_id_from(sessMembers.getMember_id());

		try {
			// 전체 게시글 수 조회
			totalCount = blackService.getReportCount(input);

			int startRow = (nowPage - 1) * 8;

			input.setStartRow(startRow);
			input.setPerPgLine(perPgLine);

			// 데이터 조회하기
			output = blackService.getReportList(input);

			result.put("menuList", output);
			result.put("status", "OK");
			result.put("totalCount", totalCount);
			result.put("perPgLine", perPgLine);
		} catch (Exception e) {
			result.put("status", "False");
		}

		return result;
	}

	/** =======================신고하기=========================== */

	/** =======================댓글=========================== */
	// 댓글 등록
	@RequestMapping(value = "/insertcomment", method = RequestMethod.POST)
	public Map<String, Object> insertcomment(HttpServletRequest request,
			@RequestParam(value = "goods_c_content", required = false) String goods_c_content,
			@RequestParam(value = "goods_id", required = false, defaultValue = "1") int goods_id) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			// return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
			// return webHelper.redirect(null, "로그인이 필요합니다.");
			result.put("status", "False");
			result.put("returnMsg", "로그인이 필요합니다.");

			return result;
		}

		Comment input = new Comment();

		input.setGoods_c_content(goods_c_content);
		input.setGoods_id(goods_id);
		input.setMember_id(sessMembers.getMember_id());

		try {
			commentService.addComment(input);
			result.put("status", "OK");
			result.put("returnMsg", "댓글이 등록 되었습니다.");
		} catch (Exception e) {
			result.put("status", "False");
			result.put("returnMsg", "댓글 등록에 실패하였습니다.");
		}

		return result;
	}

	// 댓글 조회
	@RequestMapping(value = "/selectcomment", method = RequestMethod.POST)
	public Map<String, Object> selectcomment(HttpServletRequest request, @RequestParam(value = "goods_id") int goods_id,
			@RequestParam(value = "limitCnt", required = false, defaultValue = "5") int limitCnt) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		Members sessMembers = getSessionData(request);

		Comment input = new Comment();

		List<Comment> output = null; // 조회결과가 저장될 객체
		int cmtCount = 0;

		input.setGoods_id(goods_id);
		input.setMember_id(sessMembers.getMember_id());
		input.setLimitCnt(limitCnt);

		try {
			output = commentService.getCommentList(input);
			cmtCount = commentService.getCommentCount(input);

			result.put("commentList", output);
			result.put("cmtCount", cmtCount);
			result.put("status", "OK");
		} catch (Exception e) {
			result.put("status", "False");
			result.put("returnMsg", "댓글 조회에 실패했습니다.");
		}

		return result;
	}

	// 댓글 수정
	@RequestMapping(value = "/updatecomment", method = RequestMethod.POST)
	public Map<String, Object> updatecomment(HttpServletRequest request,
			@RequestParam(value = "goods_comment_id", required = false, defaultValue = "1") int goods_comment_id,
			@RequestParam(value = "goods_c_content", required = false) String goods_c_content) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			// return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
			// return webHelper.redirect(null, "로그인이 필요합니다.");
			result.put("status", "False");
			result.put("returnMsg", "로그인이 필요합니다.");

			return result;
		}

		Comment input = new Comment();

		input.setMember_id(sessMembers.getMember_id());
		input.setGoods_comment_id(goods_comment_id);
		input.setGoods_c_content(goods_c_content);

		try {
			commentService.editComment(input);
			result.put("status", "OK");
			result.put("returnMsg", "댓글이 수정 되었습니다.");
		} catch (Exception e) {
			result.put("status", "False");
			result.put("returnMsg", "댓글 수정에 실패하였습니다.");
		}

		return result;
	}

	// 댓글 삭제
	@RequestMapping(value = "/deletecomment", method = RequestMethod.POST)
	public Map<String, Object> deletecomment(HttpServletRequest request,
			@RequestParam(value = "goods_comment_id", required = false, defaultValue = "1") int goods_comment_id)
			throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			// return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
			// return webHelper.redirect(null, "로그인이 필요합니다.");
			result.put("status", "False");
			result.put("returnMsg", "로그인이 필요합니다.");

			return result;
		}

		Comment input = new Comment();

		input.setMember_id(sessMembers.getMember_id());
		input.setGoods_comment_id(goods_comment_id);

		try {
			commentService.deleteComment(input);
			result.put("status", "OK");
			result.put("returnMsg", "댓글이 정상적으로 삭제 되었습니다.");
		} catch (Exception e) {
			result.put("status", "False");
			result.put("returnMsg", "댓글 삭제에 실패하였습니다.");
		}

		return result;
	}

	/** =======================댓글=========================== */

	/** =======================판매목록=========================== */
	// 판매목록 조회 화면
	@RequestMapping(value = "/getMenuList", method = RequestMethod.POST)
	public Map<String, Object> getMenuList(HttpServletRequest request,
			@RequestParam(value = "nowPage", defaultValue = "1") int nowPage,
			@RequestParam(value = "perPgLine", defaultValue = "8") int perPgLine) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			// return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
			// return webHelper.redirect(null, "로그인이 필요합니다.");
			// result.put("status", "False");
			// result.put("returnMsg", "로그인이 필요합니다.");

			webHelper.redirect(null, "로그인이 필요합니다.");

			return result;
		}

		int totalCount = 0; // 전체 게시글 수

		List<GoodsUp> output = null; // 조회결과가 저장될 객체

		GoodsUp input = new GoodsUp();

		input.setMember_id(sessMembers.getMember_id());

		try {

			// 전체 게시글 수 조회
			totalCount = goodsupService.getSaleListCnt(input);

			int startRow = (nowPage - 1) * 8;

			input.setStartRow(startRow);
			input.setPerPgLine(perPgLine);

			// 데이터 조회하기
			output = goodsupService.getGoodsUpListSale(input);

			result.put("menuList", output);
			result.put("status", "OK");
			result.put("totalCount", totalCount);
			result.put("perPgLine", perPgLine);
		} catch (Exception e) {
			result.put("status", "False");
		}

		return result;
	}

	/** 판매상태 변경 처리 */
	@RequestMapping(value = "/mypage_dropbox_update", method = RequestMethod.POST)
	public Map<String, Object> mypage_dropbox_update(HttpServletRequest request,
			@RequestParam(value = "goods_id", required = false, defaultValue = "1") int goods_id,
			@RequestParam(value = "state", required = false, defaultValue = "1") String state) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			// return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
			// return webHelper.redirect(null, "로그인이 필요합니다.");
			result.put("status", "False");
			result.put("returnMsg", "로그인이 필요합니다.");

			return result;
		}

		GoodsUp input = new GoodsUp();

		input.setMember_id(sessMembers.getMember_id());
		input.setGoods_id(goods_id);
		input.setState(state);

		try {
			goodsupService.dropboxGoodsUp(input);
			result.put("status", "OK");
			result.put("returnMsg", "정상적으로 판매상태가 변경 되었습니다.");
		} catch (Exception e) {
			result.put("status", "False");
			result.put("returnMsg", "판매상태 변경에 실패하였습니다.");
		}

		return result;
	}

	/** 판매상품 삭제 처리 */
	@RequestMapping(value = "/mypage_sale_list_delete", method = RequestMethod.POST)
	public Map<String, Object> mypage_sale_list_delete(HttpServletRequest request,
			@RequestParam(value = "goods_id", required = false, defaultValue = "1") int goods_id) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			// return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
			// return webHelper.redirect(null, "로그인이 필요합니다.");
			result.put("status", "False");
			result.put("returnMsg", "로그인이 필요합니다.");

			return result;
		}

		GoodsUp input = new GoodsUp();

		input.setMember_id(sessMembers.getMember_id());
		input.setGoods_id(goods_id);

		try {
			goodsupService.deleteGoodsUp(input);
			result.put("status", "OK");
			result.put("returnMsg", "상품이 정상적으로 삭제 되었습니다.");
		} catch (Exception e) {
			result.put("status", "False");
			result.put("returnMsg", "상품 삭제에 실패하였습니다.");
		}

		return result;
	}

	/** =======================판매목록=========================== */

	/** =======================관심상품 =========================== */
	// 관심상품 조회 화면
	@RequestMapping(value = "/getlikeList", method = RequestMethod.POST)
	public Map<String, Object> getlikeList(HttpServletRequest request,
			@RequestParam(value = "nowPage", defaultValue = "1") int nowPage,
			@RequestParam(value = "perPgLine", defaultValue = "8") int perPgLine) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			// return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
			// return webHelper.redirect(null, "로그인이 필요합니다.");
			result.put("status", "False");
			result.put("returnMsg", "로그인이 필요합니다.");

			return result;
		}

		int totalCount = 0; // 전체 게시글 수

		List<Like> output = null; // 조회결과가 저장될 객체

		Like input = new Like();

		input.setMember_id(sessMembers.getMember_id());

		try {
			// 전체 게시글 수 조회
			totalCount = likeService.getLikeCount(input);

			int startRow = (nowPage - 1) * 8;

			input.setStartRow(startRow);
			input.setPerPgLine(perPgLine);

			// 데이터 조회하기
			output = likeService.getLikeList(input);

			result.put("menuList", output);
			result.put("status", "OK");
			result.put("totalCount", totalCount);
			result.put("perPgLine", perPgLine);

		} catch (Exception e) {
			result.put("status", "False");
		}

		return result;
	}

	/** 좋아요 등록 처리 */
	@RequestMapping(value = "/addLike", method = RequestMethod.POST)
	public Map<String, Object> addLike(HttpServletRequest request,
			@RequestParam(value = "goods_id", required = false, defaultValue = "1") int goods_id) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			// return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
			// return webHelper.redirect(null, "로그인이 필요합니다.");
			result.put("status", "False");
			result.put("returnMsg", "로그인이 필요합니다.");

			return result;
		}

		Like input = new Like();

		input.setMember_id(sessMembers.getMember_id()); // 좋아요 하는 사람
		input.setGoods_id(goods_id); // 상품아이디

		try {
			likeService.addLike(input);
			result.put("status", "OK");
			result.put("like_yn", "Y");
			result.put("like_id", input.getLike_id());
			result.put("returnMsg", "정상적으로 찜하기 되었습니다.");
		} catch (Exception e) {
			result.put("status", "False");
			result.put("returnMsg", "찜하기에 실패했습니다.");
		}

		return result;
	}

	/** 좋아요 해제 */
	@RequestMapping(value = "/deleteLike", method = RequestMethod.POST)
	public Map<String, Object> deleteLike(HttpServletRequest request,
			@RequestParam(value = "goods_id", required = false, defaultValue = "1") int goods_id) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			// return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
			// return webHelper.redirect(null, "로그인이 필요합니다.");
			result.put("status", "False");
			result.put("returnMsg", "로그인이 필요합니다.");

			return result;
		}

		Like input = new Like();

		input.setMember_id(sessMembers.getMember_id()); // 좋아요 하는 사람
		input.setGoods_id(goods_id);

		try {
			likeService.deleteLike(input);
			result.put("status", "OK");
			result.put("like_yn", "N");
			result.put("returnMsg", "정상적으로 찜하기가 해제 되었습니다.");
		} catch (Exception e) {
			result.put("status", "False");
			result.put("returnMsg", "찜하기 해제에 실패했습니다.");
		}

		return result;
	}

	/** =======================관심상품=========================== */

	/** =======================블랙리스트=========================== */
	// 신고리스트 등록
	@RequestMapping(value = "/blackcomment", method = RequestMethod.POST)
	public Map<String, Object> blackcomment(HttpServletRequest request,
			@RequestParam(value = "member_id_to", required = false) int member_id_to
	) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			result.put("status", "False");
			result.put("returnMsg", "로그인이 필요합니다.");

			return result;
		}

		Black input = new Black();

		input.setMember_id_to(member_id_to);
		input.setMember_id_from(sessMembers.getMember_id());

		try {
			int resultNum = blackService.addBlack(input);
			
			if (resultNum == 9999) {
				result.put("status", "OK");
				result.put("returnMsg", "이미 차단된 사용자입니다.");
				
				return result;
			}
			result.put("status", "OK");
			result.put("returnMsg", "차단이 되었습니다.");
		} catch (Exception e) {
			result.put("status", "False");
			result.put("returnMsg", "차단 하기에 실패하였습니다.");
		}

		return result;
	}
	
	// 블랙리스트 조회 화면
	@RequestMapping(value = "/getblackList", method = RequestMethod.POST)
	public Map<String, Object> getblackList(HttpServletRequest request,
			@RequestParam(value = "nowPage", defaultValue = "1") int nowPage,
			@RequestParam(value = "perPgLine", defaultValue = "8") int perPgLine) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			// return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
			// return webHelper.redirect(null, "로그인이 필요합니다.");
			result.put("status", "False");
			result.put("returnMsg", "로그인이 필요합니다.");

			return result;
		}

		int totalCount = 0; // 전체 게시글 수

		List<Black> output = null; // 조회결과가 저장될 객체

		Black input = new Black();

		input.setMember_id_from(sessMembers.getMember_id());

		try {
			// 전체 게시글 수 조회
			totalCount = blackService.getBlackCount(input);

			int startRow = (nowPage - 1) * 8;

			input.setStartRow(startRow);
			input.setPerPgLine(perPgLine);

			// 데이터 조회하기
			output = blackService.getBlackList(input);

			result.put("menuList", output);
			result.put("status", "OK");
			result.put("totalCount", totalCount);
			result.put("perPgLine", perPgLine);
		} catch (Exception e) {
			result.put("status", "False");
		}

		return result;
	}

	/** 신고하기 등록 처리 */
	@RequestMapping(value = "/addReport", method = RequestMethod.POST)
	public Map<String, Object> addReport(HttpServletRequest request,
			@RequestParam(value = "goods_id", required = false, defaultValue = "1") int goods_id,
			@RequestParam(value = "member_id_to", required = false, defaultValue = "1") int member_id_to,
			@RequestParam(value = "black_state", required = false, defaultValue = "1") String black_state)
			throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			// return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
			// return webHelper.redirect(null, "로그인이 필요합니다.");
			result.put("status", "False");
			result.put("returnMsg", "로그인이 필요합니다.");

			return result;
		}

		// 신고자와 신고대상자는 같을 수 없음
		if (member_id_to == sessMembers.getMember_id()) {
			result.put("status", "False");
			result.put("returnMsg", "자기 자신은 신고할 수 없습니다.");
			return result;
		}

		Black input = new Black();

		input.setBlack_type("신고");
		input.setBlack_state(black_state); // 신고상태
		// A : 광고(신청홍보, 낚시글, 도배글)
		// B : 물품정보 부정확(카테고리, 가격, 사진)
		// C : 거래금지 품목(담배, 주류, 장물)
		// D : 언어폭력(비방, 욕설, 성희롱)
		// E : 기타사유
		// F : 거래사기(1:1질문)
		input.setMember_id_from(sessMembers.getMember_id()); // 신고하는 사람
		input.setMember_id_to(member_id_to); // 신고당한 사람
		input.setGoods_id(goods_id); // 신고당한 상품

		try {
			int resultNum = blackService.addReport(input);
			
			if (resultNum == 9999) {
				result.put("status", "OK");
				result.put("returnMsg", "이미 신고된 상품입니다.");
				
				return result;
			}
			blackService.deleteReport(input); // 신고 누적 갯수가 10건 이상인 상품 삭제
			result.put("status", "OK");
			result.put("returnMsg", "정상적으로 신고 되었습니다.");
		} catch (Exception e) {
			result.put("status", "False");
			result.put("returnMsg", "신고에 실패하였습니다.");
		}

		return result;
	}

	/** 블랙리스트 해제 */
	@RequestMapping(value = "/deleteBlack", method = RequestMethod.POST)
	public Map<String, Object> deleteBlack(HttpServletRequest request,
			@RequestParam(value = "black_id", required = false, defaultValue = "1") int black_id
	) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		Members sessMembers = getSessionData(request);
		if (sessMembers.getMember_id() == 0) {
			// return webHelper.redirect(contextPath + "/2depth/login.do", "로그인이 필요합니다.");
			// return webHelper.redirect(null, "로그인이 필요합니다.");
			result.put("status", "False");
			result.put("returnMsg", "로그인이 필요합니다.");

			return result;
		}

		Black input = new Black();

		input.setBlack_id(black_id); // 블랙 key
		input.setMember_id_from(sessMembers.getMember_id()); // 신고하는 사람

		try {
			blackService.deleteBlack(input);
			result.put("status", "OK");
			result.put("returnMsg", "정상적으로 차단해제 되었습니다.");
		} catch (Exception e) {
			result.put("status", "False");
			result.put("returnMsg", "차단 해제에 실패하였습니다.");
		}

		return result;
	}

	/** =======================블랙리스트=========================== */

	/** =======================인기상품 4건=========================== */

	// 인기상품 4건 조회
	@RequestMapping(value = "/getPopularList", method = RequestMethod.POST)
	public Map<String, Object> getPopularList(HttpServletRequest request) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();
		Members sessMembers = getSessionData(request);

		Main inputMain = new Main();
		List<Main> output = new ArrayList<Main>(); // 메인(인기)
		inputMain.setMember_id(sessMembers.getMember_id());

		try {
			output = mainService.getMainTopList(inputMain);

			result.put("popularList", output);
			result.put("status", "OK");
		} catch (Exception e) {
			result.put("status", "False");
		}

		return result;
	}

	// 신규상품 4건 조회
	@RequestMapping(value = "/getNewList", method = RequestMethod.POST)
	public Map<String, Object> getNewList(HttpServletRequest request) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();
		Members sessMembers = getSessionData(request);

		Main inputMain = new Main();
		List<Main> output = new ArrayList<Main>(); // 메인(신규)
		inputMain.setMember_id(sessMembers.getMember_id());

		try {
			output = mainService.getMainNewList(inputMain);

			result.put("newList", output);
			result.put("status", "OK");
		} catch (Exception e) {
			result.put("status", "False");
		}

		return result;
	}

	// 추천상품 4건 조회
	@RequestMapping(value = "/getRecommendList", method = RequestMethod.POST)
	public Map<String, Object> getKeywordList(HttpServletRequest request) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();
		Members sessMembers = getSessionData(request);

		Main inputMain = new Main();
		List<Main> output = new ArrayList<Main>(); // 메인(추천)
		inputMain.setMember_id(sessMembers.getMember_id());

		try {
			output = mainService.getKeywordList(inputMain);

			result.put("recommendList", output);
			result.put("status", "OK");
		} catch (Exception e) {
			result.put("status", "False");
		}

		return result;
	}

}