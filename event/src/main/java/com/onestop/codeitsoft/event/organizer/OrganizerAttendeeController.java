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
import com.onestop.codeitsoft.event.entity.Attendee;
import com.onestop.codeitsoft.event.entity.Response;
import com.onestop.codeitsoft.event.services.ApiService;

@RestController
@RequestMapping("/organizer/attendee")
public class OrganizerAttendeeController {

	@Autowired
	private ApiService apiService;

	@Autowired
	private EventApiController eventApiController;

	@GetMapping("/attendee-registration-approval")
	public ModelAndView addEvent(HttpSession session) {

		HashMap userMap = (HashMap) session.getAttribute("userMap");
		ArrayList companyList = apiService.getCompanyList(userMap);
		ModelAndView mav = new ModelAndView("/organizer/attendee-registration-approval");
		
		mav.addObject("companyList", companyList);
		mav.addObject("firstName", userMap.get("firstName"));
		mav.addObject("lastName", userMap.get("lastName"));
		return mav;
	}

	@PostMapping("/getAttendeeApprovedTableList")
	public ModelAndView getAttendeeApprovedTableList(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId) {

		Response approvedLeaveRequest = eventApiController.getAttendeeApprovedList(companyId, branchId);
		ArrayList<HashMap> result = (ArrayList<HashMap>) approvedLeaveRequest.getResult();

		ModelAndView mav = new ModelAndView("/organizer/attendeeApproval-tableList");
		if (result == null) {
			mav.addObject("attendeeApprovalRequest", result);
		} else {
			mav.addObject("attendeeApprovalRequest", result);
		}
		return mav;
	}

	@PostMapping("/getApproval")
	public Response saveAttendee(@ModelAttribute Attendee attendee) throws IllegalStateException, IOException {

		Response saveAttendee = eventApiController.getApproval(attendee);
		return saveAttendee;
	}

	@PostMapping("/approveOrRejectRequest")
	public Response approveOrRejectRequest(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId, @RequestParam("attendeeId") int attendeeId,
			@RequestParam("attendeeApprovalStatus") int attendeeApprovalStatus) {

		Response approveOrRejectRequest = eventApiController.approveOrRejectRequest(companyId, branchId, attendeeId,
				attendeeApprovalStatus);
		return approveOrRejectRequest;
	}

	@GetMapping("/attendee-list")
	public ModelAndView eventList(HttpSession session) {

		HashMap userMap = (HashMap) session.getAttribute("userMap");
		ArrayList companyList = apiService.getCompanyList(userMap);
		ModelAndView mav = new ModelAndView("/organizer/attendee-list");
		mav.addObject("companyList", companyList);
		return mav;
	}

	@PostMapping("/getAttendeeTableList")
	public ModelAndView getAttendeeTableList(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId, @RequestParam int page,
            @RequestParam int pageSize) {
		
		System.out.println("page no : "+page);
		
		System.out.println("page size no : "+pageSize);
		
		ModelAndView mav = new ModelAndView("/organizer/attendeeList");
		Response attendeeData = eventApiController.getAttendeeDataByPage(companyId, branchId, page, pageSize);		
		HashMap result = (HashMap)attendeeData.getResult();		
		int noOfAttendee = (Integer)result.get("noOfAttendee");		
		ArrayList<HashMap> attendeeDataresult = (ArrayList<HashMap>)result.get("attendeeList");   
		
		System.out.println("total no of attendee get :"+attendeeDataresult.size());
		
		mav.addObject("attendeeDetails", attendeeDataresult);
		mav.addObject("noOfAttendee", noOfAttendee);
		mav.addObject("page", page);
		mav.addObject("pageSize", pageSize);
		return mav;
	}
	
	@PostMapping("/getAttendeeList") 
	public ArrayList<HashMap> getAttendeeList(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId) {
		
		Response attendeeDetails = eventApiController.getAttendeeList(companyId, branchId);
		ArrayList<HashMap> result = (ArrayList<HashMap>)attendeeDetails.getResult();
		System.out.println(attendeeDetails);
		return result;
	}	
	
	@GetMapping("/attendee-details")
	public ModelAndView eventsDetails(@RequestParam("attendeeId") int attendeeId) {

		Response attendeeDetails = eventApiController.getAttendeeById(attendeeId);
		HashMap result = (HashMap) attendeeDetails.getResult();

		ModelAndView mav = new ModelAndView("/organizer/attendee-details");
		mav.addObject("attendeeDetails", result);
		return mav;
	}

	@GetMapping("/edit-attendee")
	public ModelAndView editEvents(@RequestParam("attendeeId") int attendeeId) {

		Response attendeeDetails = eventApiController.getAttendeeById(attendeeId);
		HashMap result = (HashMap) attendeeDetails.getResult();

		ModelAndView mav = new ModelAndView("/organizer/edit-attendee");
		mav.addObject("attendeeDetails", result);
		return mav;
	}

	@GetMapping("/attendee-log")
	public ModelAndView attendeeLog(HttpSession session) {

		HashMap userMap = (HashMap) session.getAttribute("userMap");
		ArrayList companyList = apiService.getCompanyList(userMap);

		ModelAndView mav = new ModelAndView("/organizer/attendee-log");
		mav.addObject("companyList", companyList);
		return mav;
	}

	@PostMapping("/getAttendeeLogTableList")
	public ModelAndView attendeeLogList(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId) {

		Response attendeeLogDetails = eventApiController.getAttendeeLogList(companyId, branchId);
		ArrayList<HashMap> result = (ArrayList<HashMap>) attendeeLogDetails.getResult();

		ModelAndView mav = new ModelAndView("/organizer/attendeeLogList");
		mav.addObject("attendeeLogDetails", result);
		return mav;
	}
	
	@GetMapping("/attendee-activities")
	public ModelAndView attendeeActivities(HttpSession session) {

		HashMap userMap = (HashMap) session.getAttribute("userMap");
		ArrayList companyList = apiService.getCompanyList(userMap);

		ModelAndView mav = new ModelAndView("/organizer/attendee-activities");
		mav.addObject("companyList", companyList);
		return mav;
	}
	
	@GetMapping("/getAttendeeActivitiesTableList")
	public ModelAndView attendeeActivitiesList(@RequestParam("companyId") int companyId, @RequestParam("branchId") int branchId, 
			@RequestParam("attendeeLogId") int attendeeLogId) {

		Response attendeeLogDetails = eventApiController.getStallLogListByCompanyIdBranchIdAndAttendeeLogId(companyId, branchId, attendeeLogId);
		ArrayList<HashMap> result = (ArrayList<HashMap>) attendeeLogDetails.getResult();

		ModelAndView mav = new ModelAndView("/organizer/attendeeActivitiesList");
		mav.addObject("attendeeActivitiesDetails", result);
		return mav;
	}

}
