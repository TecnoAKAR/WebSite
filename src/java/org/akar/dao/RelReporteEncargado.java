package org.akar.dao;

import java.io.Serializable;

public class RelReporteEncargado implements Serializable {

    int idRel;
    TblUser encargado;
    Reporte rep;

    public RelReporteEncargado() {
        encargado = new TblUser();
        rep = new Reporte();
    }

    public int getIdRel() {
        return idRel;
    }

    public void setIdRel(int idRel) {
        this.idRel = idRel;
    }

    public TblUser getEncargado() {
        return encargado;
    }

    public void setEncargado(TblUser encargado) {
        this.encargado = encargado;
    }

    public Reporte getRep() {
        return rep;
    }

    public void setRep(Reporte rep) {
        this.rep = rep;
    }
    
}
