package com.onestop.codeitsoft.event.entity;

import org.springframework.web.multipart.MultipartFile;

public class Attendee {

	private int attendeeId;

	private int companyId;

	private int branchId;

	private String companyName;

	private String branchName;

	private String firstName;

	private String lastName;

	private long phoneNo;

	private String email;

	private String dob;

	private String gender;

	private String address;

	private Event event;

	private Category category;

	private Venue venue;

	private int review;

	// -1 for rejected 0 for No approval and 1 for approveRequired and 2 for approved 
	// for approved
	private int attendeeApprovalStatus;

	// 0 for no payment and 1 for payment required but not payment done 2 for
	// payment done
	private int payment;

	private int attendeeLoginAccess;

	private MultipartFile qrCodeImage;

	private String qrCodeImageName;

	private String qrCodeImageOriginalName;

	private int removeQrImg;

	private String attendeeCode;
	
	private int updateAttendee;

	public Attendee() {

	}

	public MultipartFile getQrCodeImage() {
		return qrCodeImage;
	}

	public void setQrCodeImage(MultipartFile qrCodeImage) {
		this.qrCodeImage = qrCodeImage;
	}

	public String getQrCodeImageName() {
		return qrCodeImageName;
	}

	public void setQrCodeImageName(String qrCodeImageName) {
		this.qrCodeImageName = qrCodeImageName;
	}

	public String getQrCodeImageOriginalName() {
		return qrCodeImageOriginalName;
	}

	public void setQrCodeImageOriginalName(String qrCodeImageOriginalName) {
		this.qrCodeImageOriginalName = qrCodeImageOriginalName;
	}

	public int getRemoveQrImg() {
		return removeQrImg;
	}

	public void setRemoveQrImg(int removeQrImg) {
		this.removeQrImg = removeQrImg;
	}

	public String getAttendeeCode() {
		return attendeeCode;
	}

	public void setAttendeeCode(String attendeeCode) {
		this.attendeeCode = attendeeCode;
	}

	public int getAttendeeId() {
		return attendeeId;
	}

	public void setAttendeeId(int attendeeId) {
		this.attendeeId = attendeeId;
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

	public long getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(long phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Venue getVenue() {
		return venue;
	}

	public void setVenue(Venue venue) {
		this.venue = venue;
	}

	public int getReview() {
		return review;
	}

	public void setReview(int review) {
		this.review = review;
	}

	public int getAttendeeApprovalStatus() {
		return attendeeApprovalStatus;
	}

	public void setAttendeeApprovalStatus(int attendeeApprovalStatus) {
		this.attendeeApprovalStatus = attendeeApprovalStatus;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getAttendeeLoginAccess() {
		return attendeeLoginAccess;
	}

	public void setAttendeeLoginAccess(int attendeeLoginAccess) {
		this.attendeeLoginAccess = attendeeLoginAccess;
	}
	public int getUpdateAttendee() {
		return updateAttendee;
	}

	public void setUpdateAttendee(int updateAttendee) {
		this.updateAttendee = updateAttendee;
	}

	public Attendee(int attendeeId, int companyId, int branchId, String companyName, String branchName,
			String firstName, String lastName, long phoneNo, String email, int noOfPerson, String dob, String gender,
			String address, Event event, Category category, Venue venue, int review, int attendeeLoginAccess,
			int attendeeApprovalStatus, int payment, MultipartFile qrCodeImage, String qrCodeImageName,
			String qrCodeImageOriginalName, int removeQrImg, String attendeeCode, int updateAttendee) {
		super();
		this.attendeeId = attendeeId;
		this.companyId = companyId;
		this.branchId = branchId;
		this.companyName = companyName;
		this.branchName = branchName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phoneNo = phoneNo;
		this.email = email;
		this.dob = dob;
		this.gender = gender;
		this.address = address;
		this.event = event;
		this.category = category;
		this.venue = venue;
		this.review = review;
		this.attendeeLoginAccess = attendeeLoginAccess;
		this.attendeeApprovalStatus = attendeeApprovalStatus;
		this.payment = payment;
		this.qrCodeImage = qrCodeImage;
		this.qrCodeImageName = qrCodeImageName;
		this.qrCodeImageOriginalName = qrCodeImageOriginalName;
		this.removeQrImg = removeQrImg;
		this.attendeeCode = attendeeCode;
		this.updateAttendee = updateAttendee;
	}

	@Override
	public String toString() {
		return "Attendee [attendeeId=" + attendeeId + ", companyId=" + companyId + ", branchId=" + branchId
				+ ", companyName=" + companyName + ", branchName=" + branchName + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", phoneNo=" + phoneNo + ", email=" + email + ", noOfPerson=" 
				+ ", dob=" + dob + ", gender=" + gender + ", address=" + address + ", event=" + event + ", category="
				+ category + ", venue=" + venue + ", review=" + review + ", attendeeLoginAccess=" + attendeeLoginAccess
				+ ", attendeeApprovalStatus=" + attendeeApprovalStatus + ", payment=" + payment + ", qrCodeImage="
				+ qrCodeImage + ", qrCodeImageName=" + qrCodeImageName + ", qrCodeImageOriginalName="
				+ qrCodeImageOriginalName + ", removeQrImg=" + removeQrImg + ", attendeeCode=" + attendeeCode
				+ ", updateAttendee=" + updateAttendee + "]";
	}
}
