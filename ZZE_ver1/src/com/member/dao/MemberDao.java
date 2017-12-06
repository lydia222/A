package com.member.dao;


import java.util.List;
import java.util.Map;

import com.member.dto.MemberDto;

public interface MemberDao {
	
	public int getMemberTotal();
	public List<MemberDto> selectPage(int page);
	public int getMemberTotalBySearch(Map<String, String> map);
	public List<MemberDto> selectPageBySearch(Map map);
	public MemberDto selectOneById(String id);
	public MemberDto selectOneByIdPw(Map<String,String> map);
	public MemberDto selectOneByEmail(String email);
	public boolean insert(MemberDto dto);
	public String getId(Map<String, String> map);
	public String getIdByNo(int no);
	public String getPw(Map<String, String> map);
	public int enabledUpdate(String[] no, String[] enabled);
	public int leave(int no);
	public int myInfoUpdate(MemberDto member);
}
