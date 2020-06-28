package com.abc.services;

import com.abc.beans.User;
import com.abc.dao.HospitalDAO;

public class Login {

	public User isValidUser(User user) throws Exception {
		HospitalDAO loginDao = new HospitalDAO();
		User currentUser = null;
		currentUser = loginDao.isValidUser(user);
		return currentUser;
	}
}
