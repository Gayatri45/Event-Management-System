package com.onestop.codeitsoft.event.entity;

public class Category {
	
	private int categoryId;
	
	private int companyId;

	private int branchId;

	private String companyName;

	private String branchName;
	
	private String categoryName;

	public Category() {
		
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
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

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Category(int categoryId, int companyId, int branchId, String companyName, String branchName,
			String categoryName) {
		super();
		this.categoryId = categoryId;
		this.companyId = companyId;
		this.branchId = branchId;
		this.companyName = companyName;
		this.branchName = branchName;
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", companyId=" + companyId + ", branchId=" + branchId
				+ ", companyName=" + companyName + ", branchName=" + branchName + ", categoryName=" + categoryName
				+ "]";
	}

	
}
