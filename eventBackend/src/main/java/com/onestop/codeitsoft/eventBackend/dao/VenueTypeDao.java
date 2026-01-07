package com.onestop.codeitsoft.eventBackend.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.onestop.codeitsoft.eventBackend.entity.VenueType;

@Repository
public interface VenueTypeDao extends JpaRepository<VenueType, Integer>{

	@Query(nativeQuery = true, value="SELECT * FROM venue_type WHERE company_Id =:companyId AND branch_Id =:branchId AND name =:name")
	Optional<VenueType> getVenueTypeByCompanyIdBranchIdAndName(int companyId, int branchId, String name);

	@Query(nativeQuery = true, value = "SELECT * FROM venue_type WHERE company_id =:companyId AND branch_id =:branchId")
	List<VenueType> getVenueTypeListByCompanyIdAndBranchId(int companyId, int branchId);

	@Query(nativeQuery = true, value = "SELECT * FROM venue_type WHERE venue_type_id =:venueTypeId")
	VenueType getVenueTypeById(int venueTypeId);

	@Query(nativeQuery = true, value="SELECT * FROM venue_type WHERE company_Id =:companyId AND branch_Id =:branchId AND venue_type_id <>:venueTypeId AND name =:name")
	Optional<VenueType> getVenueTypeByCompanyIdBranchIdAndVenueTypeIdAndVenueNameExceptThis(int companyId, int branchId,
			int venueTypeId, String name);

}
