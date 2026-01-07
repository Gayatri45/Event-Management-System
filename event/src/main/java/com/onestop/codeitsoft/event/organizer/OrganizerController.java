package com.onestop.codeitsoft.event.organizer;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onestop.codeitsoft.event.controller.EventApiController;
import com.onestop.codeitsoft.event.entity.ChangePassword;
import com.onestop.codeitsoft.event.entity.Event;
import com.onestop.codeitsoft.event.entity.LoginData;
import com.onestop.codeitsoft.event.entity.Response;
import com.onestop.codeitsoft.event.entity.UpdateProfile;
import com.onestop.codeitsoft.event.exception.InvalidCompanyStatusCode;
import com.onestop.codeitsoft.event.myurl.MyUrl;
import com.onestop.codeitsoft.event.services.ApiService;
import com.onestop.codeitsoft.event.services.MyService;
import com.onestop.codeitsoft.event.services.MyStaticService;

@RestController
@RequestMapping("/organizer")
public class OrganizerController {
	
	@Autowired
	private MyService myService;
	
	@Autowired
	private ApiService apiService;
	
	@Autowired
	private EventApiController eventApiController;
	
	@GetMapping("/login")
	public ModelAndView login(@ModelAttribute("message") String message) {
		return new ModelAndView("/organizer/login").addObject("message", message);
	}
	
	@PostMapping("/loginUserOrganizer")
	public ModelAndView loginUser(@ModelAttribute LoginData data, HttpSession httpSession, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes redirectAttributes)
			throws IOException, InvalidCompanyStatusCode {
	
		Response responseApi = myService.getResp(MyUrl.onestopurl + "erp/loginUser", data.toString(),
				myService.getHeader());		

		if (responseApi.getCode() == 0) {
			String message = responseApi.getMessage();
			redirectAttributes.addFlashAttribute("message", message);
			return new ModelAndView("redirect:/organizer/login");
		}

		HashMap userMap = (HashMap) responseApi.getResult();
		
		String email = (String) userMap.get("email");
		String isdCode = (String) userMap.get("isdCode");
		String mobile = (String) userMap.get("mobile");
		Integer userId = (Integer) userMap.get("userId");		

		httpSession.setAttribute("UserData", userMap);
		httpSession.setAttribute("userMap", userMap);
		httpSession.setAttribute("email", email);
		httpSession.setAttribute("isdCode", isdCode);
		httpSession.setAttribute("mobile", mobile);
		httpSession.setAttribute("userId", userId);
		httpSession.setAttribute("loginData", data);
		httpSession.setMaxInactiveInterval(10800);
		
		Cookie cookie = null;
		Cookie cookie1 = null;

		try {
			cookie = new Cookie("osuser_uuid", MyStaticService.cookieEncrypt("dbafe526-7f65-11", "onestoponline-iv",
					(String) userMap.get("email")));
			cookie1 = new Cookie("osuser_sec", MyStaticService.cookieEncrypt("dbafe526-7f65-11", "onestoponline-iv",
					(String) userMap.get("token")));
			response.addCookie(cookie);
			response.addCookie(cookie1);
		} catch (Exception e) {
			System.out.println(e);
		}

		if (userMap.get("companyStatus").equals("1")) {
			return new ModelAndView("redirect:" + MyUrl.eventurl + "/organizer/companysetup");
		} else if (userMap.get("companyStatus").equals("2")) {	
			return new ModelAndView("redirect:" + MyUrl.eventurl + "/organizer/dashboard");
		} else {
			throw new InvalidCompanyStatusCode("Company Status Code can be 1 or 2 only");
		}		
	}
	
	@GetMapping("/dashboard")
    public ModelAndView index(HttpSession session) {
		
		HashMap userMap = (HashMap)session.getAttribute("userMap");		
		ArrayList companyList = apiService.getCompanyList(userMap);
		
		List<Integer> branch = new ArrayList<Integer>();
		for(int i=0; i<companyList.size(); i++) {
			HashMap company = (HashMap)companyList.get(i);
			int companyId = (Integer)company.get("companyId");
			
			ArrayList<Map> branchList = apiService.getBranchList(companyId, userMap);
			branch.add(branchList.size());
		}
		
		Response organizerDashboardData = eventApiController.getOrganizerDashboardData();
		HashMap result = (HashMap)organizerDashboardData.getResult();
		
		List<Event> eventList = (ArrayList<Event>)result.get("eventList");
		
        ModelAndView mav = new ModelAndView("/organizer/index");
        mav.addObject("organizerDashboardData", result);
        mav.addObject("companyList", companyList.size());
        mav.addObject("branchList", branch.size());
    	mav.addObject("eventList", eventList);
        return mav;
    }

	@GetMapping("/companyLogout")
	public ModelAndView companyLogout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("userMap");

