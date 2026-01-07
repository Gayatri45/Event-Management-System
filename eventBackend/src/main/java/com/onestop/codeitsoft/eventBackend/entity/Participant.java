package com.onestop.codeitsoft.eventBackend.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
public class Participant {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int participantId;
	
	private int companyId;
	
	private int branchId;
	
	private String companyName;
	
	private String branchName;
	
	private String participantName;
	
	private String stallName;
	
	private String stallDescription;
	
	private String participantEmail;
	
	private String participantPhoneNo;
	
	private String participantAddress;	
	
	private int participantLoginAccess;
	
	@OneToOne
	private Event event;
	
	@Transient
	private MultipartFile profilePic;
	
	private String profilePicName;
	
	private String profilePicOriginalName;
	
	private int removeProfilePic;
	
	@Transient
	private String qrCodeMessage;
	
	@Transient
	private int eventId;

	public Participant() {
		super();		
	}

	public Participant(int participantId, int companyId, int branchId, String companyName, String branchName,
			String participantName, String stallName, String stallDescription, String participantEmail,
			String participantPhoneNo, String participantAddress, int participantLoginAccess, Event event,
			MultipartFile profilePic, String profilePicName, String profilePicOriginalName, int removeProfilePic,
			String qrCodeMessage) {
		super();
		this.participantId = participantId;
		this.companyId = companyId;
		this.branchId = branchId;
		this.companyName = companyName;
		this.branchName = branchName;
		this.participantName = participantName;
		this.stallName = stallName;
		this.stallDescription = stallDescription;
		this.participantEmail = participantEmail;
		this.participantPhoneNo = participantPhoneNo;
		this.participantAddress = participantAddress;
		this.participantLoginAccess = participantLoginAccess;
		this.event = event;
		this.profilePic = profilePic;
		this.profilePicName = profilePicName;
		this.profilePicOriginalName = profilePicOriginalName;
		this.removeProfilePic = removeProfilePic;
		this.qrCodeMessage = qrCodeMessage;
	}

	public int getParticipantId() {
		return participantId;
	}

	public void setParticipantId(int participantId) {
		this.participantId = participantId;
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

	public String getParticipantName() {
		return participantName;
	}

	public void setParticipantName(String participantName) {
		this.participantName = participantName;
	}

	public String getStallName() {
		return stallName;
	}

	public void setStallName(String stallName) {
		this.stallName = stallName;
	}

	public String getStallDescription() {
		return stallDescription;
	}

	public void setStallDescription(String stallDescription) {
		this.stallDescription = stallDescription;
	}

	public String getParticipantEmail() {
		return participantEmail;
	}

	public void setParticipantEmail(String participantEmail) {
		this.participantEmail = participantEmail;
	}

	public String getParticipantPhoneNo() {
		return participantPhoneNo;
	}

	public void setParticipantPhoneNo(String participantPhoneNo) {
		this.participantPhoneNo = participantPhoneNo;
	}

	public String getParticipantAddress() {
		return participantAddress;
	}

	public void setParticipantAddress(String participantAddress) {
		this.participantAddress = participantAddress;
	}

	public int getParticipantLoginAccess() {
		return participantLoginAccess;
	}

	public void setParticipantLoginAccess(int participantLoginAccess) {
		this.participantLoginAccess = participantLoginAccess;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public MultipartFile getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(MultipartFile profilePic) {
		this.profilePic = profilePic;
	}

	public String getProfilePicName() {
		return profilePicName;
	}

	public void setProfilePicName(String profilePicName) {
		this.profilePicName = profilePicName;
	}

	public String getProfilePicOriginalName() {
		return profilePicOriginalName;
	}

	public void setProfilePicOriginalName(String profilePicOriginalName) {
		this.profilePicOriginalName = profilePicOriginalName;
	}

	public int getRemoveProfilePic() {
		return removeProfilePic;
	}

	public void setRemoveProfilePic(int removeProfilePic) {
		this.removeProfilePic = removeProfilePic;
	}

	public String getQrCodeMessage() {
		return qrCodeMessage;
	}

	public void setQrCodeMessage(String qrCodeMessage) {
		this.qrCodeMessage = qrCodeMessage;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	@Override
	public String toString() {
		return "Participant [participantId=" + participantId + ", companyId=" + companyId + ", branchId=" + branchId
				+ ", companyName=" + companyName + ", branchName=" + branchName + ", participantName=" + participantName
				+ ", stallName=" + stallName + ", stallDescription=" + stallDescription + ", participantEmail="
				+ participantEmail + ", participantPhoneNo=" + participantPhoneNo + ", participantAddress="
				+ participantAddress + ", participantLoginAccess=" + participantLoginAccess + ", event=" + event
				+ ", profilePic=" + profilePic + ", profilePicName=" + profilePicName + ", profilePicOriginalName="
				+ profilePicOriginalName + ", removeProfilePic=" + removeProfilePic + ", qrCodeMessage=" + qrCodeMessage
				+ "]";
	}

}
