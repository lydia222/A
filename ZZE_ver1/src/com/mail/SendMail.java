package com.mail;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
 
public class SendMail {
	
	private String email;
	private String title;
	private String content;
	
	private void setEmail(String email) {
		this.email = email;
	}
	
	private void setTitleId() {
		title = "지짐이 : 계정 아이디 찾기";
	}

	private void setTitlePw() {
		title = "지짐이 : 계정 비밀번호 찾기";
	}

	private void setContentId(String name, String id) {
		content = "<h1>지짐이</h1><br>"
					+name+"님의 계정 아이디는 <b>"+id+"</b> 입니다.";
	}
	
	private void setContentPw(String name, String pw) {
		content = "<h1>지짐이</h1><br>"
					+name+"님의 계정 비밀번호는 <b>"+pw+"</b> 입니다.";
	}

	private void send() throws AddressException, MessagingException {
		Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.quitwait", "false");
         
        Authenticator auth = new Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("zizime1234@gmail.com", "zizim1234");
            }
        };
    
        Session session = Session.getDefaultInstance(props,auth);
         
        MimeMessage message = new MimeMessage(session);
        message.setSender(new InternetAddress("zizime1234@gmail.com"));
        message.setSubject(title);
 
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
         
        Multipart mp = new MimeMultipart();
        MimeBodyPart mbp1 = new MimeBodyPart();
        mbp1.setContent(content, "text/html; charset=utf-8");
        mp.addBodyPart(mbp1);
         
        MailcapCommandMap mc = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
        mc.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
        mc.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
        mc.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
        mc.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
        mc.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
        CommandMap.setDefaultCommandMap(mc);
        
        message.setContent(mp);
         
        Transport.send(message);
	}

	public void sendId(String email, String name, String id) {
		SendMail mail = new SendMail();
		mail.setEmail(email);
		mail.setTitleId();
		mail.setContentId(name, id);
		try {
			mail.send();
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	public void sendPw(String email, String name, String pw) {
		SendMail mail = new SendMail();
		mail.setEmail(email);
		mail.setTitlePw();
		mail.setContentPw(name, pw);
		try {
			mail.send();
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
}