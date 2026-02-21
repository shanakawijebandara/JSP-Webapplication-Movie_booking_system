package servlet;


import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailSender {

    final String fromEmail = "ekabashen1@gmail.com";
    final String password = "pqtq zdra xwvf wagf";
    
    public String sendEmail(String toEmail, String subject, String messageText) {
        // SMTP configuration
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
        props.put("mail.smtp.port", "587"); // TLS Port
        props.put("mail.smtp.auth", "true"); // Enable Authentication
        props.put("mail.smtp.starttls.enable", "true"); // Enable STARTTLS

        // Authenticate and send email
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject(subject);
            message.setText(messageText);

            Transport.send(message);
            return "Please Check your Email inbox";
        } catch (MessagingException e) {
            e.printStackTrace();
            return "Error while sending email: " + e.getMessage();
        }
    }
}

