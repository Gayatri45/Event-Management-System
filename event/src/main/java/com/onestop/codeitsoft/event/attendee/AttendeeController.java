package com.onestop.codeitsoft.event.attendee;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.onestop.codeitsoft.event.controller.EventApiController;
import com.onestop.codeitsoft.event.entity.Attendee;
import com.onestop.codeitsoft.event.entity.Response;

@RestController
@RequestMapping("/attendee")
public class AttendeeController {

	@Autowired
	private EventApiController eventApiController;

	@GetMapping("/attendeeRegistrationForm/{companyId}/{branchId}/{eventId}")
	public ModelAndView registrationForm(@PathVariable int companyId, @PathVariable int branchId,
			@PathVariable int eventId) {

		Response eventDetailsList = eventApiController.getEventList(companyId, branchId);
		ArrayList<HashMap> result = (ArrayList<HashMap>) eventDetailsList.getResult();

		Response eventById = eventApiController.getEventById(companyId, branchId, eventId);
		HashMap result2 = (HashMap) eventById.getResult();

		ModelAndView mav = new ModelAndView("/attendee/attendeeRegistrationForm");
		mav.addObject("eventList", result);
		mav.addObject("eventDetails", result2);
		return mav;
	}

	@PostMapping("/saveAttendee")
	public Response saveAttendee(@ModelAttribute Attendee attendee) throws IllegalStateException, IOException {

		Response saveAttendee = eventApiController.saveAttendee(attendee);
		return saveAttendee;
	}

	@GetMapping("/edit-attendee")
	public ModelAndView editEvents(@RequestParam("attendeeId") int attendeeId) {

		Response attendeeDetails = eventApiController.getAttendeeById(attendeeId);
		HashMap result = (HashMap) attendeeDetails.getResult();

		ModelAndView mav = new ModelAndView("/organizer/edit-attendee");
		mav.addObject("attendeeDetails", result);
		return mav;
	}

	@GetMapping("/attendee-details")
	public ModelAndView eventsDetails(@RequestParam("attendeeId") int attendeeId) {

		Response attendeeDetails = eventApiController.getAttendeeById(attendeeId);
		HashMap result = (HashMap) attendeeDetails.getResult();

		ModelAndView mav = new ModelAndView("/organizer/attendee-details");
		mav.addObject("attendeeDetails", result);
		return mav;
	}


}
