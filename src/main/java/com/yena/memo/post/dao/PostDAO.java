package com.yena.memo.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yena.memo.post.model.Post;

@Repository
public interface PostDAO {

	//게시물 올리기 upload insert
	public int insertPost(
			@Param("imagePath") String imagePath
			,@Param("userId") int userId
			,@Param("post_title") String post_title
			,@Param("post_content") String post_content);


	//메모 리스트 보기
	public List<Post> selectPost(@Param("userId") int userId);

	public Post readPost(@Param("id") int id);


}
