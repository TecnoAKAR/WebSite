
package org.akar.dao;

import java.io.Serializable;

public class RelTareaUsu implements Serializable {
    
    int idRel;
    TblUsuario usuario;
    Solucion sol;
    
    public RelTareaUsu(){
        usuario = new TblUsuario();
        sol = new Solucion();
    }

    public int getIdRel() {
        return idRel;
    }

    public void setIdRel(int idRel) {
        this.idRel = idRel;
    }

    public TblUsuario getUsuario() {
        return usuario;
    }

    public void setUsuario(TblUsuario usuario) {
        this.usuario = usuario;
    }

    public Solucion getSol() {
        return sol;
    }

    public void setSol(Solucion sol) {
        this.sol = sol;
    }
    
}
