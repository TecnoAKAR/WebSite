
package org.akar.helper;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.akar.dao.RelTareaUsu;
import org.akar.dao.Solucion;
import org.akar.service.SolucionService;

public class SolucionHelper {
    
    Solucion sol;
    RelTareaUsu rel;
    
    public SolucionHelper(){
        sol = new Solucion();
        rel = new RelTareaUsu();
    }
    
    public List<Solucion> getListSop(){
        List<Solucion> list = new SolucionService().getListSop();
        if(list != null){
            return list;
        } else{
            return null;
        }
    }
    
    public List<Solucion> getListMan(){
        List<Solucion> list = new SolucionService().getListMan();
        if(list != null){
            return list;
        } else{
            return null;
        }
    }
    
    public Solucion getById(HttpServletRequest par){
        sol.setIdTarea( Integer.parseInt(par.getParameter("idreporte")) );
        
        if(sol.getIdTarea() == 0){
            return null;
        }
        
        Solucion rep = new SolucionService().getById(sol);
        if(rep != null){
            return rep;
        } else{
            return null;
        }
    }
    
    public boolean update(HttpServletRequest par){
        sol.setIdTarea( Integer.parseInt(par.getParameter("idTarea")) );
        sol.setEstatus( par.getParameter("estatus") );
        sol.setSolucion( par.getParameter("sol") );
        
        if(sol.getSolucion().length() > 520 || sol.getSolucion().length() == 0 || sol.getSolucion() == null || sol.getSolucion().equals("")){
            return false;
        }
        if(sol.getEstatus().equals(par.getParameter("estatusInicial"))){
            return false;
        }
        if(sol.getIdTarea() == 0){
            return false;
        }
        
        if(new SolucionService().update(sol) == true){
            return true;
        } else{
            return false;
        }
        
    }
    
}
