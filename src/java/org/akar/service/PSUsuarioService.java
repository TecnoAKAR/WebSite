package org.akar.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.akar.dao.TblTipoUsuario;
import org.akar.dao.TblUsuario;

public class PSUsuarioService {

    public PSUsuarioService() {
    }
    
    public boolean SignUp(TblUsuario usuario, TblTipoUsuario tipo){
        try{
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            String sql = "call sp_Registro(?, ?, ?, ?, ?, ?, ?, ?)";
            int row = 0;
            
            connection = DBConnection.getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            preparedStatement.setString(1, usuario.getNom());
            preparedStatement.setString(2, usuario.getApellidoP());
            preparedStatement.setString(3, usuario.getApellidoM());
            preparedStatement.setDate(4, new Date(usuario.getFechaNac().getTime()));
            preparedStatement.setString(5, usuario.getCorreo());
            preparedStatement.setString(6, usuario.getPassword());
            preparedStatement.setString(7, usuario.getNomUser());
            preparedStatement.setInt(8, tipo.getIdTipo());
            row = preparedStatement.executeUpdate();
            DBConnection.closeConnection(connection);
            return row == 1;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    
}
