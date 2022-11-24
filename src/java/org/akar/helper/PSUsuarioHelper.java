package org.akar.helper;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.akar.dao.PSUsuario;
import org.akar.dao.TblTipoUsuario;
import org.akar.dao.TblUsuario;
import org.akar.service.PSUsuarioService;

public class PSUsuarioHelper implements Serializable {
    
    TblUsuario usuario,usuario2;
    TblTipoUsuario tipo,tipo2;
    PSUsuario psUser;
    
    public PSUsuarioHelper(){
        
    }
    
    public PSUsuario SignUp(HttpServletRequest request){
        
        usuario = new TblUsuario();
        tipo = new TblTipoUsuario();
        
        
        usuario.setNom( request.getParameter("nombre"));
        usuario.setApellidoP( request.getParameter("apellido_p"));
        usuario.setApellidoM( request.getParameter("apellido_m"));
        usuario.setFechaNac(getDate(request.getParameter("fecha_nac")));
        usuario.setCorreo( request.getParameter("correo_e"));
        usuario.setNomUser( request.getParameter("usuario"));
        tipo.setIdTipo( Integer.parseInt( request.getParameter("tipoUsuario") ));
        usuario.setPassword( request.getParameter("pass"));
        
        if(usuario.getNom().length() == 0 || usuario.getNom() == null){
            return null;
        }
        if(usuario.getApellidoP().length() == 0 || usuario.getApellidoP() == null){
            return null;
        }
        if(usuario.getApellidoM().length() == 0 || usuario.getApellidoM() == null){
            return null;
        }
        if(usuario.getFechaNac() == null){
            return null;
        }
        if(usuario.getCorreo().length() == 0 || usuario.getCorreo() == null){
            return null;
        }
        if(usuario.getNomUser().length() == 0 || usuario.getNomUser() == null){
            return null;
        }
        if( tipo.getIdTipo() == 0 ){
            return null;
        }
        if(usuario.getPassword().length() == 0 || usuario.getPassword() == null){
            return null;
        }
        
        return new PSUsuarioService().SignUp(usuario, tipo);
    }
    public PSUsuario SignUp2(HttpServletRequest request){
        
        psUser=new PSUsuario(new TblUsuario(), new TblTipoUsuario());
        PSUsuario psUser2=new PSUsuario(new TblUsuario(), new TblTipoUsuario());
        

        
        
        psUser.getUsuario().setNom( request.getParameter("nombre"));
        psUser.getUsuario().setApellidoP( request.getParameter("apellido_p"));
        psUser.getUsuario().setApellidoM( request.getParameter("apellido_m"));
        psUser.getUsuario().setFechaNac(getDate(request.getParameter("fecha_nac")));
        psUser.getUsuario().setCorreo( request.getParameter("correo_e"));
        psUser.getUsuario().setNomUser( request.getParameter("usuario"));
        psUser.getUsuario().setPassword( request.getParameter("pass"));
        psUser2.getUsuario().setNom( request.getParameter("nombre2"));
        psUser2.getUsuario().setApellidoP( request.getParameter("apellido_p2"));
        psUser2.getUsuario().setApellidoM( request.getParameter("apellido_m2"));
        psUser2.getUsuario().setFechaNac(getDate(request.getParameter("fecha_nac2")));
        psUser2.getUsuario().setCorreo( request.getParameter("correo_e2"));
        psUser2.getUsuario().setNomUser( request.getParameter("usuario2"));
        psUser2.getUsuario().setPassword( request.getParameter("pass2"));
        
        if(psUser.getUsuario().getNom().length() == 0 || psUser.getUsuario().getNom() == null){
            return null;
        }
        if(psUser.getUsuario().getApellidoP().length() == 0 || psUser.getUsuario().getApellidoP() == null){
            return null;
        }
        if(psUser.getUsuario().getApellidoM().length() == 0 || psUser.getUsuario().getApellidoM() == null){
            return null;
        }
        if(psUser.getUsuario().getFechaNac() == null){
            return null;
        }
        if(psUser.getUsuario().getCorreo().length() == 0 || psUser.getUsuario().getCorreo() == null){
            return null;
        }
        if(psUser.getUsuario().getNomUser().length() == 0 || psUser.getUsuario().getNomUser() == null){
            return null;
        }
        if(psUser.getUsuario().getPassword().length() == 0 || psUser.getUsuario().getPassword() == null){
            return null;
        }
        if(psUser2.getUsuario().getNom().length() == 0 || psUser2.getUsuario().getNom() == null){
            return null;
        }
        if(psUser2.getUsuario().getApellidoP().length() == 0 || psUser2.getUsuario().getApellidoP() == null){
            return null;
        }
        if(psUser2.getUsuario().getApellidoM().length() == 0 || psUser2.getUsuario().getApellidoM() == null){
            return null;
        }
        if(psUser2.getUsuario().getFechaNac() == null){
            return null;
        }
        if(psUser2.getUsuario().getCorreo().length() == 0 || psUser2.getUsuario().getCorreo() == null){
            return null;
        }
        if(psUser2.getUsuario().getNomUser().length() == 0 || psUser2.getUsuario().getNomUser() == null){
            return null;
        }
        if(psUser2.getUsuario().getPassword().length() == 0 || psUser2.getUsuario().getPassword() == null){
            return null;
        }
        
        return new PSUsuarioService().SignUp2(psUser,psUser2);
    }
    
    public PSUsuario Login(HttpServletRequest request){
        psUser = new PSUsuario(new TblUsuario(), new TblTipoUsuario());
        
        psUser.getUsuario().setCorreo( request.getParameter( "correo" ) );
        psUser.getUsuario().setPassword( request.getParameter( "pass" ) );
        if(psUser.getUsuario().getCorreo().length() == 0 || psUser.getUsuario().getCorreo() == null){
            return null;
        }
        if(psUser.getUsuario().getPassword().length() == 0 || psUser.getUsuario().getPassword() == null){
            return null;
        }
        
        return new PSUsuarioService().Login(psUser);
    }
    
    public Date getDate( String campo )
    {
        DateFormat dateFormat = null;
        try 
        {
            if( campo == null || campo.length() == 0 )
            {
                return null;
            }
            dateFormat = new SimpleDateFormat( "yyyy-MM-dd" );
            return dateFormat.parse(campo);
        } 
        catch (ParseException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
}
