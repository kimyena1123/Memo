package com.yena.memo.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yena.memo.user.bo.UserBO;

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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
