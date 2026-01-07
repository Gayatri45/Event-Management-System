package com.onestop.codeitsoft.eventBackend.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.onestop.codeitsoft.eventBackend.entity.StallLog;

@Repository
public interface StallLogDao extends JpaRepository<StallLog, Integer>{

	@Query(nativeQuery = true, value = "Select * FROM stall_log where attendee_log_attendee_log_id =:attendeeLogId")
	List<StallLog> getStallLogByAttendeeLogId(int attendeeLogId);

	@Query(nativeQuery = true, value = "Select * FROM stall_log JOIN attendee_log where stall_log.attendee_log_attendee_log_id = attendee_log.attendee_log_id AND attendee_log.company_id =:companyId "
			+ "AND attendee_log.branch_id =:branchId AND stall_log.participant_participant_id =:participantId")
	List<StallLog> getStallLogListByCompanyIdBranchIdAndParticipantId(int companyId, int branchId, int participantId);

	@Query(nativeQuery = true, value = "Select * FROM stall_log JOIN attendee_log where stall_log.attendee_log_attendee_log_id = attendee_log.attendee_log_id AND"
			+ " attendee_log.company_id =:companyId AND attendee_log.branch_id =:branchId AND attendee_log.attendee_log_id =:attendeeLogId")
	List<StallLog> getStallLogListByCompanyIdBranchIdAndAttendeeLogId(int companyId, int branchId, int attendeeLogId);

}
