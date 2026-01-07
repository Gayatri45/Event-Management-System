package com.onestop.codeitsoft.eventBackend.daoImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onestop.codeitsoft.eventBackend.dao.AttendeeLogDao;
import com.onestop.codeitsoft.eventBackend.entity.AttendeeLog;

@Service
public class AttendeeLogDaoImp {
	
	@Autowired 
	AttendeeLogDao attendeeLogDao;

	public AttendeeLog saveAttendeeLog(AttendeeLog attendeeLog) {
		return attendeeLogDao.save(attendeeLog);
	}

	public List<AttendeeLog> getAttendeeLogListByCompanyIdAndBranchIdAndParticipantId(int companyId, int branchId,
			int participantId) {
		return attendeeLogDao.getAttendeeLogListByCompanyIdAndBranchIdAndParticipantId(companyId, branchId, participantId);
	}

	public AttendeeLog getAttendeeLogDetailsByCompanyIdBranchIdAttendeeIdCheckInStatusAndAttendeeLogStatus(
			int companyId, int branchId, int attendeeId, int checkinstatus, int attendeelogstatusforgetpass) {
		return attendeeLogDao.getAttendeeLogDetailsByCompanyIdBranchIdAttendeeIdCheckInStatusAndAttendeeLogStatus(companyId, branchId, attendeeId, checkinstatus, attendeelogstatusforgetpass);
	}

	public List<Integer> getDistinctAttendeeIdByEventId(int eventId) {
		return attendeeLogDao.getDistinctAttendeeIdByEventId(eventId);
	}

	public AttendeeLog checkAttendeeIsCheckInOrNotAtGate(int companyId, int branchId, int eventId, int attendeeId, int checkinstatus, int attendeelogstatusforgetpass) {		
		return attendeeLogDao.checkAttendeeIsCheckInOrNotAtGate(companyId, branchId, eventId, attendeeId, checkinstatus, attendeelogstatusforgetpass);
	}

	public AttendeeLog checkIsThereAnyParticipantCheckInORNot(int companyId, int branchId, int eventId, int attendeeId,
			int checkinstatus, int attendeelogstatusforgetpass) {
		return attendeeLogDao.checkIsThereAnyParticipantCheckInORNot(companyId, branchId, eventId, attendeeId, checkinstatus, attendeelogstatusforgetpass);
	}

	public AttendeeLog checkParticipantIsLoginInAnotherStallORNot(int attendeeLogId, int stallLogId, int participantId,
			int participantcheckinstatus, int attendeelogstatusforparticipantstall) {
		return attendeeLogDao.checkParticipantIsLoginInAnotherStallORNot(attendeeLogId, stallLogId, participantId, participantcheckinstatus, attendeelogstatusforparticipantstall);
	}

	public AttendeeLog checkAttendeeIsCheckInOrNotAtGate(int companyId, int branchId, int eventId, int attendeeId,
			int participantId, int checkinstatus, int participantcheckinstatus,
			int attendeelogstatusforparticipantstall) {
		return attendeeLogDao.checkAttendeeIsCheckInOrNotAtGate(companyId, branchId, eventId, attendeeId, participantId, checkinstatus, participantcheckinstatus, attendeelogstatusforparticipantstall);
	}

	public List<AttendeeLog> getAttendeeLogListByCompanyIdAndBranchIdAndAttendeeLogStatus(int companyId, int branchId, int attendeelogstatusforgetpass) {
		return attendeeLogDao.getAttendeeLogListByCompanyIdAndBranchIdAndAttendeeLogStatus(companyId, branchId, attendeelogstatusforgetpass);
	}

	public List<AttendeeLog> getAttendeeLogList() {		
		return attendeeLogDao.getAttendeeLogList();
	}

	public List<AttendeeLog> getAttendeeLogListByCompanyIdBranchIdAndAttendeeLogId(int companyId, int branchId,
			int attendeeLogId) {
		return attendeeLogDao.getAttendeeLogListByCompanyIdBranchIdAndAttendeeLogId(companyId, branchId, attendeeLogId);
	}

	public List<AttendeeLog> getAttendeeLogListByCompanyIdBranchIdParticipantIdAndEventId(int companyId, int branchId,
			int participantId, int eventId) {
		return attendeeLogDao.getAttendeeLogListByCompanyIdBranchIdParticipantIdAndEventId(companyId, branchId, participantId, eventId);
	}

	public AttendeeLog checkIsThereAnyParticipantCheckInORNotAtGate(int companyId, int branchId, int eventId,
			int attendeeId, int checkinstatus, int attendeelogstatusforgetpass) {
		return attendeeLogDao.checkIsThereAnyParticipantCheckInORNotAtGate(companyId, branchId, eventId, attendeeId, checkinstatus, attendeelogstatusforgetpass);
	}

	public List<AttendeeLog> getAttendeeLogListByCompanyIdAndBranchIdAndEventId(int companyId, int branchId,
			int eventId) {		
		return attendeeLogDao.getAttendeeLogListByCompanyIdAndBranchIdAndEventId(companyId, branchId, eventId);
	}

}
