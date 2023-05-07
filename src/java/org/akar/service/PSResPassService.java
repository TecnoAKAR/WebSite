
package org.akar.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.akar.dao.PSResPass;
import org.akar.dao.PSUsuario;
import org.akar.dao.TblTipoUsuario;
import org.akar.dao.TblUsuario;

public class PSResPassService {

    public PSResPassService() {
    }
    
    public boolean setToken(PSResPass resPass){
        try{
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet;
            String sql = "call sp_asignarToken(?, ?, ?)";
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
            preparedStatement.setString(1, resPass.getUsuario().getCorreo());
            preparedStatement.setString(2, resPass.getResPass().getToken());
            preparedStatement.setTimestamp(3, resPass.getResPass().getExp());
            row = preparedStatement.executeUpdate();
            DBConnection.closeConnection(connection);
            return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    
    public boolean resPass(PSResPass resPass){
        try{
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet;
            String sql = "call sp_ActualizarContrasena(?, ?)";
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
            preparedStatement.setString(1, resPass.getUsuario().getCorreo());
            preparedStatement.setString(2, resPass.getUsuario().getPassword());
            row = preparedStatement.executeUpdate();
            DBConnection.closeConnection(connection);
            return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    
    public PSUsuario verCuenta(PSResPass correo){
        try{
            Connection connection;
            PreparedStatement preparedStatement;
            ResultSet resultSet;
            String sql = "call sp_VerCuenta(?)";
            int row = 0;
            
            connection = DBConnection.getConnection();
            if( connection == null ){
                return null;
            }
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, correo.getUsuario().getCorreo());
            resultSet = preparedStatement.executeQuery( );
            if( resultSet == null )
            {
                return null;
            }
            while( resultSet.next() )
            {
                PSUsuario query = new PSUsuario( new TblUsuario(), new TblTipoUsuario());
                query.setIdRelTipUs( resultSet.getInt(1));
                query.getUsuario().setIdUsuario( resultSet.getInt(2));
                query.getTipo().setIdTipo(resultSet.getInt(3));
                query.getUsuario().setNom( resultSet.getString(4) );
                query.getUsuario().setApellidoP( resultSet.getString(5));
                query.getUsuario().setApellidoM( resultSet.getString(6));
                query.getUsuario().setCorreo( resultSet.getString(7));
                query.getUsuario().setNomUser( resultSet.getString(8));
                return query;
            }
            resultSet.close();
            DBConnection.closeConnection(connection);
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    
    
    public PSResPass getToken( String token ){
        try{
            Connection connection;
            PreparedStatement preparedStatement;
            ResultSet resultSet;
            String sql = "call sp_recDatosToken(?)";
            int row = 0;
            
            connection = DBConnection.getConnection();
            if( connection == null ){
                return null;
            }
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, token);
            resultSet = preparedStatement.executeQuery( );
            if( resultSet == null )
            {
                return null;
            }
            while( resultSet.next() )
            {
                PSResPass query = new PSResPass();
                query.getUsuario().setCorreo(resultSet.getString(1));
                query.getResPass().setToken(resultSet.getString(2));
                query.getResPass().setExp(resultSet.getTimestamp(3));
                return query;
            }
            resultSet.close();
            DBConnection.closeConnection(connection);
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
}
