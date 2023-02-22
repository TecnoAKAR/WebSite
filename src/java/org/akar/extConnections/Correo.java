
package org.akar.extConnections;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Correo {
    private String akarSupport;
    private String clave;
    private String correoAKAR;
    
    public Correo(){
    }
    
    public boolean contactoAKAR(String nombre, String mail, String asunto, String cuerpo) {
        this.akarSupport = "tecno.akar.soporte@gmail.com";
        this.clave = "fgkebykjmmafajmu";
        this.correoAKAR = "akartecnologias@gmail.com";

        Properties props = System.getProperties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.user", this.akarSupport);
        props.put("mail.smtp.clave", this.clave);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", "587");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        String msj = "De: "+nombre+"\nCorreo: "+mail+"\nMensaje: "+cuerpo;
        
        try {
            message.setFrom(new InternetAddress(akarSupport));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(correoAKAR));
            message.setSubject(asunto);
            message.setText(msj);
            Transport transport = session.getTransport("smtp");
            transport.connect("smtp.gmail.com", akarSupport, clave);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            return true;
        } catch (MessagingException me) {
            me.printStackTrace();
            return false;
        }
        
    }
    
    public boolean resPass(){
        return false;
    }
    
}
