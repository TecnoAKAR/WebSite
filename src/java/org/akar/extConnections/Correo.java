
package org.akar.extConnections;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Correo {
    private final String akarSupport;
    private final String clave;
    private final String correoAKAR;
    private String ip;
    
    public Correo(){
        this.akarSupport = "tecno.akar.soporte@gmail.com";
        this.clave = "fgkebykjmmafajmu";
        this.correoAKAR = "akartecnologias@gmail.com";
        this.ip = "";
    }
    
    public boolean contactoAKAR(String nombre, String mail, String asunto, String cuerpo) {

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
    
    public boolean resPass(String mail, String token){
        Properties props = System.getProperties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.user", this.akarSupport);
        props.put("mail.smtp.clave", this.clave);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", "587");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);
        
        try{
            InetAddress host = InetAddress.getLocalHost();
            this.ip = host.getHostAddress();
        } catch (UnknownHostException ex) {
            Logger.getLogger(Correo.class.getName()).log(Level.SEVERE, null, ex);
        }
        

        String msj = "Buenas tardes, estimado usuario.\nPara poder restablecer su contraseña ingresa en el siguiente link: \n"+"http://"+ip+":8080/akar/resPass.jsp?token="+token+"\nPodrá cambiar su contraseña en un plazo máximo de 24 horas.\nCualquier situación que se le presente contactenos a "+this.correoAKAR+", estamos para servirle";
        
        try {
            System.out.println(mail);
            message.setFrom(new InternetAddress(akarSupport));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));
            message.setSubject("Correo para restablecer contraseña.");
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
    
    public boolean verCuenta(String mail, String token){
        Properties props = System.getProperties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.user", this.akarSupport);
        props.put("mail.smtp.clave", this.clave);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", "587");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try{
            InetAddress host = InetAddress.getLocalHost();
            this.ip = host.getHostAddress();
        } catch (UnknownHostException ex) {
            Logger.getLogger(Correo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String msj = "Buenas tardes, estimado usuario.\nPara poder verificar su cuenta ingrese en el siguiente link: \n"+"http://"+ip+":8080/akar/VerCuenta?token="+token+"&correo="+mail+"\nPodrá verificar su cuenta en un plazo máximo de 24 horas.\nCualquier situación que se le presente contactenos a "+this.correoAKAR+", estamos para servirle";
        
        try {
            System.out.println(mail);
            message.setFrom(new InternetAddress(akarSupport));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));
            message.setSubject("Correo de verificación de cuenta.");
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
}
