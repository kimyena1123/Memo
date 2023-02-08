package com.yena.memo.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yena.memo.user.dao.UserDAO;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;

	public int addUser(
			String user_id, String user_pw,
			String user_name, String user_email) {
		
		return userDAO.insertUser(user_id, user_pw, user_name, user_email);
	}
}
