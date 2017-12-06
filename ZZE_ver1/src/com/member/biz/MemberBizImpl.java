package com.member.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.member.dao.MemberDaoImpl;
import com.member.dto.MemberDto;

public class MemberBizImpl implements MemberBiz {

	MemberDaoImpl dao = new MemberDaoImpl(); 

	@Override
	public int getMemberTotal() {
		return dao.getMemberTotal();
	}

	@Override
	public List<MemberDto> selectPage(int page){
		return dao.selectPage(page);
	}
	
	@Override
	public int getMemberTotalBySearch(String search, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("keyword", keyword);
		
		return dao.getMemberTotalBySearch(map);
	}
	
	@Override
	public List<MemberDto> selectPageBySearch(int pageNum, String search, String keyword){
		Map map = new HashMap();
		map.put("page", pageNum);
		map.put("search", search);
		map.put("keyword", keyword);
		
		return dao.selectPageBySearch(map);
	}
	
	@Override
	public MemberDto selectOneByIdPw(String id, String pw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		return dao.selectOneByIdPw(map);
	}
	
	@Override
	public MemberDto selectOneById(String id) {
		return dao.selectOneById(id);
	}
	
	@Override
	public MemberDto selectOneByEmail(String email) {
		return dao.selectOneByEmail(email);
	}
	
	@Override
	public boolean insert(MemberDto dto) {
		return dao.insert(dto);
	}
	
	@Override
	public String getId(String name, String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		return dao.getId(map);
	}
	
	@Override
	public String getIdByNo(int no) {
		return dao.getIdByNo(no);
	}
	
	@Override
	public String getPw(String id, String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
		return dao.getPw(map);
	}
	
	@Override
	public int enabledUpdate(String[] no, String[] enabled) {
		return dao.enabledUpdate(no, enabled);
	}

	@Override
	public int leave(int no) {
		return dao.leave(no);
	}
	
	@Override
	public int myInfoUpdate(MemberDto member) {
		return dao.myInfoUpdate(member);
	}
}
