package com.onestop.codeitsoft.event.participant;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.onestop.codeitsoft.event.controller.EventApiController;
import com.onestop.codeitsoft.event.entity.Response;

@RestController
@RequestMapping("/participant/attendee")
public class ParticipantAttendee {

	@Autowired
	private EventApiController eventApiController;

	@GetMapping("/attendee-log")
	public ModelAndView dashboard(HttpSession session) {
		
		HashMap participantDetails = (HashMap)session.getAttribute("participantDetails");
		int companyId = (Integer)participantDetails.get("companyId");
		int branchId = (Integer)participantDetails.get("branchId");
		int participantId = (Integer)participantDetails.get("participantId");
		Response participantById = eventApiController.getParticipantById(participantId);
		HashMap participant = (HashMap)participantById.getResult();
		HashMap event = (HashMap)participant.get("event");
		int eventId = (Integer)event.get("eventId");
		
		Response attendeeLogDetails = eventApiController.getAttendeeLogListByParticipantIdAndEventId(companyId, branchId, participantId, eventId);
		ArrayList<HashMap> result = (ArrayList<HashMap>)attendeeLogDetails.getResult();		
		
		ModelAndView mav = new ModelAndView("/participant/attendee-log");
		mav.addObject("attendeeLogDetails", result);
		return mav;
	}
	
}
