package smtp;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuth extends Authenticator {
	@Override
	protected PasswordAuthentication getPasswordAuthentication() { 
		//return new PasswordAuthentication("네이버아이디", "비밀번호");
		return new PasswordAuthentication("whdydals0802", "!wh456852");
	}	
}
