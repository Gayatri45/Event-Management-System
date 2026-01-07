package com.onestop.codeitsoft.event.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.onestop.codeitsoft.event.entity.Response;
import com.onestop.codeitsoft.event.myurl.MyUrl;
import com.onestop.codeitsoft.event.services.MyStaticService;

@org.springframework.stereotype.Controller
public class Controller {
	
	@Autowired
	private EventApiController eventApiController;

	@GetMapping("/login")
    public ModelAndView login() {
        return new ModelAndView("login");
    }	

	@GetMapping("/")
	public ModelAndView index(HttpSession session, HttpServletRequest request) {
		Map<String, Object> userMap = (Map<String,Object>)session.getAttribute("userMap");
//		System.out.println("USERMAPPPPP :"+userMap);
		Cookie cookie = null;
        Cookie[] cookies = null;
		cookies= request.getCookies();
		String osuser_uuid =null;
		String osuser_sec=null;
		if( cookies != null ) {
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i]; 
               if(cookie.getName().equals("osuser_uuid")){
            	   osuser_uuid= cookie.getValue();
               }else if(cookie.getName().equals("osuser_sec")){
            	   osuser_sec = cookie.getValue();
               }
            }
            if(osuser_uuid != null && osuser_sec != null) {
            	if(MyStaticService.getMyLoggedSession(osuser_uuid, osuser_sec)==true){
            		userMap = (Map<String,Object>)session.getAttribute("userMap");
            	}
            }
         } 
//		System.out.println("userMapp : "+userMap);
		if(userMap != null) {
//			return new ModelAndView("redirect:" + MyUrl.schoolurl +"/admin/loginUserr");
			return new ModelAndView("redirect:" + MyUrl.eventurl +"/loginUserr");		
		}
		
		Response resp = eventApiController.getUpcomingEvents();		
		ArrayList<HashMap> result = (ArrayList<HashMap>)resp.getResult();
		
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("events", result);
		return mav;
	}
		
	@GetMapping("/loginUserr")
	public ModelAndView loginUserr(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws IOException {

		Map userMap = (Map)httpSession.getAttribute("userMap");
		
		if(userMap == null) {
			
			Cookie cookie = null;
	        Cookie[] cookies = null;
			cookies= request.getCookies();
			String osuser_uuid =null;
			String osuser_sec=null;
			if( cookies != null ) {
	            for (int i = 0; i < cookies.length; i++) {
	               cookie = cookies[i]; 
	               if(cookie.getName().equals("osuser_uuid")){
	            	   osuser_uuid= cookie.getValue();
	               }else if(cookie.getName().equals("osuser_sec")){
	            	   osuser_sec = cookie.getValue();
	               }
	            }
	            if(osuser_uuid != null && osuser_sec != null) {
	            	if(MyStaticService.getMyLoggedSession(osuser_uuid, osuser_sec)==true){
	            		userMap = (Map<String,Object>)httpSession.getAttribute("userMap");
	            	}
	            }
	         } 
		}
		
		if (userMap != null) {
			httpSession.setAttribute("userMap", userMap);
			httpSession.setAttribute("UserData", userMap);

			String email = (String) userMap.get("email");
			String token = (String) userMap.get("token");
			Integer userId = (Integer) userMap.get("userId");
			httpSession.setAttribute("email", email);
			httpSession.setAttribute("token", token);
			httpSession.setAttribute("userId", userId);

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
				return new ModelAndView("redirect:" + MyUrl.eventurl + "/");
			}
		}
		else {
			System.out.println("userMap is null");
			return new ModelAndView("redirect:" + MyUrl.eventurl + "/");
		}
	}
	
	@GetMapping("/events-details")
	public ModelAndView eventsDetails(@RequestParam("eventId") int eventId) {

		Response eventDetailsById = eventApiController.getEventDetailsById(eventId);
		HashMap result = (HashMap) eventDetailsById.getResult();

		ModelAndView mav = new ModelAndView("eventsDetails");
		mav.addObject("event", result);
		return mav;
	}
}
