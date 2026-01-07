package com.onestop.codeitsoft.event.entity;

public class LoginCredentials {

	private int loginId;

	private int schoolId;

	private int branchId;

	// 1 for participant
	private int userType;

	private String email;

	private String password;

	private String status;

	private String oldPassword;

	public LoginCredentials() {
		
	}

	public int getLoginId() {
		return loginId;
	}

	public void setLoginId(int loginId) {
		this.loginId = loginId;
	}

	public int getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(int schoolId) {
		this.schoolId = schoolId;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public LoginCredentials(int loginId, int schoolId, int branchId, int userType, String email, String password,
			String status, String oldPassword) {
		super();
		this.loginId = loginId;
		this.schoolId = schoolId;
		this.branchId = branchId;
		this.userType = userType;
		this.email = email;
		this.password = password;
		this.status = status;
		this.oldPassword = oldPassword;
	}

	@Override
	public String toString() {
		return "LoginCredentials [loginId=" + loginId + ", schoolId=" + schoolId + ", branchId=" + branchId
				+ ", userType=" + userType + ", email=" + email + ", password=" + password + ", status=" + status
				+ ", oldPassword=" + oldPassword + "]";
	}

}
