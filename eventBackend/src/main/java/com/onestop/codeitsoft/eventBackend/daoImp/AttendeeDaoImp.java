package com.onestop.codeitsoft.eventBackend.daoImp;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.onestop.codeitsoft.eventBackend.dao.AttendeeDao;
import com.onestop.codeitsoft.eventBackend.dao.EventDao;
import com.onestop.codeitsoft.eventBackend.entity.Attendee;

@Service
public class AttendeeDaoImp {
	
	@Autowired
	AttendeeDao attendeeDao;
	
	@Autowired 
	EventDao eventDao;
	
	public Attendee saveAttendee(Attendee attendee) {
		return attendeeDao.save(attendee);
	}

	public Optional<Attendee> getAttendeeByCompanyIdAndBranchIdExceptThis(int companyId, int branchId, int attendeeId) {
		return attendeeDao.getAttendeeByCompanyIdBranchIdAndEventIdExceptThis(companyId, branchId, attendeeId);
	}

	public Optional<Attendee> getattendeeByCompanyIdBranchIdAndEmailAndPhoneNo(int companyId, int branchId, String email, long phoneNo) {
		return attendeeDao.getattendeeByCompanyIdBranchIdAndEmailAndPhoneNo(companyId, branchId, email, phoneNo);
	}

	public List<Attendee> getAttendeeListByCompanyIdAndBranchId(int companyId, int branchId) {
		return attendeeDao.getAttendeeListByCompanyIdAndBranchId(companyId, branchId);
	}

	public Attendee getAttendeeById(Integer attendeeId) {
		return attendeeDao.getAttendeeById(attendeeId);
	}

	public List<Attendee> getAttendeeListByCompanyIdAndBranchIdAndApprovalStatus(int companyId, int branchId, int attendeeApprovalStatus) {
		return attendeeDao.getAttendeeListByCompanyIdAndBranchIdAndApprovalStatus(companyId, branchId, attendeeApprovalStatus);
	}

	public Attendee getAttendeeByCompanyIdBranchIdAndEmail(int companyId, int branchId, String email) {
		return attendeeDao.getAttendeeByCompanyIdBranchIdAndEmail(companyId, branchId, email);
	}

	public Attendee getAttendeeByCompanyIdBranchIdAndAttendeeId(int companyId, int branchId, int attendeeId) {
		return attendeeDao.getAttendeeByCompanyIdBranchIdAndAttendeeId(companyId, branchId, attendeeId);
	}

	public Attendee getEventByAttendeeCompanyIdBranchIdAndAttendeeId(int companyId, int branchId, int attendeeId) {
		return attendeeDao.getAttendeeByCompanyIdBranchIdAndAttendeeId(companyId, branchId, attendeeId);
	}

	public boolean getAttendeeByCompanyIdBranchIdAttendeeIdAndEventIdExceptThis(int companyId, int branchId,
			int attendeeId, int eventId) {
		return attendeeDao.getAttendeeByCompanyIdBranchIdAttendeeIdAndEventIdExceptThis(companyId, branchId, attendeeId, eventId);
	}

	public List<Attendee> getAttendeeListByCompanyIdAndBranchIdAndEventId(int companyId, int branchId, int eventId) {		
		return attendeeDao.getAttendeeListByCompanyIdAndBranchIdAndEventId(companyId, branchId, eventId);
	}

	public List<Attendee> getAttendeeList() {
		return attendeeDao.getAttendeeList();
	}

	public List<Attendee> getAttendeeListByEventId(int eventId) {
		return attendeeDao.getAttendeeListByEventId(eventId);
	}

	public List<Attendee> getAttendeeRowListByCompanyIdAndBranchId(int companyId, int branchId, int pageSize) {
		return attendeeDao.getAttendeeRowListByCompanyIdAndBranchId(companyId, branchId, pageSize);
	}

	public Page<Attendee> findAll(Pageable pageable) {
		return attendeeDao.findAll(pageable);
	}

	public List<Attendee> getAttendeeListDataByPage(int companyId, int branchId, int page, int pageSize) {		
		return attendeeDao.getAttendeeListDataByPage(companyId, branchId, page, pageSize);
	}

	public int getTotalAttendeeNumber(int companyId, int branchId) {		
		return attendeeDao.getTotalAttendeeNumber(companyId, branchId);
	}


}
