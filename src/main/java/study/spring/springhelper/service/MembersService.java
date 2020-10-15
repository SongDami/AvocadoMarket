package study.spring.springhelper.service;

import java.util.List;

import study.spring.springhelper.model.Members;

public interface MembersService {
	// 마이페이지 닉네임&이미지, 판매자프로필 닉네임&이미지
	public Members getselectgoods(Members input) throws Exception;

	// 회원 데이터 상세 조회
	public Members getMembersItem(Members input) throws Exception;

	// 회원 데이터 목록 조회
	public List<Members> getMembersList(Members input) throws Exception;

	// 회원 데이터가 저장되어 있는 갯수 조회
	public int getMembersCount(Members input) throws Exception;

	// 회원 데이터 등록하기
	public int addMembers(Members input) throws Exception;

	// 회원 데이터 수정하기
	public int editMembers(Members input) throws Exception;

	// 회원 데이터 삭제하기
	public int deleteMembers(Members input) throws Exception;

	// 아이디 중복검사 하기
	public void idUniqueCheck(Members input) throws Exception;

	// 닉네임 중복검사 하기
	public void nickCheck(Members input) throws Exception;
	
	//이메일 중복검사
	public void emailUniqueCheck(Members input) throws Exception;

	// 로그인
	public Members login(Members input) throws Exception;

	// 아이디 찾기
	public Members findId(Members input) throws Exception;

	// 비밀번호 찾기
	public Members findPw(Members input) throws Exception;

	// 회원가입 이메일 인증번호 전송
//    public boolean emailSend(String subject, String text, String from, String to, String filePath);

}
