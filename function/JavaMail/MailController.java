package JavaMail;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;


public class MailController {

	private String username = "";			// specify your email id here (sender's email id)
	private String password = "";			// specify your password here

    public MailController() {
    }
    
    public int sendMail(Mail email) {
        try {
            Properties props = System.getProperties();
            // -- Attaching to default Session, or we could start a new one --
            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.host", email.smtpServ);
            props.put("mail.smtp.auth", "true");
            Authenticator auth = new SMTPAuthenticator();
            Session session = Session.getInstance(props, auth);
            // -- Create a new message --
            Message msg = new MimeMessage(session);
            // -- Set the FROM and TO fields --
            msg.setFrom(new InternetAddress(email.from));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email.to, false));
            msg.setSubject(email.subject);
            msg.setText(email.message);
            // -- Set some other header information --
            msg.setHeader("MyMail", "Mr. XYZ");
            msg.setSentDate(new Date());
            // -- Send the message --
            Transport.send(msg);
            System.out.println("Message sent to " + email.to + " OK.");
            return 0;
        } catch (MessagingException ex) {
            System.out.println("Exception " + ex);
            return -1;
        }
    }

    private class SMTPAuthenticator extends javax.mail.Authenticator {

        @Override
        public PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }

    }
    
}
