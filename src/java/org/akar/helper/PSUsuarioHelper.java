package org.akar.helper;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.akar.dao.TblTipoUsuario;
import org.akar.dao.TblUsuario;
import org.akar.service.PSUsuarioService;

public class PSUsuarioHelper implements Serializable {
    
    TblUsuario usuario;
    TblTipoUsuario tipo;
    
    public PSUsuarioHelper(){
        
    }
    
    public boolean SignUp(HttpServletRequest request){
        
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
            return false;
        }
        if(usuario.getApellidoP().length() == 0 || usuario.getNom() == null){
            return false;
        }
        if(usuario.getApellidoM().length() == 0 || usuario.getNom() == null){
            return false;
        }
        if(usuario.getFechaNac() == null){
            return false;
        }
        if(usuario.getCorreo().length() == 0 || usuario.getNom() == null){
            return false;
        }
        if(usuario.getNomUser().length() == 0 || usuario.getNom() == null){
            return false;
        }
        if( tipo.getIdTipo() == 0 ){
            return false;
        }
        if(usuario.getPassword().length() == 0 || usuario.getNom() == null){
            return false;
        }
        
        return new PSUsuarioService().SignUp(usuario, tipo);
    }
    
    public boolean Login(HttpServletRequest request){
        return true;
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
