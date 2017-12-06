package com.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.config.SqlMapConfig;
import com.member.dto.MemberDto;

public class MemberDaoImpl extends SqlMapConfig implements MemberDao{

	private String nameSpace = "com.member.";
	private SqlSession session;
	
	public MemberDaoImpl() {
		session = null;
	}
	
	//admin을 제외한 모든 계정의 수를 불러들인다.
	@Override
	public int getMemberTotal() {
		int res = 0;
		session = getSession();
		System.out.println("01. 세션 오픈");
		
		try {
			res = session.selectOne(nameSpace+"memberTotal");
			System.out.println("02. selectAll 쿼리 성공");
			session.commit();
			System.out.println("03. commit 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("02/03 단계 실패");
			session.rollback();
			System.out.println("rollback");
		} finally {
			session.close();
			System.out.println("04. 세션 닫기");
		}
		
		return res;
	}
	
	//해당 페이지의 게시물을 가져온다
	@Override
	public List<MemberDto> selectPage(int page) {
		List<MemberDto> memberList = new ArrayList<MemberDto>();
		session = getSession();
		System.out.println("01. 세션 오픈");
		
		try {
			memberList = session.selectList(nameSpace+"selectPage", page);
			System.out.println("02. selectAll 쿼리 성공");
			session.commit();
			System.out.println("03. commit 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("02/03 단계 실패");
			session.rollback();
			System.out.println("rollback");
		} finally {
			session.close();
			System.out.println("04. 세션 닫기");
		}
		
		return memberList;
	}
	
	//admin을 제외한 검색조건에 맞는 계정의 수를 불러들인다.
	@Override
	public int getMemberTotalBySearch(Map<String, String> map) {
		int res = 0;
		session = getSession();
		System.out.println("01. 세션 오픈");
		
		try {
			res = session.selectOne(nameSpace+"memberTotalBySearch", map);
			System.out.println("02. selectAll 쿼리 성공");
			session.commit();
			System.out.println("03. commit 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("02/03 단계 실패");
			session.rollback();
			System.out.println("rollback");
		} finally {
			session.close();
			System.out.println("04. 세션 닫기");
		}
		
		return res;
	}
		
	//조건에 맞는 해당 페이지의 게시물을 가져온다
	@Override
	public List<MemberDto> selectPageBySearch(Map map) {
		List<MemberDto> memberList = new ArrayList<MemberDto>();
		
		session = getSession();
		System.out.println("01. 세션 오픈");
		
		try {
			memberList = session.selectList(nameSpace+"selectPageBySearch", map);
			System.out.println("02. selectAll 쿼리 성공");
			session.commit();
			System.out.println("03. commit 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("02/03 단계 실패");
			session.rollback();
			System.out.println("rollback");
		} finally {
			session.close();
			System.out.println("04. 세션 닫기");
		}
		
		return memberList;
	}
	
	
	//DB에 Member 추가
	@Override
	public boolean insert(MemberDto dto) {
		boolean isSuccess = false;
		
		session = getSession();
		System.out.println("01. 세션 오픈");
		
		try {
			int tmp = session.insert(nameSpace+"insert", dto );
			if(tmp>0) {
				isSuccess = true;
				System.out.println("02. insert 쿼리 성공");
				session.commit();
				System.out.println("03. commit 성공");
			}else {
				System.out.println("02. insert 쿼리 실패");
				session.rollback();
				System.out.println("03. rollback");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("02/03 단계 실패");
			session.rollback();
			System.out.println("rollback");
		} finally {
			session.close();
			System.out.println("04. 세션 닫기");
		}
		
		return isSuccess;
	}
	
	// id와 pw로 member 찾기
	@Override
	public MemberDto selectOneByIdPw(Map<String, String> map) {
		MemberDto member = null;

		session = getSession();
		System.out.println("01. 세션 오픈");
		
		try {
			member = session.selectOne(nameSpace+"login", map);
			System.out.println("02. select 쿼리 성공");
			session.commit();
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("02. 쿼리실패");
			session.rollback();
			System.out.println("rollback");
		} finally {
			session.close();
			System.out.println("03. 세션 닫기");
		}
		
		return member;
	}
	
	// id로 member 찾기
	@Override
	public MemberDto selectOneById(String id) {
		MemberDto member = null;

		session = getSession();
		System.out.println("01. 세션 오픈");
		
		try {
			member = session.selectOne(nameSpace+"selectOneById", id);
			System.out.println("02. select 쿼리 성공");
			session.commit();
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("02. 쿼리실패");
			session.rollback();
			System.out.println("rollback");
		} finally {
			session.close();
			System.out.println("03. 세션 닫기");
		}
		
		return member;
	}
	
	// 이메일로 member 찾기
		@Override
		public MemberDto selectOneByEmail(String email) {
			MemberDto member = null;

			session = getSession();
			System.out.println("01. 세션 오픈");
			
			try {
				member = session.selectOne(nameSpace+"selectOneByEmail", email);
				System.out.println("02. select 쿼리 성공");
				session.commit();
				
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("02. 쿼리실패");
				session.rollback();
				System.out.println("rollback");
			} finally {
				session.close();
				System.out.println("03. 세션 닫기");
			}
			
			return member;
		}
	
	/**
	 * 이름, 이메일로 ID 찾기
	 */
	@Override
	public String getId(Map<String, String> map) {
		String id = "";
		
		session = getSession();
		System.out.println("01. 세션 오픈");
		
		try {
			id = session.selectOne(nameSpace+"getId", map);
			System.out.println("02. select 쿼리 성공");
			session.commit();
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("02. 쿼리실패");
			session.rollback();
			System.out.println("rollback");
		} finally {
			session.close();
			System.out.println("03. 세션 닫기");
		}
		
		return id;
	}
	
	
	@Override
	public String getIdByNo(int no) {
		String id = "";
		
		session = getSession();
		System.out.println("01. 세션 오픈");
		
		try {
			id = session.selectOne(nameSpace+"getIdByNo", no);
			System.out.println("02. select 쿼리 성공");
			session.commit();
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("02. 쿼리실패");
			session.rollback();
			System.out.println("rollback");
		} finally {
			session.close();
			System.out.println("03. 세션 닫기");
		}
		
		return id;
	}
	/**
	 * ID, 이메일로 비밀번호 찾기
	 */
	@Override
	public String getPw(Map<String, String> map) {
		String pw = "";
		
		session = getSession();
		System.out.println("01. 세션 오픈");
		
		try {
			pw = session.selectOne(nameSpace+"getPw", map);
			System.out.println("02. select 쿼리 성공");
			session.commit();
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("02. 쿼리실패");
			session.rollback();
			System.out.println("rollback");
		} finally {
			session.close();
			System.out.println("03. 세션 닫기");
		}
		
		return pw;
	}
	
	@Override
	public int enabledUpdate(String[] no, String[] enabled) {
		int res = 0;
		session = getSession();
		System.out.println("01. 세션 오픈");
		boolean ok = true;
		
		for (int i = 0; i < no.length; i++) {
			
			try {
				Map<String, String> map = new HashMap<String, String>();
				map.put("no", no[i]);
				map.put("enabled", enabled[i]);
				int tmp = session.update(nameSpace+"enabledUpdate", map);
				res += tmp;
				
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("02. 쿼리실패");
				session.rollback();
				System.out.println("rollback");
				break;
			}
		}
		
		if(ok) {
			System.out.println("02. update 쿼리 성공");
			session.commit();
		}
		
		session.close();
		System.out.println("03. 세션 닫기");
		
		return res;
	}
	
	@Override
	public int leave(int no) {
		int res = 0;
		session = getSession();
		System.out.println("01. 세션 오픈");
		
			
		try {
			res = session.delete(nameSpace+"leave", no);
			session.commit();
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("02. 쿼리실패");
			session.rollback();
			System.out.println("rollback");
		
		} finally {
			session.close();
			System.out.println("03. 세션 닫기");
		}
		
		return res;
	}
	
	@Override
	public int myInfoUpdate(MemberDto member) {
		int res = 0;
		session = getSession();
		System.out.println("01. 세션 오픈");
		
			
		try {
			res = session.delete(nameSpace+"myInfoUpdate", member);
			session.commit();
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("02. 쿼리실패");
			session.rollback();
			System.out.println("rollback");
		
		} finally {
			session.close();
			System.out.println("03. 세션 닫기");
		}
		
		return res;
	}
	
}
