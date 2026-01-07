package com.onestop.codeitsoft.eventBackend.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.onestop.codeitsoft.eventBackend.entity.Venue;

@Repository
public interface VenueDao extends JpaRepository<Venue, Integer>{	

	@Query(nativeQuery = true, value = "SELECT * FROM venue WHERE company_id =:companyId AND branch_id =:branchId ORDER BY venue_name ASC")
	List<Venue> getVenueListByCompanyIdAndBranchId(int companyId, int branchId);

	@Query(nativeQuery = true, value = "SELECT * FROM venue WHERE venue_id =:venueId")
	public Venue getVenueById(int venueId);

	@Query(nativeQuery = true, value="SELECT * FROM venue WHERE company_Id =:companyId AND branch_Id =:branchId AND venue_name =:venueName AND street_address =:streetAddress AND city =:city AND state =:state AND "
			+ "postal_code =:postalCode AND country_id =:countryId")
	Optional<Venue> getVenueByCompanyIdBranchIdAndVenueNameStreetAddressCityStatePostalCodeCountryId(int companyId,
			int branchId, String venueName, String streetAddress, String city, String state, String postalCode,
			int countryId);

	@Query(nativeQuery = true, value="SELECT * FROM venue WHERE company_Id =:companyId AND branch_Id =:branchId AND venue_id <>:venueId AND venue_name =:venueName AND street_address =:streetAddress AND city =:city AND state =:state AND "
			+ "postal_code =:postalCode AND country_id =:countryId")
	Optional<Venue> getVenueByCompanyIdBranchIdAndVenueIdAndVenueNameStreetAddressCityStatePostalCodeCountryIdExceptThis(
			int companyId, int branchId, int venueId, String venueName, String streetAddress, String city, String state,
			String postalCode, int countryId);


}