		String logoutData = "{\"logedEmail\":\"" + userMap.get("email") + "\"" + ",\"token\":\"" + userMap.get("token")
				+ "\"}";

		Response resp = myService.getResp(MyUrl.onestopurl + "profile/logout", logoutData, myService.getHeader());
		System.out.println("CODE : "+resp.getCode());
		System.out.println("MESSAGE : "+resp.getMessage());
		Integer code = (Integer) resp.getCode();
		if (code == 1) {
			removeCookie(response, request, "osuser_uuid");
			removeCookie(response, request, "osuser_sec");
			session.invalidate();
			return new ModelAndView("redirect:" + MyUrl.eventurl + "/organizer/login");
		} else {
			return new ModelAndView("error").addObject("message", resp.getMessage());
		}
	}
	
	private void removeCookie(HttpServletResponse response, HttpServletRequest request, String name) {
		Cookie cookies[] = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(name)) {
					cookie.setMaxAge(0);
					cookie.setValue("");
					cookie.setPath("/");
//					cookie.setDomain(".onestop.global");
					response.addCookie(cookie);
				}
			}
		}
	}
	
	@GetMapping("/profile")
	public ModelAndView profile(HttpSession session) {

		Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("userMap");

		ModelAndView mav = new ModelAndView("/organizer/profile");
		mav.addObject("userMap", userMap);
		return mav;
	}
	
	@RequestMapping("/companysetup")
	public ModelAndView companysetup() {
		return new ModelAndView("/organizer/companysetup");
	}
	
	@PostMapping("/changeUserPassword")
	public Response changePassword(@ModelAttribute ChangePassword data, HttpSession session,
			HttpServletRequest request) {

		Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("userMap");

		data.setToken((String) userMap.get("token"));
		data.setLogedEmail((String) userMap.get("email"));
		data.setIpAddress(request.getRemoteAddr());

		Response resp = myService.getResp(MyUrl.onestopurl + "profile/changePassword", data, myService.getHeader());
		return resp;
	}
		
	@PostMapping("/updateUserProfile")
	public Response updateUserProfile(@ModelAttribute UpdateProfile data, HttpSession session) //, @RequestParam("profile") MultipartFile profile
			throws IllegalStateException, IOException {
				
		FileSystemResource logo = null;
		if (data.getProfile() != null) {
			logo = new FileSystemResource(multipartToFile(data.getProfile(), (data.getProfile()).getOriginalFilename()));
		}

		MultiValueMap<String, Object> form = new LinkedMultiValueMap<>();
		form.add("token", data.getToken());
		form.add("logedEmail", data.getLogedEmail());
		form.add("roleId", data.getRoleId());
		form.add("userType", data.getUserType());
		form.add("firstName", data.getFirstName());
		form.add("lastName", data.getLastName());
		form.add("email", data.getEmail());
		form.add("mobile", data.getMobile());
		form.add("companyId", data.getCompanyId());
		form.add("userId", data.getUserId());
		form.add("companyCode", data.getCompanyCode());
		form.add("profile", logo);		

		HttpEntity<MultiValueMap<String, Object>> request = new HttpEntity<MultiValueMap<String, Object>>(form, getMultiPartHeader());
		RestTemplate restTemplate = new RestTemplate();
		
		ResponseEntity<Response> responseEntityStr = restTemplate.postForEntity(MyUrl.onestopurl + "company/updateUserProfile", request, Response.class);

		Response resp = responseEntityStr.getBody();

		int code = (Integer) resp.getCode();
		HashMap result = (HashMap) resp.getResult();
		
		if (code == 1) {
			session.setAttribute("userMap", result);
		}

		return resp;
	}

	public HttpHeaders getMultiPartHeader() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("requestSource", "Web");
		headers.add("appName", "OSSC");
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);

		return headers;
	}
	
	public File multipartToFile(MultipartFile multipart, String fileName) throws IllegalStateException, IOException {
	
		File convFile = new File(System.getProperty("java.io.tmpdir") + "/" + fileName);	
		multipart.transferTo(convFile);
		return convFile;
	}	
	
	public File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException {		
		
		String fileName = multipart.getName();		
		File convFile = new File(System.getProperty("java.io.tmpdir") + "/" + fileName);
		multipart.transferTo(convFile);
		return convFile;
	}
	
	@GetMapping("/resetPasssword")
	public ModelAndView resetPasssword(@RequestParam("email") String email) {

		String stringdata = "{\"email\":\"" + email + "\"}";
		Response resp = myService.getResp(MyUrl.onestopurl + "erp/forgetPassword", stringdata, myService.getHeader());
		return new ModelAndView("redirect:" + MyUrl.eventurl + "/organizer/login");
	}
	
}
