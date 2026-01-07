package com.onestop.codeitsoft.eventBackend.daoImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onestop.codeitsoft.eventBackend.dao.StallLogDao;
import com.onestop.codeitsoft.eventBackend.entity.StallLog;

@Service
public class StallLogDaoImp {
	
	@Autowired
	StallLogDao stallLogDao;

	public StallLog saveStallLog(StallLog participantAttendeeLog) {
		return stallLogDao.save(participantAttendeeLog);
	}

	public List<StallLog> getStallLogByAttendeeLogId(int attendeeLogId) {
		return stallLogDao.getStallLogByAttendeeLogId(attendeeLogId);
	}

	public List<StallLog> getStallLogListByCompanyIdBranchIdAndParticipantId(int companyId, int branchId,
			int participantId) {
		return stallLogDao.getStallLogListByCompanyIdBranchIdAndParticipantId(companyId, branchId, participantId);
	}

	public List<StallLog> getStallLogListByCompanyIdBranchIdAndAttendeeLogId(int companyId, int branchId,
			int attendeeLogId) {
		return stallLogDao.getStallLogListByCompanyIdBranchIdAndAttendeeLogId(companyId, branchId, attendeeLogId);
	}
	

}
