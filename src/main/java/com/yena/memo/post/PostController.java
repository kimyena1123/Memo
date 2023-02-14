package com.yena.memo.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yena.memo.post.bo.PostBO;
import com.yena.memo.post.model.Post;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequestMapping("/post")
@Controller
public class PostController {
	
	@Autowired
	private PostBO postBO;

	@GetMapping("/list/view")
	public String listView(Model model,
							HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("session_user_index");
		
		List<Post> postList = postBO.getPostList(userId);
		
		model.addAttribute("postList", postList);
		
		return "post/list";
	}
	
	@GetMapping("/create/view")
	public String createView() {
		
		return "post/create";
	}
	
	//메모 보기
	@GetMapping("/detail/view")
	public String detailView(
			@RequestParam("id") int id
			,Model model) {
		
		Post post = postBO.getPost(id);
		
		model.addAttribute("post", post);
		
		return "post/detail";
	}
}
