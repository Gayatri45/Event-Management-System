package com.onestop.codeitsoft.eventBackend.daoImp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onestop.codeitsoft.eventBackend.dao.LoginCredentialDao;
import com.onestop.codeitsoft.eventBackend.entity.LoginCredentials;

@Service
public class LoginCredentialsDaoImp {
	
	@Autowired
	private LoginCredentialDao loginCredentialDao;

	public LoginCredentials getCredentialDetailsByEmailPassword(String email, String password) {
		return loginCredentialDao.getCredentialDetailsByEmailPassword(email, password);
	}

	public LoginCredentials saveLoginCredentials(LoginCredentials loginCred) {
		return loginCredentialDao.save(loginCred);
	}

	public LoginCredentials getCredentialDetailsByEmail(String email) {
		return loginCredentialDao.getCredentialDetailsByEmail(email);
	}

}
