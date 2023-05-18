
package org.akar.dao;

import java.io.Serializable;
import java.util.Date;

public class ReporteCambios implements Serializable {
    
    int idReporteCambios;
    TblUser usuario;
    Reporte rep;
    Date fechaCambio;
    String estatusI;
    
    public ReporteCambios(){
        usuario = new TblUser();
        rep = new Reporte();
    }

    public int getIdReporteCambios() {
        return idReporteCambios;
    }

    public void setIdReporteCambios(int idReporteCambios) {
        this.idReporteCambios = idReporteCambios;
    }

    public TblUser getUsuario() {
        return usuario;
    }

    public void setUsuario(TblUser usuario) {
        this.usuario = usuario;
    }

    public Reporte getRep() {
        return rep;
    }

    public void setRep(Reporte rep) {
        this.rep = rep;
    }

    public Date getFechaCambio() {
        return fechaCambio;
    }

    public void setFechaCambio(Date fechaCambio) {
        this.fechaCambio = fechaCambio;
    }

    public String getEstatusI() {
        return estatusI;
    }

    public void setEstatusI(String estatusI) {
        this.estatusI = estatusI;
    }
    
}
