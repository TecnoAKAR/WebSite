
package org.akar.helper;

import java.sql.Timestamp;
import java.time.Instant;
import javax.servlet.http.HttpServletRequest;
import org.akar.dao.PSResPass;
import org.akar.dao.PSUsuario;
import org.akar.extConnections.Correo;
import org.akar.security.Tokens;
import org.akar.service.PSResPassService;

public class PSResPassHelper {
    
    PSResPass resPass;

    public PSResPassHelper() {
        resPass = new PSResPass();
    }
    
    public boolean setToken(HttpServletRequest request){
        Tokens tok = new Tokens();
        int recVer = 0;
        resPass.getUsuario().setCorreo(request.getParameter("CorreoRec"));
        resPass.getResPass().setToken(tok.genToken());
        resPass.getResPass().setExp(Timestamp.from(Instant.now()));
        
        if(resPass.getUsuario().getCorreo() == null || resPass.getUsuario().getCorreo().length() == 0){
            resPass.getUsuario().setCorreo(request.getParameter("correo_e"));
            recVer = 1;
            if(resPass.getUsuario().getCorreo() == null || resPass.getUsuario().getCorreo().length() == 0){
                return false;
            }    
        }
        if(resPass.getResPass().getToken().length() == 0 || resPass.getResPass().getToken() == null){
            return false;
        }
        if(resPass.getResPass().getExp() == null){
            return false;
        }
        
        if(new PSResPassService().setToken(resPass) == true){
            if(recVer == 0){
                new Correo().resPass(resPass.getUsuario().getCorreo(), resPass.getResPass().getToken());
            } else{
                new Correo().verCuenta(resPass.getUsuario().getCorreo(), resPass.getResPass().getToken());
            }
            return true;
        }else{
            return false;
        }
    }
    
    public boolean resPass(HttpServletRequest request){
        resPass.getUsuario().setCorreo(request.getParameter("Correo"));
        resPass.getUsuario().setPassword(request.getParameter("newPass"));
        
        if(resPass.getUsuario().getCorreo().length() == 0 || resPass.getUsuario().getCorreo() == null){
            return false;
        }
        if(resPass.getUsuario().getPassword().length() == 0 || resPass.getUsuario().getPassword() == null){
            return false;
        }
        
        if(new PSResPassService().resPass(resPass) == true){
            return true;
        }else{
            return false;
        }
    }
    
    public PSUsuario verCuenta(HttpServletRequest request){
        resPass.getUsuario().setCorreo(request.getParameter("correo"));
        if(resPass.getUsuario().getCorreo().length() == 0 || resPass.getUsuario().getCorreo() == null){
            return null;
        }
        return new PSResPassService().verCuenta(resPass);
    }
    
    public PSResPass getToken(HttpServletRequest request){
        PSResPass resPass = new PSResPass();
        resPass = new PSResPassService().getToken(request.getParameter("token"));
        if(resPass != null){
            return resPass;
        }else{
            return null;
        }
    }
    
}
