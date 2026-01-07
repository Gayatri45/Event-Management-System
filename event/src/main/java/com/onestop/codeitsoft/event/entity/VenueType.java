package com.onestop.codeitsoft.event.entity;

public class VenueType {

	private int venueTypeId;

	private int companyId;

	private int branchId;

	private String companyName;

	private String branchName;

	private String name;

	public VenueType() {

	}

	public VenueType(int venueTypeId, int companyId, int branchId, String companyName, String branchName, String name) {
		super();
		this.venueTypeId = venueTypeId;
		this.companyId = companyId;
		this.branchId = branchId;
		this.companyName = companyName;
		this.branchName = branchName;
		this.name = name;
	}

	public int getVenueTypeId() {
		return venueTypeId;
	}

	public void setVenueTypeId(int venueTypeId) {
		this.venueTypeId = venueTypeId;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "VenueType [venueTypeId=" + venueTypeId + ", companyId=" + companyId + ", branchId=" + branchId
				+ ", companyName=" + companyName + ", branchName=" + branchName + ", name=" + name + "]";
	}

}
