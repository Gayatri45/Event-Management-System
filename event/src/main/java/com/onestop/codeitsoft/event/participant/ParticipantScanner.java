package com.onestop.codeitsoft.event.participant;

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

@RestController
@RequestMapping("/participant/scanner")
public class ParticipantScanner {
	
	@Autowired
	private EventApiController eventApiController;

	@GetMapping("/check-in-scan")
	public ModelAndView myScanner() {
		ModelAndView mav = new ModelAndView("/participant/check-in-scan");
		return mav;
	}

	@GetMapping("/check-out-scan")
	public ModelAndView checkOutScan() {
		ModelAndView mav = new ModelAndView("/participant/check-out-scan");
		return mav;
	}

	@PostMapping("/checkInAttendee")
	public Response checkInAttendee(@RequestParam("qrCodeMessage") String qrCodeMessage, HttpSession session) {
		
		HashMap participantDetails = (HashMap)session.getAttribute("participantDetails");
		int participantId = (Integer)participantDetails.get("participantId");		
		
		Response checkInAttendee = eventApiController.checkInAttendeeFromParticipant(qrCodeMessage, participantId);
		return checkInAttendee;
	}

	@PostMapping("/checkOutAttendee")
	public Response checkOutAttendee(@RequestParam("qrCodeMessage") String qrCodeMessage, HttpSession session) {
		
		HashMap participantDetails = (HashMap)session.getAttribute("participantDetails");
		int participantId = (Integer)participantDetails.get("participantId");		

		Response checkOutAttendee = eventApiController.checkOutAttendeeFromParticipant(qrCodeMessage, participantId);
		return checkOutAttendee;
	}
}
