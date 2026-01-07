package com.onestop.codeitsoft.eventBackend.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
public class AttendeeLog {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int attendeeLogId;

	private int companyId;

	private int branchId;

	private String companyName;

	private String branchName;
		
	@OneToOne
	@JsonManagedReference
	private StallLog stallLog;

	@OneToOne
	private Attendee attendee;

	@OneToOne
	private Event event;

	// check-in = 1, check-out = 0
	private int checkInOutStatus;

	private String checkIntime;

	private String checkOutTime;

	private String checkInDate;

	private String checkOutDate;

//	// 1 for check-in 0 for check-out
////	private int participantCheckInOutStatus;
////	
////	private String participantStallCheckInTime;
////	
////	private String participantStallCheckOutTime;
////	
////	private String participantStallCheckInDate;
////	
////	private String participantStallCheckOutDate;
//
//	// 1 for check-in 0 for check-out
////	@ElementCollection
////	private List<Integer> participantCheckInOutStatus;
////
////	@ElementCollection
////	private List<String> participantStallCheckInTime;
////
////	@ElementCollection
////	private List<String> participantStallCheckOutTime;
////
////	@ElementCollection
////	private List<String> participantStallCheckInDate;
////
////	@ElementCollection
////	private List<String> participantStallCheckOutDate;
//
////	@ManyToOne
////	@ElementCollection
////	private List<Participant> participant;
//	
//	
	// 111 for organizer get pass check-in-out
	// 222 for participant check-in-out
	private int attendeeLogStatus;

	public AttendeeLog() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getAttendeeLogId() {
		return attendeeLogId;
	}

	public void setAttendeeLogId(int attendeeLogId) {
		this.attendeeLogId = attendeeLogId;
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

	public StallLog getStallLog() {
		return stallLog;
	}

	public void setStallLog(StallLog stallLog) {
		this.stallLog = stallLog;
	}

	public Attendee getAttendee() {
		return attendee;
	}

	public void setAttendee(Attendee attendee) {
		this.attendee = attendee;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public int getCheckInOutStatus() {
		return checkInOutStatus;
	}

	public void setCheckInOutStatus(int checkInOutStatus) {
		this.checkInOutStatus = checkInOutStatus;
	}

	public String getCheckIntime() {
		return checkIntime;
	}

	public void setCheckIntime(String checkIntime) {
		this.checkIntime = checkIntime;
	}

	public String getCheckOutTime() {
		return checkOutTime;
	}

	public void setCheckOutTime(String checkOutTime) {
		this.checkOutTime = checkOutTime;
	}

	public String getCheckInDate() {
		return checkInDate;
	}

	public void setCheckInDate(String checkInDate) {
		this.checkInDate = checkInDate;
	}

	public String getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(String checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	public int getAttendeeLogStatus() {
		return attendeeLogStatus;
	}

	public void setAttendeeLogStatus(int attendeeLogStatus) {
		this.attendeeLogStatus = attendeeLogStatus;
	}

	public AttendeeLog(int attendeeLogId, int companyId, int branchId, String companyName, String branchName,
			StallLog stallLog, Attendee attendee, Event event, int checkInOutStatus, String checkIntime,
			String checkOutTime, String checkInDate, String checkOutDate, int attendeeLogStatus) {
		super();
		this.attendeeLogId = attendeeLogId;
		this.companyId = companyId;
		this.branchId = branchId;
		this.companyName = companyName;
		this.branchName = branchName;
		this.stallLog = stallLog;
		this.attendee = attendee;
		this.event = event;
		this.checkInOutStatus = checkInOutStatus;
		this.checkIntime = checkIntime;
		this.checkOutTime = checkOutTime;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.attendeeLogStatus = attendeeLogStatus;
	}

	@Override
	public String toString() {
		return "AttendeeLog [attendeeLogId=" + attendeeLogId + ", companyId=" + companyId + ", branchId=" + branchId
				+ ", companyName=" + companyName + ", branchName=" + branchName + ", stallLog=" + stallLog
				+ ", attendee=" + attendee + ", event=" + event + ", checkInOutStatus=" + checkInOutStatus
				+ ", checkIntime=" + checkIntime + ", checkOutTime=" + checkOutTime + ", checkInDate=" + checkInDate
				+ ", checkOutDate=" + checkOutDate + ", attendeeLogStatus=" + attendeeLogStatus + "]";
	}

	
}
