package com.yena.memo.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequestMapping("/user")
@Controller
public class UserController {

	//회원가입 화면
	@GetMapping("/signup/view")
	public String signupView() {
		
		return "user/signup";
	}
	
	//로그인 화면
	@GetMapping("/signin/view")
	public String signinView() {
		
		return "user/signin";
	}
	
	//로그아웃 기능
	@GetMapping("/signout")
	public String signout(HttpServletRequest request) { // 리다이렉트->string
		
		//로그아웃
		//로그인 시 저장되었던 세션값 제거("session_user_index", "session_user_name", "session_user_id") 제거.
		HttpSession session = request.getSession();
		
		session.removeAttribute("session_user_index	");
		session.removeAttribute("session_user_name");
		session.removeAttribute("session_user_id");
		
		return "redirect:/user/signin/view";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
