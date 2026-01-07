package com.onestop.codeitsoft.eventBackend.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class LoginCredentials {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int loginId;

	private int companyId;

	private int branchId;
	
	private int userType;

	private String email;
	
	private String token;

	private String password;

	private int status;

	private String oldPassword;

	public LoginCredentials() {
		
	}

	public int getLoginId() {
		return loginId;
	}

	public void setLoginId(int loginId) {
		this.loginId = loginId;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getBranchId() {
		return branchId;
	}

	public void setBranchId(int branchId) {
		this.branchId = branchId;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public LoginCredentials(int loginId, int companyId, int branchId, int userType, String email, String password,
			int status, String oldPassword) {
		super();
		this.loginId = loginId;
		this.companyId = companyId;
		this.branchId = branchId;
		this.userType = userType;
		this.email = email;
		this.password = password;
		this.status = status;
		this.oldPassword = oldPassword;
	}

	@Override
	public String toString() {
		return "LoginCredentials [loginId=" + loginId + ", companyId=" + companyId + ", branchId=" + branchId
				+ ", userType=" + userType + ", email=" + email + ", password=" + password + ", status=" + status
				+ ", oldPassword=" + oldPassword + "]";
	}

}
