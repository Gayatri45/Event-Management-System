package com.onestop.codeitsoft.eventBackend.daoImp;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.onestop.codeitsoft.eventBackend.dao.ParticipantDao;
import com.onestop.codeitsoft.eventBackend.entity.Category;
import com.onestop.codeitsoft.eventBackend.entity.Participant;

@Service
public class ParticipantDaoImp{
	
	@Autowired
	private ParticipantDao participantDao;
	
	public Participant saveParticipant(Participant participant) {
		return participantDao.save(participant);
	}

	public List<Participant> getParticipantListByCompanyIdAndBranchId(int companyId, int branchId) {		
		return participantDao.getParticipantListByCompanyIdAndBranchId(companyId, branchId);
	}

	public Participant getParticipantByCompanyIdBranchIdAndEmail(int companyId, int branchId, String email) {
		return participantDao.getParticipantByCompanyIdBranchIdAndEmail(companyId, branchId, email);
	}

	public Participant getParticipateDetailsByCompanyIdAndBranchIdAndParticipantId(int companyId, int branchId,
			int participantId) {
		return participantDao.getParticipateDetailsByCompanyIdAndBranchIdAndParticipantId(companyId, branchId, participantId);
	}

	public Participant getParticipantById(int participantId) {
		return participantDao.getParticipantById(participantId);
	}

	public List<Participant> getParticipantListByCompanyIdAndBranchIdAndEventId(int companyId, int branchId, int eventId) {
		return participantDao.getParticipantListByCompanyIdAndBranchIdAndEventId(companyId, branchId, eventId);
	}

	public List<Participant> getParticipantList() {
		return participantDao.getParticipantList();
	}

	public List<Participant> getParticipantListByEventId(int eventId) {
		return participantDao.getParticipantListByEventId(eventId);
	}

	public Optional<Category> getParticipantByCompanyIdBranchIdAndAndParticipantIdAndParticipantNameExceptThis(
			int companyId, int branchId, int participantId, String participantEmail) {
		return participantDao.getParticipantByCompanyIdBranchIdAndAndParticipantIdAndParticipantNameExceptThis(companyId, branchId, participantId, participantEmail);
	}

	public Optional<Category> getParticipantByCompanyIdBranchIdAndParticipantEmail(int companyId, int branchId,
			String participantEmail) {
		return participantDao.getParticipantByCompanyIdBranchIdAndParticipantEmail(companyId, branchId, participantEmail);
	}

}
