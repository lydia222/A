package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.mail.SendMail;
import com.member.biz.MemberBizImpl;
import com.member.dto.MemberDto;

@WebServlet("/Controller.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Controller() {
        super();
    }

    private void forward(String url, HttpServletRequest request, HttpServletResponse response) {
    	RequestDispatcher rd = request.getRequestDispatcher(url);
    	try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
			System.out.println("ServletException");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("IOException");
		}
    }

    private void alert(String msg, String url, HttpServletResponse response) {
    	PrintWriter out;
		try {
			out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('"+msg+"');");
			out.println("location.href='"+url+"';");
			out.println("</script>");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("getWriter Error");
		}
    }

    private void goBack(String msg, HttpServletResponse response) {
    	PrintWriter out;
		try {
			out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('"+msg+"');");
			out.println("history.go(-1);");
			out.println("</script>");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("getWriter Error");
		}
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		MemberBizImpl mBiz = new MemberBizImpl();

		String command = request.getParameter("command");

		//로그인
		if(command.equals("login")) {

			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String url = request.getParameter("url");

			if(url.length()==0) {
				url = "main.jsp";
			}
			MemberDto member = mBiz.selectOneByIdPw(id, pw);
			if(member != null) {
				session.setAttribute("member", member);
				response.sendRedirect(url);
			}else {
				alert("ID/PW를 다시 확인해주세요", url, response);
			}

		//로그아웃
		}else if(command.equals("logout")) {
			session.invalidate();
			response.sendRedirect("main.jsp");

		//아이디 중복 체크
		}else if(command.equals("idCheck")) {
			String id = request.getParameter("id");
			MemberDto member = mBiz.selectOneById(id);
			String result = "duplicate";
			if(member == null) {
				result = "ok";
			}
			PrintWriter out = response.getWriter();
			out.println(result);

		//이메일 중복체크
		}else if(command.equals("emailCheck")) {
			String email = request.getParameter("email");
			MemberDto member = mBiz.selectOneByEmail(email);
			String result = "duplicate";
			if(member == null) {
				result = "ok";
			}
			System.out.println(result);
			PrintWriter out = response.getWriter();
			out.println(result);

		//회원 추가
		}else if(command.equals("memberInsert")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String face = request.getParameter("face");
			String email = request.getParameter("email");
			//전화번호에 숫자가 아닌 값이 들어왔을때
			String tel = request.getParameter("tel");
			System.out.println(tel);
			try {
				Long.parseLong(tel);
				String address = request.getParameter("address");
				MemberDto member = new MemberDto(0, id, pw, name, gender, face, email, tel, address, "");
				boolean isSuccess = mBiz.insert(member);
				if(isSuccess) {
					alert("회원가입을\\n축하합니다!", "Controller.do?command=close", response);
				}else {
					goBack("회원가입이 실패되었습니다. 다시 시도해주세요", response);
				}
			}catch(NumberFormatException e) {
				goBack("전화번호는 숫자로만 입력해주세요.", response);
			}

		}else if(command.equals("close")){
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("window.close();");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("getWriter Error");
			}

		}else if(command.equals("joinForm")) {
			response.sendRedirect("joinForm.jsp");
		}else if(command.equals("findIdForm")) {
			response.sendRedirect("findIdForm.jsp");

		//Id 찾기
		}else if(command.equals("findId")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String id = mBiz.getId(name, email);

			PrintWriter out = response.getWriter();
			if(id==null) {
				out.println("no");
			}else {
				out.println("ok");
				SendMail mail = new SendMail();
				mail.sendId(email, name, id);
			}

		}else if(command.equals("findPwForm")) {
			response.sendRedirect("findPwform.jsp");

		}else if(command.equals("findPw")) {
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			String pw = mBiz.getPw(id, email);
			PrintWriter out = response.getWriter();
			if(pw==null) {
				out.println("no");
			}else {
				out.println("ok");
				String name = mBiz.selectOneById(id).getName();
				SendMail mail = new SendMail();
				mail.sendPw(email, name, pw);
			}


		//온천 검색 페이지
		}else if(command.equals("search")) {
			response.sendRedirect("search.jsp");

		//게시판 페이지
		}else if(command.equals("board")) {
			response.sendRedirect("board.jsp");

		//회원 관리 페이지
		}else if(command.equals("memberManage")) {
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			String search = request.getParameter("search");
			List<MemberDto> memberList = null;

			//검색이 아닐 시
			if(search == null) {
				memberList = mBiz.selectPage(pageNum);
				request.setAttribute("memberList", memberList);
				int totalPage = (int)Math.ceil((double)mBiz.getMemberTotal()/10);
				forward("memberManage.jsp?totalPage="+totalPage, request, response);
			}else {
			//검색일 시
				String keyword = request.getParameter("keyword");
				memberList = mBiz.selectPageBySearch(pageNum, search, keyword);
				request.setAttribute("memberList", memberList);
				int totalPage = (int)Math.ceil((double)mBiz.getMemberTotalBySearch(search, keyword)/10);
				forward("memberManage.jsp?totalPage="+totalPage, request, response);
			}

		//회원 상태 변경
		}else if(command.equals("enabledChange")) {
			String[] no = request.getParameterValues("no");
			String[] enabled = request.getParameterValues("enabled");
			String url = request.getParameter("url");
			int res = mBiz.enabledUpdate(no, enabled);
			if(res == no.length) {
				System.out.println("수정 성공");
				alert("변경 완료되었습니다", url, response);
			}else {
				goBack("다시 시도해주세요.", response);
			}


		//회원 내 정보 페이지
		}else if(command.equals("myInfo")) {
			response.sendRedirect("myInfo.jsp");

		//회원 탈퇴
		}else if(command.equals("leave")) {
			int no = Integer.parseInt(request.getParameter("no"));
			int res = mBiz.leave(no);
			if(res>0) {
				session.invalidate();
				alert("탈퇴 처리되었습니다.", "main.jsp", response);
			}else {
				goBack("다시 시도해주세요!", response);
			}

		//회원 정보 수정
		}else if(command.equals("myInfoUpdate")) {
			int no = Integer.parseInt(request.getParameter("no"));
			String face = request.getParameter("face");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			//전화번호에 숫자가 아닌 값이 들어왔을때
			String tel = request.getParameter("tel");

			try {
				Long.parseLong(tel);
				MemberDto member = new MemberDto(no, null, pw, name, gender, face, email, tel, address, null);
				int res = mBiz.myInfoUpdate(member);
				if(res>0) {
					String id = mBiz.getIdByNo(no);
					session.removeAttribute("member");
					alert("회원정보를 수정하였습니다!", "Controller.do?command=login&id="+id+"&pw="+pw+"&url=myInfo.jsp", response);
				}else {
					goBack("다시 시도해주세요!", response);
				}
			} catch(NumberFormatException e) {
				e.printStackTrace();
				goBack("전화번호는 숫자로만 입력해주세요", response);
			}

		} else if(command.equals("spaboard")) {
			response.sendRedirect("spaBoard.jsp");
		}

	}
}
