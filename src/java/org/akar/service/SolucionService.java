
package org.akar.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.akar.dao.ReporteCambios;
import org.akar.dao.Reporte;

public class SolucionService {
    
    Reporte rep;
    ReporteCambios repCam;
    
    public SolucionService(){
    }
//    
//    public List<Reporte> getListSop(){
//        List<Reporte> list = null;
//        Connection connection = null;
//        Statement statement = null;
//        ResultSet resultSet = null;
//        sol = null;
//        String query = null;
//        
//        try 
//        {
//            connection = DBConnection.getConnection( );
//            if( connection == null )
//            {
//                return null;
//            }
//            statement = connection.createStatement( );
//            if( statement == null )
//            {
//                return null;
//            }
//            query = "select * from tarea where estatus = 'En proceso';";
//            resultSet = statement.executeQuery( query );
//            if( resultSet == null )
//            {
//                return null;
//            }
//            list = new ArrayList<>();
//            while( resultSet.next() )
//            {
//                sol = new Reporte();
//                sol.setIdTarea( resultSet.getInt(1) );
//                sol.setIdResponsable( resultSet.getInt(2) );
//                sol.setNombreU( resultSet.getString(3) );
//                sol.setApellidosU( resultSet.getString(4) );
//                sol.setCorreoU( resultSet.getString(5) );
//                sol.setNomTarea(resultSet.getString(6) );
//                sol.setProblema( resultSet.getString(7) );
//                sol.setEstatus( resultSet.getString(8) );
//                sol.setSolucion( resultSet.getString(9) );
//                sol.setSolMan( resultSet.getString(10) );
//                sol.setFecha( resultSet.getDate(11) );
//                list.add(sol);
//            }
//            resultSet.close();
//            DBConnection.closeConnection(connection);
//            return list;
//        } 
//        catch (SQLException ex) 
//        {
//            ex.printStackTrace();
//        }
//        return null;
//    }
////    
//    public List<Reporte> getListMan(){
//        List<Reporte> list = null;
//        Connection connection = null;
//        Statement statement = null;
//        ResultSet resultSet = null;
//        sol = null;
//        String query = null;
//        
//        try 
//        {
//            connection = DBConnection.getConnection( );
//            if( connection == null )
//            {
//                return null;
//            }
//            statement = connection.createStatement( );
//            if( statement == null )
//            {
//                return null;
//            }
//            query = "select * from tarea where estatus = 'A reportar';";
//            resultSet = statement.executeQuery( query );
//            if( resultSet == null )
//            {
//                return null;
//            }
//            list = new ArrayList<>();
//            while( resultSet.next() )
//            {
//                sol = new Reporte();
//                sol.setIdTarea( resultSet.getInt(1) );
//                sol.setIdResponsable( resultSet.getInt(2) );
//                sol.setNombreU( resultSet.getString(3) );
//                sol.setApellidosU( resultSet.getString(4) );
//                sol.setCorreoU( resultSet.getString(5) );
//                sol.setNomTarea(resultSet.getString(6) );
//                sol.setProblema( resultSet.getString(7) );
//                sol.setEstatus( resultSet.getString(8) );
//                sol.setSolucion( resultSet.getString(9) );
//                sol.setSolMan( resultSet.getString(10) );
//                sol.setFecha( resultSet.getDate(11) );
//                list.add(sol);
//            }
//            resultSet.close();
//            DBConnection.closeConnection(connection);
//            return list;
//        } 
//        catch (SQLException ex) 
//        {
//            ex.printStackTrace();
//        }
//        return null;
//    }
//    
//    public Reporte getById(Reporte solucion){
//        Connection connection = null;
//        PreparedStatement preparedStatement = null;
//        ResultSet resultSet = null;
//        String sql = "select * from tarea where idTarea = ?;";
//        try 
//        {
//            connection = DBConnection.getConnection( );
//            if( connection == null )
//            {
//                return null;
//            }
//            preparedStatement = connection.prepareStatement(sql);
//            preparedStatement.setInt(1, solucion.getIdTarea() );
//            resultSet = preparedStatement.executeQuery( );
//            if( resultSet == null )
//            {
//                return null;
//            }
//            while( resultSet.next() )
//            {
//                sol = new Reporte();
//                sol.setIdTarea( resultSet.getInt(1) );
//                sol.setIdResponsable( resultSet.getInt(2) );
//                sol.setNombreU( resultSet.getString(3) );
//                sol.setApellidosU( resultSet.getString(4) );
//                sol.setCorreoU( resultSet.getString(5) );
//                sol.setNomTarea(resultSet.getString(6) );
//                sol.setProblema( resultSet.getString(7) );
//                sol.setEstatus( resultSet.getString(8) );
//                sol.setSolucion( resultSet.getString(9) );
//                sol.setSolMan( resultSet.getString(10) );
//                sol.setFecha( resultSet.getDate(11) );
//            }
//            resultSet.close();
//            DBConnection.closeConnection(connection);
//            return sol;
//        } 
//        catch (SQLException ex) 
//        {
//            ex.printStackTrace();
//        }
//        return null;
//    }
//    
//    public boolean update(Reporte solucion){
//        Connection connection = null;
//        PreparedStatement preparedStatement = null;
//        String sql = "update tarea set estatus = ?, solucion = ? where idTarea = ?;";
//        int row = 0;
//        try 
//        {
//            connection = DBConnection.getConnection( );
//            if( connection == null )
//            {
//                return false;
//            }
//            preparedStatement = connection.prepareStatement(sql);
//            if( preparedStatement == null )
//            {
//                return false;
//            }
//            preparedStatement.setString(1, solucion.getEstatus() );
//            preparedStatement.setString(2, solucion.getSolucion() );
//            preparedStatement.setInt(3, solucion.getIdTarea() );
//            row = preparedStatement.executeUpdate();
//            DBConnection.closeConnection(connection);
//            return row == 1;
//        } 
//        catch (SQLException ex) 
//        {
//            ex.printStackTrace();
//        }
//        return false;
//    }
//    
}
