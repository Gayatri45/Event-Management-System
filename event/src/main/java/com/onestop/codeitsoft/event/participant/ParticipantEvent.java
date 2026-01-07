package com.onestop.codeitsoft.event.participant;

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
@RequestMapping("/participant/event")
public class ParticipantEvent {
	
	@Autowired
	private EventApiController eventApiController;
	
	@GetMapping("/events-details")
    public ModelAndView eventsDetails(HttpSession session) {
		
		HashMap participantDetails = (HashMap)session.getAttribute("participantDetails");
		HashMap event = (HashMap)participantDetails.get("event");
		int eventId = (Integer)event.get("eventId");
		
		Response eventDetailsById = eventApiController.getEventDetailsById(eventId);
		HashMap result = (HashMap) eventDetailsById.getResult();
		
        ModelAndView mav = new ModelAndView("/participant/events-details");
        mav.addObject("eventDetails", result);
		return mav;
    }

}
