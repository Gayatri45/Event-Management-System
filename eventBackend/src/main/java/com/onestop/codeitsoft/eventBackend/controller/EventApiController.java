package com.onestop.codeitsoft.eventBackend.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.zxing.WriterException;
import com.onestop.codeitsoft.eventBackend.daoImp.AttendeeDaoImp;
import com.onestop.codeitsoft.eventBackend.daoImp.AttendeeLogDaoImp;
import com.onestop.codeitsoft.eventBackend.daoImp.AudienceDaoImp;
import com.onestop.codeitsoft.eventBackend.daoImp.CategoryDaoImp;
import com.onestop.codeitsoft.eventBackend.daoImp.EventDaoImp;
import com.onestop.codeitsoft.eventBackend.daoImp.LoginCredentialsDaoImp;
import com.onestop.codeitsoft.eventBackend.daoImp.ParticipantDaoImp;
import com.onestop.codeitsoft.eventBackend.daoImp.PasswordRecovery;
import com.onestop.codeitsoft.eventBackend.daoImp.StallLogDaoImp;
import com.onestop.codeitsoft.eventBackend.daoImp.VenueDaoImp;
import com.onestop.codeitsoft.eventBackend.daoImp.VenueTypeDaoImp;
import com.onestop.codeitsoft.eventBackend.entity.Attendee;
import com.onestop.codeitsoft.eventBackend.entity.AttendeeLog;
import com.onestop.codeitsoft.eventBackend.entity.Audience;
import com.onestop.codeitsoft.eventBackend.entity.Category;
import com.onestop.codeitsoft.eventBackend.entity.Event;
import com.onestop.codeitsoft.eventBackend.entity.LoginCredentials;
import com.onestop.codeitsoft.eventBackend.entity.Participant;
import com.onestop.codeitsoft.eventBackend.entity.Response;
import com.onestop.codeitsoft.eventBackend.entity.StallLog;
import com.onestop.codeitsoft.eventBackend.entity.Venue;
import com.onestop.codeitsoft.eventBackend.entity.VenueType;
import com.onestop.codeitsoft.eventBackend.myurl.MyUrl;
import com.onestop.codeitsoft.eventBackend.services.AwsFileUploader;
import com.onestop.codeitsoft.eventBackend.services.EncryptDecryptService;
import com.onestop.codeitsoft.eventBackend.services.MyService;
import com.onestop.codeitsoft.eventBackend.services.QRCodeGenerator;
import com.onestop.codeitsoft.eventBackend.services.SendMail;

@Controller
@RequestMapping("/eventApi")
public class EventApiController {

	@Autowired
	MyService myService;

	@Autowired
	EventDaoImp eventDaoImp;

	@Autowired
	CategoryDaoImp categoryDaoImp;

	@Autowired
	AudienceDaoImp audienceDaoImp;

	@Autowired
	VenueDaoImp venueDaoImp;

	@Autowired
	VenueTypeDaoImp venueTypeDaoImp;

	@Autowired
	AttendeeDaoImp attendeeDaoImp;

	@Autowired
	LoginCredentialsDaoImp loginCredDaoImp;

	@Autowired
	QRCodeGenerator codeGenerator;

	@Autowired
	ParticipantDaoImp participantDaoImp;

	@Autowired
	AttendeeLogDaoImp attendeeLogDaoImp;

	@Autowired
	StallLogDaoImp stallLogDaoImp;

	@Autowired
	PasswordRecovery passRecover;

	private ServletContext servletContext;

	public String secretKey = "ThisIsASecretKey";

	private static final int attendeeLogStatusForGetPass = 111;

	private static final int attendeeLogStatusForParticipantStall = 222;

	private static final int checkInStatus = 1;

	private static final int checkOutStatus = 0;

	List<Integer> participantCheckInStatusList = new ArrayList<Integer>();
	private static final int participantCheckInStatus = 1;

	private static final int participantCheckOutStatus = 0;

