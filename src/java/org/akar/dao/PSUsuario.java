
package org.akar.dao;

public class PSUsuario {
    
    int idRelTipUs;
    TblUsuario usuario,usuario2;
    TblTipoUsuario tipo;

    public PSUsuario(TblUsuario usuario, TblTipoUsuario tipo) {
        this.usuario = usuario;
        this.tipo = tipo;
    }
    public int getIdRelTipUs() {
        return idRelTipUs;
    }

    public void setIdRelTipUs(int idRelTipUs) {
        this.idRelTipUs = idRelTipUs;
    }
    
    public TblUsuario getUsuario() {
        return usuario;
    }
    public TblUsuario getUsuario2() {
        return usuario2;
    }
    public void setUsuario(TblUsuario usuario) {
        this.usuario = usuario;
    }
    
    public void setUsuario2(TblUsuario usuario) {
        this.usuario = usuario2;
    }

    public TblTipoUsuario getTipo() {
        return tipo;
    }

    public void setTipo(TblTipoUsuario tipo) {
        this.tipo = tipo;
    }
    
}
