package study.spring.springhelper.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.springhelper.model.Members;
import study.spring.springhelper.service.MembersService;

@Slf4j
@Service

public class MembersServiceImpl implements MembersService {

	@Autowired
	SqlSession sqlSession;

	// 마이페이지 닉네임&이미지, 판매자프로필 닉네임&이미지
	@Override
	public Members getselectgoods(Members input) throws Exception {
		Members result = null;

		try {
			result = sqlSession.selectOne("MembersMapper.selectgoods", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	// 회원 데이터 상세 조회
	@Override
	public Members getMembersItem(Members input) throws Exception {
		Members result = null;

		try {
			result = sqlSession.selectOne("MembersMapper.selectItem", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	// 회원 데이터 목록 조회
	@Override
	public List<Members> getMembersList(Members input) throws Exception {
		List<Members> result = null;

		try {
			result = sqlSession.selectList("MembersMapper.selectList", input);

			if (result == null) {
				throw new NullPointerException("result = null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");

		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	// 회원 데이터가 저장되어 있는 갯수 조회
	@Override
	public int getMembersCount(Members input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("MembersMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	// 회원 데이터 등록하기
	@Override
	public int addMembers(Members input) throws Exception {
		int result = 0;

		// 중복검사 기능 호출
//        this.idCheck(input);
//        this.nickCheck(input);

		try {
			result = sqlSession.insert("MembersMapper.insertItem", input);

			if (result == 0) {
				throw new NullPointerException("result = 0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		return result;
	}

	// 회원 데이터 수정하기
	@Override
	public int editMembers(Members input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("MembersMapper.updateItem", input);

			if (result == 0) {
				throw new NullPointerException("result = 0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}

	// 회원탈퇴 하기
	@Override
	public int deleteMembers(Members input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("MembersMapper.deleteItem", input);

			if (result > 0) {
				throw new NullPointerException("result = 0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		return result;
	}

	// 로그인
	@Override
	public Members login(Members input) throws Exception {
		Members result = null;

		try {
			result = sqlSession.selectOne("MembersMapper.loginItem", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("아이디나 비밀번호가 잘못되었습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	// 비밀번호 찾기
	@Override
	public Members findPw(Members input) throws Exception {
		Members result = null;

		try {
			result = sqlSession.selectOne("MembersMapper.findPw", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	// 아이디 중복검사
	@Override
	public void idUniqueCheck(Members input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("MembersMapper.idCheck", input);
			if (result > 0) {
				throw new NullPointerException("result=" + result);
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("이미 사용중인 아이디 입니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("아이디 중복검사에 실패했습니다.");
		}
	}

	// 닉네임 중복검사
	@Override
	public void nickCheck(Members input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("MembersMapper.nickCheck", input);
			if (result > 0) {
				throw new NullPointerException("result=" + result);
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("이미 사용중인 이메일 입니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("이메일 중복검사에 실패했습니다.");
		}
	}
	
	// 이메일 중복검사
	@Override
	public void emailUniqueCheck(Members input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("MembersMapper.emailCheck", input);
			if (result > 0) {
				throw new NullPointerException("result=" + result);
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("이미 사용중인 이메일 입니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("이메일 중복검사에 실패했습니다.");
		}
	}

	// 아이디 찾기
	@Override
	public Members findId(Members input) throws Exception {
		Members result = null;

		try {
			result = sqlSession.selectOne("MembersMapper.findId", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

}
