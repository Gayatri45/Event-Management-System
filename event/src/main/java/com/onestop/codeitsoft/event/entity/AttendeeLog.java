package com.onestop.codeitsoft.event.entity;

import java.util.List;


public class AttendeeLog {

	private int attendeeLogId;

	private int companyId;

	private int branchId;

	private String companyName;

	private String branchName;
		
	private StallLog stallLog;

	private Attendee attendee;

	private Event event;

	// check-in = 1, check-out = 0
	private int checkInOutStatus;

	private String checkIntime;

	private String checkOutTime;

	private String checkInDate;

	private String checkOutDate;
	
	private List<Integer> stallLogId;	
	
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

	public List<Integer> getStallLogId() {
		return stallLogId;
	}

	public void setStallLogId(List<Integer> stallLogId) {
		this.stallLogId = stallLogId;
	}

	public int getAttendeeLogStatus() {
		return attendeeLogStatus;
	}

	public void setAttendeeLogStatus(int attendeeLogStatus) {
		this.attendeeLogStatus = attendeeLogStatus;
	}

	public AttendeeLog(int attendeeLogId, int companyId, int branchId, String companyName, String branchName,
			StallLog stallLog, Attendee attendee, Event event, int checkInOutStatus, String checkIntime,
			String checkOutTime, String checkInDate, String checkOutDate, List<Integer> stallLogId,
			int attendeeLogStatus) {
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
		this.stallLogId = stallLogId;
		this.attendeeLogStatus = attendeeLogStatus;
	}

	@Override
	public String toString() {
		return "AttendeeLog [attendeeLogId=" + attendeeLogId + ", companyId=" + companyId + ", branchId=" + branchId
				+ ", companyName=" + companyName + ", branchName=" + branchName + ", stallLog=" + stallLog
				+ ", attendee=" + attendee + ", event=" + event + ", checkInOutStatus=" + checkInOutStatus
				+ ", checkIntime=" + checkIntime + ", checkOutTime=" + checkOutTime + ", checkInDate=" + checkInDate
				+ ", checkOutDate=" + checkOutDate + ", stallLogId=" + stallLogId + ", attendeeLogStatus="
				+ attendeeLogStatus + "]";
	}

}
