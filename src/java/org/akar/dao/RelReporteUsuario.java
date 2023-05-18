
package org.akar.dao;

import java.io.Serializable;

public class RelReporteUsuario implements Serializable{
    
    int idRelReporteUsuario;
    Reporte rep;
    TblUser user;

    public RelReporteUsuario() {
        this.rep = new Reporte();
        this.user = new TblUser();
    }

    public int getIdRelReporteUsuario() {
        return idRelReporteUsuario;
    }

    public void setIdRelReporteUsuario(int idRelReporteUsuario) {
        this.idRelReporteUsuario = idRelReporteUsuario;
    }

    public Reporte getRep() {
        return rep;
    }

    public void setRep(Reporte rep) {
        this.rep = rep;
    }

    public TblUser getUser() {
        return user;
    }

    public void setUser(TblUser user) {
        this.user = user;
    }

}
