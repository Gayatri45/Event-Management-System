package com.onestop.codeitsoft.eventBackend.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.onestop.codeitsoft.eventBackend.entity.Attendee;

@Repository
public interface AttendeeDao extends JpaRepository<Attendee, Integer> { 

	@Query(nativeQuery = true, value="SELECT * FROM attendee WHERE company_Id =:companyId AND branch_Id =:branchId AND attendee_id <>:attendeeId")
	public Optional<Attendee> getAttendeeByCompanyIdBranchIdAndEventIdExceptThis(int companyId, int branchId, int attendeeId);
	
	@Query(nativeQuery = true, value="SELECT * FROM attendee WHERE company_Id =:companyId AND branch_Id =:branchId AND email =:email AND phone_no =:phoneNo")
	public Optional<Attendee> getattendeeByCompanyIdBranchIdAndEmailAndPhoneNo(int companyId, int branchId,
			String email, long phoneNo);

	@Query(nativeQuery = true, value = "SELECT * FROM attendee WHERE company_id =:companyId AND branch_id =:branchId ORDER BY attendee_id DESC")
	public List<Attendee> getAttendeeListByCompanyIdAndBranchId(int companyId, int branchId);

	@Query(nativeQuery = true, value = "SELECT * FROM attendee WHERE attendee_id =:attendeeId")
	public Attendee getAttendeeById(Integer attendeeId);	

	@Query(nativeQuery = true, value="SELECT * FROM attendee WHERE company_id =:companyId AND branch_id =:branchId AND attendee_approval_status =:attendeeApprovalStatus")
	public List<Attendee> getAttendeeListByCompanyIdAndBranchIdAndApprovalStatus(int companyId, int branchId, int attendeeApprovalStatus);

	@Query(nativeQuery = true, value="SELECT * FROM attendee WHERE company_id =:companyId AND branch_id =:branchId AND email=:email")
	public Attendee getAttendeeByCompanyIdBranchIdAndEmail(int companyId, int branchId, String email);

	@Query(nativeQuery = true, value="SELECT * FROM attendee WHERE company_id =:companyId AND branch_id =:branchId AND attendee_id =:attendeeId")
	public Attendee getAttendeeByCompanyIdBranchIdAndAttendeeId(int companyId, int branchId, int attendeeId);
		
//	@Query(nativeQuery = true, value="INSERT INTO attendee_event (attendee_attendee_id, event_event_id) VALUES (attendeeId, eventId)")
//	public Attendee saveEventToAttendee(int attendeeId, int eventId);
	
	@Query(nativeQuery = true, value="SELECT * FROM attendee WHERE company_Id =:companyId AND branch_Id =:branchId AND attendee_id =:attendeeId AND event_event_id =:eventId")
	public boolean getAttendeeByCompanyIdBranchIdAttendeeIdAndEventIdExceptThis(int companyId, int branchId, int attendeeId, int eventId);
	
	@Query(nativeQuery = true, value = "SELECT * FROM attendee WHERE company_id =:companyId AND branch_id =:branchId AND event_event_id =:eventId")
	public List<Attendee> getAttendeeListByCompanyIdAndBranchIdAndEventId(int companyId, int branchId, int eventId);
	
	@Query(nativeQuery = true, value = "SELECT * FROM attendee")
	public List<Attendee> getAttendeeList();

	@Query(nativeQuery = true, value = "SELECT * FROM attendee WHERE event_event_id =:eventId")
	public List<Attendee> getAttendeeListByEventId(int eventId);

	@Query(nativeQuery = true, value = "SELECT * FROM attendee WHERE company_id =:companyId AND branch_id =:branchId ORDER BY attendee_id DESC LIMIT :pageSize")
	public List<Attendee> getAttendeeRowListByCompanyIdAndBranchId(int companyId, int branchId, int pageSize);

	//@Query(nativeQuery = true, value = "SELECT ROW_NUMBER() OVER (ORDER BY attendee_id) AS slno, attendee_id, company_id, branch_id, first_name, last_name, phone_no, email, dob, gender, address, event_event_id, category_category_id, venue_venue_id, review, attendee_login_access, attendee_approval_status, payment, qr_code_image_name, qr_code_image_original_name, attendee_code, update_attendee FROM attendee WHERE company_id =:companyId AND branch_id =:branchId ORDER BY attendee_id DESC LIMIT :pageSize OFFSET :page")
	
	@Query(nativeQuery = true, value = "SELECT * FROM attendee WHERE company_id =:companyId AND branch_id =:branchId ORDER BY attendee_id DESC LIMIT :pageSize OFFSET :page")	
	public List<Attendee> getAttendeeListDataByPage(int companyId, int branchId, int page, int pageSize);
	
	@Query(nativeQuery = true, value = "SELECT count(*) FROM attendee WHERE company_id =:companyId AND branch_id =:branchId")
	public int getTotalAttendeeNumber(int companyId, int branchId);


}

