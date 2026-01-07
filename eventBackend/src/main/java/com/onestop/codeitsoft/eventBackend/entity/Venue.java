package com.onestop.codeitsoft.eventBackend.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Venue {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int venueId;
	
	private int companyId;

	private int branchId;

	private String companyName;

	private String branchName;
	
	private String venueName;
	
	private String description;
	
	@OneToOne
	private VenueType venueType;
	
//	@Transient
//	@ElementCollection
//	private List<Audience> audience;
	
	private int seatedGuestNo;
	
	private int standingGuestNo;
	
//	private String neighborhoods;
	
//	private double pricing;
	
//	private float availablity;
	
	private String foodAndBeverageDetails;
	
//	private int showQuoteOnVenuePage;
	
	private String contactEmail;
	
	private String streetAddress;
	
	private String streetAddress2;
	
	private String city;
	
	private String postalCode;
	
	private String state;
	
	private int countryId;
	
	private String countryCode;
	
	private String countryName;
	
	private String isdCode;
	
//	private int showMap;
	
//	@Transient
//	private MultipartFile image;
	
//	private String imageName;
	
//	private String imageOriginalName;
	
//	private int removeImage;	

	public Venue() {
		
	}

	public int getVenueId() {
		return venueId;
	}

	public void setVenueId(int venueId) {
		this.venueId = venueId;
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

	public String getVenueName() {
		return venueName;
	}

	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public VenueType getVenueType() {
		return venueType;
	}

	public void setVenueType(VenueType venueType) {
		this.venueType = venueType;
	}

	public int getSeatedGuestNo() {
		return seatedGuestNo;
	}

	public void setSeatedGuestNo(int seatedGuestNo) {
		this.seatedGuestNo = seatedGuestNo;
	}

	public int getStandingGuestNo() {
		return standingGuestNo;
	}

	public void setStandingGuestNo(int standingGuestNo) {
		this.standingGuestNo = standingGuestNo;
	}

	public String getFoodAndBeverageDetails() {
		return foodAndBeverageDetails;
	}

	public void setFoodAndBeverageDetails(String foodAndBeverageDetails) {
		this.foodAndBeverageDetails = foodAndBeverageDetails;
	}

	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getStreetAddress2() {
		return streetAddress2;
	}

	public void setStreetAddress2(String streetAddress2) {
		this.streetAddress2 = streetAddress2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getCountryId() {
		return countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getIsdCode() {
		return isdCode;
	}

	public void setIsdCode(String isdCode) {
		this.isdCode = isdCode;
	}

	public Venue(int venueId, int companyId, int branchId, String companyName, String branchName, String venueName,
			String description, VenueType venueType, int seatedGuestNo, int standingGuestNo,
			String foodAndBeverageDetails, String contactEmail, String streetAddress, String streetAddress2,
			String city, String postalCode, String state, int countryId, String countryCode, String countryName,
			String isdCode) {
		super();
		this.venueId = venueId;
		this.companyId = companyId;
		this.branchId = branchId;
		this.companyName = companyName;
		this.branchName = branchName;
		this.venueName = venueName;
		this.description = description;
		this.venueType = venueType;
		this.seatedGuestNo = seatedGuestNo;
		this.standingGuestNo = standingGuestNo;
		this.foodAndBeverageDetails = foodAndBeverageDetails;
		this.contactEmail = contactEmail;
		this.streetAddress = streetAddress;
		this.streetAddress2 = streetAddress2;
		this.city = city;
		this.postalCode = postalCode;
		this.state = state;
		this.countryId = countryId;
		this.countryCode = countryCode;
		this.countryName = countryName;
		this.isdCode = isdCode;
	}

	@Override
	public String toString() {
		return "Venue [venueId=" + venueId + ", companyId=" + companyId + ", branchId=" + branchId + ", companyName="
				+ companyName + ", branchName=" + branchName + ", venueName=" + venueName + ", description="
				+ description + ", venueType=" + venueType + ", seatedGuestNo=" + seatedGuestNo + ", standingGuestNo="
				+ standingGuestNo + ", foodAndBeverageDetails=" + foodAndBeverageDetails + ", contactEmail="
				+ contactEmail + ", streetAddress=" + streetAddress + ", streetAddress2=" + streetAddress2 + ", city="
				+ city + ", postalCode=" + postalCode + ", state=" + state + ", countryId=" + countryId
				+ ", countryCode=" + countryCode + ", countryName=" + countryName + ", isdCode=" + isdCode + "]";
	}
}
