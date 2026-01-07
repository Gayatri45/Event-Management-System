package com.onestop.codeitsoft.eventBackend.services;
import java.util.Base64;

import org.springframework.stereotype.Service;
@Service
public class EncodeDecodeService {
	
	 // Encode a string using Base64
    public static String encodeString(String input) {
        byte[] encodedBytes = Base64.getEncoder().encode(input.getBytes());
        return new String(encodedBytes);
    }

    // Decode a Base64-encoded string
    public static String decodeString(String encodedInput) {
        byte[] decodedBytes = Base64.getDecoder().decode(encodedInput.getBytes());
        return new String(decodedBytes);
    }

}
