package com.onestop.codeitsoft.eventBackend.entity;

import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
public class Event {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int eventId;

	private int companyId;

	private int branchId;

	private String companyName;

	private String branchName;

	@Transient
	private int categoryId;
	
	@OneToOne
	private Category category;

	private String eventName;

	private String description;

	@Transient
	private int audienceId;
	
	@ElementCollection
	private List<Audience> audience;
	
	@ElementCollection
	private List<Integer> audienceIdList;

	private String country;

	private long phoneNo;

	private String email;

	private String artists;

	private String eventStartDate;

	private String eventLastDate;
	
	@Transient
	private int venueId;
	
	@OneToOne
	private Venue venue;

	private double ticketPrice;

	@Transient
	private MultipartFile imageGallery;

	private String imageGalleryName;

	private String imageGalleryOriginalName;

	private int removeImageGallery;
	
	@Transient
	private List<MultipartFile> imageGalleryList;
	
	@Transient
	private List<String> imageGalleryNameList;
	
	@Transient
	private List<String> imageGalleryOriginalNameList;
	
	@Transient
	private List<Integer> removeImageGalleryList;

	private int approvalRequired;

	private int paymentGatewayRequired;

	private String createdByName;

	private String createdByRole;

	private String createdDate;

	private String createdTime;

	private String eventUrl;
	
	@Transient
	private int noOfAttendee;
	
	@Transient
	private int noOfParticipant;
	
	@Transient
	private int noOfAttendeLog;

