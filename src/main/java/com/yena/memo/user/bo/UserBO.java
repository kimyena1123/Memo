package com.yena.memo.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yena.memo.common.EncryptUtils;
import com.yena.memo.user.dao.UserDAO;
import com.yena.memo.user.model.User;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;

	public int addUser(
			String user_id, String user_pw,
			String user_name, String user_email) {
		
		//비밀번호 암호화
		String encryptPassword = EncryptUtils.md5(user_pw);
		
		//넘겨줄 때 user_pw가 아닌 암호화된 encryptPassword로 넘겨준다.
		return userDAO.insertUser(user_id, encryptPassword, user_name, user_email);
	}
	
	public User getUser(String user_id, String user_pw) {
		
		//비밀번호 암호화
		String encryptPassword = EncryptUtils.md5(user_pw);
		
		return userDAO.selectUser(user_id, encryptPassword);
	}
}
