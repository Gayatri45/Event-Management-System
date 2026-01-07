package com.onestop.codeitsoft.eventBackend.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Category {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
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

//	public String getCategoryIcon() {
//		return categoryIcon;
//	}
//
//	public void setCategoryIcon(String categoryIcon) {
//		this.categoryIcon = categoryIcon;
//	}
//
//	public MultipartFile getImage() {
//		return image;
//	}
//
//	public void setImage(MultipartFile image) {
//		this.image = image;
//	}
//
//	public String getImageName() {
//		return imageName;
//	}
//
//	public void setImageName(String imageName) {
//		this.imageName = imageName;
//	}
//
//	public String getImageOriginalName() {
//		return imageOriginalName;
//	}
//
//	public void setImageOriginalName(String imageOriginalName) {
//		this.imageOriginalName = imageOriginalName;
//	}
//
//	public int getFeaturedOrder() {
//		return featuredOrder;
//	}
//
//	public void setFeaturedOrder(int featuredOrder) {
//		this.featuredOrder = featuredOrder;
//	}
//	
//	public int getRemoveImg() {
//		return removeImg;
//	}
//
//	public void setRemoveImg(int removeImg) {
//		this.removeImg = removeImg;
//	}

	
	
}
