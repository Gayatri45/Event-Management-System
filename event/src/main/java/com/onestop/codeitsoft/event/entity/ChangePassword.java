package com.onestop.codeitsoft.event.entity;

public class ChangePassword {
	
	String token;
	String logedEmail;
	String password;
	String newPassword;
	String ipAddress;

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getLogedEmail() {
		return logedEmail;
	}

	public void setLogedEmail(String logedEmail) {
		this.logedEmail = logedEmail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public ChangePassword(String token, String logedEmail, String password, String newPassword, String ipAddress) {
		super();
		this.token = token;
		this.logedEmail = logedEmail;
		this.password = password;
		this.newPassword = newPassword;
		this.ipAddress = ipAddress;
	}

	public ChangePassword() {
		super();
	}

	@Override
	public String toString() {
		return "ChangePassword [token=" + token + ", logedEmail=" + logedEmail + ", password=" + password
				+ ", newPassword=" + newPassword + ", ipAddress=" + ipAddress + "]";
	}
		

}
