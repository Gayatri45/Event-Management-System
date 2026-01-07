package com.onestop.codeitsoft.event.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.onestop.codeitsoft.event.entity.Attendee;
import com.onestop.codeitsoft.event.entity.Audience;
import com.onestop.codeitsoft.event.entity.Category;
import com.onestop.codeitsoft.event.entity.Event;
import com.onestop.codeitsoft.event.entity.Participant;
import com.onestop.codeitsoft.event.entity.Response;
import com.onestop.codeitsoft.event.entity.Venue;
import com.onestop.codeitsoft.event.entity.VenueType;
import com.onestop.codeitsoft.event.myurl.MyUrl;
import com.onestop.codeitsoft.event.services.ApiService;
import com.onestop.codeitsoft.event.services.MyService;

@RestController
@RequestMapping("/eventApi")
public class EventApiController {

	@Autowired
	private MyService myService;

	@Autowired
	private ApiService apiService;

	// -- Get Branch List --

	@PostMapping("/getBranchList")
	public ArrayList<Map> getBranchList(@RequestParam("companyId") int companyId, HttpSession session) {

		HashMap userMap = (HashMap) session.getAttribute("userMap");
		ArrayList<Map> branchListMap = apiService.getBranchList(companyId, userMap);
		return branchListMap;
	}

	// -- Get Country List --

	@PostMapping("/getCountryList")
	public ArrayList<HashMap> getCountryList(HttpSession session) {

		ArrayList<HashMap> countryList = (ArrayList<HashMap>) apiService.getCountryList();
		return countryList;
	}

	public Response saveCategory(Category category) throws IllegalStateException, IOException {

		MultiValueMap<String, Object> map = myService.getMultiValueMapFromSaveCategory(category);
		Response response = myService.getResponse(MyUrl.apiUrl + "/saveCategory", map, myService.getMultiPartHeaders());
		return response;
	}

