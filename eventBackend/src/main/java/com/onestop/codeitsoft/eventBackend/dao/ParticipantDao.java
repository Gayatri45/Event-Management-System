package com.onestop.codeitsoft.eventBackend.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.onestop.codeitsoft.eventBackend.entity.Category;
import com.onestop.codeitsoft.eventBackend.entity.Participant;

@Repository
public interface ParticipantDao extends JpaRepository<Participant, Integer>{
	
	@Query(nativeQuery = true, value = "SELECT * FROM participant WHERE company_id =:companyId AND branch_id =:branchId ORDER BY participant_id DESC")
	List<Participant> getParticipantListByCompanyIdAndBranchId(int companyId, int branchId);

	@Query(nativeQuery = true, value="SELECT * FROM participant WHERE company_Id =:companyId AND branch_Id =:branchId AND participant_email =:email")
	Participant getParticipantByCompanyIdBranchIdAndEmail(int companyId, int branchId, String email);

	@Query(nativeQuery = true, value="SELECT * FROM participant WHERE company_Id =:companyId AND branch_Id =:branchId AND participant_id =:participantId")
	Participant getParticipateDetailsByCompanyIdAndBranchIdAndParticipantId(int companyId, int branchId,
			int participantId);

	@Query(nativeQuery = true, value = "SELECT * FROM participant WHERE participant_id =:participantId")
	Participant getParticipantById(int participantId);

	@Query(nativeQuery = true, value="SELECT * FROM participant WHERE company_Id =:companyId AND branch_Id =:branchId AND event_event_id =:eventId")
	List<Participant> getParticipantListByCompanyIdAndBranchIdAndEventId(int companyId, int branchId, int eventId);

	@Query(nativeQuery = true, value = "SELECT * FROM participant")
	List<Participant> getParticipantList();

	@Query(nativeQuery = true, value = "SELECT * FROM participant WHERE event_event_id =:eventId")
	List<Participant> getParticipantListByEventId(int eventId);

	@Query(nativeQuery = true, value="SELECT * FROM participant WHERE company_Id =:companyId AND branch_Id =:branchId AND participant_id <>:participantId AND participant_email =:participantEmail")
	Optional<Category> getParticipantByCompanyIdBranchIdAndAndParticipantIdAndParticipantNameExceptThis(int companyId,
			int branchId, int participantId, String participantEmail);

	@Query(nativeQuery = true, value="SELECT * FROM participant WHERE company_Id =:companyId AND branch_Id =:branchId AND participant_email =:participantEmail")
	Optional<Category> getParticipantByCompanyIdBranchIdAndParticipantEmail(int companyId, int branchId,
			String participantEmail);

}
