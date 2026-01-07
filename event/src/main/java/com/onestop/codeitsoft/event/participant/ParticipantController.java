package com.onestop.codeitsoft.event.participant;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onestop.codeitsoft.event.controller.EventApiController;
import com.onestop.codeitsoft.event.entity.LoginCredentials;
import com.onestop.codeitsoft.event.entity.Participant;
import com.onestop.codeitsoft.event.entity.Response;
import com.onestop.codeitsoft.event.myurl.MyUrl;
import com.onestop.codeitsoft.event.services.ApiService;
import com.onestop.codeitsoft.event.services.EncodeDecodeService;
import com.onestop.codeitsoft.event.services.MyService;

@RestController
@RequestMapping("/participant")
public class ParticipantController {

	@Autowired
	private MyService myService;

	@Autowired
	private ApiService apiService;

	@Autowired
	private EventApiController eventApiController;

	@PostMapping("/loginUser")
	public ModelAndView loginUser(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpSession httpSession, HttpServletResponse response, RedirectAttributes redirectAttributes) {

		System.out.println(email + " " + password);

		Response participantLogin = apiService.getParticipantLogin(email, password);

		System.out.println(participantLogin);

		if (participantLogin.getCode() == 0) {
			redirectAttributes.addFlashAttribute("message", participantLogin.getMessage());
			return new ModelAndView("redirect:/login");
		} else {

			HashMap result = (HashMap) participantLogin.getResult();
			HashMap loginCredentials = (HashMap) result.get("loginCredentials");
			int userType = (Integer) loginCredentials.get("userType");

			String token = (String) loginCredentials.get("token");

			httpSession.setAttribute("email", email);
			httpSession.setAttribute("token", token);
			httpSession.setAttribute("password", password);
			httpSession.setAttribute("loginCredentials", loginCredentials);
			httpSession.setAttribute("userType", userType);

			HashMap participantDetails = (HashMap) result.get("participantDetails");

			httpSession.setAttribute("participantDetails", participantDetails);

			redirectAttributes.addFlashAttribute("participantDetails", participantDetails);
			return new ModelAndView("redirect:/participant/dashboard");

		}

	}

	@GetMapping("/login")
	public ModelAndView login(@ModelAttribute("message") String message) {
		return new ModelAndView("/participant/login").addObject("message", message);
	}

	@GetMapping("/dashboard")
	public ModelAndView dashboard(HttpSession session) {
		
		HashMap participantDetails = (HashMap)session.getAttribute("participantDetails");
		int companyId = (Integer)participantDetails.get("companyId");
		int branchId = (Integer)participantDetails.get("branchId");
		int participantId = (Integer)participantDetails.get("participantId");
		
		Response attendeeLogDetails = eventApiController.getParticipantDashboardData(companyId, branchId, participantId);
		HashMap result = (HashMap)attendeeLogDetails.getResult();
		
		ModelAndView mav = new ModelAndView("/participant/index");
		mav.addObject("participantDashboardData", result);
		return mav;
	}

	@GetMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws IOException {

		HttpSession session = request.getSession(false); // If 'false' is passed, it won't create a new session if it
															// doesn't exist
		if (session != null) {
			session.invalidate();
			return new ModelAndView("redirect:/participant/login");
		}
		return null;
	}

	@GetMapping("/profile")
	public ModelAndView profile(HttpSession session) {

		HashMap participantDetails = (HashMap) session.getAttribute("participantDetails");

		ModelAndView mav = new ModelAndView("/participant/profile");
		mav.addObject("participantDetails", participantDetails);
		return mav;
	}

	@PostMapping("/updateProfile")
	public Response updateProfile(@ModelAttribute Participant participant, HttpSession httpSession,
			HttpServletResponse HttpResponse) throws IllegalStateException, IOException {

		MultiValueMap<String, Object> map = myService.getMultiValueMapFromUpdateProfile(participant);
		Response response = myService.getResponse(MyUrl.apiUrl + "/updateProfile", map,
				myService.getMultiPartHeaders());

		HashMap result = (HashMap) response.getResult();

		if (participant.getParticipantId() != 0) {
			httpSession.setAttribute("participantDetails", result);
		} else {
			httpSession.setAttribute("participantDetails", result);
		}
		return response;
	}

	@PostMapping("/changeUserPassword")
	public Response changeUserPassword(@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam("oldPassword") String oldPassword) {

		Response changePassword = apiService.changePassword(email, password, oldPassword);
		return changePassword;
	}

	@GetMapping("/resetPasssword")
	public ModelAndView resetPasssword(@RequestParam("email") String email) {

		String stringdata = "{\"email\":\"" + email + "\"}";
		Response resp = myService.getResponse(MyUrl.apiUrl + "/resetPasssword", stringdata, myService.getHeader());

		return new ModelAndView("redirect:" + MyUrl.eventurl + "/participant/login");
	}

	@GetMapping("/verifyToken")
	public ModelAndView verifyToken(@PathParam("email") String email, @PathParam("token") String token) {

		ModelAndView mav = new ModelAndView();
		String decodedToken = EncodeDecodeService.decodeString(token);
		try {
			String stringdata = "{\"email\":\"" + email + "\"" + ",\"token\":\"" + decodedToken + "\"}";

			Response resp = myService.getResponse(MyUrl.apiUrl + "/verifyResetToken", stringdata,
					myService.getHeader());
			Integer code = (Integer) resp.getCode();

			if (code == 1) {
				mav = new ModelAndView("/participant/setNewPassword");
				mav.addObject("email", email);
			} else {
				mav = new ModelAndView("/participant/login");
				mav.addObject("message", "Not Verified");
			}

		} catch (Exception e) {
			mav.addObject("message", e.getMessage());
		}
		return mav;
	}

	@PostMapping("/setNewPassword")
	public Response setNewPassword(@ModelAttribute LoginCredentials credentials, HttpServletResponse response) {

		String stringdata = "{\"email\":\"" + credentials.getEmail() + "\"" + ",\"password\":\""
				+ credentials.getPassword() + "\"}";
		Response resp = myService.getResponse(MyUrl.apiUrl + "/setNewPassword", stringdata, myService.getHeaders());
		return resp;
	}

}
