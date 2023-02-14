package com.yena.memo.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yena.memo.common.FileManagerService;
import com.yena.memo.post.dao.PostDAO;
import com.yena.memo.post.model.Post;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;

	//메모 입력 insert
	public int addPost(MultipartFile file, int userId, String post_title, String post_content) {
		
		String imagePath = FileManagerService.saveFile(userId, file);
	
		return postDAO.insertPost(imagePath, userId, post_title, post_content);
		
	}
	
	public List<Post> getPostList(int userId){
		
		return postDAO.selectPost(userId);
	}
	
	//사용자가 누른 메모 보기
	public Post getPost(int id) {
		return postDAO.readPost(id);
	}
}
