package com.onestop.codeitsoft.eventBackend.daoImp;

import java.security.SecureRandom;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.onestop.codeitsoft.eventBackend.entity.LoginCredentials;
import com.onestop.codeitsoft.eventBackend.entity.Response;
import com.onestop.codeitsoft.eventBackend.myurl.MyUrl;
import com.onestop.codeitsoft.eventBackend.services.EncodeDecodeService;

@Service
public class PasswordRecovery {
	
	@Autowired
	LoginCredentialsDaoImp logCredDaoImp;

	private static final String FROM_EMAIL = "mailservice@codeiterp.com";
	private static final String PASSWORD = "rsxuoukfpiufwokb";

	private static Map<String, String> userTokenMap = new HashMap<>();

	public ResponseEntity<Response> resetPassword(String email, HttpSession session) {
		Response resp = new Response();

		try {
			String userEnteredEmail = email;
			if (userExists(userEnteredEmail)) {
				String resetToken = generateResetToken();
				sendPasswordResetEmail(userEnteredEmail, resetToken);

				userTokenMap.put(userEnteredEmail, resetToken);

				Map<String, Object> map = new HashMap<>();
				map.put("loggedEmail", userEnteredEmail);
				map.put("token", resetToken);
				resp.setCode(1);
				resp.setMessage("success");
				resp.setResult(map);
				
				System.out.println(resp+" "+userTokenMap);				

			} else {
				resp.setMessage("User with email " + userEnteredEmail + " does not exist.");
			}
		} catch (Exception e) {
			resp.setMessage(e.getMessage());
		}
		return new ResponseEntity<Response>(resp, HttpStatus.OK);
	}
	
	public boolean userExists(String email) {
		LoginCredentials logCred = logCredDaoImp.getCredentialDetailsByEmail(email);
		if (logCred != null) {
			return true;
		} else {
			return false;
		}
	}
	
	private static void sendPasswordResetEmail(String to, String resetToken) throws Exception {
		
		Properties properties = System.getProperties();
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(FROM_EMAIL, PASSWORD);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(FROM_EMAIL));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject("Password Reset");

			String encodedToken = EncodeDecodeService.encodeString(resetToken);
			String resetLink = MyUrl.eventurl + "/participant/verifyToken?email=" + to + "&token=" + encodedToken;

			message.setContent("<table width=\"100%\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\r\n"
					+ "border=\"0\" style=\"border-collapse: collapse; text-align: left\">"
					+ "<tbody><tr><td bgcolor=\"#e2e2e2\"><div class=\"m_-1882623941285670324modules-container\">"
					+ "<div><table class=\"m_-1882623941285670324row\" width=\"650\" bgcolor=\"#ffffff\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\r\n"
					+ "	border=\"0\" style=\"border-collapse: collapse; text-align: left; border-spacing: 0; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-size: 18px; line-height: 150%; background-color: #FFF3CD; margin: 0px auto; max-width: 100%; border-bottom: 1px solid #eeeeee\">"
					+ "<tbody>"
					+ "<tr><td style=\"padding: 30px 30px 5px 30px\"><h2 style=\"margin-top: 0px; margin-bottom: 20px; padding-top: 0px; padding-bottom: 0px; background-color: #28A745; font-family: 'Quicksand', Helvetica, Arial, sans-serif; font-size: 24px; line-height: 140%; color: #333333; font-weight: 400; background-color: transparent; border-bottom: 0\">\r\n"
					+ " <center style=\"color: #856404\">Reset Password !</center> </h2></td></tr>" + "</tbody>"
					+ "</table></div>" + "<div>"
					+ "<table class=\"m_-1882623941285670324row\" width=\"650\" bgcolor=\"#ffffff\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse: collapse; text-align: left; border-spacing: 0; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-size: 18px; line-height: 150%; color: #666666; margin: 0px auto; max-width: 100%; border-bottom: 1px solid #eeeeee\">"
					+ "<tbody><tr><td style=\"padding: 30px 30px 5px 30px\"><h2 style=\"margin-top: 0px; margin-bottom: 20px; padding-top: 0px; padding-bottom: 0px; font-family: 'Quicksand', Helvetica, Arial, sans-serif; font-size: 24px; line-height: 140%; color: #333333; font-weight: 400; background-color: transparent; border-bottom: 0\">"
					+ "	Click Here <span style=\"color: #b85e5e\">" + resetLink + "</span></h2></td></tr>"				
					+ "<tbody></td></tr>" + "</tbody></table></div></div></td></tr></tbody></table>", "text/html");
			
			Transport.send(message);
			System.out.println("Mail sent");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}

	private static String generateResetToken() {
		byte[] randomBytes = new byte[32];
		new SecureRandom().nextBytes(randomBytes);
		return Base64.getEncoder().encodeToString(randomBytes);
	}

	public boolean verifyResetToken(String email, String token) {
//		System.out.println(email + " && " + token);
		String storedToken = userTokenMap.get(email);
//		System.out.println(storedToken);
		return storedToken != null && storedToken.equals(token);
	}


}
