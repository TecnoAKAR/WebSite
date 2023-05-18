
package org.akar.dao;

public class PSUsuario {
    
    int idRelTipUs;
    TblUser usuario;
    TblTipoUsuario tipo;

    public PSUsuario(TblUser usuario, TblTipoUsuario tipo) {
        this.usuario = usuario;
        this.tipo = tipo;
    }
    public int getIdRelTipUs() {
        return idRelTipUs;
    }

    public void setIdRelTipUs(int idRelTipUs) {
        this.idRelTipUs = idRelTipUs;
    }
    
    public TblUser getUsuario() {
        return usuario;
    }

    public void setUsuario(TblUser usuario) {
        this.usuario = usuario;
    }
    
    public TblTipoUsuario getTipo() {
        return tipo;
    }

    public void setTipo(TblTipoUsuario tipo) {
        this.tipo = tipo;
    }
    
}
