package com.yena.memo.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yena.memo.user.bo.UserBO;
import com.yena.memo.user.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequestMapping("/user")
@RestController //@Controller + @ResponseBody
public class UserRestController {
	
	@Autowired
	private UserBO userBO;

	//회원가입 API
	@PostMapping("/signup")
	public Map<String, Boolean> signup(
			@RequestParam("user_id") String user_id
			,@RequestParam("user_pw") String user_pw
			,@RequestParam("user_name") String user_name
			,@RequestParam("user_email") String user_email){
		
		int count = userBO.addUser(user_id, user_pw, user_name, user_email);
		
		Map<String, Boolean> result = new HashMap<>();
		
		if(count == 1) { //insert 성공
			result.put("result", true);
		}else { // insert 실패
			result.put("result", false);
		}
		
		return result;
	}
	
	//로그인 API
	@PostMapping("/signin")
	public Map<String, Boolean> signin(
			@RequestParam("user_id") String user_id
			,@RequestParam("user_pw") String user_pw
			,HttpServletRequest request){
		
		User user = userBO.getUser(user_id, user_pw);
		
		Map<String, Boolean> result = new HashMap<>();
		//세션에 특정한 값이 저장되어 있으면 로그인 된 상태
		//세션에 특정한 값이 저장되어 있지 않으면 로그인이 되어있지 않은 상태

		//조회 안됐으면 null
		if(user != null) {
			result.put("result", true);
			
			//세션 객체 얻어오기
			HttpSession session = request.getSession();
			
			//로그인 성공하면 session 생성.
			//index 값 등을 저장한 세션 생성
			session.setAttribute("session_user_index", user.getId());
			session.setAttribute("session_user_name", user.getUser_name());
			session.setAttribute("session_user_id", user.getUser_id());
		}else {
			result.put("result", false);
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
