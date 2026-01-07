package com.onestop.codeitsoft.event.organizer;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import com.onestop.codeitsoft.event.entity.Event;
import com.onestop.codeitsoft.event.entity.Response;
import com.onestop.codeitsoft.event.myurl.MyUrl;
import com.onestop.codeitsoft.event.services.ApiService;

@RestController
@RequestMapping("/organizer/myEvent")
public class OrganizerMyEventController {

	@Autowired
	private ApiService apiService;

	@Autowired
	private EventApiController eventApiController;

	@GetMapping("/add-event")
	public ModelAndView addEvent(HttpSession session) {

		HashMap userMap = (HashMap) session.getAttribute("userMap");
		ArrayList companyList = apiService.getCompanyList(userMap);
		ModelAndView mav = new ModelAndView("/organizer/add-event");
		mav.addObject("companyList", companyList);
		mav.addObject("firstName", userMap.get("firstName"));
		mav.addObject("lastName", userMap.get("lastName"));
		return mav;
	}

	@PostMapping("/saveEvent")
	public Response saveEvent(@ModelAttribute Event event) throws IllegalStateException, IOException {

		if (event.getEventUrl() == null) {
			URL url = null;

			try {
				String urlString = MyUrl.eventurl + "/attendee/attendeeRegistrationForm/" + event.getCompanyId() + "/"
						+ event.getBranchId() + "/" + event.getEventId();
				url = new URL(urlString);
				event.setEventUrl(url.toString());
			} catch (MalformedURLException e) {
				System.out.println("Invalid URL");
			}
		}

		LocalDateTime currentDateTime = LocalDateTime.now();
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		String formattedDate = currentDateTime.format(dateFormatter);
		String formattedTime = currentDateTime.format(timeFormatter);

		if (event.getEventId() > 0) {
			Response eventById = eventApiController.getEventDetailsById(event.getEventId());
			HashMap result = (HashMap) eventById.getResult();
			if (event.getImageGallery() == null) {
				Event eventDetails = new Event(result);
				event.setImageGallery(eventDetails.getImageGallery());
			}
		}
		
		String originalFilename = event.getImageGallery().getOriginalFilename();
		event.setImageGalleryOriginalName(originalFilename);

		event.setCreatedDate(formattedDate);
		event.setCreatedTime(formattedTime);

		Response saveEvent = eventApiController.saveEvent(event);
		return saveEvent;
	}

	@GetMapping("/event-list")
	public ModelAndView eventList(HttpSession session) {

		HashMap userMap = (HashMap) session.getAttribute("userMap");
		ArrayList companyList = apiService.getCompanyList(userMap);
		ModelAndView mav = new ModelAndView("/organizer/event-list");
		mav.addObject("companyList", companyList);
		return mav;
	}

	@PostMapping("/getEventTableList")
	public ModelAndView getEventTableList(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId) {

		Response eventDetailsList = eventApiController.getEventList(companyId, branchId);
		ArrayList<HashMap> result = (ArrayList<HashMap>) eventDetailsList.getResult();

		ModelAndView mav = new ModelAndView("/organizer/eventList");
		mav.addObject("eventList", result);
		return mav;
	}

	@PostMapping("/getEventList")
	public ArrayList<HashMap> getEventList(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId) {

		Response eventDetailsList = eventApiController.getEventList(companyId, branchId);
		ArrayList<HashMap> result = (ArrayList<HashMap>) eventDetailsList.getResult();
		return result;
	}

	@PostMapping("/getEventById")
	public HashMap getEventById(@RequestParam("companyId") int companyId, @RequestParam("branchId") int branchId,
			@RequestParam("eventId") int eventId) {

		Response eventById = eventApiController.getEventById(companyId, branchId, eventId);
		HashMap result = (HashMap) eventById.getResult();
		return result;
	}

	@PostMapping("/getEventFilterTableList")
	public ModelAndView getEventFilterTableList(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId, @RequestParam("categoryId") int categoryId,
			@RequestParam("venueId") int venueId, @RequestParam("eventStartDate") String eventStartDate,
			@RequestParam("eventLastDate") String eventLastDate) {

		Response eventFilterTableList = eventApiController.getEventFilterTableList(companyId, branchId, categoryId,
				venueId, eventStartDate, eventLastDate);
		ArrayList<HashMap> result = (ArrayList<HashMap>) eventFilterTableList.getResult();

		ModelAndView mav = new ModelAndView("/organizer/eventList");
		mav.addObject("eventList", result);
		return mav;
	}

	@GetMapping("/events-details")
	public ModelAndView eventsDetails(@RequestParam("eventId") int eventId) {

		Response eventDetailsById = eventApiController.getEventDetailsById(eventId);
		HashMap result = (HashMap) eventDetailsById.getResult();

		ModelAndView mav = new ModelAndView("/organizer/events-details");
		mav.addObject("eventDetails", result);
		return mav;
	}

	@GetMapping("/edit-event")
	public ModelAndView editEvents(@RequestParam("eventId") int eventId) {

		Response eventDetailsById = eventApiController.getEventDetailsById(eventId);
		HashMap result = (HashMap) eventDetailsById.getResult();

		int companyId = (Integer) result.get("companyId");
		int branchId = (Integer) result.get("branchId");

		Response categoryList = eventApiController.getCategoryList(companyId, branchId);
		ArrayList<HashMap> category = (ArrayList<HashMap>) categoryList.getResult();

		Response audienceList = eventApiController.getAudienceList(companyId, branchId);
		ArrayList<HashMap> audience = (ArrayList<HashMap>) audienceList.getResult();

		ArrayList<HashMap> countryList = apiService.getCountryList();

		Response venueList = eventApiController.getVenueList(companyId, branchId);
		ArrayList<HashMap> venue = (ArrayList<HashMap>) venueList.getResult();

		ModelAndView mav = new ModelAndView("/organizer/edit-event");
		mav.addObject("eventDetails", result);
		mav.addObject("categoryList", category);
		mav.addObject("audienceList", audience);
		mav.addObject("countryList", countryList);
		mav.addObject("venueList", venue);
		return mav;
	}

	@GetMapping("/event-attendees")
	public ModelAndView eventAttendee(HttpSession session) {

		HashMap userMap = (HashMap) session.getAttribute("userMap");
		ArrayList companyList = apiService.getCompanyList(userMap);

		ModelAndView mav = new ModelAndView("/organizer/event-attendees");
		mav.addObject("companyList", companyList);
		return mav;
	}

	@GetMapping("/getEventAttendeeTableList")
	public ModelAndView getEventAttendeeTableList(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId, @RequestParam("eventId") int eventId) {

		Response attendeeList = eventApiController.getAttendeeListByEventId(companyId, branchId, eventId);
		ArrayList<HashMap> result = (ArrayList<HashMap>) attendeeList.getResult();

		ModelAndView mav = new ModelAndView("/organizer/event-attendees");
		mav.addObject("attendeeList", result);
		return mav;
	}

}
