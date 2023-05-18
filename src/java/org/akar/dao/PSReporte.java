
package org.akar.dao;

public class PSReporte {
    
    Reporte reportito;
    TblUser usuario;
    TblTipoUsuario tipo;
    
    public PSReporte(Reporte reporte, TblUser usuario,TblTipoUsuario tipo ){
        this.reportito=reporte;
        this.usuario=usuario;
        this.tipo=tipo;
    }

    public TblUser getUsuario() {
        return usuario;
    }

    public void setUsuario(TblUser usuario) {
        this.usuario = usuario;
    }

    public Reporte getReportito() {
        return reportito;
    }

    public void setReportito(Reporte reportito) {
        this.reportito = reportito;
    }
    public TblTipoUsuario getTipo() {
        return tipo;
    }

    public void setTipo(TblTipoUsuario tipo) {
        this.tipo = tipo;
    }
    
    
}