	public Response getCategoryList(int companyId, int branchId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getCategoryList", stringData,
				myService.getHeaders());
		return response;
	}

	public Response saveAudience(Audience audience) throws IllegalStateException, IOException {

		MultiValueMap<String, Object> map = myService.getMultiValueMapFromSaveAudience(audience);
		Response response = myService.getResponse(MyUrl.apiUrl + "/saveAudience", map, myService.getMultiPartHeaders());
		return response;
	}

	public Response getAudienceList(int companyId, int branchId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getAudienceList", stringData,
				myService.getHeaders());
		return response;
	}

	public Response saveEvent(Event event) throws IllegalStateException, IOException {

		MultiValueMap<String, Object> map = myService.getMultiValueMapFromSaveEvent(event);
		Response response = myService.getResponse(MyUrl.apiUrl + "/saveEvent", map, myService.getMultiPartHeaders());
		return response;
	}

	public Response saveVenueType(VenueType venueType) {

		Response response = myService.getResponse(MyUrl.apiUrl + "/saveVenueType", venueType, myService.getHeaders());
		return response;
	}

	public Response getVenueTypeList(int companyId, int branchId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getVenueTypeList", stringData,
				myService.getHeaders());
		return response;
	}

	public Response saveVenue(Venue venue) throws IllegalStateException, IOException {

		MultiValueMap<String, Object> map = myService.getMultiValueMapFromSaveVenue(venue);
		Response response = myService.getResponse(MyUrl.apiUrl + "/saveVenue", map, myService.getMultiPartHeaders());
		return response;
	}

	public Response getVenueList(int companyId, int branchId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getVenueList", stringData, myService.getHeaders());
		return response;
	}

	public Response getEventList(int companyId, int branchId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getEventList", stringData, myService.getHeaders());
		return response;
	}

	public Response getEventById(int companyId, int branchId, int eventId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\""
				+ ",\"eventId\":\"" + eventId + "\" }";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getEventByCompanyIdBranchIdAndEventId", stringData,
				myService.getHeaders());
		return response;
	}

	public Response saveAttendee(Attendee attendee) throws IllegalStateException, IOException {

		MultiValueMap<String, Object> map = myService.getMultiValueMapFromSaveAttendee(attendee);
		Response response = myService.getResponse(MyUrl.apiUrl + "/saveAttendee", map, myService.getMultiPartHeaders());
		return response;
	}

	public Response getApproval(Attendee attendee) throws IllegalStateException, IOException {

		MultiValueMap<String, Object> map = myService.getMultiValueMapFromSaveAttendee(attendee);
		Response response = myService.getResponse(MyUrl.apiUrl + "/getApproval", map, myService.getMultiPartHeaders());
		return response;
	}

	public Response getAttendeeApprovedList(int companyId, int branchId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getAttendeeApprovalList", stringData,
				myService.getHeaders());
		return response;
	}

	public Response approveOrRejectRequest(int companyId, int branchId, int attendeeId, int attendeeApprovalStatus) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\""
				+ ",\"attendeeId\":\"" + attendeeId + "\"" + ",\"attendeeApprovalStatus\":\"" + attendeeApprovalStatus
				+ "\"}";

		Response response = myService.getResponse(MyUrl.apiUrl + "/approveOrRejectRequest", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getEventDetailsById(int eventId) {

		String stringData = "{\"eventId\":\"" + eventId + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getEventDetailsById", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getLanguageList(int companyId, int branchId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getLanguageList", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getEnrolledEventList(int companyId, int branchId, int attendeeId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\""
				+ ",\"attendeeId\":\"" + attendeeId + "\" }";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getEnrolledEventList", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getAttendeeList(int companyId, int branchId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getAttendeeList", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getEventFilterTableList(int companyId, int branchId, int categoryId, int venueId,
			String eventStartDate, String eventLastDate) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\""
				+ ",\"categoryId\":\"" + categoryId + "\"" + ",\"venueId\":\"" + venueId + "\""
				+ ",\"eventStartDate\":\"" + eventStartDate + "\"" + ",\"eventLastDate\":\"" + eventLastDate + "\"}";

		Response response = myService.getResponse(MyUrl.apiUrl + "/getEventFilterList", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getAttendeeListByEventId(int companyId, int branchId, int eventId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\""
				+ ",\"eventId\":\"" + eventId + "\" }";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getAttendeeListByEventId", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getVenueById(int venueId) {

		String stringData = "{\"venueId\":\"" + venueId + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getVenueById", stringData, myService.getHeaders());
		return response;
	}

	public Response getAttendeeById(int attendeeId) {

		String stringData = "{\"attendeeId\":\"" + attendeeId + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getAttendeeById", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getCategoryById(int categoryId) {

		String stringData = "{\"categoryId\":\"" + categoryId + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getCategoryById", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getAudienceById(int audienceId) {

		String stringData = "{\"audienceId\":\"" + audienceId + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getAudienceById", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getVenueTypeById(int venueTypeId) {

		String stringData = "{\"venueTypeId\":\"" + venueTypeId + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getVenueTypeById", stringData,
				myService.getHeaders());
		return response;
	}

	public Response saveParticipant(Participant participant) throws IllegalStateException, IOException {

		MultiValueMap<String, Object> map = myService.getMultiValueMapFromSaveParticipant(participant);
		Response response = myService.getResponse(MyUrl.apiUrl + "/saveParticipant", map,
				myService.getMultiPartHeaders());
		return response;
	}

	public Response getParticipantList(int companyId, int branchId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getParticipantList", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getAttendeeLogList(int companyId, int branchId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getAttendeeLogList", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getParticipantById(int participantId) {

		String stringData = "{\"participantId\":\"" + participantId + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getParticipantById", stringData,
				myService.getHeaders());
		return response;
	}

	public Response checkInAttendee(String qrCodeMessage) {

		String stringData = "{\"qrCodeMessage\":\"" + qrCodeMessage + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/checkInAttendeeInGetPass", stringData,
				myService.getHeaders());
		return response;
	}

	public Response checkOutAttendee(String qrCodeMessage) {

		String stringData = "{\"qrCodeMessage\":\"" + qrCodeMessage + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/checkOutAttendeeInGetPass", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getAttendeeLogListByParticipantId(int companyId, int branchId, int participantId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\""
				+ ",\"participantId\":\"" + participantId + "\" }";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getAttendeeLogListByParticipantId", stringData,
				myService.getHeaders());
		return response;
	}

	public Response checkInAttendeeFromParticipant(String qrCodeMessage, int participantId) {

		String stringData = "{\"qrCodeMessage\":\"" + qrCodeMessage + "\"" + ",\"participantId\":\"" + participantId
				+ "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/checkInAttendeeFromParticipant", stringData,
				myService.getHeaders());
		return response;
	}

	public Response checkOutAttendeeFromParticipant(String qrCodeMessage, int participantId) {

		String stringData = "{\"qrCodeMessage\":\"" + qrCodeMessage + "\"" + ",\"participantId\":\"" + participantId
				+ "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/checkOutAttendeeFromParticipant", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getAttendeeEventReport(int companyId, int branchId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\" }";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getAttendeeEventReport", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getParticipantEventReport(int companyId, int branchId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\" }";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getParticipantEventReport", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getParticipantListByEventId(int companyId, int branchId, int eventId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\""
				+ ",\"eventId\":\"" + eventId + "\" }";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getParticipantListByEventId", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getOrganizerDashboardData() {

		Response response = myService.getResp(MyUrl.apiUrl + "/getOrganizerDashboardData", myService.getHeaders());
		return response;
	}

	public Response getParticipantDashboardData(int companyId, int branchId, int participantId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\""
				+ ",\"participantId\":\"" + participantId + "\" }";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getParticipantDashboardData", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getStallLogListByCompanyIdBranchIdAndAttendeeLogId(int companyId, int branchId, int attendeeLogId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\""
				+ ",\"attendeeLogId\":\"" + attendeeLogId + "\" }";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getStallLogListByCompanyIdBranchIdAndAttendeeLogId",
				stringData, myService.getHeaders());
		return response;
	}

	public Response getAttendeeLogListByParticipantIdAndEventId(int companyId, int branchId, int participantId,
			int eventId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\""
				+ ",\"participantId\":\"" + participantId + "\"" + ",\"eventId\":\"" + eventId + "\"}";

		Response response = myService.getResponse(MyUrl.apiUrl + "/getAttendeeLogListByParticipantIdAndEventId",
				stringData, myService.getHeaders());
		return response;
	}

	public Response getEventRowList(int companyId, int branchId) {

		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/getEventRowList", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getAttendeeRowList(int companyId, int branchId, int page, int pageSize) {
		
		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\""
				+ ",\"page\":\"" + page + "\"" + ",\"pageSize\":\"" + pageSize + "\"}";		
		
		Response response = myService.getResponse(MyUrl.apiUrl + "/getAttendeeRowList", stringData,
				myService.getHeaders());
		return response;
	}
	

	public Response getAttendeerowsList(int companyId, int branchId, int page, int pageSize) {
		
		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\""
				+ ",\"page\":\"" + page + "\"" + ",\"pageSize\":\"" + pageSize + "\"}";		
		
		Response response = myService.getResponse(MyUrl.apiUrl + "/getAttendeerowsList", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getAttendeeDataByPage(int companyId, int branchId, int i, int pageSize) {
		
		String stringData = "{\"companyId\":\"" + companyId + "\"" + ",\"branchId\":\"" + branchId + "\""
				+ ",\"page\":\"" + i + "\"" + ",\"pageSize\":\"" + pageSize + "\"}";		
		
		Response response = myService.getResponse(MyUrl.apiUrl + "/getAttendeeDataByPage", stringData,
				myService.getHeaders());
		return response;
	}

	public Response getUpcomingEvents() {		
		Response response = myService.getResp(MyUrl.apiUrl + "/getUpcomingEvents", myService.getHeaders());
		return response;
	}
}
