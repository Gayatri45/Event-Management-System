package com.onestop.codeitsoft.eventBackend.services;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.onestop.codeitsoft.eventBackend.entity.Response;

@Service
public class MyService {

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
		headers.add("appName", "OSSC");
		return headers;
	}

	public void checkPathExistOrNot(Path path) {
		if (!Files.exists(path)) {
			try {
				Files.createDirectories(path);
				System.out.println("Directory created successfully.");
			} catch (IOException e) {
				System.err.println("Failed to create the directory: " + e.getMessage());
			}
		}
	}

}
