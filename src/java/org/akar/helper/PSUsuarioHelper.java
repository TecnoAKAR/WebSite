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
    
    TblUsuario usuario;
    TblTipoUsuario tipo;
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
