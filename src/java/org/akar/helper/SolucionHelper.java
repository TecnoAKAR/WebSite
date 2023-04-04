
package org.akar.helper;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.akar.dao.RelReporteUsuario;
import org.akar.dao.ReporteCambios;
import org.akar.dao.Reporte;
import org.akar.dao.TblUsuario;
import org.akar.service.SolucionService;

public class SolucionHelper {
    
    Reporte rep;
    ReporteCambios repCam;
    TblUsuario usu;
    
    public SolucionHelper(){
        rep = new Reporte();
        repCam = new ReporteCambios();
        usu = new TblUsuario();
    }
    
    public List<Reporte> getListSop(int idUsuario){
        usu.setIdUsuario(idUsuario);

        if(usu.getIdUsuario() == 0){
            return null;
        }
        
        List<Reporte> list = new SolucionService().getListSop(usu);
        if(list != null){
            return list;
        } else{
            return null;
        }
    }
    
    public List<Reporte> getListMan(int idUsuario){
        usu.setIdUsuario(idUsuario);
        if(usu.getIdUsuario() == 0){
            return null;
        }
        
        List<Reporte> list = new SolucionService().getListMan(usu);
        if(list != null){
            return list;
        } else{
            return null;
        }
    }
    
    public RelReporteUsuario getById(HttpServletRequest par){
        rep.setIdReporte( Integer.parseInt(par.getParameter("idreporte")) );
        
        if(rep.getIdReporte() == 0){
            return null;
        }
        
        RelReporteUsuario report = new SolucionService().getById(rep);
        if(report != null){
            return report;
        } else{
            return null;
        }
    }
    
    public boolean sp_Soporte(HttpServletRequest par){
        Date fecha = new Date();
        rep.setIdReporte( Integer.parseInt(par.getParameter("idRep")) );
        rep.setEstatus( par.getParameter("estat") );
        rep.setSolucion( par.getParameter("sol") );
        rep.setFechaF( fecha );
        repCam.setEstatusI( par.getParameter("estatI") );
        repCam.setFechaCambio( fecha );
        usu.setIdUsuario( Integer.parseInt(par.getParameter("idIng")) );
        
        if(repCam.getEstatusI() == null ||  repCam.getEstatusI().length() == 0){
            return false;
        }
        if(repCam.getFechaCambio() == null ){
            return false;
        }
        if(usu.getIdUsuario() == 0 ){
            return false;
        }
        if(rep.getIdReporte()== 0){
            return false;
        }
        if(rep.getSolucion() == null || rep.getSolucion().length() > 1024 || rep.getSolucion().length() == 0 || rep.getSolucion().equals(" ")){
            return false;
        }
        if(rep.getEstatus().equals( repCam.getEstatusI() )){
            return false;
        }
        if(rep.getFechaF() == null ){
            return false;
        }
        
        return new SolucionService().sp_Soporte(rep, usu, repCam);
    }
    
}
