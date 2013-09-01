package ar.edu.itba.it.proyectofinal.tix.domain.service;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;

public class MailService {

	private static Logger logger = Logger.getLogger(MailService.class);

	public static boolean send(Mail mail) throws MessagingException {
		Properties properties = System.getProperties();
		properties.setProperty("mail.smtp.host", mail.getHost());
		Session session = Session.getDefaultInstance(properties);
		MimeMessage message = new MimeMessage(session);
		InternetAddress from = new InternetAddress(mail.getFrom());
		message.setFrom(from);
		InternetAddress to = new InternetAddress(mail.getTo());
		message.addRecipient(Message.RecipientType.TO, to);
		message.setSubject(mail.getSubject());
		message.setContent(mail.getContents(), "text/html");
		Transport.send(message);
		return true;
	}

}
