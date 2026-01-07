package com.onestop.codeitsoft.event.services;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.stereotype.Service;

@Service
public class Secquirity {
	private final  String secret="dbafe526-7f65-11";
	private final  String ivKey="onestoponline-iv";
	public String oneStopCookieDecrypt(String data) throws Exception {
		SecretKey secretKey=new SecretKeySpec(secret.getBytes("UTF-8"), "AES");
        return cookieDecrypt(secretKey,data);
    }
	private String cookieDecrypt(SecretKey secretKey,String strToDecrypt) throws NoSuchAlgorithmException, NoSuchPaddingException, UnsupportedEncodingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
        Base64 base64 = new Base64();
        Cipher ciper = Cipher.getInstance("AES/CBC/PKCS5Padding");        
        IvParameterSpec iv = new IvParameterSpec(ivKey.getBytes("UTF-8"), 0, ciper.getBlockSize());        
        ciper.init(Cipher.DECRYPT_MODE, secretKey, iv);
        byte[] text = ciper.doFinal(base64.decode(strToDecrypt));
        return new String(text);
    }
	public static String encode(String url) throws UnsupportedEncodingException {
		return URLEncoder.encode(url,"UTF-8");
	}
	public static String generateRandomKey() {
        // Define the length of the key
        int keyLength = 16;

        // Define the characters allowed in the key
        String characters = "0123456789";

        // Initialize Random object
        Random random = new Random();

        // Use StringBuilder to efficiently build the key
        StringBuilder keyBuilder = new StringBuilder(keyLength);

        // Generate random key
        for (int i = 0; i < keyLength; i++) {
            int randomIndex = random.nextInt(characters.length());
            keyBuilder.append(characters.charAt(randomIndex));
        }

        return keyBuilder.toString();
    }
	
}
