package com.onestop.codeitsoft.event.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onestop.codeitsoft.event.entity.Response;
import com.onestop.codeitsoft.event.myurl.MyUrl;

@Service
public class ApiService {

	@Autowired
	private MyService myService;

	// -- Get Company List --

	public ArrayList getCompanyList(HashMap userMap) {

		String myData = "{ \"token\":\"" + userMap.get("token") + "\"" + ",\"logedEmail\":\"" + userMap.get("email")
				+ "\" }";

		Response companyListResponse = myService.getResp(MyUrl.onestopurl + "company/companyList", myData,
				myService.getHeaders());
		ArrayList<Map> companyListResult = (ArrayList) companyListResponse.getResult();
		return companyListResult;
	}

	// -- Get Company Profile By Company Id --

	public HashMap getCompanyProfile(int companyId, HashMap userMap) {

		String myData = "{ \"token\":\"" + userMap.get("token") + "\"" + ",\"logedEmail\":\"" + userMap.get("email")
				+ "\"" + ",\"companyId\":\"" + companyId + "\" }";

		Response companyResp = myService.getResp(MyUrl.onestopurl + "profile/companyProfile", myData, myService.getHeaders());
		HashMap companyProfile = (HashMap) companyResp.getResult();
		return companyProfile;

	}

	public ArrayList<Map> getBranchList(int companyId, HashMap userMap) {

		String branchrequestData = "{ \"token\":\"" + userMap.get("token") + "\"" + ",\"logedEmail\":\""
				+ userMap.get("email") + "\"" + ",\"companyId\":\"" + companyId + "\" }";

		Response branchresponseData = myService.getResp(MyUrl.onestopurl + "company/branchList", branchrequestData,
				myService.getHeaders());
		ArrayList<Map> branchListResult = (ArrayList) branchresponseData.getResult();
		return branchListResult;
	}

	// -- Get Branch Details --

	public HashMap updateBranchDetails(int branchId, HttpSession session) {

		HashMap userMap = (HashMap) session.getAttribute("userMap");

		String branchrequestData = "{ \"token\":\"" + userMap.get("token") + "\"" + ",\"logedEmail\":\""
				+ userMap.get("email") + "\"" + ",\"branchId\":\"" + branchId + "\" }";

		Response resp = myService.getResp(MyUrl.onestopurl + "/company/branchDetails", branchrequestData,
				myService.getHeaders());
		HashMap branchMap = (HashMap) resp.getResult();
		return branchMap;
	}

	// -- Get Country List --

	public ArrayList<HashMap> getCountryList() {
		
		Response countryList = myService.getResp(MyUrl.onestopurl + "erp/countryList", myService.getHeader());		
		ArrayList<HashMap> resultCountryList = (ArrayList<HashMap>) countryList.getResult();
		return resultCountryList;
	}

	public Response getParticipantLogin(String email, String password) {
		
		String stringData = "{\"email\":\"" + email + "\"" + ",\"password\":\"" + password + "\"}";
		Response response = myService.getResponse(MyUrl.apiUrl + "/login", stringData, myService.getHeaders());
		return response;
	}

	public Response changePassword(String email, String password, String oldPassword) {

		String stringData = "{\"email\":\"" + email + "\"" + ",\"password\":\"" + password + "\""
				+ ",\"oldPassword\":\"" + oldPassword + "\" }";
		Response response = myService.getResponse(MyUrl.apiUrl + "/changePassword", stringData, myService.getHeaders());
		return response;
	}

}
