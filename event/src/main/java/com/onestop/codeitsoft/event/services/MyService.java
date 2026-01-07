package com.onestop.codeitsoft.event.services;

import java.io.File;
import java.io.IOException;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.onestop.codeitsoft.event.entity.Attendee;
import com.onestop.codeitsoft.event.entity.Audience;
import com.onestop.codeitsoft.event.entity.Category;
import com.onestop.codeitsoft.event.entity.ChangePassword;
import com.onestop.codeitsoft.event.entity.Event;
import com.onestop.codeitsoft.event.entity.Participant;
import com.onestop.codeitsoft.event.entity.Response;
import com.onestop.codeitsoft.event.entity.Venue;
import com.onestop.codeitsoft.event.entity.VenueType;

@Service
public class MyService {

	public HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "School");
		headers.setContentType(MediaType.APPLICATION_JSON);
//		System.out.println(headers);
		return headers;
	}

	public Response getResp(String url, String data, HttpHeaders headers) {
		HttpEntity<String> request = new HttpEntity<String>(data, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Response> responseEntityStr = restTemplate.postForEntity(url, request, Response.class);
		Response resp = responseEntityStr.getBody();
		return resp;
	}

	public HttpHeaders getHeader() {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.add("requestSource", "Web");
		headers.add("appName", "OSEV");
		return headers;
	}

	public HttpHeaders getMultiPartHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", null);
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		return headers;
	}

	public File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException {
		String fileName = multipart.getName();
		File convFile = new File(System.getProperty("java.io.tmpdir") + "/" + fileName);
		multipart.transferTo(convFile);
		return convFile;
	}

	public Response getResp(String url, HttpHeaders headers) {

//		HttpEntity<String> request = new HttpEntity<String>(headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Response> responseEntityStr = restTemplate.getForEntity(url, Response.class);
		Response resp = responseEntityStr.getBody();
		return resp;
	}

	public Response getResponse(String url, String data, HttpHeaders headers) {

		HttpEntity<String> request = new HttpEntity<String>(data, headers);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Response> responseEntityStr = restTemplate.postForEntity(url, request, Response.class);
		Response resp = responseEntityStr.getBody();
		//System.out.println("result"+resp.getResult());
		return resp;
	}

	public Response getResponse(String url, MultiValueMap<String, Object> map, HttpHeaders multiPartHeader) {

		HttpEntity<MultiValueMap<String, Object>> request = new HttpEntity<MultiValueMap<String, Object>>(map,
				multiPartHeader);

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Response> responseEntityStr = restTemplate.postForEntity(url, request, Response.class);
		Response resp = responseEntityStr.getBody();
		return resp;
	}

	public MultiValueMap<String, Object> getMultiValueMapFromSaveCategory(Category category)
			throws IllegalStateException, IOException {

		MultiValueMap<String, Object> form = new LinkedMultiValueMap<>();

		form.add("categoryId", category.getCategoryId());
		form.add("companyId", category.getCompanyId());
		form.add("companyName", category.getCompanyName());
		form.add("branchId", category.getBranchId());
		form.add("branchName", category.getBranchName());
		form.add("categoryName", category.getCategoryName());
		return form;
	}

	public Response getResponse(String url, VenueType venueType, HttpHeaders headers) {

		HttpEntity<VenueType> request = new HttpEntity<VenueType>(venueType, headers);

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Response> responseEntityStr = restTemplate.postForEntity(url, request, Response.class);
		Response resp = responseEntityStr.getBody();
		return resp;
	}

	public MultiValueMap<String, Object> getMultiValueMapFromSaveAudience(Audience audience)
			throws IllegalStateException, IOException {

		MultiValueMap<String, Object> form = new LinkedMultiValueMap<>();

		form.add("audienceId", audience.getAudienceId());
		form.add("companyId", audience.getCompanyId());
		form.add("companyName", audience.getCompanyName());
		form.add("branchId", audience.getBranchId());
		form.add("branchName", audience.getBranchName());
		form.add("audienceName", audience.getAudienceName());
		return form;
	}

	public MultiValueMap<String, Object> getMultiValueMapFromSaveEvent(Event event)
			throws IllegalStateException, IOException {

		FileSystemResource image = null;
		if (event.getImageGallery() != null)
			image = new FileSystemResource(multipartToFile(event.getImageGallery()));

		MultiValueMap<String, Object> form = new LinkedMultiValueMap<>();

		form.add("eventId", event.getEventId());
		form.add("companyId", event.getCompanyId());
		form.add("companyName", event.getCompanyName());
		form.add("branchId", event.getBranchId());
		form.add("branchName", event.getBranchName());
		form.add("category", event.getCategory().getCategoryId());
		form.add("eventName", event.getEventName());
		form.add("description", event.getDescription());

		for (int i = 0; i < event.getAudienceIdList().size(); i++) {
			form.add("audienceIdList", event.getAudienceIdList().get(i));
		}
		form.add("country", event.getCountry());
		form.add("phoneNo", event.getPhoneNo());
		form.add("email", event.getEmail());
		form.add("artists", event.getArtists());
		form.add("eventStartDate", event.getEventStartDate());
		form.add("eventLastDate", event.getEventLastDate());
		form.add("venue", event.getVenue().getVenueId());
		form.add("ticketPrice", event.getTicketPrice());
		form.add("imageGalleryName", event.getImageGalleryName());
		form.add("imageGalleryOriginalName", event.getImageGalleryOriginalName());
		form.add("imageGallery", image);
		form.add("removeImageGallery", event.getRemoveImageGallery());
		form.add("approvalRequired", event.getApprovalRequired());
		form.add("paymentGatewayRequired", event.getPaymentGatewayRequired());
		form.add("createdByName", event.getCreatedByName());
		form.add("createdByRole", event.getCreatedByRole());
		form.add("createdDate", event.getCreatedDate());
		form.add("createdTime", event.getCreatedTime());
		form.add("eventUrl", event.getEventUrl());
		return form;
	}

	public MultiValueMap<String, Object> getMultiValueMapFromSaveVenue(Venue venue)
			throws IllegalStateException, IOException {

		MultiValueMap<String, Object> form = new LinkedMultiValueMap<>();

		form.add("venueId", venue.getVenueId());
		form.add("companyId", venue.getCompanyId());
		form.add("companyName", venue.getCompanyName());
		form.add("branchId", venue.getBranchId());
		form.add("branchName", venue.getBranchName());
		form.add("venueName", venue.getVenueName());
		form.add("description", venue.getDescription());
		form.add("venueType", venue.getVenueType().getVenueTypeId());
		form.add("seatedGuestNo", venue.getSeatedGuestNo());
		form.add("standingGuestNo", venue.getStandingGuestNo());
		form.add("foodAndBeverageDetails", venue.getFoodAndBeverageDetails());
		form.add("contactEmail", venue.getContactEmail());
		form.add("streetAddress", venue.getStreetAddress());
		form.add("streetAddress2", venue.getStreetAddress2());
		form.add("city", venue.getCity());
		form.add("postalCode", venue.getPostalCode());
		form.add("state", venue.getState());
		form.add("countryId", venue.getCountryId());
		form.add("countryCode", venue.getCountryCode());
		form.add("countryName", venue.getCountryName());
		form.add("isdCode", venue.getIsdCode());
		return form;
	}

	public MultiValueMap<String, Object> getMultiValueMapFromSaveAttendee(Attendee attendee)
			throws IllegalStateException, IOException {

		MultiValueMap<String, Object> form = new LinkedMultiValueMap<>();

		form.add("attendeeId", attendee.getAttendeeId());
		form.add("companyId", attendee.getCompanyId());
		form.add("companyName", attendee.getCompanyName());
		form.add("branchId", attendee.getBranchId());
		form.add("branchName", attendee.getBranchName());
		form.add("firstName", attendee.getFirstName());
		form.add("lastName", attendee.getLastName());
		form.add("phoneNo", attendee.getPhoneNo());
		form.add("email", attendee.getEmail());
		form.add("dob", attendee.getDob());
		form.add("gender", attendee.getGender());
		form.add("address", attendee.getAddress());
		form.add("event", attendee.getEvent().getEventId());
		form.add("category", attendee.getCategory().getCategoryId());
		form.add("venue", attendee.getVenue().getVenueId());
		form.add("review", attendee.getReview());
		form.add("attendeeApprovalStatus", attendee.getAttendeeApprovalStatus());
		form.add("payment", attendee.getPayment());
		form.add("attendeeLoginAccess", attendee.getAttendeeLoginAccess());
		form.add("qrCodeImageName", attendee.getQrCodeImageName());
		form.add("qrCodeImageOriginalName", attendee.getQrCodeImageOriginalName());
		form.add("attendeeCode", attendee.getAttendeeCode());
		form.add("updateAttendee", attendee.getUpdateAttendee());
		return form;
	}

	public MultiValueMap<String, Object> getMultiValueMapFromSaveParticipant(Participant participant) throws IllegalStateException, IOException {
		
		FileSystemResource image = null;
		if (participant.getProfilePic() != null) {
			image = new FileSystemResource(multipartToFile(participant.getProfilePic()));
		}
		
		MultiValueMap<String, Object> form = new LinkedMultiValueMap<>();
		
		form.add("participantId", participant.getParticipantId());
		form.add("companyId", participant.getCompanyId());
		form.add("companyName", participant.getCompanyName());
		form.add("branchId", participant.getBranchId());
		form.add("branchName", participant.getBranchName());
		form.add("participantName", participant.getParticipantName());
		form.add("stallName", participant.getStallName());
		form.add("stallDescription", participant.getStallDescription());
		form.add("participantEmail", participant.getParticipantEmail());
		form.add("participantPhoneNo", participant.getParticipantPhoneNo());
		form.add("participantAddress", participant.getParticipantAddress());
		form.add("event", participant.getEvent().getEventId());
		form.add("profilePic", image);
		form.add("profilePicName", participant.getProfilePicName());
		if(participant.getProfilePic()!=null && !participant.getProfilePic().isEmpty()) {
			form.add("profilePicOriginalName", participant.getProfilePic().getOriginalFilename());
		}
		form.add("removeProfilePic", participant.getRemoveProfilePic());
		
		return form;
		
	}

	public Response getResp(String url, ChangePassword data, HttpHeaders header) {
		HttpEntity<ChangePassword> request = new HttpEntity<ChangePassword>(data, header);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Response> responseEntityStr = restTemplate.postForEntity(url, request, Response.class);
		Response resp = responseEntityStr.getBody();
		return resp;
	}

	public MultiValueMap<String, Object> getMultiValueMapFromUpdateProfile(Participant participant)
			throws IllegalStateException, IOException {
		
		FileSystemResource image = null;
		if (participant.getProfilePic() != null) {
			image = new FileSystemResource(multipartToFile(participant.getProfilePic()));
		}

		MultiValueMap<String, Object> form = new LinkedMultiValueMap<>();
		form.add("participantId", participant.getParticipantId());
		form.add("companyId", participant.getCompanyId());
		form.add("branchId", participant.getBranchId());
		form.add("participantName", participant.getParticipantName());
		form.add("participantEmail", participant.getParticipantEmail());
		form.add("participantPhoneNo", participant.getParticipantPhoneNo());
		
		form.add("profilePic", image);
		form.add("profilePicName", participant.getProfilePicName());
		form.add("profilePicOriginalName", participant.getProfilePic().getOriginalFilename());
		form.add("removeProfilePic", participant.getRemoveProfilePic());
		return form;
	}
	
}
