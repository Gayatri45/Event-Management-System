package com.onestop.codeitsoft.eventBackend.daoImp;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onestop.codeitsoft.eventBackend.dao.VenueTypeDao;
import com.onestop.codeitsoft.eventBackend.entity.VenueType;

@Service
public class VenueTypeDaoImp {
	
	@Autowired
	VenueTypeDao venueTypeDao;
	
	public VenueType saveVenueType(VenueType venueType) {	
		return venueTypeDao.save(venueType);
	}

	public Optional<VenueType> getvenueTypeByCompanyIdBranchIdAndName(int companyId, int branchId, String name) {
		return venueTypeDao.getVenueTypeByCompanyIdBranchIdAndName(companyId, branchId, name);
	}

	public List<VenueType> getVenueTypeListByCompanyIdAndBranchId(int companyId, int branchId) {
		return venueTypeDao.getVenueTypeListByCompanyIdAndBranchId(companyId, branchId);
	}

	public VenueType getVenueTypeById(int venueTypeId) {
		return venueTypeDao.getVenueTypeById(venueTypeId);
	}

	public Optional<VenueType> getVenueTypeByCompanyIdBranchIdAndVenueTypeIdAndVenueNameExceptThis(int companyId,
			int branchId, int venueTypeId, String name) {
		return venueTypeDao.getVenueTypeByCompanyIdBranchIdAndVenueTypeIdAndVenueNameExceptThis(companyId, branchId, venueTypeId, name);
	}


}
