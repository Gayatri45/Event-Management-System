package com.onestop.codeitsoft.eventBackend.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Audience {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int audienceId;	
	
	private int companyId;

	private int branchId;

	private String companyName;

	private String branchName;
	
	private String audienceName;
	
	public Audience() {
		
	}

	public int getAudienceId() {
		return audienceId;
	}

	public void setAudienceId(int audienceId) {
		this.audienceId = audienceId;
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

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getAudienceName() {
		return audienceName;
	}

	public void setAudienceName(String audienceName) {
		this.audienceName = audienceName;
	}

	public Audience(int audienceId, int companyId, int branchId, String companyName, String branchName,
			String audienceName) {
		super();
		this.audienceId = audienceId;
		this.companyId = companyId;
		this.branchId = branchId;
		this.companyName = companyName;
		this.branchName = branchName;
		this.audienceName = audienceName;
	}

	@Override
	public String toString() {
		return "Audience [audienceId=" + audienceId + ", companyId=" + companyId + ", branchId=" + branchId
				+ ", companyName=" + companyName + ", branchName=" + branchName + ", audienceName=" + audienceName
				+ "]";
	}
	
}
