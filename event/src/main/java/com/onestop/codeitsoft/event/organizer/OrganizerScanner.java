package com.onestop.codeitsoft.event.organizer;

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
@RequestMapping("/organizer/scanner")
public class OrganizerScanner {

	@Autowired
	private EventApiController eventApiController;

	@GetMapping("/check-in-scan")
	public ModelAndView myScanner() {
		ModelAndView mav = new ModelAndView("/organizer/check-in-scan");
		return mav;
	}

	@GetMapping("/check-out-scan")
	public ModelAndView checkOutScan() {
		ModelAndView mav = new ModelAndView("/organizer/check-out-scan");
		return mav;
	}

	@PostMapping("/checkInAttendee")
	public Response checkInAttendee(@RequestParam("qrCodeMessage") String qrCodeMessage) {
		
		Response checkInAttendee = eventApiController.checkInAttendee(qrCodeMessage);
		return checkInAttendee;
	}

	@PostMapping("/checkOutAttendee")
	public Response checkOutAttendee(@RequestParam("qrCodeMessage") String qrCodeMessage) {

		Response checkOutAttendee = eventApiController.checkOutAttendee(qrCodeMessage);
		return checkOutAttendee;
	}

}
