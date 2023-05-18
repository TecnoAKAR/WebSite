
package org.akar.dao;

import java.io.Serializable;
import java.util.Date;

public class MsjForo implements Serializable{
    
    int idMensaje;
    TblUser usuario;
    String mensaje;
    Date hora;

    public MsjForo() {
        usuario = new TblUser();
    }

    public int getIdMensaje() {
        return idMensaje;
    }

    public void setIdMensaje(int idMensaje) {
        this.idMensaje = idMensaje;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public Date getHora() {
        return hora;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

    public TblUser getUsuario() {
        return usuario;
    }

    public void setUsuario(TblUser usuario) {
        this.usuario = usuario;
    }
    
}
