package com.onestop.codeitsoft.event.organizer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.onestop.codeitsoft.event.controller.EventApiController;
import com.onestop.codeitsoft.event.entity.Response;
import com.onestop.codeitsoft.event.entity.Venue;
import com.onestop.codeitsoft.event.services.ApiService;

@RestController
@RequestMapping("/organizer/venue")
public class OrganizerVenueController {
	
	@Autowired
	private ApiService apiService;
	
	@Autowired
	private EventApiController eventApiController;
	
//	-------------------- Add Venue -------------------
	
	@GetMapping("/add-venues")
    public ModelAndView addVenues(HttpSession session) {
		
		HashMap userMap = (HashMap) session.getAttribute("userMap");
		ArrayList companyList = apiService.getCompanyList(userMap);				
		ModelAndView mav = new ModelAndView("/organizer/add-venues");
		mav.addObject("companyList", companyList);
		return mav;
    }
		
	@PostMapping("/saveVenue")
	public Response saveVenue(@ModelAttribute Venue venue) throws IllegalStateException, IOException {
		
	    Response saveEvent = eventApiController.saveVenue(venue);
		return saveEvent;
	}
	
//	------------------------- My Venues ----------------
		
	@GetMapping("/my-venues")
    public ModelAndView myVenues(HttpSession session) {
		
		HashMap userMap = (HashMap) session.getAttribute("userMap");
		ArrayList companyList = apiService.getCompanyList(userMap);	
		
		ModelAndView mav = new ModelAndView("/organizer/my-venues");
		mav.addObject("companyList", companyList);
		return mav;
    }
	
	@PostMapping("/getVenueList")
	public ArrayList<HashMap> getVenueList(@RequestParam("companyId") int companyId, @RequestParam("branchId") int branchId) {
		
		Response venueList = eventApiController.getVenueList(companyId, branchId);
		ArrayList<HashMap> result = (ArrayList<HashMap>)venueList.getResult();
		return result;
	}
	
	@PostMapping("/getVenueTableList")
	public ModelAndView getVenueTableList(@RequestParam("companyId") int companyId, @RequestParam("branchId") int branchId) {
		
		Response venueList = eventApiController.getVenueList(companyId, branchId);
		ArrayList<HashMap> result = (ArrayList<HashMap>)venueList.getResult();
		ModelAndView mav = new ModelAndView("/organizer/venueList");
		mav.addObject("venueList", result);
		return mav;
	}
	
	@GetMapping("/edit-venues")
    public ModelAndView editEvents(@RequestParam("venueId") int venueId) {
		
		Response venueDetails = eventApiController.getVenueById(venueId);
		HashMap result = (HashMap) venueDetails.getResult();
		
		int companyId = (Integer)result.get("companyId");
		int branchId = (Integer)result.get("branchId");
		
		Response venueTypeList = eventApiController.getVenueTypeList(companyId, branchId);
		ArrayList<HashMap> venueType = (ArrayList<HashMap>)venueTypeList.getResult();
				
		ArrayList<HashMap> countryList = apiService.getCountryList();				
		
        ModelAndView mav = new ModelAndView("/organizer/edit-venues");
        mav.addObject("venueDetails", result);
        mav.addObject("venueTypeList", venueType);
        mav.addObject("countryList", countryList);
		return mav;
    }
	
	@GetMapping("/venues-details")
    public ModelAndView eventsDetails(@RequestParam("venueId") int venueId) {
		
		Response venueDetails = eventApiController.getVenueById(venueId);
		HashMap result = (HashMap) venueDetails.getResult();
		
        ModelAndView mav = new ModelAndView("/organizer/venues-details");
        mav.addObject("venueDetails", result);
		return mav;
    }

}
