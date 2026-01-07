package com.onestop.codeitsoft.eventBackend.services;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import com.onestop.codeitsoft.eventBackend.entity.Attendee;
import com.onestop.codeitsoft.eventBackend.entity.Event;
import com.onestop.codeitsoft.eventBackend.entity.LoginCredentials;
import com.onestop.codeitsoft.eventBackend.entity.Participant;
import com.onestop.codeitsoft.eventBackend.myurl.MyUrl;

@Service
public class SendMail {

	public static boolean sendMailToAttendee(Attendee attendee) throws Exception {

		String to = (String) attendee.getEmail();
		String firstName = (String) attendee.getFirstName();
		String lastName = (String) attendee.getLastName();
		Event event = (Event) attendee.getEvent();
		String eventName = (String) event.getEventName();
		int attendeeApprovalStatus = (Integer) attendee.getAttendeeApprovalStatus();
		String qrCodeImageName = (String) attendee.getQrCodeImageName();

		if (lastName == null) {
			lastName = "";
		}

		String companyName = (String) attendee.getCompanyName();
		String from = "**************.com";
		String password = "**************";
		String host = "smtp.gmail.com";
		Properties properties = System.getProperties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from, companyName));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(companyName + " - Event Registration Successfully!");

			if (attendeeApprovalStatus == 0) {

				message.setContent("<table width=\"100%\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\r\n"
						+ "border=\"0\" style=\"border-collapse: collapse; text-align: left\">"
						+ "<tbody><tr><td bgcolor=\"#e2e2e2\"><div class=\"m_-1882623941285670324modules-container\">"
						+ "<div><table class=\"m_-1882623941285670324row\" width=\"650\" bgcolor=\"#ffffff\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\r\n"
						+ "	border=\"0\" style=\"border-collapse: collapse; text-align: left; border-spacing: 0; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-size: 18px; line-height: 150%; background-color: #D4EDDA; margin: 0px auto; max-width: 100%; border-bottom: 1px solid #eeeeee\">"
						+ "<tbody>"
						+ "<tr><td style=\"padding: 30px 30px 5px 30px\"><h2 style=\"margin-top: 0px; margin-bottom: 20px; padding-top: 0px; padding-bottom: 0px; background-color: #28A745; font-family: 'Quicksand', Helvetica, Arial, sans-serif; font-size: 24px; line-height: 140%; color: #333333; font-weight: 400; background-color: transparent; border-bottom: 0\">\r\n"
						+ " <center style=\"color: #28A745\">Congratualations !</center> </h2></td></tr>" + "</tbody>"
						+ "</table></div>" + "<div>"
						+ "<table class=\"m_-1882623941285670324row\" width=\"650\" bgcolor=\"#ffffff\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse: collapse; text-align: left; border-spacing: 0; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-size: 18px; line-height: 150%; color: #666666; margin: 0px auto; max-width: 100%; border-bottom: 1px solid #eeeeee\">"
						+ "<tbody><tr><td style=\"padding: 30px 30px 5px 30px\"><h2 style=\"margin-top: 0px; margin-bottom: 20px; padding-top: 0px; padding-bottom: 0px; font-family: 'Quicksand', Helvetica, Arial, sans-serif; font-size: 24px; line-height: 140%; color: #333333; font-weight: 400; background-color: transparent; border-bottom: 0\">"
						+ "	Hi <span style=\"color: #b85e5e\">" + firstName + " " + lastName + "</span></h2></td></tr>"
						+ "<tr><td class=\"m_-1882623941285670324text\" style=\"padding: 0px 30px 0px 30px; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-weight: 300; font-size: 16px; line-height: 150%; color: #666666\">"
						+ " Thanks for joining " + companyName + " - you are successfully registered for " + eventName
						+ " Event. <br>" + "<p>Your get pass QR is attached with mail. </p>" + "</td></tr>"
						+ "<tr><td colspan=\"30\"><table style=\"width: 100%\"><tbody><tr>"
						+ "<td style=\"padding: 0px 30px 20px 30px; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-weight: 300; font-size: 18px; line-height: 100%; color: #666666; text-align: center; word-break: break-all\">"
						+ "<div class=\"m_-1882623941285670324sub-module\"> &nbsp;<span>" + "<a><img src='"
						+ MyUrl.uploadedUrl + "attendeeQRCodeImages/" + qrCodeImageName
						+ "' width=\"200\" border=\"0\" vspace=\"0\" hspace=\"0\" ></a>"
						+ "<br><br><br></tr></tbody></td></tr>"
						+ "</tbody></table></div></div></td></tr></tbody></table>", "text/html");

			} else {
				message.setContent("<table width=\"100%\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\r\n"
						+ "border=\"0\" style=\"border-collapse: collapse; text-align: left\">"
						+ "<tbody><tr><td bgcolor=\"#e2e2e2\"><div class=\"m_-1882623941285670324modules-container\">"
						+ "<div><table class=\"m_-1882623941285670324row\" width=\"650\" bgcolor=\"#ffffff\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\r\n"
						+ "	border=\"0\" style=\"border-collapse: collapse; text-align: left; border-spacing: 0; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-size: 18px; line-height: 150%; background-color: #D4EDDA; margin: 0px auto; max-width: 100%; border-bottom: 1px solid #eeeeee\">"
						+ "<tbody>"
						+ "<tr><td style=\"padding: 30px 30px 5px 30px\"><h2 style=\"margin-top: 0px; margin-bottom: 20px; padding-top: 0px; padding-bottom: 0px; background-color: #28A745; font-family: 'Quicksand', Helvetica, Arial, sans-serif; font-size: 24px; line-height: 140%; color: #333333; font-weight: 400; background-color: transparent; border-bottom: 0\">\r\n"
						+ " <center style=\"color: #28A745\">Congratualations !</center> </h2></td></tr>" + "</tbody>"
						+ "</table></div>" + "<div>"
						+ "<table class=\"m_-1882623941285670324row\" width=\"650\" bgcolor=\"#ffffff\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse: collapse; text-align: left; border-spacing: 0; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-size: 18px; line-height: 150%; color: #666666; margin: 0px auto; max-width: 100%; border-bottom: 1px solid #eeeeee\">"
						+ "<tbody><tr><td style=\"padding: 30px 30px 5px 30px\"><h2 style=\"margin-top: 0px; margin-bottom: 20px; padding-top: 0px; padding-bottom: 0px; font-family: 'Quicksand', Helvetica, Arial, sans-serif; font-size: 24px; line-height: 140%; color: #333333; font-weight: 400; background-color: transparent; border-bottom: 0\">"
						+ "	Hi <span style=\"color: #b85e5e\">" + firstName + " " + lastName + "</span></h2></td></tr>"
						+ "<tr><td class=\"m_-1882623941285670324text\" style=\"padding: 0px 30px 0px 30px; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-weight: 300; font-size: 16px; line-height: 150%; color: #666666\">"
						+ " Thanks for joining " + companyName + " - you are successfully registered for " + eventName
						+ " Event. <br>"
						+ "<p>Your get pass QR is attached with mail. Kindly wait for organizers approval..</p>"
						+ "</td></tr>" + "<tr><td colspan=\"30\"><table style=\"width: 100%\"><tbody><tr>"
						+ "<td style=\"padding: 0px 30px 20px 30px; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-weight: 300; font-size: 18px; line-height: 100%; color: #666666; text-align: center; word-break: break-all\">"
						+ "<div class=\"m_-1882623941285670324sub-module\"> &nbsp;<span>" + "<a><img src='"
						+ MyUrl.uploadedUrl + "attendeeQRCodeImages/" + qrCodeImageName
						+ "' width=\"200\" border=\"0\" vspace=\"0\" hspace=\"0\" ></a>"
						+ "<br><br><br></tr></tbody></td></tr>"
						+ "</tbody></table></div></div></td></tr></tbody></table>", "text/html");
			}

			Transport.send(message);
			System.out.println("Mail Sent successfully....");
			return true;
		} catch (MessagingException | UnsupportedEncodingException mex) {
			mex.printStackTrace();
			return false;
		}

	}

	public static boolean sendApprovalORRejectedMailToAttendee(Attendee attendee) {

		String to = (String) attendee.getEmail();
		String firstName = (String) attendee.getFirstName();
		String lastName = (String) attendee.getLastName();
		Event event = (Event) attendee.getEvent();
		String eventName = (String) event.getEventName();
		int attendeeApprovalStatus = (Integer) attendee.getAttendeeApprovalStatus();

		if (lastName == null) {
			lastName = "";
		}

		String companyName = (String) attendee.getCompanyName();
		String from = "mailservice@codeiterp.com";
		String password = "rsxuoukfpiufwokb";
		String host = "smtp.gmail.com";
		Properties properties = System.getProperties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from, companyName));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			if (attendeeApprovalStatus == 2) {

				message.setSubject(companyName + " - Approved Event !!");
				message.setContent("<table width=\"100%\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\r\n"
						+ "border=\"0\" style=\"border-collapse: collapse; text-align: left\">"
						+ "<tbody><tr><td bgcolor=\"#e2e2e2\"><div class=\"m_-1882623941285670324modules-container\">"
						+ "<div><table class=\"m_-1882623941285670324row\" width=\"650\" bgcolor=\"#ffffff\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\r\n"
						+ "	border=\"0\" style=\"border-collapse: collapse; text-align: left; border-spacing: 0; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-size: 18px; line-height: 150%; background-color: #D4EDDA; margin: 0px auto; max-width: 100%; border-bottom: 1px solid #eeeeee\">"
						+ "<tbody>"
						+ "<tr><td style=\"padding: 30px 30px 5px 30px\"><h2 style=\"margin-top: 0px; margin-bottom: 20px; padding-top: 0px; padding-bottom: 0px; background-color: #28A745; font-family: 'Quicksand', Helvetica, Arial, sans-serif; font-size: 24px; line-height: 140%; color: #333333; font-weight: 400; background-color: transparent; border-bottom: 0\">\r\n"
						+ " <center style=\"color: #28A745\">Congratualations !! Approved Event </center> </h2></td></tr>"
						+ "</tbody>" + "</table></div>" + "<div>"
						+ "<table class=\"m_-1882623941285670324row\" width=\"650\" bgcolor=\"#ffffff\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse: collapse; text-align: left; border-spacing: 0; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-size: 18px; line-height: 150%; color: #666666; margin: 0px auto; max-width: 100%; border-bottom: 1px solid #eeeeee\">"
						+ "<tbody><tr><td style=\"padding: 30px 30px 5px 30px\"><h2 style=\"margin-top: 0px; margin-bottom: 20px; padding-top: 0px; padding-bottom: 0px; font-family: 'Quicksand', Helvetica, Arial, sans-serif; font-size: 24px; line-height: 140%; color: #333333; font-weight: 400; background-color: transparent; border-bottom: 0\">"
						+ "	Hi <span style=\"color: #b85e5e\">" + firstName + " " + lastName + "</span></h2></td></tr>"
						+ "<tr><td class=\"m_-1882623941285670324text\" style=\"padding: 0px 30px 0px 30px; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-weight: 300; font-size: 16px; line-height: 150%; color: #666666\">"
						+ " Thanks for joining " + companyName
						+ " -  your event enroll request are successfully approved for " + eventName + " Event. <br>"
						+ "<p> Your get pass QR is already send to your previous mail. </p><br><br><br>" + "</td></tr>"
						+ "</tbody></table></div></div></td></tr></tbody></table>", "text/html");

			} else {

				message.setSubject(companyName + " - Rejected Event !!");
				message.setContent("<table width=\"100%\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\r\n"
						+ "border=\"0\" style=\"border-collapse: collapse; text-align: left\">"
						+ "<tbody><tr><td bgcolor=\"#e2e2e2\"><div class=\"m_-1882623941285670324modules-container\">"
						+ "<div><table class=\"m_-1882623941285670324row\" width=\"650\" bgcolor=\"#ffffff\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\r\n"
						+ "	border=\"0\" style=\"border-collapse: collapse; text-align: left; border-spacing: 0; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-size: 18px; line-height: 150%; background-color: #F8D7DA; margin: 0px auto; max-width: 100%; border-bottom: 1px solid #eeeeee\">"
						+ "<tbody>"
						+ "<tr><td style=\"padding: 30px 30px 5px 30px\"><h2 style=\"margin-top: 0px; margin-bottom: 20px; padding-top: 0px; padding-bottom: 0px; background-color: #28A745; font-family: 'Quicksand', Helvetica, Arial, sans-serif; font-size: 24px; line-height: 140%; color: #333333; font-weight: 400; background-color: transparent; border-bottom: 0\">\r\n"
						+ " <center style=\"color: #721C24\"> Sorry ! Unfortunately Rejected Event </center> </h2></td></tr>"
						+ "</tbody>" + "</table></div>" + "<div>"
						+ "<table class=\"m_-1882623941285670324row\" width=\"650\" bgcolor=\"#ffffff\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse: collapse; text-align: left; border-spacing: 0; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-size: 18px; line-height: 150%; color: #666666; margin: 0px auto; max-width: 100%; border-bottom: 1px solid #eeeeee\">"
						+ "<tbody><tr><td style=\"padding: 30px 30px 5px 30px\"><h2 style=\"margin-top: 0px; margin-bottom: 20px; padding-top: 0px; padding-bottom: 0px; font-family: 'Quicksand', Helvetica, Arial, sans-serif; font-size: 24px; line-height: 140%; color: #333333; font-weight: 400; background-color: transparent; border-bottom: 0\">"
						+ "	Hi <span style=\"color: #b85e5e\">" + firstName + " " + lastName + "</span></h2></td></tr>"
						+ "<tr><td class=\"m_-1882623941285670324text\" style=\"padding: 0px 30px 0px 30px; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-weight: 300; font-size: 16px; line-height: 150%; color: #666666\">"
						+ " Thanks for joining " + companyName
						+ " -  your event enroll request are unfortunately not approved for " + eventName
						+ " Event. <br>" + "<p>  Kindly register again for this event. </p><br><br><br>" + "</td></tr>"
						+ "</tbody></table></div></div></td></tr></tbody></table>", "text/html");
			}

			Transport.send(message);
			return true;
		} catch (MessagingException | UnsupportedEncodingException mex) {
			mex.printStackTrace();
			return false;
		}
	}

	public static boolean sendUpdateMailToAttendee(Attendee attendee) {

		String to = (String) attendee.getEmail();
		String firstName = (String) attendee.getFirstName();
		String lastName = (String) attendee.getLastName();
		Event event = (Event) attendee.getEvent();
		String eventName = (String) event.getEventName();
		String qrCodeImageName = (String) attendee.getQrCodeImageName();

		if (lastName == null) {
			lastName = "";
		}

		String companyName = (String) attendee.getCompanyName();
		String from = "mailservice@codeiterp.com";
		String password = "rsxuoukfpiufwokb";
		String host = "smtp.gmail.com";
		Properties properties = System.getProperties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from, companyName));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(companyName + " - Event Update Successfully!");

			message.setContent("<table width=\"100%\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\r\n"
					+ "border=\"0\" style=\"border-collapse: collapse; text-align: left\">"
					+ "<tbody><tr><td bgcolor=\"#e2e2e2\"><div class=\"m_-1882623941285670324modules-container\">"
					+ "<div><table class=\"m_-1882623941285670324row\" width=\"650\" bgcolor=\"#ffffff\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\r\n"
					+ "	border=\"0\" style=\"border-collapse: collapse; text-align: left; border-spacing: 0; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-size: 18px; line-height: 150%; background-color: #FFF3CD; margin: 0px auto; max-width: 100%; border-bottom: 1px solid #eeeeee\">"
					+ "<tbody>"
					+ "<tr><td style=\"padding: 30px 30px 5px 30px\"><h2 style=\"margin-top: 0px; margin-bottom: 20px; padding-top: 0px; padding-bottom: 0px; background-color: #28A745; font-family: 'Quicksand', Helvetica, Arial, sans-serif; font-size: 24px; line-height: 140%; color: #333333; font-weight: 400; background-color: transparent; border-bottom: 0\">\r\n"
					+ " <center style=\"color: #856404\">Congratualations !</center> </h2></td></tr>" + "</tbody>"
					+ "</table></div>" + "<div>"
					+ "<table class=\"m_-1882623941285670324row\" width=\"650\" bgcolor=\"#ffffff\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse: collapse; text-align: left; border-spacing: 0; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-size: 18px; line-height: 150%; color: #666666; margin: 0px auto; max-width: 100%; border-bottom: 1px solid #eeeeee\">"
					+ "<tbody><tr><td style=\"padding: 30px 30px 5px 30px\"><h2 style=\"margin-top: 0px; margin-bottom: 20px; padding-top: 0px; padding-bottom: 0px; font-family: 'Quicksand', Helvetica, Arial, sans-serif; font-size: 24px; line-height: 140%; color: #333333; font-weight: 400; background-color: transparent; border-bottom: 0\">"
					+ "	Hi <span style=\"color: #b85e5e\">" + firstName + " " + lastName + "</span></h2></td></tr>"
					+ "<tr><td class=\"m_-1882623941285670324text\" style=\"padding: 0px 30px 0px 30px; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-weight: 300; font-size: 16px; line-height: 150%; color: #666666\">"
					+ " Thanks for joining " + companyName + " - your profile is successfully updates for " + eventName
					+ " Event. <br>"
					+ "<p>Your get pass QR is attached with mail. Kindly wait for organizers approval..</p>"
					+ "</td></tr>" + "<tr><td colspan=\"30\"><table style=\"width: 100%\"><tbody><tr>"
					+ "<td style=\"padding: 0px 30px 20px 30px; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-weight: 300; font-size: 18px; line-height: 100%; color: #666666; text-align: center; word-break: break-all\">"
					+ "<div class=\"m_-1882623941285670324sub-module\"> &nbsp;<span>" + "<a><img src='"
					+ MyUrl.uploadedUrl + "attendeeQRCodeImages/" + qrCodeImageName
					+ "' width=\"200\" border=\"0\" vspace=\"0\" hspace=\"0\" ></a>"
					+ "<br><br><br></tr></tbody></td></tr>" + "</tbody></table></div></div></td></tr></tbody></table>",
					"text/html");

			Transport.send(message);
			System.out.println("Update Mail Sent successfully....");
			return true;
		} catch (MessagingException | UnsupportedEncodingException mex) {
			mex.printStackTrace();
			return false;
		}
	}

	public static boolean sendMailToParticipant(Participant participant, LoginCredentials loginCredentials)
			throws Exception {

		String to = (String) participant.getParticipantEmail();
		String participantName = (String) participant.getParticipantName();
		Event event = participant.getEvent();
		String eventName = (String) event.getEventName();
		String loginPassword = (String) loginCredentials.getPassword();

		String companyName = (String) participant.getCompanyName();
		String from = "mailservice@codeiterp.com";
		String password = "rsxuoukfpiufwokb";
		String host = "smtp.gmail.com";
		Properties properties = System.getProperties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from, companyName));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(companyName + " - Participant Registration Successfully!");

			message.setContent("<table width=\"100%\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\r\n"
					+ "border=\"0\" style=\"border-collapse: collapse; text-align: left\">"
					+ "<tbody><tr><td bgcolor=\"#e2e2e2\"><div class=\"m_-1882623941285670324modules-container\">"
					+ "<div><table class=\"m_-1882623941285670324row\" width=\"650\" bgcolor=\"#ffffff\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\r\n"
					+ "	border=\"0\" style=\"border-collapse: collapse; text-align: left; border-spacing: 0; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-size: 18px; line-height: 150%; background-color: #D4EDDA; margin: 0px auto; max-width: 100%; border-bottom: 1px solid #eeeeee\">"
					+ "<tbody>"
					+ "<tr><td style=\"padding: 30px 30px 5px 30px\"><h2 style=\"margin-top: 0px; margin-bottom: 20px; padding-top: 0px; padding-bottom: 0px; background-color: #28A745; font-family: 'Quicksand', Helvetica, Arial, sans-serif; font-size: 24px; line-height: 140%; color: #333333; font-weight: 400; background-color: transparent; border-bottom: 0\">\r\n"
					+ " <center style=\"color: #28A745\">Successfully Registered !</center> </h2></td></tr>"
					+ "</tbody>" + "</table></div>" + "<div>"
					+ "<table class=\"m_-1882623941285670324row\" width=\"650\" bgcolor=\"#ffffff\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse: collapse; text-align: left; border-spacing: 0; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-size: 18px; line-height: 150%; color: #666666; margin: 0px auto; max-width: 100%; border-bottom: 1px solid #eeeeee\">"
					+ "<tbody><tr><td style=\"padding: 30px 30px 5px 30px\"><h2 style=\"margin-top: 0px; margin-bottom: 20px; padding-top: 0px; padding-bottom: 0px; font-family: 'Quicksand', Helvetica, Arial, sans-serif; font-size: 24px; line-height: 140%; color: #333333; font-weight: 400; background-color: transparent; border-bottom: 0\">"
					+ "	Hi <span style=\"color: #b85e5e\">" + participantName + "</span></h2></td></tr>"
					+ "<tr><td class=\"m_-1882623941285670324text\" style=\"padding: 0px 30px 0px 30px; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-weight: 300; font-size: 16px; line-height: 150%; color: #666666\">"
					+ " Thanks for joining " + companyName + " - you are successfully registered for " + eventName
					+ " Event As a Participant. <br>" + "<p> Your login credentials are as follows. </p>" + "</td></tr>"
					+ "<tr><td colspan=\"30\"><table style=\"width: 100%\"><tbody><tr>"
					+ "<td style=\"padding: 0px 30px 20px 30px; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-weight: 300; font-size: 18px; line-height: 100%; color: #666666; text-align: center; word-break: break-all\">"
					+ "<div class=\"m_-1882623941285670324sub-module\"> &nbsp;<span>" + "Username : " + to + "<br><br>"
					+ "password : " + loginPassword + "<br><br><br></tr></tbody></td></tr>"
					+ "</tbody></table></div></div></td></tr></tbody></table>", "text/html");

			Transport.send(message);
			System.out.println("participant Mail Sent successfully....");
			return true;
		} catch (MessagingException | UnsupportedEncodingException mex) {
			mex.printStackTrace();
			return false;
		}

	}

	public static void sendPasswordChangeMail(LoginCredentials cred) {

		String to = cred.getEmail();
		String firstName = "Onestop User";
		String from = "mailservice@codeiterp.com";
		String password = "rsxuoukfpiufwokb";
		String host = "smtp.gmail.com";
		Properties properties = System.getProperties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});
		// session.setDebug(true);
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from, "Codeit - Event Management Software"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject("Password Changed successful!");
//			message.setContent("<h4>Dear " + firstName
//					+ ", Your login password is successfully updated.<br> Your updated login credentials are as follows.<br> username : "
//					+ cred.getEmail() + " <br> password : " + cred.getPassword()
//					+ "<br></h4><h4>Thank You!!<br> TEAM ONESTOP - SCHOOL MANAGEMENT SOFTWARE </h4>", "text/html");

			message.setContent("<table width=\"100%\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\r\n"
					+ "border=\"0\" style=\"border-collapse: collapse; text-align: left\">"
					+ "<tbody><tr><td bgcolor=\"#e2e2e2\"><div class=\"m_-1882623941285670324modules-container\">"
					+ "<div><table class=\"m_-1882623941285670324row\" width=\"650\" bgcolor=\"#ffffff\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\r\n"
					+ "	border=\"0\" style=\"border-collapse: collapse; text-align: left; border-spacing: 0; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-size: 18px; line-height: 150%; background-color: #FFF3CD; margin: 0px auto; max-width: 100%; border-bottom: 1px solid #eeeeee\">"
					+ "<tbody>"
					+ "<tr><td style=\"padding: 30px 30px 5px 30px\"><h2 style=\"margin-top: 0px; margin-bottom: 20px; padding-top: 0px; padding-bottom: 0px; background-color: #28A745; font-family: 'Quicksand', Helvetica, Arial, sans-serif; font-size: 24px; line-height: 140%; color: #333333; font-weight: 400; background-color: transparent; border-bottom: 0\">\r\n"
					+ " <center style=\"color: #856404\">Congratualations !</center> </h2></td></tr>" + "</tbody>"
					+ "</table></div>" + "<div>"
					+ "<table class=\"m_-1882623941285670324row\" width=\"650\" bgcolor=\"#ffffff\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse: collapse; text-align: left; border-spacing: 0; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-size: 18px; line-height: 150%; color: #666666; margin: 0px auto; max-width: 100%; border-bottom: 1px solid #eeeeee\">"
					+ "<tbody><tr><td style=\"padding: 30px 30px 5px 30px\"><h2 style=\"margin-top: 0px; margin-bottom: 20px; padding-top: 0px; padding-bottom: 0px; font-family: 'Quicksand', Helvetica, Arial, sans-serif; font-size: 24px; line-height: 140%; color: #333333; font-weight: 400; background-color: transparent; border-bottom: 0\">"
					+ "	Dear <span style=\"color: #b85e5e\">" + firstName + "</span></h2></td></tr>"
					+ "<tr><td class=\"m_-1882623941285670324text\" style=\"padding: 0px 30px 0px 30px; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-weight: 300; font-size: 16px; line-height: 150%; color: #666666\">"
					+ "  Your login password is successfully updated. <br> Your updated login credentials are as follows.<br> <br>"					
					+ "</td></tr>" 
					+ "<tr><td colspan=\"30\"><table style=\"width: 100%\"><tbody><tr>"
					+ "<td style=\"padding: 0px 30px 20px 30px; font-family: 'Roboto', Helvetica, Arial, sans-serif; font-weight: 300; font-size: 18px; line-height: 100%; color: #666666; text-align: center; word-break: break-all\">"
					+ "<div class=\"m_-1882623941285670324sub-module\"> &nbsp;<span>" + "Username : " + cred.getEmail() + "<br><br>"
					+ "password : " + cred.getPassword() + "<br><br><br></tr></tbody></td></tr>"
					+ "<tbody></td></tr>" + "</tbody></table></div></div></td></tr></tbody></table>", "text/html");
			
			Transport.send(message);
			// System.out.println("Mail Sent successfully....");
		} catch (MessagingException | UnsupportedEncodingException mex) {
			mex.printStackTrace();
		}

	}

}
