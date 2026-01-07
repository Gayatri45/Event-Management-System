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
import com.onestop.codeitsoft.event.entity.Audience;
import com.onestop.codeitsoft.event.entity.Category;
import com.onestop.codeitsoft.event.entity.Response;
import com.onestop.codeitsoft.event.entity.VenueType;
import com.onestop.codeitsoft.event.services.ApiService;

@RestController
@RequestMapping("/organizer/categoryAndAudience")
public class OrganizerCategoryAndAudience {
	
	@Autowired
	private ApiService apiService;

	@Autowired
	private EventApiController eventApiController;
	
//	------------------------------ Category --------------------------

	@GetMapping("/manage-categories")
	public ModelAndView manageCategories(HttpSession session) {

		HashMap userMap = (HashMap) session.getAttribute("userMap");
		ArrayList companyList = apiService.getCompanyList(userMap);
		ModelAndView mav = new ModelAndView("/organizer/manage-categories");
		mav.addObject("companyList", companyList);
		return mav;
	}

	@PostMapping("/saveCategory")
	public Response saveCategory(@ModelAttribute Category category) throws IllegalStateException, IOException {

		Response saveCategory = eventApiController.saveCategory(category);
		return saveCategory;
	}

	@PostMapping("/getCategoryList")
	public ArrayList<HashMap> getCategoryList(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId) {

		Response categoryList = eventApiController.getCategoryList(companyId, branchId);
		ArrayList<HashMap> result = (ArrayList<HashMap>) categoryList.getResult();
		return result;
	}

	@PostMapping("/getCategoryTableList")
	public ModelAndView getCategoryTableList(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId) {

		Response categoryList = eventApiController.getCategoryList(companyId, branchId);
		ArrayList<HashMap> result = (ArrayList<HashMap>) categoryList.getResult();

		ModelAndView mav = new ModelAndView("/organizer/categoriesList");
		mav.addObject("categoryList", result);
		return mav;
	}

	@PostMapping("/getCategoryById")
	public HashMap getCategoryById(@RequestParam("categoryId") int categoryId) {

		Response category = eventApiController.getCategoryById(categoryId);
		HashMap result = (HashMap) category.getResult();
		return result;
	}
//	---------------------------- Audience ----------------------------

	@GetMapping("/manage-audiences")
	public ModelAndView manageAudiences(HttpSession session) {

		HashMap userMap = (HashMap) session.getAttribute("userMap");
		ArrayList companyList = apiService.getCompanyList(userMap);
		ModelAndView mav = new ModelAndView("/organizer/manage-audiences");
		mav.addObject("companyList", companyList);
		return mav;
	}

	@PostMapping("/saveAudience")
	public Response saveAudience(@ModelAttribute Audience audience) throws IllegalStateException, IOException {

		Response saveAudience = eventApiController.saveAudience(audience);
		return saveAudience;
	}

	@PostMapping("/getAudienceList")
	public ArrayList<HashMap> getAudienceList(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId) {

		Response audienceList = eventApiController.getAudienceList(companyId, branchId);
		ArrayList<HashMap> result = (ArrayList<HashMap>) audienceList.getResult();
		return result;
	}

	@PostMapping("/getAudienceTableList")
	public ModelAndView getAudienceTableList(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId) {

		Response audienceList = eventApiController.getAudienceList(companyId, branchId);
		ArrayList<HashMap> result = (ArrayList<HashMap>) audienceList.getResult();

		ModelAndView mav = new ModelAndView("/organizer/audienceList");
		mav.addObject("audienceList", result);
		return mav;
	}
	
	@PostMapping("/getAudienceById")
	public HashMap getAudienceById(@RequestParam("audienceId") int audienceId) {

		Response audience = eventApiController.getAudienceById(audienceId);
		HashMap result = (HashMap) audience.getResult();
		return result;
	}

//	--------------------------- Venue ---------------------------

	@GetMapping("/venue-type")
	public ModelAndView venueType(HttpSession session) {

		HashMap userMap = (HashMap) session.getAttribute("userMap");
		ArrayList companyList = apiService.getCompanyList(userMap);
		ModelAndView mav = new ModelAndView("/organizer/venue-type");
		mav.addObject("companyList", companyList);
		return mav;
	}

	@PostMapping("/saveVenueType")
	public Response saveVenueType(@ModelAttribute VenueType venueType) throws IllegalStateException, IOException {

		Response saveVenueType = eventApiController.saveVenueType(venueType);
		return saveVenueType;
	}

	@PostMapping("/getVenueTypeList")
	public ArrayList<HashMap> getVenueTypeList(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId) {

		Response venueTypeList = eventApiController.getVenueTypeList(companyId, branchId);
		ArrayList<HashMap> result = (ArrayList<HashMap>) venueTypeList.getResult();
		return result;
	}

	@PostMapping("/getVenueTypeTableList")
	public ModelAndView getVenueTypeTableList(@RequestParam("companyId") int companyId,
			@RequestParam("branchId") int branchId) {

		Response venueTypeList = eventApiController.getVenueTypeList(companyId, branchId);
		ArrayList<HashMap> result = (ArrayList<HashMap>) venueTypeList.getResult();

		ModelAndView mav = new ModelAndView("/organizer/venueTypeList");
		mav.addObject("venueTypeList", result);
		return mav;
	}
	
	@PostMapping("/getVenueTypeById")
	public HashMap getVenueTypeById(@RequestParam("venueTypeId") int venueTypeId) {

		Response venueType = eventApiController.getVenueTypeById(venueTypeId);
		HashMap result = (HashMap) venueType.getResult();
		return result;
	}

}
