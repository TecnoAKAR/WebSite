
package org.akar.dao;

import java.io.Serializable;

public class PSResPass implements Serializable{
    
    TblUser usuario;
    ResPass resPass;

    public PSResPass() {
        this.usuario = new TblUser();
        this.resPass = new ResPass();
    }

    public TblUser getUsuario() {
        return usuario;
    }

    public void setUsuario(TblUser usuario) {
        this.usuario = usuario;
    }

    public ResPass getResPass() {
        return resPass;
    }

    public void setResPass(ResPass resPass) {
        this.resPass = resPass;
    }
    
}
