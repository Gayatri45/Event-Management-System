package com.onestop.codeitsoft.eventBackend.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.onestop.codeitsoft.eventBackend.entity.AttendeeLog;

@Repository
public interface AttendeeLogDao extends JpaRepository<AttendeeLog, Integer> {

	@Query(nativeQuery = true, value = "SELECT * FROM attendee_log JOIN stall_log WHERE attendee_log.company_id =:companyId AND attendee_log.branch_id =:branchId AND "
			+ "stall_log.participant_participant_id =:participantId")
	List<AttendeeLog> getAttendeeLogListByCompanyIdAndBranchIdAndParticipantId(int companyId, int branchId,
			int participantId);

	@Query(nativeQuery = true, value = "SELECT * FROM attendee_log WHERE company_id =:companyId AND branch_id =:branchId AND attendee_attendee_id =:attendeeId AND check_in_out_status =:checkinstatus AND attendee_log_status =:attendeelogstatusforgetpass")
	AttendeeLog getAttendeeLogDetailsByCompanyIdBranchIdAttendeeIdCheckInStatusAndAttendeeLogStatus(int companyId,
			int branchId, int attendeeId, int checkinstatus, int attendeelogstatusforgetpass);

	@Query(nativeQuery = true, value = "SELECT DISTINCT attendee_attendee_id FROM attendee_log WHERE event_event_id =:eventId")
	List<Integer> getDistinctAttendeeIdByEventId(int eventId);
	
	@Query(nativeQuery = true, value = "SELECT * FROM attendee_log where company_id =:companyId AND branch_id =:branchId AND event_event_id =:eventId AND attendee_attendee_id =:attendeeId AND "
			+ "check_in_out_status =:checkinstatus AND attendee_log_status =:attendeelogstatusforgetpass")
	AttendeeLog checkAttendeeIsCheckInOrNotAtGate(int companyId, int branchId, int eventId, int attendeeId, int checkinstatus, int attendeelogstatusforgetpass);

	@Query(nativeQuery = true, value = "SELECT * FROM attendee_log where company_id =:companyId AND branch_id =:branchId AND event_event_id =:eventId AND attendee_attendee_id =:attendeeId AND "
			+ "stall_log_stall_log_id IS NOT NULL AND check_in_out_status =:checkinstatus AND attendee_log_status =:attendeelogstatusforgetpass")
	AttendeeLog checkIsThereAnyParticipantCheckInORNot(int companyId, int branchId, int eventId, int attendeeId,
			int checkinstatus, int attendeelogstatusforgetpass);
	
	@Query(nativeQuery = true, value = "SELECT * FROM attendee_log where company_id =:companyId AND branch_id =:branchId AND event_event_id =:eventId AND attendee_attendee_id =:attendeeId AND "
			+ "check_in_out_status =:checkinstatus AND attendee_log_status =:attendeelogstatusforgetpass")
	AttendeeLog checkIsThereAnyParticipantCheckInORNotAtGate(int companyId, int branchId, int eventId, int attendeeId,
			int checkinstatus, int attendeelogstatusforgetpass);

	@Query(nativeQuery = true, value = "SELECT * FROM attendee_log JOIN stall_log where attendee_log.stall_log_stall_log_id = stall_log.stall_log_id AND stall_log.stall_log_id =:stallLogId AND attendee_log_id =:attendeeLogId AND stall_log.participant_participant_id <>:participantId AND stall_log.participant_check_in_out_status =:participantcheckinstatus AND stall_log.participant_stall_log_status =:attendeelogstatusforparticipantstall")
	AttendeeLog checkParticipantIsLoginInAnotherStallORNot(int attendeeLogId, int stallLogId, int participantId,
			int participantcheckinstatus, int attendeelogstatusforparticipantstall);

	@Query(nativeQuery = true, value = "SELECT * FROM attendee_log JOIN stall_log where attendee_log.company_id =:companyId AND attendee_log.branch_id =:branchId AND "
			+ "attendee_log.event_event_id =:eventId AND attendee_log.attendee_attendee_id =:attendeeId AND stall_log.participant_participant_id =:participantId "
			+ "AND attendee_log.check_in_out_status =:checkinstatus AND stall_log.participant_check_in_out_status =:participantcheckinstatus "
			+ "AND stall_log.participant_stall_log_status =:attendeelogstatusforparticipantstall")
	AttendeeLog checkAttendeeIsCheckInOrNotAtGate(int companyId, int branchId, int eventId, int attendeeId, int participantId, int checkinstatus, int participantcheckinstatus, 
			int attendeelogstatusforparticipantstall);

	@Query(nativeQuery = true, value = "SELECT * FROM attendee_log WHERE company_id =:companyId AND branch_id =:branchId AND attendee_log_status =:attendeelogstatusforgetpass ORDER BY attendee_log_id DESC")
	List<AttendeeLog> getAttendeeLogListByCompanyIdAndBranchIdAndAttendeeLogStatus(int companyId, int branchId, int attendeelogstatusforgetpass);

	@Query(nativeQuery = true, value = "SELECT * FROM attendee_log")
	List<AttendeeLog> getAttendeeLogList();

	@Query(nativeQuery = true, value = "SELECT * FROM attendee_log where company_id =:companyId AND branch_id =:branchId AND attendee_log_id =:attendeeLogId")
	List<AttendeeLog> getAttendeeLogListByCompanyIdBranchIdAndAttendeeLogId(int companyId, int branchId, int attendeeLogId);

	@Query(nativeQuery = true, value = "SELECT * FROM attendee_log JOIN stall_log WHERE attendee_log.stall_log_stall_log_id = stall_log.stall_log_id AND attendee_log.company_id =:companyId AND attendee_log.branch_id =:branchId AND "
			+ "stall_log.participant_participant_id =:participantId AND attendee_log.event_event_id =:eventId")
	List<AttendeeLog> getAttendeeLogListByCompanyIdBranchIdParticipantIdAndEventId(int companyId, int branchId,
			int participantId, int eventId);

	@Query(nativeQuery = true, value = "SELECT * FROM attendee_log where company_id =:companyId AND branch_id =:branchId AND event_event_id =:eventId")
	List<AttendeeLog> getAttendeeLogListByCompanyIdAndBranchIdAndEventId(int companyId, int branchId, int eventId);
 
}
