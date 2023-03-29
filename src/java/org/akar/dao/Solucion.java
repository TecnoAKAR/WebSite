
package org.akar.dao;

import java.io.Serializable;
import java.util.Date;

public class Solucion implements Serializable{
    
    int idTarea;
    int idResponsable;
    String nombreU;
    String apellidosU;
    String correoU;
    String nomTarea;
    String problema;
    String estatus;
    String solucion;
    String solMan;
    Date fecha;

    public int getIdTarea() {
        return idTarea;
    }

    public void setIdTarea(int idTarea) {
        this.idTarea = idTarea;
    }

    public int getIdResponsable() {
        return idResponsable;
    }

    public void setIdResponsable(int idResponsable) {
        this.idResponsable = idResponsable;
    }

    public String getNombreU() {
        return nombreU;
    }

    public void setNombreU(String nombreU) {
        this.nombreU = nombreU;
    }

    public String getApellidosU() {
        return apellidosU;
    }

    public void setApellidosU(String apellidosU) {
        this.apellidosU = apellidosU;
    }

    public String getCorreoU() {
        return correoU;
    }

    public void setCorreoU(String correoU) {
        this.correoU = correoU;
    }

    public String getNomTarea() {
        return nomTarea;
    }

    public void setNomTarea(String nomTarea) {
        this.nomTarea = nomTarea;
    }

    public String getProblema() {
        return problema;
    }

    public void setProblema(String problema) {
        this.problema = problema;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    public String getSolucion() {
        return solucion;
    }

    public void setSolucion(String solucion) {
        this.solucion = solucion;
    }

    public String getSolMan() {
        return solMan;
    }

    public void setSolMan(String solMan) {
        this.solMan = solMan;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
}
