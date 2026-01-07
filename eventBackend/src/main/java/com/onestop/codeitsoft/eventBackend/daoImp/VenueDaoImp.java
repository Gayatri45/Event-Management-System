package com.onestop.codeitsoft.eventBackend.daoImp;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onestop.codeitsoft.eventBackend.dao.VenueDao;
import com.onestop.codeitsoft.eventBackend.entity.Venue;

@Service
public class VenueDaoImp {
	
	@Autowired
	VenueDao venueDao;
	
	public Venue saveVenue(Venue venue) {
		return venueDao.save(venue);
	}
	
	public List<Venue> getVenueListByCompanyIdAndBranchId(int companyId, int branchId) {
		return venueDao.getVenueListByCompanyIdAndBranchId(companyId, branchId);
	}

	public Venue getVenueById(int venueId) {
		return venueDao.getVenueById(venueId);
	}

	public Optional<Venue> getVenueByCompanyIdBranchIdAndVenueNameStreetAddressCityStatePostalCodeCountryId(
			int companyId, int branchId, String venueName, String streetAddress, String city, String state,
			String postalCode, int countryId) {		
		return venueDao.getVenueByCompanyIdBranchIdAndVenueNameStreetAddressCityStatePostalCodeCountryId(companyId, branchId, venueName, streetAddress, city, state, postalCode, countryId);
	}

	public Optional<Venue> getVenueByCompanyIdBranchIdAndVenueIdAndVenueNameStreetAddressCityStatePostalCodeCountryIdExceptThis(
			int companyId, int branchId, int venueId, String venueName, String streetAddress, String city, String state,
			String postalCode, int countryId) {
		return venueDao.getVenueByCompanyIdBranchIdAndVenueIdAndVenueNameStreetAddressCityStatePostalCodeCountryIdExceptThis(companyId, branchId, venueId, venueName, streetAddress, city, state, postalCode, countryId);
	}

}
