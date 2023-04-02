
package org.akar.helper;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.akar.dao.ReporteCambios;
import org.akar.dao.Reporte;
import org.akar.service.SolucionService;

public class SolucionHelper {
    
    Reporte rep;
    ReporteCambios repCam;
    
    public SolucionHelper(){
        rep = new Reporte();
        repCam = new ReporteCambios();
    }
//    
//    public List<Reporte> getListSop(){
//        List<Reporte> list = new SolucionService().getListSop();
//        if(list != null){
//            return list;
//        } else{
//            return null;
//        }
//    }
//    
//    public List<Reporte> getListMan(){
//        List<Reporte> list = new SolucionService().getListMan();
//        if(list != null){
//            return list;
//        } else{
//            return null;
//        }
//    }
//    
//    public Reporte getById(HttpServletRequest par){
//        sol.setIdTarea( Integer.parseInt(par.getParameter("idreporte")) );
//        
//        if(sol.getIdTarea() == 0){
//            return null;
//        }
//        
//        Reporte rep = new SolucionService().getById(sol);
//        if(rep != null){
//            return rep;
//        } else{
//            return null;
//        }
//    }
//    
//    public boolean update(HttpServletRequest par){
//        sol.setIdTarea( Integer.parseInt(par.getParameter("idTarea")) );
//        sol.setEstatus( par.getParameter("estatus") );
//        sol.setSolucion( par.getParameter("sol") );
//        
//        if(sol.getSolucion().length() > 520 || sol.getSolucion().length() == 0 || sol.getSolucion() == null || sol.getSolucion().equals("")){
//            return false;
//        }
//        if(sol.getEstatus().equals(par.getParameter("estatusInicial"))){
//            return false;
//        }
//        if(sol.getIdTarea() == 0){
//            return false;
//        }
//        
//        if(new SolucionService().update(sol) == true){
//            return true;
//        } else{
//            return false;
//        }
//        
//    }
//    
}
