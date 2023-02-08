package com.yena.memo.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yena.memo.common.EncryptUtils;
import com.yena.memo.user.dao.UserDAO;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;

	public int addUser(
			String user_id, String user_pw,
			String user_name, String user_email) {
		
		//비밀번호 암호화
		String encryptPassword = EncryptUtils.md5(user_pw);
		
		return userDAO.insertUser(user_id, encryptPassword, user_name, user_email);
	}
}
