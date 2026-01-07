package com.onestop.codeitsoft.event.entity;

public class StallLog {
	
	private int stallLogId;
	
	private Participant participant;
	
	private int participantStallLogStatus;
	
	// 1 for check-in 0 for check-out
	private int participantCheckInOutStatus;
	
	private String participantStallCheckInTime;
	
	private String participantStallCheckOutTime;
	
	private String participantStallCheckInDate;
	
	private String participantStallCheckOutDate;
	
	private AttendeeLog attendeeLog;

	public StallLog() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StallLog(int stallLogId, Participant participant, int participantCheckInOutStatus,
			String participantStallCheckInTime, String participantStallCheckOutTime, String participantStallCheckInDate,
			String participantStallCheckOutDate) {
		super();
		this.stallLogId = stallLogId;
		this.participant = participant;
		this.participantCheckInOutStatus = participantCheckInOutStatus;
		this.participantStallCheckInTime = participantStallCheckInTime;
		this.participantStallCheckOutTime = participantStallCheckOutTime;
		this.participantStallCheckInDate = participantStallCheckInDate;
		this.participantStallCheckOutDate = participantStallCheckOutDate;
	}

	public int getStallLogId() {
		return stallLogId;
	}

	public void setStallLogId(int stallLogId) {
		this.stallLogId = stallLogId;
	}

	public Participant getParticipant() {
		return participant;
	}

	public void setParticipant(Participant participant) {
		this.participant = participant;
	}

	public int getParticipantCheckInOutStatus() {
		return participantCheckInOutStatus;
	}

	public void setParticipantCheckInOutStatus(int participantCheckInOutStatus) {
		this.participantCheckInOutStatus = participantCheckInOutStatus;
	}

	public String getParticipantStallCheckInTime() {
		return participantStallCheckInTime;
	}

	public void setParticipantStallCheckInTime(String participantStallCheckInTime) {
		this.participantStallCheckInTime = participantStallCheckInTime;
	}

	public String getParticipantStallCheckOutTime() {
		return participantStallCheckOutTime;
	}

	public void setParticipantStallCheckOutTime(String participantStallCheckOutTime) {
		this.participantStallCheckOutTime = participantStallCheckOutTime;
	}

	public String getParticipantStallCheckInDate() {
		return participantStallCheckInDate;
	}

	public void setParticipantStallCheckInDate(String participantStallCheckInDate) {
		this.participantStallCheckInDate = participantStallCheckInDate;
	}

	public String getParticipantStallCheckOutDate() {
		return participantStallCheckOutDate;
	}

	public void setParticipantStallCheckOutDate(String participantStallCheckOutDate) {
		this.participantStallCheckOutDate = participantStallCheckOutDate;
	}

	public int getParticipantStallLogStatus() {
		return participantStallLogStatus;
	}

	public void setParticipantStallLogStatus(int participantStallLogStatus) {
		this.participantStallLogStatus = participantStallLogStatus;
	}

	public AttendeeLog getAttendeeLog() {
		return attendeeLog;
	}

	public void setAttendeeLog(AttendeeLog attendeeLog) {
		this.attendeeLog = attendeeLog;
	}

	@Override
	public String toString() {
		return "StallLog [stallLogId=" + stallLogId + ", participant=" + participant + ", participantStallLogStatus="
				+ participantStallLogStatus + ", participantCheckInOutStatus=" + participantCheckInOutStatus
				+ ", participantStallCheckInTime=" + participantStallCheckInTime + ", participantStallCheckOutTime="
				+ participantStallCheckOutTime + ", participantStallCheckInDate=" + participantStallCheckInDate
				+ ", participantStallCheckOutDate=" + participantStallCheckOutDate + ", attendeeLog=" + attendeeLog
				+ "]";
	}
	
}
