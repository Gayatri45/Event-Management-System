package com.onestop.codeitsoft.event.entity;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class UpdateProfile {
	
	public String token;
	public String logedEmail;
	public int roleId;
	public int userType;
	public String firstName;
	public String lastName;
	public String email;
	public String mobile;
	public int companyId;
	public int userId;
	public String companyCode;
	public MultipartFile profile;
	public MultipartFile esign;
	public byte[] esign1;	
	
	public UpdateProfile() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void setEsign() {

		this.esign = new MultipartFile() {

//			@Override
//			public void transferTo1(File dest) throws IOException, IllegalStateException {
//
//			}

			@Override
			public boolean isEmpty() {
				return false;
			}

			@Override
			public long getSize() {
				return esign1.length;
			}

			@Override
			public String getOriginalFilename() {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public String getName() {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public InputStream getInputStream() throws IOException {
				return null;
			}

			@Override
			public String getContentType() {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public byte[] getBytes() throws IOException {
				return esign1;
			}

			@Override
			public void transferTo(File dest) throws IOException, IllegalStateException {
				// TODO Auto-generated method stub

			}
		};

	}
	
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
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}
	public MultipartFile getProfile() {
		return profile;
	}
	public void setProfile(MultipartFile profile) {
		this.profile = profile;
	}
	public MultipartFile getEsign() {
		return esign;
	}
	public void setEsign(MultipartFile esign) {
		this.esign = esign;
	}
	public byte[] getEsign1() {
		return esign1;
	}
	public void setEsign1(byte[] esign1) {
		this.esign1 = esign1;
	}
	public UpdateProfile(String token, String logedEmail, int roleId, int userType, String firstName, String lastName,
			String email, String mobile, int companyId, int userId, String companyCode, MultipartFile profile,
			MultipartFile esign, byte[] esign1) {
		super();
		this.token = token;
		this.logedEmail = logedEmail;
		this.roleId = roleId;
		this.userType = userType;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.mobile = mobile;
		this.companyId = companyId;
		this.userId = userId;
		this.companyCode = companyCode;
		this.profile = profile;
		this.esign = esign;
		this.esign1 = esign1;
	}
	
	@Override
	public String toString() {
		return "UpdateProfile [token=" + token + ", logedEmail=" + logedEmail + ", roleId=" + roleId + ", userType="
				+ userType + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", mobile="
				+ mobile + ", companyId=" + companyId + ", userId=" + userId + ", companyCode=" + companyCode
				+ ", profile=" + profile + ", esign=" + esign + ", esign1=" + Arrays.toString(esign1) + "]";
	}

}
