package com.yena.memo.post;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.yena.memo.post.bo.PostBO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/post")
public class PostRestController {
	@Autowired
	private PostBO postBO;

	//메모 입력 API + file 저장
		@PostMapping("/create")
		public Map<String, Boolean> postCreate(
				@RequestParam("file") MultipartFile file
				, HttpServletRequest request
				,@RequestParam("post_title") String post_title
				,@RequestParam("post_content") String post_content) {
			
			//로그인된 사용자의 user 테이블 id 컬럼 값
			HttpSession session = request.getSession();
			
			//설정은 set, 가져오는 건 get
		
			int user_index = (Integer)session.getAttribute("session_user_index");
			
			int count = postBO.addPost(file, user_index, post_title, post_content);
			
			Map<String, Boolean> result = new HashMap<>();
			
			if(count == 1) { //insert 성공
				result.put("result", true);
			}else {
				result.put("result", false);
			}
			return result;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
