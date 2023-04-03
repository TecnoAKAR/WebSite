/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.akar.helper;

import java.io.Serializable;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.akar.dao.PSReporte;
import org.akar.dao.Reporte;
import org.akar.dao.TblUsuario;
import org.akar.service.ReporteGerenteService;

/**
 *
 * @author kalid
 */
public class ReporteGerenteHelper implements Serializable{
    
    private List<Reporte> reporte;
    Reporte reportito;
    TblUsuario usuario;
    PSReporte psrep;

    public ReporteGerenteHelper() {
    }
    
    
        public Reporte getById(HttpServletRequest par){
        Reporte rep= new Reporte();
        rep.setIdReporte( Integer.parseInt(par.getParameter("idreporte")) );
        
        if(rep.getIdReporte() == 0){
            return null;
        }
        
        Reporte report = new ReporteGerenteService().getById(rep);
        if(report != null){
            return report;
        } else{
            return null;
        }
    }

    
    public boolean AsignarReporteIng(HttpServletRequest request){
        psrep= new PSReporte(new Reporte(), new TblUsuario());
        
        
        psrep.getReportito().setEstatus(request.getParameter("Estatus"));
        psrep.getUsuario().setNomUser(request.getParameter("idEncargado"));
        psrep.getReportito().setProblema(request.getParameter("Problema"));
        
        if(psrep.getUsuario().getNomUser().length() == 0 || psrep.getUsuario().getNomUser()== null){
            return false;
        }
        if(psrep.getReportito().getEstatus().length() == 0 || psrep.getReportito().getEstatus()== null){
            return false;
        }
        if(psrep.getReportito().getProblema().length() == 0 || psrep.getReportito().getProblema()== null){
            return false;
        }
               
        return new ReporteGerenteService().AsignarReporteIng(psrep.getUsuario(), psrep.getReportito());
        
    }
        public boolean AsignarReporteMan(HttpServletRequest request){
        psrep= new PSReporte(new Reporte(), new TblUsuario());
        
        psrep.getReportito().setEstatus(request.getParameter("Estatus"));
        psrep.getUsuario().setNomUser(request.getParameter("idEncargado"));
        psrep.getReportito().setProblema(request.getParameter("Problema"));
        psrep.getReportito().setSolucion(request.getParameter("Solucion"));
        
        if(psrep.getUsuario().getNomUser().length() == 0 || psrep.getUsuario().getNomUser()== null){
            return false;
        }
        if(psrep.getReportito().getEstatus().length() == 0 || psrep.getReportito().getEstatus()== null){
            return false;
        }
        if(psrep.getReportito().getProblema().length() == 0 || psrep.getReportito().getProblema()== null){
            return false;
        }
        if(psrep.getReportito().getSolucion().length() == 0 || psrep.getReportito().getSolucion()== null){
            return false;
        }
        return new ReporteGerenteService().AsignarReporteMan(psrep.getUsuario(), psrep.getReportito());
        
    }
    
    
    public boolean loadList(){
        reporte= ReporteGerenteService.getListReporte();
        return reporte!=null && reporte.size()>0;
    }
    
    public List<Reporte>getList(){
        if(reporte==null || reporte.size()==0){
            if(!loadList()){
                return null;
            }
        }
        return reporte;
    }
    
    public void setList(List<Reporte> reporte){
        this.reporte=reporte;
    }
    
}