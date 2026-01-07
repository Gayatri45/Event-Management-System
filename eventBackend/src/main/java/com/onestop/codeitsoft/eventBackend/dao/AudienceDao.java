package com.onestop.codeitsoft.eventBackend.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.onestop.codeitsoft.eventBackend.entity.Audience;

@Repository
public interface AudienceDao extends JpaRepository<Audience, Integer> {

	@Query(nativeQuery = true, value="SELECT * FROM audience WHERE company_id =:companyId AND branch_id =:branchId AND audience_name =:audienceName")
	public Optional<Audience> getAudienceByCompanyIdBranchIdAndAudienceName(int companyId, int branchId, String audienceName);
	
	@Query(nativeQuery = true, value = "SELECT * FROM audience WHERE company_id =:companyId AND branch_id =:branchId")
	public List<Audience> getAudienceListByCompanyIdAndBranchId(@Param("companyId")int companyId, @Param("branchId")int branchId);

	@Query(nativeQuery = true, value = "SELECT * FROM audience WHERE audience_id =:audienceId")
	public Audience getAudienceById(Integer audienceId);

	@Query(nativeQuery = true, value="SELECT * FROM audience WHERE company_id =:companyId AND branch_id =:branchId AND audience_id <>:audienceId AND audience_name =:audienceName")
	public Optional<Audience> getAudienceByCompanyIdAndBranchIdAndAudienceIdAndAudienceNameExceptThis(int companyId,
			int branchId, int audienceId, String audienceName);

}
