package com.member.biz;

import java.util.List;

import com.member.dto.MemberDto;

public interface MemberBiz {

	public int getMemberTotal();
	public List<MemberDto> selectPage(int page);
	public int getMemberTotalBySearch(String search, String keyword);
	public List<MemberDto> selectPageBySearch(int pageNum, String search, String keyword);
	public MemberDto selectOneById(String id);
	public MemberDto selectOneByIdPw(String id, String pw);
	public MemberDto selectOneByEmail(String email);
	public boolean insert(MemberDto dto);
	public String getId(String name, String email);
	public String getIdByNo(int no);
	public String getPw(String id, String email);
	public int enabledUpdate(String[] no, String[] enabled);
	public int leave(int no);
	public int myInfoUpdate(MemberDto member);
}