	public Event() {

	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getAudienceId() {
		return audienceId;
	}

	public void setAudienceId(int audienceId) {
		this.audienceId = audienceId;
	}

	public int getVenueId() {
		return venueId;
	}

	public void setVenueId(int venueId) {
		this.venueId = venueId;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
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

	public String getEventName() {
		return eventName;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Audience> getAudience() {
		return audience;
	}

	public void setAudience(List<Audience> audience) {
		this.audience = audience;
	}

	public List<Integer> getAudienceIdList() {
		return audienceIdList;
	}

	public void setAudienceIdList(List<Integer> audienceIdList) {
		this.audienceIdList = audienceIdList;
	}

	public List<MultipartFile> getImageGalleryList() {
		return imageGalleryList;
	}

	public void setImageGalleryList(List<MultipartFile> imageGalleryList) {
		this.imageGalleryList = imageGalleryList;
	}

	public List<String> getImageGalleryNameList() {
		return imageGalleryNameList;
	}

	public void setImageGalleryNameList(List<String> imageGalleryNameList) {
		this.imageGalleryNameList = imageGalleryNameList;
	}

	public List<String> getImageGalleryOriginalNameList() {
		return imageGalleryOriginalNameList;
	}

	public void setImageGalleryOriginalNameList(List<String> imageGalleryOriginalNameList) {
		this.imageGalleryOriginalNameList = imageGalleryOriginalNameList;
	}

	public List<Integer> getRemoveImageGalleryList() {
		return removeImageGalleryList;
	}

	public void setRemoveImageGalleryList(List<Integer> removeImageGalleryList) {
		this.removeImageGalleryList = removeImageGalleryList;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
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

	public String getArtists() {
		return artists;
	}

	public void setArtists(String artists) {
		this.artists = artists;
	}

	public String getEventStartDate() {
		return eventStartDate;
	}

	public void setEventStartDate(String eventStartDate) {
		this.eventStartDate = eventStartDate;
	}

	public String getEventLastDate() {
		return eventLastDate;
	}

	public void setEventLastDate(String eventLastDate) {
		this.eventLastDate = eventLastDate;
	}

	public Venue getVenue() {
		return venue;
	}

	public void setVenue(Venue venue) {
		this.venue = venue;
	}

	public double getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(double ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	public MultipartFile getImageGallery() {
		return imageGallery;
	}

	public void setImageGallery(MultipartFile imageGallery) {
		this.imageGallery = imageGallery;
	}

	public String getImageGalleryName() {
		return imageGalleryName;
	}

	public void setImageGalleryName(String imageGalleryName) {
		this.imageGalleryName = imageGalleryName;
	}

	public String getImageGalleryOriginalName() {
		return imageGalleryOriginalName;
	}

	public void setImageGalleryOriginalName(String imageGalleryOriginalName) {
		this.imageGalleryOriginalName = imageGalleryOriginalName;
	}

	public int getRemoveImageGallery() {
		return removeImageGallery;
	}

	public void setRemoveImageGallery(int removeImageGallery) {
		this.removeImageGallery = removeImageGallery;
	}

	public int getApprovalRequired() {
		return approvalRequired;
	}

	public void setApprovalRequired(int approvalRequired) {
		this.approvalRequired = approvalRequired;
	}

	public int getPaymentGatewayRequired() {
		return paymentGatewayRequired;
	}

	public void setPaymentGatewayRequired(int paymentGatewayRequired) {
		this.paymentGatewayRequired = paymentGatewayRequired;
	}

	public String getCreatedByName() {
		return createdByName;
	}

	public void setCreatedByName(String createdByName) {
		this.createdByName = createdByName;
	}

	public String getCreatedByRole() {
		return createdByRole;
	}

	public void setCreatedByRole(String createdByRole) {
		this.createdByRole = createdByRole;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(String createdTime) {
		this.createdTime = createdTime;
	}

	public String getEventUrl() {
		return eventUrl;
	}

	public void setEventUrl(String eventUrl) {
		this.eventUrl = eventUrl;
	}

	public int getNoOfAttendee() {
		return noOfAttendee;
	}

	public void setNoOfAttendee(int noOfAttendee) {
		this.noOfAttendee = noOfAttendee;
	}

	public int getNoOfParticipant() {
		return noOfParticipant;
	}

	public void setNoOfParticipant(int noOfParticipant) {
		this.noOfParticipant = noOfParticipant;
	}

	public int getNoOfAttendeLog() {
		return noOfAttendeLog;
	}

	public void setNoOfAttendeLog(int noOfAttendeLog) {
		this.noOfAttendeLog = noOfAttendeLog;
	}

	public Event(int eventId, int companyId, int branchId, String companyName, String branchName, int categoryId,
			Category category, String eventName, String description, int audienceId, List<Audience> audience,
			List<Integer> audienceIdList, String country, long phoneNo, String email, String artists,
			String eventStartDate, String eventLastDate, int venueId, Venue venue, double ticketPrice,
			MultipartFile imageGallery, String imageGalleryName, String imageGalleryOriginalName,
			int removeImageGallery, List<MultipartFile> imageGalleryList, List<String> imageGalleryNameList,
			List<String> imageGalleryOriginalNameList, List<Integer> removeImageGalleryList, int approvalRequired,
			int paymentGatewayRequired, String createdByName, String createdByRole, String createdDate,
			String createdTime, String eventUrl, int noOfAttendee, int noOfParticipant, int noOfAttendeLog) {
		super();
		this.eventId = eventId;
		this.companyId = companyId;
		this.branchId = branchId;
		this.companyName = companyName;
		this.branchName = branchName;
		this.categoryId = categoryId;
		this.category = category;
		this.eventName = eventName;
		this.description = description;
		this.audienceId = audienceId;
		this.audience = audience;
		this.audienceIdList = audienceIdList;
		this.country = country;
		this.phoneNo = phoneNo;
		this.email = email;
		this.artists = artists;
		this.eventStartDate = eventStartDate;
		this.eventLastDate = eventLastDate;
		this.venueId = venueId;
		this.venue = venue;
		this.ticketPrice = ticketPrice;
		this.imageGallery = imageGallery;
		this.imageGalleryName = imageGalleryName;
		this.imageGalleryOriginalName = imageGalleryOriginalName;
		this.removeImageGallery = removeImageGallery;
		this.imageGalleryList = imageGalleryList;
		this.imageGalleryNameList = imageGalleryNameList;
		this.imageGalleryOriginalNameList = imageGalleryOriginalNameList;
		this.removeImageGalleryList = removeImageGalleryList;
		this.approvalRequired = approvalRequired;
		this.paymentGatewayRequired = paymentGatewayRequired;
		this.createdByName = createdByName;
		this.createdByRole = createdByRole;
		this.createdDate = createdDate;
		this.createdTime = createdTime;
		this.eventUrl = eventUrl;
		this.noOfAttendee = noOfAttendee;
		this.noOfParticipant = noOfParticipant;
		this.noOfAttendeLog = noOfAttendeLog;
	}

	@Override
	public String toString() {
		return "Event [eventId=" + eventId + ", companyId=" + companyId + ", branchId=" + branchId + ", companyName="
				+ companyName + ", branchName=" + branchName + ", categoryId=" + categoryId + ", category=" + category
				+ ", eventName=" + eventName + ", description=" + description + ", audienceId=" + audienceId
				+ ", audience=" + audience + ", audienceIdList=" + audienceIdList + ", country=" + country
				+ ", phoneNo=" + phoneNo + ", email=" + email + ", artists=" + artists + ", eventStartDate="
				+ eventStartDate + ", eventLastDate=" + eventLastDate + ", venueId=" + venueId + ", venue=" + venue
				+ ", ticketPrice=" + ticketPrice + ", imageGallery=" + imageGallery + ", imageGalleryName="
				+ imageGalleryName + ", imageGalleryOriginalName=" + imageGalleryOriginalName + ", removeImageGallery="
				+ removeImageGallery + ", imageGalleryList=" + imageGalleryList + ", imageGalleryNameList="
				+ imageGalleryNameList + ", imageGalleryOriginalNameList=" + imageGalleryOriginalNameList
				+ ", removeImageGalleryList=" + removeImageGalleryList + ", approvalRequired=" + approvalRequired
				+ ", paymentGatewayRequired=" + paymentGatewayRequired + ", createdByName=" + createdByName
				+ ", createdByRole=" + createdByRole + ", createdDate=" + createdDate + ", createdTime=" + createdTime
				+ ", eventUrl=" + eventUrl + ", noOfAttendee=" + noOfAttendee + ", noOfParticipant=" + noOfParticipant
				+ ", noOfAttendeLog=" + noOfAttendeLog + "]";
	}

}
