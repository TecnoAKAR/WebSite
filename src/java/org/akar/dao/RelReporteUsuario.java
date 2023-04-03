/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.akar.dao;

import java.io.Serializable;
import java.util.Date;

public class RelReporteUsuario implements Serializable {
    
    int idRelReporteUsuario;
    TblUsuario usuario;
    Reporte rep;
    
    public RelReporteUsuario(){
        usuario = new TblUsuario();
        rep = new Reporte();
    }

    public int getidReporteCambios() {
        return idRelReporteUsuario;
    }

    public void setidRelReporteUsuario(int idRelReporteUsuario) {
        this.idRelReporteUsuario = idRelReporteUsuario;
    }

    public TblUsuario getUsuario() {
        return usuario;
    }

    public void setUsuario(TblUsuario usuario) {
        this.usuario = usuario;
    }

    public Reporte getRep() {
        return rep;
    }

    public void setRep(Reporte rep) {
        this.rep = rep;
    }

    
}

