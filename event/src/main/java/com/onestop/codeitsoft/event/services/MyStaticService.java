package com.onestop.codeitsoft.event.services;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.onestop.codeitsoft.event.entity.Status;
import com.onestop.codeitsoft.event.myurl.MyUrl;

public class MyStaticService {
	private static SecretKeySpec secretKey;
	private static RestTemplate restTemplate = new RestTemplate();
	
	public static HttpHeaders getHeader() {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.add("requestSource", "Web");
		headers.add("appName", "OSSHIP");
		return headers;
	}
	
	public static long getExpiryDays(long expDate) throws ParseException {
		
		Date expDte = new Date(expDate);
		Date today = new Date();
		long difDay = (expDte.getTime() - today.getTime()) / (24 * 60 * 60 * 1000);
		
		if ((expDte.getTime() - today.getTime()) % (24 * 60 * 60 * 1000) > 0) {
			difDay += 1;
		}
		return difDay;
	}
	
	public static Status getMyAuthUserDetails(Map usermap) {
		HttpHeaders ht = new HttpHeaders();
		ht.add("requestSource", "Web");
		HttpEntity<JSONObject> htent = new HttpEntity(usermap, ht);
		return restTemplate.postForObject(MyUrl.betaUrl + "company/verifyUserSession", htent, Status.class);
	}
	
	public static String cookieDecrypt(String secret, String ivkey, String strToDecrypt) throws Exception {
		Base64 base64 = new Base64();
		Cipher ciper = Cipher.getInstance("AES/CBC/PKCS5Padding");
		secretKey = new SecretKeySpec(secret.getBytes("UTF-8"), "AES");
		IvParameterSpec iv = new IvParameterSpec(ivkey.getBytes("UTF-8"), 0, ciper.getBlockSize());
		ciper.init(Cipher.DECRYPT_MODE, secretKey, iv); //Decrypt
		byte[] text = ciper.doFinal(base64.decode(strToDecrypt));
		return new String(text);
	}
	
	public static String cookieEncrypt(String secret, String ivkey, String strToEncrypt) throws Exception {
	        Base64 base64 = new Base64();
	        Cipher ciper = Cipher.getInstance("AES/CBC/PKCS5Padding");
	        secretKey = new SecretKeySpec(secret.getBytes("UTF-8"), "AES");
	        IvParameterSpec iv = new IvParameterSpec(ivkey.getBytes("UTF-8"), 0, ciper.getBlockSize());
	        ciper.init(Cipher.ENCRYPT_MODE, secretKey, iv); //Encrypt
	        byte[] encryptedCiperBytes;
	        encryptedCiperBytes = base64.encode((ciper.doFinal(strToEncrypt.getBytes())));
	        return new String(encryptedCiperBytes);
	 }
	
	public static boolean getMyLoggedSession(String email, String token) {
		try {
			ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
			HttpServletRequest request = (HttpServletRequest) attr.getRequest();
			         
			HttpSession session = request.getSession();
			Map userMap = null;
			Map usermap = new HashMap();
			usermap.put("logedEmail", cookieDecrypt("dbafe526-7f65-11", "onestoponline-iv", email));
			usermap.put("token", cookieDecrypt("dbafe526-7f65-11", "onestoponline-iv", token));
			Status status = getMyAuthUserDetails(usermap);
			if (status.getCode()==0) {
				return false;
			} else {
				userMap = (Map) status.getResult();
				if (userMap.get("companyCode") != null) {
				String companyCode = (String) userMap.get("companyCode");
				userMap.put("companyCode", companyCode.toLowerCase());
			}
			if (userMap.get("expDate") != null) {
				long diffDays = getExpiryDays((long) userMap.get("expDate"));
				userMap.put("expDays", diffDays);
			}
			session.setAttribute("userInfo", userMap);
			session.setAttribute("userMap", userMap);
			}
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	public static boolean getMyLoggedSessionforMultiUser(String email, String password) {
		try {
			ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
			HttpServletRequest request = (HttpServletRequest) attr.getRequest();
			         
			HttpSession session = request.getSession();
			Map userMap = null;
			Map usermap = new HashMap();
			
			usermap.put("email", cookieDecrypt("dbafe526-7f65-11", "onestoponline-iv", email));
			usermap.put("password", cookieDecrypt("dbafe526-7f65-11", "onestoponline-iv", password));
			
			Status status = getMyAuthUserDetails(usermap);
			if (status.getCode()==0) {
				return false;
			} else {
				userMap = (Map) status.getResult();
				if (userMap.get("companyCode") != null) {
				String companyCode = (String) userMap.get("companyCode");
				userMap.put("companyCode", companyCode.toLowerCase());
			}
			if (userMap.get("expDate") != null) {
				long diffDays = getExpiryDays((long) userMap.get("expDate"));
				userMap.put("expDays", diffDays);
			}
			session.setAttribute("userInfo", userMap);
			session.setAttribute("userMap", userMap);
			}
		} catch (Exception e) {
			return false;
		}
		return true;
	}



}
