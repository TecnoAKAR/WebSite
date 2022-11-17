package org.akar.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.akar.dao.PSUsuario;
import org.akar.dao.TblTipoUsuario;
import org.akar.dao.TblUsuario;

public class PSUsuarioService {

    public PSUsuarioService() {
    }
    
    public PSUsuario SignUp(TblUsuario usuario, TblTipoUsuario tipo){
        try{
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet;
            String sql = "call sp_Registro(?, ?, ?, ?, ?, ?, ?, ?)";
            int row = 0;
            
            connection = DBConnection.getConnection( );
            if( connection == null )
            {
                return null;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return null;
            }
            preparedStatement.setString(1, usuario.getNom());
            preparedStatement.setString(2, usuario.getApellidoP());
            preparedStatement.setString(3, usuario.getApellidoM());
            preparedStatement.setDate(4, new Date(usuario.getFechaNac().getTime()));
            preparedStatement.setString(5, usuario.getCorreo());
            preparedStatement.setString(6, usuario.getPassword());
            preparedStatement.setString(7, usuario.getNomUser());
            preparedStatement.setInt(8, tipo.getIdTipo());
            
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
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    
    public PSUsuario Login( PSUsuario psUser ){
        try{
            Connection connection;
            PreparedStatement preparedStatement;
            ResultSet resultSet;
            String sql = "call sp_Login(?, ?)";
            int row = 0;
            
            connection = DBConnection.getConnection();
            if( connection == null ){
                return null;
            }
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, psUser.getUsuario().getCorreo());
            preparedStatement.setString(2, psUser.getUsuario().getPassword() );
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
    
}
