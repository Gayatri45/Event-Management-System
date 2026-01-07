package com.onestop.codeitsoft.event.organizer;

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
import com.onestop.codeitsoft.event.entity.Participant;
import com.onestop.codeitsoft.event.entity.Response;
import com.onestop.codeitsoft.event.services.ApiService;

@RestController
@RequestMapping("/organizer/participant")
public class OrganizerParticipant {

	@Autowired
	private ApiService apiService;

	@Autowired
	private EventApiController eventApiController;

	@GetMapping("/add-participant")
	public ModelAndView addVenues(HttpSession session) {

		HashMap userMap = (HashMap) session.getAttribute("userMap");
		ArrayList companyList = apiService.getCompanyList(userMap);
		ModelAndView mav = new ModelAndView("/organizer/add-participant");
		mav.addObject("companyList", companyList);
		return mav;
	}

	@PostMapping("/saveParticipant")
	public Response saveParticipant(@ModelAttribute Participant participant) throws Exception {
		
		if(participant.getParticipantId() > 0) {
			 Response participantById = eventApiController.getParticipantById(participant.getParticipantId());
			 HashMap result = (HashMap) participantById.getResult();
			if(participant.getProfilePic() == null) {
				Participant participantDetails = new Participant(result);
				participant.setProfilePic(participantDetails.getProfilePic());
			}
		}
		
		Response saveEvent = eventApiController.saveParticipant(participant);		
		return saveEvent;
	}

	@GetMapping("/participant-list")
	public ModelAndView myVenues(HttpSession session) {

		HashMap userMap = (HashMap) session.getAttribute("userMap");
		ArrayList companyList = apiService.getCompanyList(userMap);

		ModelAndView mav = new ModelAndView("/organizer/participant-list");
		mav.addObject("companyList", companyList);
		return mav;
	}

	@PostMapping("/getparticipantTableList")
	public ModelAndView getVenueTableList(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId) {

		Response participantList = eventApiController.getParticipantList(companyId, branchId);
		ArrayList<HashMap> result = (ArrayList<HashMap>) participantList.getResult();

		ModelAndView mav = new ModelAndView("/organizer/participantList");
		mav.addObject("participantList", result);
		return mav;
	}

	@GetMapping("/edit-participant")
	public ModelAndView editParticipant(@RequestParam("participantId") int participantId) {

		Response participantById = eventApiController.getParticipantById(participantId);
		HashMap result = (HashMap) participantById.getResult();

		int companyId = (Integer) result.get("companyId");
		int branchId = (Integer) result.get("branchId");

		Response eventList = eventApiController.getEventList(companyId, branchId);
		ArrayList<HashMap> event = (ArrayList<HashMap>) eventList.getResult();

		ModelAndView mav = new ModelAndView("/organizer/edit-participant");
		mav.addObject("participantDetails", result);
		mav.addObject("eventList", event);
		return mav;
	}

	@GetMapping("/participant-details")
	public ModelAndView participantDetails(@RequestParam("participantId") int participantId) {

		Response participantById = eventApiController.getParticipantById(participantId);
		HashMap result = (HashMap) participantById.getResult();

		ModelAndView mav = new ModelAndView("/organizer/participant-details");
		mav.addObject("participantDetails", result);
		return mav;
	}
	
	@GetMapping("/getParticipantByEventIdTableList")
	public ModelAndView getParticipantByEventIdTableList(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId, @RequestParam("eventId") int eventId) {

		Response participantList = eventApiController.getParticipantListByEventId(companyId, branchId, eventId);
		ArrayList<HashMap> result = (ArrayList<HashMap>) participantList.getResult();

		ModelAndView mav = new ModelAndView("/organizer/event-participants");
		mav.addObject("participantList", result);
		return mav;
	}
}