	public ServletContext getServletContext() {
		return servletContext;
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	@Autowired
	public EventApiController(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	@PostMapping("/saveCategory")
	public ResponseEntity<Response> saveCategory(@ModelAttribute Category category,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		if (category.getCompanyId() == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (category.getBranchId() == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (category.getCategoryName() == null || category.getCategoryName().equals("")) {
			resp.setMessage("Please Enter Category Name");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}

		if (category.getCategoryId() > 0) {
			if (categoryDaoImp.getCategoryByCompanyIdBranchIdAndCategoryIdAndCategoryNameExpectThis(category.getCompanyId(),
					category.getBranchId(), category.getCategoryId(), category.getCategoryName()).isPresent()) {
				resp.setMessage("Category Name Already Exists");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
		} else {
			if (categoryDaoImp.getCategoryByCompanyIdBranchIdAndCategoryName(category.getCompanyId(),
					category.getBranchId(), category.getCategoryName()).isPresent()) {
				resp.setMessage("Category Name Already Exists");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
		}

		try {
			category = categoryDaoImp.saveCategory(category);
			resp.setCode(1);
			resp.setMessage("success");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getCategoryList")
	public ResponseEntity<Response> getCategoryList(@RequestBody Category map,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		try {
			List<Category> categoryList = categoryDaoImp.getCategoryListByCompanyIdAndBranchId(companyId, branchId);
			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(categoryList);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setCode(0);
			resp.setMessage(e.getMessage());
			resp.setResult(null);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getCategoryById")
	public ResponseEntity<Response> getCategoryById(@RequestBody Category category) {
		Response resp = new Response();
		try {
			Category categoryDetails = categoryDaoImp.getCategoryById(category.getCategoryId());
			if (categoryDetails != null) {
				resp.setCode(1);
				resp.setMessage("success");
				resp.setResult(categoryDetails);
			} else {
				resp.setMessage("Data Not Found");
			}
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
		}
		return new ResponseEntity<Response>(resp, HttpStatus.OK);
	}

	@PostMapping("/saveAudience")
	public ResponseEntity<Response> saveAudience(@ModelAttribute Audience audience,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		if (audience.getCompanyId() == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (audience.getBranchId() == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (audience.getAudienceName() == null || audience.getAudienceName().equals("")) {
			resp.setMessage("Please Enter Audience Name");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}

		if (audience.getAudienceId() > 0) {
			if (audienceDaoImp.getAudienceByCompanyIdAndBranchIdAndAudienceIdAndAudienceNameExceptThis(audience.getCompanyId(),
					audience.getBranchId(), audience.getAudienceId(), audience.getAudienceName()).isPresent()) {
				resp.setMessage("Audience Already Exists");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
		} else {
			if (audienceDaoImp.getAudienceByCompanyIdBranchIdAndAudienceName(audience.getCompanyId(),
					audience.getBranchId(), audience.getAudienceName()).isPresent()) {
				resp.setMessage("Audience Already Exists");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
		}

		try {
			audience = audienceDaoImp.saveAudience(audience);
			resp.setCode(1);
			resp.setMessage("success");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getAudienceList")
	public ResponseEntity<Response> getAudienceListSchoolIdAndBranchId(@RequestBody Audience map,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		try {
			List<Audience> audienceList = audienceDaoImp.getAudienceListByCompanyIdAndBranchId(companyId, branchId);
			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(audienceList);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setCode(0);
			resp.setMessage(e.getMessage());
			resp.setResult(null);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getAudienceById")
	public ResponseEntity<Response> getAudienceById(@RequestBody Audience audience) {
		Response resp = new Response();
		try {
			Audience audienceDetails = audienceDaoImp.getAudienceById(audience.getAudienceId());
			if (audienceDetails != null) {
				resp.setCode(1);
				resp.setMessage("success");
				resp.setResult(audienceDetails);
			} else {
				resp.setMessage("Data Not Found");
			}
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
		}
		return new ResponseEntity<Response>(resp, HttpStatus.OK);
	}

	@PostMapping("/saveVenueType")
	public ResponseEntity<Response> saveVenueType(@RequestBody VenueType venueType,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		if (venueType.getCompanyId() == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (venueType.getBranchId() == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (venueType.getName() == null || venueType.getName().equals("")) {
			resp.setMessage("Please Enter VenueType Name");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (venueType.getVenueTypeId() > 0) {
			if (venueTypeDaoImp.getVenueTypeByCompanyIdBranchIdAndVenueTypeIdAndVenueNameExceptThis(venueType.getCompanyId(),
					venueType.getBranchId(), venueType.getVenueTypeId(), venueType.getName()).isPresent()) {
				resp.setMessage("venueType Already Exists");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
		} else {
			if (venueTypeDaoImp.getvenueTypeByCompanyIdBranchIdAndName(venueType.getCompanyId(),
					venueType.getBranchId(), venueType.getName()).isPresent()) {
				resp.setMessage("venueType Already Exists");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
		}
		try {
			venueType = venueTypeDaoImp.saveVenueType(venueType);
			resp.setCode(1);
			resp.setMessage("success");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getVenueTypeList")
	public ResponseEntity<Response> getVenueTypeListSchoolIdAndBranchId(@RequestBody VenueType map,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		try {
			List<VenueType> venueTypeList = venueTypeDaoImp.getVenueTypeListByCompanyIdAndBranchId(companyId, branchId);
			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(venueTypeList);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setCode(0);
			resp.setMessage(e.getMessage());
			resp.setResult(null);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getVenueTypeById")
	public ResponseEntity<Response> getVenueTypeById(@RequestBody VenueType venueType) {
		Response resp = new Response();
		try {
			VenueType venueTypeDetails = venueTypeDaoImp.getVenueTypeById(venueType.getVenueTypeId());
			if (venueTypeDetails != null) {
				resp.setCode(1);
				resp.setMessage("success");
				resp.setResult(venueTypeDetails);
			} else {
				resp.setMessage("Data Not Found");
			}
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
		}
		return new ResponseEntity<Response>(resp, HttpStatus.OK);
	}

	@PostMapping("/saveVenue")
	public ResponseEntity<Response> saveVenue(@ModelAttribute Venue venue,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		if (venue.getCompanyId() == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (venue.getBranchId() == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (venue.getVenueName() == null || venue.getVenueName().equals("")) {
			resp.setMessage("Please Enter Venue Name");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (venue.getVenueType() == null) {
			resp.setMessage("Please Select Venue Type");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (venue.getStreetAddress() == null || venue.getStreetAddress().equals("")) {
			resp.setMessage("Please Enter Address");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (venue.getCity() == null || venue.getCity().equals("")) {
			resp.setMessage("Please Enter City");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (venue.getPostalCode() == null || venue.getPostalCode().equals("")) {
			resp.setMessage("Please Enter Zip/Postal Code");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (venue.getState() == null || venue.getState().equals("")) {
			resp.setMessage("Please Enter State");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (venue.getCountryId() == 0) {
			resp.setMessage("Please Select Country");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (venue.getVenueId() > 0) {
			if (venueDaoImp.getVenueByCompanyIdBranchIdAndVenueIdAndVenueNameStreetAddressCityStatePostalCodeCountryIdExceptThis(venue.getCompanyId(), venue.getBranchId(),
					venue.getVenueId(), venue.getVenueName(), venue.getStreetAddress(),
					venue.getCity(), venue.getState(), venue.getPostalCode(), venue.getCountryId()).isPresent()) {
				resp.setMessage("venue Already Exists");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
		} else {
			if (venueDaoImp.getVenueByCompanyIdBranchIdAndVenueNameStreetAddressCityStatePostalCodeCountryId(
							venue.getCompanyId(), venue.getBranchId(), venue.getVenueName(), venue.getStreetAddress(),
							venue.getCity(), venue.getState(), venue.getPostalCode(), venue.getCountryId()).isPresent()) {
				resp.setMessage("Venue Already Exists");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
		}

		try {
			venue = venueDaoImp.saveVenue(venue);
			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(venue);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getVenueList")
	public ResponseEntity<Response> getVenueListSchoolIdAndBranchId(@RequestBody Venue map,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		try {
			List<Venue> venueList = venueDaoImp.getVenueListByCompanyIdAndBranchId(companyId, branchId);
			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(venueList);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setCode(0);
			resp.setMessage(e.getMessage());
			resp.setResult(null);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getVenueById")
	public ResponseEntity<Response> getVenueById(@RequestBody Venue venue) {
		Response resp = new Response();
		try {
			Venue venueDetails = venueDaoImp.getVenueById(venue.getVenueId());
			if (venueDetails != null) {
				resp.setCode(1);
				resp.setMessage("success");
				resp.setResult(venueDetails);
			} else {
				resp.setMessage("Data Not Found");
			}
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
		}
		return new ResponseEntity<Response>(resp, HttpStatus.OK);
	}

	@PostMapping("/saveEvent")
	public ResponseEntity<Response> saveEvent(@ModelAttribute Event event,
			@RequestParam("imageGallery") MultipartFile image,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		if (event.getCompanyId() == 0) {
			resp.setMessage("PLEASE SELECT COMPANY");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (event.getBranchId() == 0) {
			resp.setMessage("PLEASE SELECT BRANCH");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (event.getCategory() == null) {
			resp.setCode(0);
			resp.setMessage("PLEASE SELECT CATEGORY");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (event.getEventName() == null || event.getEventName().equals("")) {
			resp.setMessage("PLEASE ENTER EVENT NAME");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (event.getAudienceIdList() == null) {
			resp.setCode(0);
			resp.setMessage("PLEASE SELECT AUDIENCE");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (event.getAudienceIdList().size() == 0) {
			resp.setCode(0);
			resp.setMessage("PLEASE SELECT AUDIENCE ATLEAST ONE AUDIENCE");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
//		if (event.getCountry() == null || event.getCountry().equals("")) {
//			resp.setMessage("PLEASE SELECT COUNTRY");
//			return new ResponseEntity<Response>(resp, HttpStatus.OK);
//		}
		if (event.getEmail() == null || event.getEmail().equals("")) {
			resp.setMessage("PLEASE ENTER EMAIL");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (event.getPhoneNo() == 0) {
			resp.setMessage("PLEASE ENTER MOBILE NO");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
//		if (event.getCountry() == null || event.getCountry().equals("")) {
//			resp.setMessage("PLEASE SELECT COUNTRY");
//			return new ResponseEntity<Response>(resp, HttpStatus.OK);
//		}
		if (event.getEventStartDate() == null || event.getEventStartDate().equals("")) {
			resp.setMessage("PLEASE SELECT EVENT START DATE");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (event.getEventLastDate() == null || event.getEventLastDate().equals("")) {
			resp.setMessage("PLEASE SELECT EVENT LAST DATE");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (event.getVenue() == null) {
			resp.setMessage("PLEASE SELECT VENUE");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (event.getPaymentGatewayRequired() == 1) {
			if (event.getTicketPrice() == 0) {
				resp.setMessage("PLEASE ENTER TICKET PRICE");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
		}

		// Check Duplicacy
		if (event.getEventId() > 0) {
			if (eventDaoImp.getEventByCompanyIdAndBranchIdAndEventIdAndEventNameExceptThis(event.getCompanyId(), event.getBranchId(),
					event.getEventId(), event.getEventName()).isPresent()) {
				resp.setMessage("Event Already Exists");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
		} else {
			if (eventDaoImp.getEventByCompanyIdBranchIdAndEventName(event.getCompanyId(), event.getBranchId(),
					event.getEventName()).isPresent()) {
				resp.setMessage("Event Already Exists");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
		}

		if (image != null && !image.isEmpty()) {

			if (event.getImageGalleryOriginalName() == null) {
				String originalFileName = image.getOriginalFilename();
				event.setImageGalleryOriginalName((originalFileName).replaceAll("\\s", ""));
			} else {
				event.setImageGalleryOriginalName((event.getImageGalleryOriginalName()).replaceAll("\\s", ""));
			}

			String eventfileName = image.getOriginalFilename() + "" + event.getCompanyId() + "" + event.getBranchId()
					+ "" + event.getEventName() + "" + event.getImageGalleryOriginalName();
			event.setImageGalleryName(eventfileName.replaceAll("\\s", ""));

			try {
				ResponseEntity<Response> uploadFile = AwsFileUploader.uploadFile(image, event.getImageGalleryName(),
						MyUrl.fileUploadPath + "/eventImages/");

				System.out.println(uploadFile);
			} catch (Exception e) {
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
		} else {
			if (event.getEventId() > 0 && event.getRemoveImageGallery() == 0) {
				Event eve = eventDaoImp.getEventDetailsById(event.getEventId());
				if (eve != null) {
					event.setImageGalleryName(eve.getImageGalleryName());
					event.setImageGalleryOriginalName(eve.getImageGalleryOriginalName());
				}
			}
		}

		try {

			List<Integer> audienceIdList = event.getAudienceIdList();
			List<Audience> audienceList = new ArrayList<>();

			for (int i = 0; i < audienceIdList.size(); i++) {
				Audience audience = audienceDaoImp.getAudienceById(event.getAudienceIdList().get(i));
				audienceList.add(audience);
			}
			event.setAudience(audienceList);
			Venue venue = event.getVenue();
			event.setCountry(venue.getCountryName());
			Event saveEvent = eventDaoImp.saveEvent(event);
			
			//System.out.println("save event"+saveEvent);

			String eventUrl = saveEvent.getEventUrl();
			int eventId = saveEvent.getEventId();

			int index = eventUrl.indexOf('0');
			String replacedStr = null;
			// Replace the letter with the integer
			if (index != -1) {
				replacedStr = eventUrl.substring(0, index) + eventId + eventUrl.substring(index + 1);
				//System.out.println(replacedStr);
				saveEvent.setEventUrl(replacedStr);
			} else {
				System.out.println("Letter not found in the string.");
				saveEvent.setEventUrl(eventUrl);
			}

			Event saveEvent2 = eventDaoImp.saveEvent(saveEvent);
			System.out.println(saveEvent2);
			resp.setCode(1);
			resp.setMessage("success");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getEventList")
	public ResponseEntity<Response> getEventList(@RequestBody Event map,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		try {
			List<Event> eventList = eventDaoImp.getEventListByCompanyIdAndBranchId(companyId, branchId);

			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(eventList);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setCode(0);
			resp.setMessage(e.getMessage());
			resp.setResult(null);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}	
	
	@PostMapping("/getEventByCompanyIdBranchIdAndEventId")
	public ResponseEntity<Response> getEventByCompanyIdBranchIdAndEventId(@RequestBody Event map,
			@RequestHeader("Authorization") String authorizationHeader) {
		Response resp = new Response();

		int eventId = map.getEventId();
		if (eventId == 0) {
			resp.setMessage("eventId can't be 0, plz check");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}

		try {
			Event event = eventDaoImp.getEventByCompanyIdBranchIdAndEventId(eventId);
			if (event != null) {
				resp.setCode(1);
				resp.setMessage("success");
				resp.setResult(event);
			} else {
				resp.setMessage("AssignClassTeacher with assignClassTeacherId : " + eventId + " does not exist");
			}
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/saveAttendee")
	public ResponseEntity<Response> saveAttendee(@ModelAttribute Attendee attendee,
			@RequestHeader("Authorization") String authorizationHeader) throws WriterException, IOException {

		Response resp = new Response();
		if (attendee.getCompanyId() == 0) {
			resp.setMessage("PLEASE SELECT COMPANY");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (attendee.getBranchId() == 0) {
			resp.setMessage("PLEASE SELECT BRANCH");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (attendee.getCategory() == null) {
			resp.setCode(0);
			resp.setMessage("PLEASE SELECT CATEGORY");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (attendee.getEvent() == null) {
			resp.setCode(0);
			resp.setMessage("PLEASE SELECT EVENT ATLEAST ONE EVENT");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (attendee.getFirstName() == null || attendee.getFirstName().equals("")) {
			resp.setMessage("PLEASE ENTER FIRST NAME");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (attendee.getVenue() == null) {
			resp.setCode(0);
			resp.setMessage("PLEASE SELECT VENUE");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (attendee.getPhoneNo() == 0) {
			resp.setCode(0);
			resp.setMessage("PLEASE ENTER PHONE NO");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (attendee.getEmail() == null || attendee.getEmail().equals("")) {
			resp.setMessage("PLEASE ENTER EMAIL");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (attendee.getDob() == null || attendee.getDob().equals("")) {
			resp.setMessage("PLEASE SELECT DATE OF BIRTH");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (attendee.getGender() == null || attendee.getGender().equals("")) {
			resp.setMessage("PLEASE SELECT GENDER");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}

		try {

			attendee.setAttendeeLoginAccess(1);
			attendeeDaoImp.saveAttendee(attendee);

			String generateRandomAlphaNumeric = QRCodeGenerator.generateRandomAlphaNumeric(6);

			attendee.setAttendeeCode(generateRandomAlphaNumeric);
			int attendeeId = (Integer) attendee.getAttendeeId();
			String attendeeIdCode = String.valueOf(attendeeId);

			String encryptedRandomKey = EncryptDecryptService.encrypt(attendeeIdCode, secretKey);
			String attendeeCode = attendee.getAttendeeCode();

			ResponseEntity<MultipartFile> generateQRCode = codeGenerator.generateQRCode(encryptedRandomKey,
					attendeeCode);
			MultipartFile image = (MultipartFile) generateQRCode.getBody();

			if (image != null && !image.isEmpty()) {

				if (attendee.getQrCodeImageOriginalName() == null) {
					String originalFileName = image.getOriginalFilename();
					attendee.setQrCodeImageOriginalName((originalFileName).replaceAll("\\s", ""));
				} else {
					attendee.setQrCodeImageOriginalName((attendee.getQrCodeImageOriginalName()).replaceAll("\\s", ""));
				}

				String qrfileName = QRCodeGenerator.generateRandomAlphaNumeric(3) + attendee.getCompanyId() + ""
						+ attendee.getBranchId() + "" + attendee.getEvent().getEventName() + ""
						+ attendee.getAttendeeCode() + "" + attendee.getQrCodeImageOriginalName();
				attendee.setQrCodeImageName((qrfileName.replaceAll("\\s", "")));

				try {
					AwsFileUploader.uploadFile(image, attendee.getQrCodeImageName(), MyUrl.fileUploadPath + "/attendeeQRCodeImages/");
				} catch (Exception e) {
					return new ResponseEntity<Response>(resp, HttpStatus.OK);
				}
			} else {
				if (attendee.getAttendeeId() > 0 && attendee.getRemoveQrImg() == 0) {
					Attendee attendeeById = attendeeDaoImp.getAttendeeById(attendee.getAttendeeId());
					if (attendeeById != null) {
						attendee.setQrCodeImageName(attendeeById.getQrCodeImageName());
						attendee.setQrCodeImageOriginalName(attendeeById.getQrCodeImageOriginalName());
					}
				}
			}

			Attendee saveAttendee2 = attendeeDaoImp.saveAttendee(attendee);

			if (saveAttendee2.getUpdateAttendee() == 0) {
				SendMail.sendMailToAttendee(saveAttendee2);
			} else {
				SendMail.sendUpdateMailToAttendee(saveAttendee2);
			}

			resp.setResult(saveAttendee2);
			resp.setCode(1);
			resp.setMessage("success");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getAttendeeList")
	public ResponseEntity<Response> getAttendeeList(@RequestBody Attendee map,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		try {
			List<Attendee> attendeeList = attendeeDaoImp.getAttendeeListByCompanyIdAndBranchId(companyId, branchId);

			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(attendeeList);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setCode(0);
			resp.setMessage(e.getMessage());
			resp.setResult(null);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}
	
	@PostMapping("/getAttendeeListByEventId")
	public ResponseEntity<Response> getAttendeeListByEventId(@RequestBody Event map,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();
		int eventId = map.getEventId();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (eventId == 0) {
			resp.setMessage("Please Select Event");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		try {
			List<Attendee> attendeeList = attendeeDaoImp.getAttendeeListByCompanyIdAndBranchIdAndEventId(companyId,
					branchId, eventId);

			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(attendeeList);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setCode(0);
			resp.setMessage(e.getMessage());
			resp.setResult(null);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getAttendeeById")
	public ResponseEntity<Response> getAttendeeById(@RequestBody Attendee attendee,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		try {
			Attendee attendeeDetails = attendeeDaoImp.getAttendeeById(attendee.getAttendeeId());
			if (attendeeDetails != null) {
				resp.setCode(1);
				resp.setMessage("success");
				resp.setResult(attendeeDetails);
			} else {
				resp.setMessage("Data Not Found");
			}
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
		}
		return new ResponseEntity<Response>(resp, HttpStatus.OK);
	}

	@PostMapping("/login")
	public ResponseEntity<Response> login(@RequestBody LoginCredentials data,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		if (data.getEmail() == null || data.getEmail().equals("")) {
			resp.setMessage("please enter username/email");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (data.getPassword() == null || data.getPassword().equals("")) {
			resp.setMessage("please enter password");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		HashMap<String, Object> map = new HashMap<>();
		LoginCredentials cred = loginCredDaoImp.getCredentialDetailsByEmailPassword(data.getEmail(), data.getPassword());

		if (cred != null) {
			Participant participant = participantDaoImp.getParticipantByCompanyIdBranchIdAndEmail(cred.getCompanyId(),
					cred.getBranchId(), cred.getEmail());

			if (participant != null) {
				if (participant.getParticipantLoginAccess() == 1) {
					resp.setCode(1);
					map.put("loginCredentials", cred);
					map.put("participantDetails", participant);
					resp.setMessage("success");
					resp.setResult(map);
				} else {
					resp.setMessage("Your account is not active! Please contact to admin");
				}
			} else {
				resp.setMessage("Email or password is incorrect");
			}
		} else {
			resp.setMessage("Email or password is incorrect");
		}
		return new ResponseEntity<Response>(resp, HttpStatus.OK);
	}

	@PostMapping("/getAttendeeApprovalList")
	public ResponseEntity<Response> getAttendeeApprovalList(@RequestBody Attendee map,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();

		int attendeeApprovalStatus = 1; // 0 for not approveRequired 1 for approveRequired

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		try {
			List<Attendee> attendeeList = attendeeDaoImp.getAttendeeListByCompanyIdAndBranchIdAndApprovalStatus(companyId, branchId, attendeeApprovalStatus);

			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(attendeeList);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setCode(0);
			resp.setMessage(e.getMessage());
			resp.setResult(null);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/approveOrRejectRequest")
	public ResponseEntity<Response> approveOrRejectRequest(@RequestBody Attendee attendee,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();

//		NULL CHECK VALIDATIONS
		if (attendee.getCompanyId() == 0) {
			resp.setMessage("PLEASE SELECT COMPANY");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (attendee.getBranchId() == 0) {
			resp.setMessage("PLEASE SELECT BRANCH");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (attendee.getAttendeeId() == 0) {
			resp.setMessage("PLEASE ENTER ATTENDEE ID");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (attendee.getAttendeeApprovalStatus() == 0) {
			resp.setMessage("PLEASE ENTER APPROVAL STATUS");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}

		try {
			Attendee attendeDetails = attendeeDaoImp.getAttendeeByCompanyIdBranchIdAndAttendeeId(
					attendee.getCompanyId(), attendee.getBranchId(), attendee.getAttendeeId());

			if (attendeDetails.getAttendeeApprovalStatus() == 1) {
				if (attendee.getAttendeeApprovalStatus() == 2) {
					attendeDetails.setAttendeeApprovalStatus(attendee.getAttendeeApprovalStatus());
					attendeeDaoImp.saveAttendee(attendeDetails);
					resp.setCode(1);
					resp.setMessage("Request Approved Successfully");
					resp.setResult(attendeDetails);
					SendMail.sendApprovalORRejectedMailToAttendee(attendeDetails);
					return new ResponseEntity<Response>(resp, HttpStatus.OK);
				} else if (attendee.getAttendeeApprovalStatus() == -1) {
					attendeDetails.setAttendeeApprovalStatus(attendee.getAttendeeApprovalStatus());
					attendeeDaoImp.saveAttendee(attendeDetails);
					resp.setCode(1);
					resp.setMessage("Rejected");
					resp.setResult(attendeDetails);
					SendMail.sendApprovalORRejectedMailToAttendee(attendeDetails);
					return new ResponseEntity<Response>(resp, HttpStatus.OK);
				} else {
					resp.setMessage("WRONG REQUEST RESPONSE");
					resp.setResult(attendeDetails);
					return new ResponseEntity<Response>(resp, HttpStatus.OK);
				}
			} else if (attendeDetails.getAttendeeApprovalStatus() == 0) {
				resp.setMessage("Approval Not Required");
				resp.setResult(attendeDetails);
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			} else if (attendeDetails.getAttendeeApprovalStatus() == -1) {
				resp.setMessage("Request has been Rejected");
				resp.setResult(attendeDetails);
				SendMail.sendApprovalORRejectedMailToAttendee(attendeDetails);
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			} else {
				resp.setMessage("Request has been Successfully Approve");
				resp.setResult(attendeDetails);
				SendMail.sendApprovalORRejectedMailToAttendee(attendeDetails);
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}

		} catch (Exception e) {
			resp.setMessage(e.getMessage());
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getEventDetailsById")
	public ResponseEntity<Response> getEventDetailsById(@RequestBody Event event) {
		Response resp = new Response();
		try {
			Event eventDetails = eventDaoImp.getEventDetailsById(event.getEventId());
			if (eventDetails != null) {
				resp.setCode(1);
				resp.setMessage("success");
				resp.setResult(eventDetails);
			} else {
				resp.setMessage("Data Not Found");
			}
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
		}
		return new ResponseEntity<Response>(resp, HttpStatus.OK);
	}

	@PostMapping("/saveParticipant")
	public ResponseEntity<Response> saveParticipant(@ModelAttribute Participant participant,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		if (participant.getCompanyId() == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (participant.getBranchId() == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (participant.getParticipantName() == null || participant.getParticipantName().equals("")) {
			resp.setMessage("Please Enter Participant's Name");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (participant.getEvent() == null) {
			resp.setMessage("Please Select Event");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (participant.getStallName() == null || participant.getStallName().equals("")) {
			resp.setMessage("Please Enter Stall's Name");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (participant.getParticipantEmail() == null || participant.getParticipantEmail().equals("")) {
			resp.setMessage("Please Enter Participant's Email");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (participant.getParticipantPhoneNo() == null || participant.getParticipantPhoneNo().equals("")) {
			resp.setMessage("Please Enter Mobile No");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}

		if (participant.getParticipantId() > 0) {
			if (participantDaoImp.getParticipantByCompanyIdBranchIdAndAndParticipantIdAndParticipantNameExceptThis(participant.getCompanyId(), participant.getBranchId(),
					participant.getParticipantId(), participant.getParticipantEmail()).isPresent()) {
				resp.setMessage("Participant Already Exists");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
		} else {
			if (participantDaoImp.getParticipantByCompanyIdBranchIdAndParticipantEmail(participant.getCompanyId(), participant.getBranchId(),
					participant.getParticipantEmail()).isPresent()) {
				resp.setMessage("Participant Already Exists");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
		}

		if (participant.getProfilePic() != null && !participant.getProfilePic().isEmpty()) {

			if (participant.getProfilePicOriginalName() == null) {
				String originalfileName = participant.getProfilePic().getOriginalFilename();
				participant.setProfilePicOriginalName((originalfileName).replaceAll("\\s", ""));
			} else {
				participant.setProfilePicOriginalName((participant.getProfilePicOriginalName()).replaceAll("\\s", ""));
			}

			Date date = new Date();
			Random random = new Random();
			int rNo1 = random.nextInt(100);
			int rNo2 = random.nextInt(100);
			SimpleDateFormat sdf = new SimpleDateFormat("ddMMyyyyHHmmss");
			String dateString = sdf.format(date);

			String fileName = "IMG" + Integer.toString(rNo1) + "" + Integer.toString(rNo2) + "" + dateString + ""
					+ participant.getProfilePicOriginalName();

			participant.setProfilePicName(fileName);

			try {
				AwsFileUploader.uploadFile(participant.getProfilePic(), participant.getProfilePicName(),
						MyUrl.fileUploadPath + "/participantImages/");
			} catch (Exception e) {
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
		} else {
			if (participant.getParticipantId() > 0 && participant.getRemoveProfilePic() == 0) {
				Participant ovb = participantDaoImp.getParticipantById(participant.getParticipantId());
				participant.setProfilePicName(ovb.getProfilePicName());
				participant.setProfilePicOriginalName(ovb.getProfilePicOriginalName());
			}
		}

		try {
			participant.setParticipantLoginAccess(1);
			Participant saveParticipant = participantDaoImp.saveParticipant(participant);

			LoginCredentials loginCred = new LoginCredentials();
			loginCred.setCompanyId(participant.getCompanyId());
			loginCred.setBranchId(participant.getBranchId());
			loginCred.setUserType(1);
			loginCred.setEmail(participant.getParticipantEmail());
			loginCred.setStatus(1);
			loginCred.setPassword((QRCodeGenerator.generateRandomAlphaNumeric(8)).replaceAll("\\s", ""));

			loginCredDaoImp.saveLoginCredentials(loginCred);

			SendMail.sendMailToParticipant(participant, loginCred);

			resp.setCode(1);
			resp.setMessage("success");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getParticipantList")
	public ResponseEntity<Response> getParticipantList(@RequestBody Participant map,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		try {
			List<Participant> participantList = participantDaoImp.getParticipantListByCompanyIdAndBranchId(companyId,
					branchId);
			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(participantList);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setCode(0);
			resp.setMessage(e.getMessage());
			resp.setResult(null);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/updateProfile")
	public ResponseEntity<Response> updateProfile(@ModelAttribute Participant participant,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();

		try {
			int companyId = participant.getCompanyId();
			int branchId = participant.getBranchId();
			int participantId = participant.getParticipantId();
			String participantName = participant.getParticipantName();
			String participantPhoneNo = participant.getParticipantPhoneNo();

			if (companyId == 0) {
				resp.setMessage("please select school");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
			if (branchId == 0) {
				resp.setMessage("please select branch");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
			if (participantId == 0) {
				resp.setMessage("For update participant details enter participantId");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
			if (participantName == null || participantName.equals("")) {
				resp.setMessage("please enter name");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
			if (participantPhoneNo == null || participantPhoneNo.equals("")) {
				resp.setMessage("please enter phone no.");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}

			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("ddMMyyyyHHmmss");
			String dateString = sdf.format(date);
			Random random = new Random();
			int rNo1 = random.nextInt(100);
			int rNo2 = random.nextInt(100);

			if (participantId != 0) {
				Participant participantDetails = participantDaoImp.getParticipateDetailsByCompanyIdAndBranchIdAndParticipantId(companyId, branchId,
								participantId);

				if (participantDetails == null) {
					resp.setMessage("participant member with participantId : " + participantId + " does not exists");
					return new ResponseEntity<Response>(resp, HttpStatus.OK);
				}

				if (participant.getProfilePic() != null && !participant.getProfilePic().isEmpty()) {
					if (participant.getProfilePicOriginalName() == null) {
						String profilePhotoOriginalName = participant.getProfilePic().getOriginalFilename();
						participantDetails.setProfilePicOriginalName((profilePhotoOriginalName).replaceAll("\\s", ""));
					} else {
						participantDetails.setProfilePicOriginalName(
								(participant.getProfilePicOriginalName()).replaceAll("\\s", ""));
					}
					String profilePhotoName = "PROIMG" + Integer.toString(rNo1) + "" + Integer.toString(rNo2) + ""
							+ dateString + "" + participantDetails.getProfilePicOriginalName();
					participantDetails.setProfilePicName(profilePhotoName);

					try {
						AwsFileUploader.uploadFile(participant.getProfilePic(), participantDetails.getProfilePicName(),
								MyUrl.fileUploadPath + "/participantImages/");
					} catch (Exception e) {
						return new ResponseEntity<Response>(resp, HttpStatus.OK);
					}
				}
				participantDetails.setParticipantName(participantName);
				participantDetails.setParticipantPhoneNo(participantPhoneNo);
				participantDetails = participantDaoImp.saveParticipant(participantDetails);
				resp.setResult(participantDetails);
			}
			resp.setCode(1);
			resp.setMessage("success");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
		}
		return new ResponseEntity<Response>(resp, HttpStatus.OK);
	}

	@PostMapping("/changePassword")
	public ResponseEntity<Response> changePassword(@RequestBody LoginCredentials logCred,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		if (logCred.getEmail() == null) {
			resp.setMessage("please enter email");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (logCred.getOldPassword() == null) {
			resp.setMessage("please enter your old password");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (logCred.getPassword() == null) {
			resp.setMessage("please enter your new password");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		try {
			LoginCredentials credentials = loginCredDaoImp.getCredentialDetailsByEmailPassword(logCred.getEmail(),
					logCred.getOldPassword());
			if (credentials == null) {
				resp.setMessage("Either your old password is incorrect Or you an entered incorrect email");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
			if (logCred.getPassword().equals(logCred.getOldPassword())) {
				resp.setMessage("Your new password can't be same as your old password, Please enter a different password.");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
			credentials.setPassword(logCred.getPassword());
			loginCredDaoImp.saveLoginCredentials(credentials);
			SendMail.sendPasswordChangeMail(credentials);
			resp.setCode(1);
			resp.setMessage("success");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getParticipantById")
	public ResponseEntity<Response> getParticipantById(@RequestBody Participant participant) {
		Response resp = new Response();
		try {
			Participant participantDetails = participantDaoImp.getParticipantById(participant.getParticipantId());
			if (participantDetails != null) {
				resp.setCode(1);
				resp.setMessage("success");
				resp.setResult(participantDetails);
			} else {
				resp.setMessage("Data Not Found");
			}
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
		}
		return new ResponseEntity<Response>(resp, HttpStatus.OK);

	}

	@PostMapping("/getAttendeeLogListByParticipantId")
	public ResponseEntity<Response> getAttendeeLogListByParticipantId(@RequestBody Participant map,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();
		int participantId = map.getParticipantId();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (participantId == 0) {
			resp.setMessage("Please Select Participant");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}

		try {
			List<AttendeeLog> attendeeLogList = attendeeLogDaoImp.getAttendeeLogListByCompanyIdAndBranchIdAndParticipantId(companyId, branchId, participantId);

			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(attendeeLogList);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setCode(0);
			resp.setMessage(e.getMessage());
			resp.setResult(null);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getAttendeeLogListByParticipantIdAndEventId")
	public ResponseEntity<Response> getAttendeeLogListByParticipantIdAndEventId(@RequestBody Participant map,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();
		int participantId = map.getParticipantId();
		int eventId = map.getEventId();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (participantId == 0) {
			resp.setMessage("Please Select Participant");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (eventId == 0) {
			resp.setMessage("Please Select Event");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}

		try {
			
			List<StallLog> stallLogList = stallLogDaoImp.getStallLogListByCompanyIdBranchIdAndParticipantId(companyId,
					branchId, participantId);
			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(stallLogList);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setCode(0);
			resp.setMessage(e.getMessage());
			resp.setResult(null);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getAttendeeEventReport")
	public ResponseEntity<Response> getAttendeeEventReport(@RequestBody Attendee map,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		try {

			List<Event> eventList = eventDaoImp.getEventListByCompanyIdAndBranchId(companyId, branchId);

			for (int i = 0; i < eventList.size(); i++) {
				int eventId = eventList.get(i).getEventId();
				int noOfAttendee = attendeeDaoImp.getAttendeeListByCompanyIdAndBranchIdAndEventId(companyId, branchId, eventId).size();
				eventList.get(i).setNoOfAttendee(noOfAttendee);
			}

			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(eventList);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setCode(0);
			resp.setMessage(e.getMessage());
			resp.setResult(null);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getParticipantEventReport")
	public ResponseEntity<Response> getParticipantEventReport(@RequestBody Participant map,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		try {

			List<Event> eventList = eventDaoImp.getEventListByCompanyIdAndBranchId(companyId, branchId);

			for (int i = 0; i < eventList.size(); i++) {
				int eventId = eventList.get(i).getEventId();
				int noOfParticipant = participantDaoImp
						.getParticipantListByCompanyIdAndBranchIdAndEventId(companyId, branchId, eventId).size();
				eventList.get(i).setNoOfParticipant(noOfParticipant);
			}

			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(eventList);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setCode(0);
			resp.setMessage(e.getMessage());
			resp.setResult(null);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getParticipantListByEventId")
	public ResponseEntity<Response> getParticipantListByEventId(@RequestBody Event map,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();
		int eventId = map.getEventId();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (eventId == 0) {
			resp.setMessage("Please Select Event");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		try {
			List<Participant> participantList = participantDaoImp.getParticipantListByCompanyIdAndBranchIdAndEventId(companyId, branchId, eventId);

			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(participantList);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setCode(0);
			resp.setMessage(e.getMessage());
			resp.setResult(null);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/resetPasssword")
	public ResponseEntity<Response> resetPassword(@RequestBody LoginCredentials logCred, HttpSession session) {
		Response resp = new Response();
		try {
			String email = logCred.getEmail();
			if (email == null || email.equals("")) {
				resp.setMessage("Please enter email whose password you want to reset");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
			ResponseEntity<Response> response = passRecover.resetPassword(logCred.getEmail(), session);
			resp = response.getBody();
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
		}
		return new ResponseEntity<Response>(resp, HttpStatus.OK);
	}

	@PostMapping("/verifyResetToken")
	public ResponseEntity<Response> verifyResetToken(@RequestBody LoginCredentials logCred) {

		Response resp = new Response();
		try {
			String email = logCred.getEmail();
			String token = logCred.getToken();
			if (email == null || email.equals("")) {
				resp.setMessage("please enter email");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
			if (token == null || token.equals("")) {
				resp.setMessage("please enter tokens");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
			if (passRecover.verifyResetToken(email, token)) {
				resp.setCode(1);
				resp.setMessage("success");
			}
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/setNewPassword")
	public ResponseEntity<Response> setNewPassword(@RequestBody LoginCredentials logCred,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		if (logCred.getEmail() == null || logCred.getEmail().equals("")) {
			resp.setMessage("please enter email");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (logCred.getPassword() == null || logCred.getPassword().equals("")) {
			resp.setMessage("please enter your new password");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		try {
			LoginCredentials credentials = loginCredDaoImp.getCredentialDetailsByEmail(logCred.getEmail());
			if (credentials == null) {
				resp.setMessage("User does not exist with your entered email.");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
			credentials.setPassword(logCred.getPassword());
			loginCredDaoImp.saveLoginCredentials(credentials);
			SendMail.sendPasswordChangeMail(credentials);
			resp.setCode(1);
			resp.setMessage("success");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getEventFilterList")
	public ResponseEntity<Response> getEventFilterList(@RequestBody Event map,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();

		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();
		int categoryId = map.getCategoryId();
		int venueId = map.getVenueId();
		String eventStartDate = map.getEventStartDate();
		String eventLastDate = map.getEventLastDate();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}

		try {
			List<Event> eventList = eventDaoImp.getEventFilterList(companyId, branchId, categoryId, venueId,
					eventStartDate, eventLastDate);

			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(eventList);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setCode(0);
			resp.setMessage(e.getMessage());
			resp.setResult(null);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@GetMapping("/getOrganizerDashboardData")
	public ResponseEntity<Response> getOrganizerDashboardData() {

		Response resp = new Response();
		Map<String, Object> responseMap = new HashMap<>();

		try {
			List<Event> eventList = eventDaoImp.getEventList();
			List<Event> upcomingEventList = eventDaoImp.getUpcomingEventList();
			List<Event> completedEventList = eventDaoImp.getCompletedEventList();
			List<Event> liveEventList = eventDaoImp.getLiveEventList();
			responseMap.put("noOfEvent", eventList.size());
			int size = eventList.size();
			List<Event> eventListnew = new ArrayList<>();

			for (int i = 0; i < size; i++) {
				Event event = eventList.get(i);
				int eventId = event.getEventId();
				Integer attendeeListByEventId = attendeeDaoImp.getAttendeeListByEventId(eventId).size();
				Integer participantListByEventId = participantDaoImp.getParticipantListByEventId(eventId).size();
				Integer attendeeLogListByEventId = attendeeLogDaoImp.getDistinctAttendeeIdByEventId(eventId).size();

				event.setNoOfAttendee(attendeeListByEventId);
				event.setNoOfParticipant(participantListByEventId);
				event.setNoOfAttendeLog(attendeeLogListByEventId);

				eventListnew.add(event);
			}

			responseMap.put("noOfUpcomingEvent", upcomingEventList.size());
			responseMap.put("noOfCompletedEvent", completedEventList.size());
			responseMap.put("noOfLiveEvent", liveEventList.size());
			responseMap.put("eventList", eventListnew);

			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(responseMap);

			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getParticipantDashboardData")
	public ResponseEntity<Response> getParticipantDashboardData(@RequestBody Participant map,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();
		int participantId = map.getParticipantId();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (participantId == 0) {
			resp.setMessage("Please Select Participant");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}

		Map<String, Object> responseMap = new HashMap<>();
		Participant participantById = participantDaoImp.getParticipantById(participantId);
		int eventId = participantById.getEvent().getEventId();

		try {
			List<Attendee> attendeeList = attendeeDaoImp.getAttendeeListByEventId(eventId);
			List<AttendeeLog> attendeeLogList = attendeeLogDaoImp
					.getAttendeeLogListByCompanyIdBranchIdParticipantIdAndEventId(companyId, branchId, participantId,
							eventId);

			responseMap.put("noOfAttendee", attendeeList.size());
			responseMap.put("noOfAttendeeLog", attendeeLogList.size());

			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(responseMap);

			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/checkInAttendeeInGetPass")
	public ResponseEntity<Response> checkInAttendee(@RequestBody String qrCodeMessage)
			throws JsonMappingException, JsonProcessingException {

		ObjectMapper mapper = new ObjectMapper();
		JsonNode jsonNode = mapper.readTree(qrCodeMessage);

		String qrCodeMessage1 = jsonNode.get("qrCodeMessage").asText();
		String encryptedRandomKey = EncryptDecryptService.decrypt(qrCodeMessage1, secretKey);
		int attendeeId = Integer.parseInt(encryptedRandomKey);

		Response resp = new Response();
		Attendee attendeeDetails = attendeeDaoImp.getAttendeeById(attendeeId);
		AttendeeLog attendeeLog = new AttendeeLog();

		LocalDateTime currentDateTime = LocalDateTime.now();
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");

		String formattedDate = currentDateTime.format(dateFormatter);
		String formattedTime = currentDateTime.format(timeFormatter);

		if (attendeeDetails != null) {

			Event event = attendeeDetails.getEvent();
			String eventStartDate = event.getEventStartDate();
			String eventLastDate = event.getEventLastDate();
			LocalDate eventStartDate1 = LocalDate.parse(eventStartDate);
			LocalDate eventLastDate1 = LocalDate.parse(eventLastDate);
			LocalDate today = LocalDate.now();
			if ((today.isEqual(eventStartDate1) || today.isAfter(eventStartDate1)) && (today.isEqual(eventLastDate1) || today.isBefore(eventLastDate1))) {

				if (attendeeDetails.getAttendeeApprovalStatus() == 2
						|| attendeeDetails.getAttendeeApprovalStatus() == 0) {

					AttendeeLog attendeeLogDetails = attendeeLogDaoImp.getAttendeeLogDetailsByCompanyIdBranchIdAttendeeIdCheckInStatusAndAttendeeLogStatus(
									attendeeDetails.getCompanyId(), attendeeDetails.getBranchId(), attendeeId,
									checkInStatus, attendeeLogStatusForGetPass);

					if (attendeeLogDetails != null) {

						if (attendeeLogDetails.getCheckInOutStatus() == 1) {
							resp.setCode(1);
							resp.setMessage("Already CHECK-IN");
							return new ResponseEntity<Response>(resp, HttpStatus.OK);
						} else {

							attendeeLog.setCheckIntime(formattedTime);
							attendeeLog.setCheckInDate(formattedDate);
							attendeeLog.setAttendee(attendeeDetails);
							attendeeLog.setCheckInOutStatus(checkInStatus);
							attendeeLog.setAttendeeLogStatus(attendeeLogStatusForGetPass);
							attendeeLog.setCompanyId(attendeeDetails.getCompanyId());
							attendeeLog.setBranchId(attendeeDetails.getBranchId());
							attendeeLog.setCompanyName(attendeeDetails.getCompanyName());
							attendeeLog.setBranchName(attendeeDetails.getBranchName());
							attendeeLog.setEvent(attendeeDetails.getEvent());

							attendeeLogDaoImp.saveAttendeeLog(attendeeLog);
							resp.setCode(1);
							resp.setMessage("Successfully CHECK-IN");
							return new ResponseEntity<Response>(resp, HttpStatus.OK);
						}
					} else {
						attendeeLog.setCheckIntime(formattedTime);
						attendeeLog.setCheckInDate(formattedDate);
						attendeeLog.setAttendee(attendeeDetails);
						attendeeLog.setCheckInOutStatus(checkInStatus);
						attendeeLog.setAttendeeLogStatus(attendeeLogStatusForGetPass);
						attendeeLog.setCompanyId(attendeeDetails.getCompanyId());
						attendeeLog.setBranchId(attendeeDetails.getBranchId());
						attendeeLog.setCompanyName(attendeeDetails.getCompanyName());
						attendeeLog.setBranchName(attendeeDetails.getBranchName());
						attendeeLog.setEvent(attendeeDetails.getEvent());
						attendeeLogDaoImp.saveAttendeeLog(attendeeLog);

						resp.setCode(1);
						resp.setMessage("Successfully CHECK-IN");
						return new ResponseEntity<Response>(resp, HttpStatus.OK);
					}
				} else {
					resp.setCode(0);
					resp.setMessage("You are not Approved For this event. Please Try Again !");
					return new ResponseEntity<Response>(resp, HttpStatus.OK);
				}
			} else {
				resp.setCode(0);
				resp.setMessage("This Event is not Running !");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
		} else {
			resp.setCode(0);
			resp.setMessage("Something went wrong");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/checkInAttendeeFromParticipant")
	public ResponseEntity<Response> checkInAttendeeFromParticipant(@RequestBody Participant participant)
			throws JsonMappingException, JsonProcessingException {

		String qrCodeMessage = participant.getQrCodeMessage();
		int participantId = participant.getParticipantId();

		String encryptedRandomKey = EncryptDecryptService.decrypt(qrCodeMessage, secretKey);
		int attendeeId = Integer.parseInt(encryptedRandomKey);

		System.out.println(attendeeId + " " + participantId);

		Attendee attendeeDetails = attendeeDaoImp.getAttendeeById(attendeeId);
		Participant participantDetails = participantDaoImp.getParticipantById(participantId);

		LocalDateTime currentDateTime = LocalDateTime.now();
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");

		String formattedDate = currentDateTime.format(dateFormatter);
		String formattedTime = currentDateTime.format(timeFormatter);

		Response resp = new Response();

		if (attendeeDetails.getEvent().getEventId() == participantDetails.getEvent().getEventId()) {
			AttendeeLog attendeeLog = attendeeLogDaoImp.checkAttendeeIsCheckInOrNotAtGate(
					attendeeDetails.getCompanyId(), attendeeDetails.getBranchId(),
					attendeeDetails.getEvent().getEventId(), attendeeDetails.getAttendeeId(), checkInStatus,
					attendeeLogStatusForGetPass);

			if (attendeeLog != null) {
				StallLog stallLog = attendeeLog.getStallLog();
				if (stallLog == null) {

					AttendeeLog checkAlreadyCheckIn = attendeeLogDaoImp.checkAttendeeIsCheckInOrNotAtGate(
							attendeeDetails.getCompanyId(), attendeeDetails.getBranchId(),
							attendeeDetails.getEvent().getEventId(), attendeeDetails.getAttendeeId(), participantId,
							checkInStatus, participantCheckInStatus, attendeeLogStatusForParticipantStall);

					if (checkAlreadyCheckIn != null) {

						if (checkAlreadyCheckIn.getStallLog() != null) {
							resp.setCode(1);
							resp.setMessage("You are already Check IN !!");
							return new ResponseEntity<Response>(resp, HttpStatus.OK);
						} else {
							StallLog participantAttendeeLog = new StallLog();
							participantAttendeeLog.setParticipant(participant);
							participantAttendeeLog.setAttendee(attendeeDetails);
							participantAttendeeLog.setParticipantCheckInOutStatus(participantCheckInStatus);
							participantAttendeeLog.setParticipantStallCheckInDate(formattedDate);
							participantAttendeeLog.setParticipantStallCheckInTime(formattedTime);
							participantAttendeeLog.setParticipantStallLogStatus(attendeeLogStatusForParticipantStall);
							participantAttendeeLog.setAttendeeLog(attendeeLog);
							StallLog saveStallLog = stallLogDaoImp.saveStallLog(participantAttendeeLog);

							attendeeLog.setStallLog(saveStallLog);
							attendeeLogDaoImp.saveAttendeeLog(attendeeLog);

							resp.setCode(1);
							resp.setMessage("Successfully CHECK-IN At Your Stall");
							return new ResponseEntity<Response>(resp, HttpStatus.OK);
						}

					} else {
						StallLog participantAttendeeLog = new StallLog();
						participantAttendeeLog.setParticipant(participant);
						participantAttendeeLog.setAttendee(attendeeDetails);
						participantAttendeeLog.setParticipantCheckInOutStatus(participantCheckInStatus);
						participantAttendeeLog.setParticipantStallCheckInDate(formattedDate);
						participantAttendeeLog.setParticipantStallCheckInTime(formattedTime);
						participantAttendeeLog.setParticipantStallLogStatus(attendeeLogStatusForParticipantStall);
						participantAttendeeLog.setAttendeeLog(attendeeLog);
						StallLog saveStallLog = stallLogDaoImp.saveStallLog(participantAttendeeLog);

						attendeeLog.setStallLog(saveStallLog);
						attendeeLogDaoImp.saveAttendeeLog(attendeeLog);

						resp.setCode(1);
						resp.setMessage("Successfully CHECK-IN At Your Stall");
						return new ResponseEntity<Response>(resp, HttpStatus.OK);
					}
				} else {
					AttendeeLog attendeeLogStall = attendeeLogDaoImp.checkParticipantIsLoginInAnotherStallORNot(
							attendeeLog.getAttendeeLogId(), stallLog.getStallLogId(), participantId,
							participantCheckInStatus, attendeeLogStatusForParticipantStall);

					if (attendeeLogStall != null) {
						resp.setCode(0);
						resp.setMessage("You are already Check IN in another Stall !!");
						return new ResponseEntity<Response>(resp, HttpStatus.OK);
					} else {
						AttendeeLog checkAlreadyCheckIn = attendeeLogDaoImp.checkAttendeeIsCheckInOrNotAtGate(
								attendeeDetails.getCompanyId(), attendeeDetails.getBranchId(),
								attendeeDetails.getEvent().getEventId(), attendeeDetails.getAttendeeId(), participantId,
								checkInStatus, participantCheckInStatus, attendeeLogStatusForParticipantStall);

						if (checkAlreadyCheckIn != null) {
							resp.setCode(1);
							resp.setMessage("You are already Check IN !!");
							return new ResponseEntity<Response>(resp, HttpStatus.OK);
						} else {
							StallLog participantAttendeeLog = new StallLog();
							participantAttendeeLog.setParticipant(participant);
							participantAttendeeLog.setAttendee(attendeeDetails);
							participantAttendeeLog.setParticipantCheckInOutStatus(participantCheckInStatus);
							participantAttendeeLog.setParticipantStallCheckInDate(formattedDate);
							participantAttendeeLog.setParticipantStallCheckInTime(formattedTime);
							participantAttendeeLog.setParticipantStallLogStatus(attendeeLogStatusForParticipantStall);
							participantAttendeeLog.setAttendeeLog(attendeeLog);
							StallLog saveStallLog = stallLogDaoImp.saveStallLog(participantAttendeeLog);

							attendeeLog.setStallLog(saveStallLog);
							attendeeLogDaoImp.saveAttendeeLog(attendeeLog);

							resp.setCode(1);
							resp.setMessage("Successfully CHECK-IN At Your Stall");
							return new ResponseEntity<Response>(resp, HttpStatus.OK);
						}
					}
				}
			} else {
				resp.setCode(0);
				resp.setMessage("Attendee is not CHECK-IN at Gate. Kindly First Check-In");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
		} else {
			resp.setCode(0);
			resp.setMessage("You are not registered for this Event");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}

	}

	@PostMapping("/checkOutAttendeeFromParticipant")
	public ResponseEntity<Response> checkOutAttendeeFromParticipant(@RequestBody Participant participant)
			throws JsonMappingException, JsonProcessingException {

		String qrCodeMessage = participant.getQrCodeMessage();
		int participantId = participant.getParticipantId();

		String encryptedRandomKey = EncryptDecryptService.decrypt(qrCodeMessage, secretKey);
		int attendeeId = Integer.parseInt(encryptedRandomKey);

		Response resp = new Response();
		Attendee attendeeDetails = attendeeDaoImp.getAttendeeById(attendeeId);
		Participant participantDetails = participantDaoImp.getParticipantById(participantId);

		LocalDateTime currentDateTime = LocalDateTime.now();
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");

		String formattedDate = currentDateTime.format(dateFormatter);
		String formattedTime = currentDateTime.format(timeFormatter);

		if (attendeeDetails.getEvent().getEventId() == participantDetails.getEvent().getEventId()) {

			AttendeeLog attendeeLog = attendeeLogDaoImp.checkAttendeeIsCheckInOrNotAtGate(
					attendeeDetails.getCompanyId(), attendeeDetails.getBranchId(),
					attendeeDetails.getEvent().getEventId(), attendeeDetails.getAttendeeId(), participantId,
					checkInStatus, participantCheckInStatus, attendeeLogStatusForParticipantStall);

			System.out.println("attendeeLog" + attendeeLog);

			if (attendeeLog != null) {
				if (attendeeLog.getStallLog() == null) {
					resp.setCode(0);
					resp.setMessage("Please Check-In first after that able to Check-Out At Your Stall");
					return new ResponseEntity<Response>(resp, HttpStatus.OK);
				} else {

					if (attendeeLog.getStallLog().getParticipant().getParticipantId() == participantId) {

						StallLog stallLog = attendeeLog.getStallLog();

						stallLog.setParticipantStallCheckOutDate(formattedDate);
						stallLog.setParticipantStallCheckOutTime(formattedTime);
						stallLog.setParticipantCheckInOutStatus(participantCheckOutStatus);
						System.out.println(formattedTime);
						System.out.println(stallLog.getParticipantStallCheckOutTime());
						StallLog saveStallLog = stallLogDaoImp.saveStallLog(stallLog);

						attendeeLog.setStallLog(saveStallLog);

						attendeeLogDaoImp.saveAttendeeLog(attendeeLog);

						resp.setCode(1);
						resp.setMessage("Successfully CHECK-OUT At Your Stall");
						return new ResponseEntity<Response>(resp, HttpStatus.OK);
					} else {
						resp.setCode(0);
						resp.setMessage("Your are not Check-In at this Stall");
						return new ResponseEntity<Response>(resp, HttpStatus.OK);
					}
				}
			} else {
				resp.setCode(0);
				resp.setMessage("Please Check-In first after that able to Check-Out At Your Stall");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			}
		} else {
			resp.setCode(0);
			resp.setMessage("Your are not register for this event");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/checkOutAttendeeInGetPass")
	public ResponseEntity<Response> checkOutAttendee(@RequestBody String qrCodeMessage)
			throws JsonMappingException, JsonProcessingException {

		ObjectMapper mapper = new ObjectMapper();
		JsonNode jsonNode = mapper.readTree(qrCodeMessage);

		String qrCodeMessage1 = jsonNode.get("qrCodeMessage").asText();
		String encryptedRandomKey = EncryptDecryptService.decrypt(qrCodeMessage1, secretKey);
		int attendeeId = Integer.parseInt(encryptedRandomKey);

		Response resp = new Response();
		Attendee attendeeDetails = attendeeDaoImp.getAttendeeById(attendeeId);

		LocalDateTime currentDateTime = LocalDateTime.now();
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");

		String formattedDate = currentDateTime.format(dateFormatter);
		String formattedTime = currentDateTime.format(timeFormatter);

		AttendeeLog attendeeLog = attendeeLogDaoImp.checkIsThereAnyParticipantCheckInORNotAtGate(
				attendeeDetails.getCompanyId(), attendeeDetails.getBranchId(), attendeeDetails.getEvent().getEventId(),
				attendeeId, checkInStatus, attendeeLogStatusForGetPass);
		System.out.println(attendeeDetails.getCompanyId() + " " + attendeeDetails.getBranchId() + " "
				+ attendeeDetails.getEvent().getEventId() + " " + attendeeId + " " + checkInStatus + " "
				+ attendeeLogStatusForGetPass);

		if (attendeeLog != null) {

			if (attendeeLog.getStallLog() == null) {
				attendeeLog.setCheckInOutStatus(checkOutStatus);
				attendeeLog.setCheckOutTime(formattedTime);
				attendeeLog.setCheckOutDate(formattedDate);

				System.out.println(attendeeLog);
				attendeeLogDaoImp.saveAttendeeLog(attendeeLog);

				resp.setCode(1);
				resp.setMessage("Successfully CHECK-OUT");
				return new ResponseEntity<Response>(resp, HttpStatus.OK);
			} else {
				List<StallLog> stallLog = stallLogDaoImp.getStallLogByAttendeeLogId(attendeeLog.getAttendeeLogId());

				List<Integer> participantCheckInOutStatus = new ArrayList<Integer>();

				for (int i = 0; i < stallLog.size(); i++) {
					StallLog stallLogDetails = stallLog.get(i);
					participantCheckInOutStatus.add(stallLogDetails.getParticipantCheckInOutStatus());
				}

				System.out.println(participantCheckInOutStatus);

				if (participantCheckInOutStatus.contains(1)) {
					resp.setCode(0);
					resp.setMessage("First Checkout From Stall where you visited");
					return new ResponseEntity<Response>(resp, HttpStatus.OK);
				} else {

					attendeeLog.setCheckInOutStatus(checkOutStatus);
					attendeeLog.setCheckOutTime(formattedTime);
					attendeeLog.setCheckOutDate(formattedDate);
					System.out.println(attendeeLog);
					attendeeLogDaoImp.saveAttendeeLog(attendeeLog);

					resp.setCode(1);
					resp.setMessage("Successfully CHECK-OUT");
					return new ResponseEntity<Response>(resp, HttpStatus.OK);
				}
			}

		} else {
			resp.setCode(0);
			resp.setMessage("You are upload or scan in wrong Scanner, For Check-Out First Check-In");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getAttendeeLogList")
	public ResponseEntity<Response> getAttendeeLogList(@RequestBody Attendee map,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}

		try {
			List<AttendeeLog> attendeeLogList = attendeeLogDaoImp.getAttendeeLogListByCompanyIdAndBranchIdAndAttendeeLogStatus(companyId, branchId,
							attendeeLogStatusForGetPass);

			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(attendeeLogList);

			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getStallLogListByCompanyIdBranchIdAndAttendeeLogId")
	public ResponseEntity<Response> getAttendeeLogListByCompanyIdBranchIdAndAttendeeLogId(@RequestBody AttendeeLog map,
			@RequestHeader("Authorization") String authorizationHeader) {

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();
		int attendeeLogId = map.getAttendeeLogId();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (attendeeLogId == 0) {
			resp.setMessage("Please Select Attendee Log");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}

		try {
			List<StallLog> stallLogList = stallLogDaoImp.getStallLogListByCompanyIdBranchIdAndAttendeeLogId(companyId,
					branchId, attendeeLogId);

			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(stallLogList);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@PostMapping("/getAttendeerowsList")
	public ResponseEntity<Response> getAttendeesList(@RequestBody Attendee map, //@RequestParam("pageSize") String pageSize, @RequestParam String page,
			@RequestHeader("Authorization") String authorizationHeader) {		

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();
		//int page = map.getPage();
		int pageSize = map.getPageSize();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		try {
			
			Map<String, Object> responseMap = new HashMap<>();
			
			List<Attendee> attendeeList = attendeeDaoImp.getAttendeeListByCompanyIdAndBranchId(companyId, branchId);
			List<Attendee> attendeerowList = attendeeDaoImp.getAttendeeRowListByCompanyIdAndBranchId(companyId, branchId, pageSize);
			responseMap.put("noOfAttendeeList", attendeeList.size());
			responseMap.put("attendeeList", attendeerowList);
			
			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(attendeerowList);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setCode(0);
			resp.setMessage(e.getMessage());
			resp.setResult(null);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}
	
	@PostMapping("/getAttendeeRowList")
	public ResponseEntity<Response> getAttendeeRowList(@RequestBody Attendee map, //@RequestParam("pageSize") String pageSize, @RequestParam String page,
			@RequestHeader("Authorization") String authorizationHeader) {		

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();
		int page = map.getPage();
		int pageSize = map.getPageSize();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		try {
			
			Map<String, Object> responseMap = new HashMap<>();
//			
			List<Attendee> attendeeList = attendeeDaoImp.getAttendeeListByCompanyIdAndBranchId(companyId, branchId);
//			List<Attendee> attendeerowList = attendeeDaoImp.getAttendeeRowListByCompanyIdAndBranchId(companyId, branchId, pageSize);
			
			
			Pageable pageable = PageRequest.of(page, pageSize);
	        Page<Attendee> result = attendeeDaoImp.findAll(pageable);
//	        return ResponseEntity.ok();
	        
	        System.out.println(result);
	        responseMap.put("noOfAttendeeList", attendeeList.size());
			responseMap.put("attendeeList", result.getContent());
			
			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(responseMap);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setCode(0);
			resp.setMessage(e.getMessage());
			resp.setResult(null);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}
		
	@PostMapping("/getAttendeeDataByPage")
	public ResponseEntity<Response> getAttendeeDataByPage(@RequestBody Attendee map, 
			@RequestHeader("Authorization") String authorizationHeader) {		

		Response resp = new Response();
		int companyId = map.getCompanyId();
		int branchId = map.getBranchId();
		int page = map.getPage();
		int pageSize = map.getPageSize();

		if (companyId == 0) {
			resp.setMessage("Please Select Company");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		if (branchId == 0) {
			resp.setMessage("Please Select Branch");
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
		try {	
			
			page = (page - 1)*10;
			
			System.out.println(page);
			System.out.println(pageSize);
			
			Map<String, Object> responseMap = new HashMap<>();
			
			int noOfAttendee = attendeeDaoImp.getTotalAttendeeNumber(companyId, branchId);
			
			System.out.println(noOfAttendee);
			List<Attendee> attendeeList = new ArrayList<Attendee>();
			if(pageSize != -1) {
				attendeeList = attendeeDaoImp.getAttendeeListDataByPage(companyId, branchId, page, pageSize);
			}else {
				attendeeList = attendeeDaoImp.getAttendeeListByCompanyIdAndBranchId(companyId, branchId);
			}	
			
			System.out.println(attendeeList);			
			
			responseMap.put("noOfAttendee", noOfAttendee);
			responseMap.put("attendeeList", attendeeList);

			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(responseMap);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setCode(0);
			resp.setMessage(e.getMessage());
			resp.setResult(null);
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

	@GetMapping("/getUpcomingEvents")
	public ResponseEntity<Response> getUpcomingEvents() {

		Response resp = new Response();
		try {
			List<Event> upcomingEventList = eventDaoImp.getUpcomingEventList();			
			resp.setCode(1);
			resp.setMessage("success");
			resp.setResult(upcomingEventList);

			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
			return new ResponseEntity<Response>(resp, HttpStatus.OK);
		}
	}

}
