
package org.akar.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import org.akar.dao.RelReporteUsuario;
import org.akar.dao.ReporteCambios;
import org.akar.dao.Reporte;
import org.akar.dao.TblUsuario;

public class SolucionService {
    
    Reporte rep;
    ReporteCambios repCam;
    RelReporteUsuario relRepUsu;
    
    public SolucionService(){
    }
    
    public List<Reporte> getListSop(TblUsuario usu){
        List<Reporte> list = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        rep = null;
        String query = "SELECT DISTINCT r.idReporte, r.Problema, r.Estatus, r.Solucion, r.FechaI, r.FechaF FROM Reporte r INNER JOIN RelReporteEncargado rel ON r.idReporte = rel.idReporte WHERE r.Estatus = 'En proceso' AND rel.idEncargado = 3;";
        
        try 
        {
            connection = DBConnection.getConnection( );
            if( connection == null )
            {
                return null;
            }
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);
            if( resultSet == null )
            {
                return null;
            }
            list = new ArrayList<>();
            while( resultSet.next() )
            {
                rep = new Reporte();
                rep.setIdReporte( resultSet.getInt(1) );
                rep.setProblema( resultSet.getString(2) );
                rep.setEstatus( resultSet.getString(3) );
                rep.setSolucion(resultSet.getString(4) );
                rep.setFechaI( resultSet.getDate(5) );
                rep.setFechaF( resultSet.getDate(6) );
                list.add(rep);
            }
            resultSet.close();
            DBConnection.closeConnection(connection);
            return list;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
//    
    public List<Reporte> getListMan(TblUsuario usu){
        List<Reporte> list = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        rep = null;
        String query = "SELECT DISTINCT r.idReporte, r.Problema, r.Estatus, r.Solucion, r.FechaI, r.FechaF FROM Reporte r INNER JOIN RelReporteEncargado rel ON r.idReporte = rel.idReporte WHERE r.Estatus = 'Mantenimiento hecho' AND rel.idEncargado = 3;";
        
        try 
        {
            connection = DBConnection.getConnection( );
            if( connection == null )
            {
                return null;
            }
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);
            if( resultSet == null )
            {
                return null;
            }
            list = new ArrayList<>();
            while( resultSet.next() )
            {
                rep = new Reporte();
                rep.setIdReporte( resultSet.getInt(1) );
                rep.setProblema( resultSet.getString(2) );
                rep.setEstatus( resultSet.getString(3) );
                rep.setSolucion(resultSet.getString(4) );
                rep.setFechaI( resultSet.getDate(5) );
                rep.setFechaF( resultSet.getDate(6) );
                list.add(rep);
            }
            resultSet.close();
            DBConnection.closeConnection(connection);
            return list;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public RelReporteUsuario getById(Reporte reporte){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "SELECT DISTINCT u.idUsuario, u.NomUsuario, r.* FROM Usuario u INNER JOIN RelReporteUsuario rel ON u.idUsuario = rel.idUsuario INNER JOIN Reporte r ON rel.idReporte = r.idReporte WHERE r.idReporte = ?;";
        try 
        {
            connection = DBConnection.getConnection( );
            if( connection == null )
            {
                return null;
            }
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, reporte.getIdReporte() );
            resultSet = preparedStatement.executeQuery( );
            if( resultSet == null )
            {
                return null;
            }
            while( resultSet.next() )
            {
                relRepUsu = new RelReporteUsuario();
                relRepUsu.getUser().setIdUsuario( resultSet.getInt(1) );
                relRepUsu.getUser().setNomUser( resultSet.getString(2) );
                relRepUsu.getRep().setIdReporte( resultSet.getInt(3) );
                relRepUsu.getRep().setProblema( resultSet.getString(4) );
                relRepUsu.getRep().setEstatus( resultSet.getString(5) );
                relRepUsu.getRep().setSolucion( resultSet.getString(6) );
                relRepUsu.getRep().setFechaI( resultSet.getDate(7) );
                relRepUsu.getRep().setFechaF( resultSet.getDate(8) );
            }
            resultSet.close();
            DBConnection.closeConnection(connection);
            return relRepUsu;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean sp_Soporte(Reporte rep, TblUsuario usuario, ReporteCambios cam){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "call sp_soporte(?, ?, ?, ?, ?, ?, ?);";
        int row = 0;
        try 
        {
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
            preparedStatement.setInt(1, rep.getIdReporte() );
            preparedStatement.setInt(2, usuario.getIdUsuario() );
            preparedStatement.setString(3, cam.getEstatusI() );
            preparedStatement.setString(4, rep.getEstatus() );
            preparedStatement.setString(5, rep.getSolucion() );
            preparedStatement.setDate(6, new Date( rep.getFechaF().getTime()) );
            preparedStatement.setDate(7, new Date( cam.getFechaCambio().getTime() ) );
            
            row = preparedStatement.executeUpdate();
            DBConnection.closeConnection(connection);
            return row == 1;
            
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    
}
