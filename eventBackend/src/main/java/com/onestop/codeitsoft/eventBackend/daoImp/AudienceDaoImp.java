package com.onestop.codeitsoft.eventBackend.daoImp;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onestop.codeitsoft.eventBackend.dao.AudienceDao;
import com.onestop.codeitsoft.eventBackend.entity.Audience;

@Service
public class AudienceDaoImp {
	
	@Autowired
	AudienceDao audienceDao;
	
	public Audience saveAudience(Audience audience) {
		return audienceDao.save(audience);
	}

	public Optional<Audience> getAudienceByCompanyIdBranchIdAndAudienceName(int companyId, int branchId, String audienceName) {
		return audienceDao.getAudienceByCompanyIdBranchIdAndAudienceName(companyId, branchId, audienceName);
	}

	public List<Audience> getAudienceListByCompanyIdAndBranchId(int companyId, int branchId) {
		return audienceDao.getAudienceListByCompanyIdAndBranchId(companyId, branchId);
	}

	public Audience getAudienceById(Integer audienceId) {
		return audienceDao.getAudienceById(audienceId);
	}

	public Optional<Audience> getAudienceByCompanyIdAndBranchIdAndAudienceIdAndAudienceNameExceptThis(int companyId,
			int branchId, int audienceId, String audienceName) {
		return audienceDao.getAudienceByCompanyIdAndBranchIdAndAudienceIdAndAudienceNameExceptThis(companyId, branchId, audienceId, audienceName);
	}
}
