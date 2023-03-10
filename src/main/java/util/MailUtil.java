package util;

import org.apache.commons.mail.HtmlEmail;

public class MailUtil {

	public static void sendMail(String email, String subject, String msg) throws Exception {
		
		//mail server 설정
		String charSet = "utf-8";
		String hostSMTP ="smtp.naver.com";
		String hostSMTPid = "whdydals0802";
		String hostSMTPpwd = "!wh369369";
		
		
		//보내는 사람 
		String fromEmail = "whdydals0802@naver.com";
		String fromName = "루팡";
		
		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);
			
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(465);
			
			mail.setAuthentication(hostSMTPid, hostSMTPpwd);
			mail.setStartTLSRequired(true);
			mail.addTo(email);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
