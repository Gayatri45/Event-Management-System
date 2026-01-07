package com.onestop.codeitsoft.event.organizer;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.onestop.codeitsoft.event.controller.EventApiController;
import com.onestop.codeitsoft.event.entity.Response;
import com.onestop.codeitsoft.event.services.ApiService;

@RestController
@RequestMapping("/organizer/report")
public class OrganizerReport {
	
	@Autowired
	private ApiService apiService;

	@Autowired
	private EventApiController eventApiController;

	@GetMapping("/attendee-event-report")
	public ModelAndView attendeeEventReport(HttpSession session) {

		HashMap userMap = (HashMap) session.getAttribute("userMap");
		ArrayList companyList = apiService.getCompanyList(userMap);
		
		ModelAndView mav = new ModelAndView("/organizer/attendee-event-report");
		mav.addObject("companyList", companyList);
		return mav;
	}
	
	@PostMapping("/getAttendeeEventReportTableList")
	public ModelAndView getAttendeeEventReportTableList(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId) {

		Response eventDetailsList = eventApiController.getAttendeeEventReport(companyId, branchId);
		ArrayList<HashMap> result = (ArrayList<HashMap>) eventDetailsList.getResult();

		ModelAndView mav = new ModelAndView("/organizer/eventAttendeeReportList");
		mav.addObject("eventReportList", result);
		return mav;
	}
	
	@GetMapping("/participant-event-report")
	public ModelAndView participantEventReport(HttpSession session) {

		HashMap userMap = (HashMap) session.getAttribute("userMap");
		ArrayList companyList = apiService.getCompanyList(userMap);
		
		ModelAndView mav = new ModelAndView("/organizer/participant-event-report");
		mav.addObject("companyList", companyList);
		return mav;
	}
	
	@PostMapping("/getParticipantEventReportTableList")
	public ModelAndView getParticipantEventReportTableList(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId) {

		Response eventDetailsList = eventApiController.getParticipantEventReport(companyId, branchId);
		ArrayList<HashMap> result = (ArrayList<HashMap>) eventDetailsList.getResult();

		ModelAndView mav = new ModelAndView("/organizer/eventParticipantReportList");
		mav.addObject("eventParticipantReportList", result);
		return mav;
	}
	

}
