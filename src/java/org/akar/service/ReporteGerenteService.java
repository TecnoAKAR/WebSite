/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.akar.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.akar.dao.PSReporte;
import org.akar.dao.Reporte;
import org.akar.dao.TblUser;
import static org.akar.service.DBConnection.closeConnection;
import static org.akar.service.DBConnection.getConnection;

/**
 *
 * @author kalid
 */
public class ReporteGerenteService {
     
        public Reporte getById(Reporte reporte){
        Reporte rep  = new Reporte();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "Select idReporte,Problema,Estatus,Solucion,FechaI from Reporte where idReporte=?";
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
                rep.setIdReporte(resultSet.getInt(1));
                rep.setProblema(resultSet.getString(2));
                rep.setEstatus(resultSet.getString(3));
                rep.setSolucion(resultSet.getString(4));
                rep.setFechaI(resultSet.getDate(5));
                

            }
            resultSet.close();
            DBConnection.closeConnection(connection);
            return rep;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    

    public static List<Reporte> getListReporte(){
        List<Reporte> Reportito=null;
        Connection con=null;
        Statement statement=null;
        ResultSet resultSet=null;
        Reporte reportito=null;
        try{
            con=getConnection();
            if (con==null){
                return null;
            }
            statement=con.createStatement();
            if(statement==null){
                return null;
            }
            resultSet=statement.executeQuery("Select idReporte,Problema, Estatus,Solucion, FechaI, FechaF from Reporte");
            if(resultSet==null){
                return null;
            }
            Reportito=new ArrayList<>();
            while(resultSet.next()){
                reportito=new Reporte();
                reportito.setIdReporte(resultSet.getInt(1));
                reportito.setProblema(resultSet.getString(2));
                reportito.setEstatus(resultSet.getString(3));
                reportito.setSolucion(resultSet.getString(4));
                reportito.setFechaI(resultSet.getDate(5));
                reportito.setFechaF(resultSet.getDate(6));
                Reportito.add(reportito);
            }
            resultSet.close();
            closeConnection(con);
            return Reportito;
        }
        
        catch(SQLException e){
            e.printStackTrace();
        }
        return null;}
        public static List<TblUser> getListIng(){
        List<TblUser> reportito=null;
        Connection con=null;
        Statement statement=null;
        ResultSet resultSet=null;
        TblUser rep =null;
        try{
            con=getConnection();
            if (con==null){
                return null;
            }
            statement=con.createStatement();
            if(statement==null){
                return null;
            }
            resultSet=statement.executeQuery("SELECT NomUsuario FROM Usuario JOIN RelTipoUsuario ON Usuario.idUsuario = RelTipoUsuario.idUsuario\n" +
            "JOIN TipoUsuario ON RelTipoUsuario.idTipo = TipoUsuario.idTipo\n" +
            "WHERE TipoUsuario.idTipo = '7';");
            if(resultSet==null){
                return null;
            }
            reportito = new ArrayList<>();
            while(resultSet.next()){
                rep = new TblUser();
                rep.setNomUser(resultSet.getString(1));
                reportito.add(rep);
            }
            resultSet.close();
            closeConnection(con);
            return reportito;
        }
        
        catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
        public static List<TblUser> getListGer(){
        List<TblUser> reportito=null;
        Connection con=null;
        Statement statement=null;
        ResultSet resultSet=null;
        TblUser rep =null;
        try{
            con=getConnection();
            if (con==null){
                return null;
            }
            statement=con.createStatement();
            if(statement==null){
                return null;
            }
            resultSet=statement.executeQuery("SELECT NomUsuario FROM Usuario JOIN RelTipoUsuario ON Usuario.idUsuario = RelTipoUsuario.idUsuario\n" +
            "JOIN TipoUsuario ON RelTipoUsuario.idTipo = TipoUsuario.idTipo\n" +
            "WHERE TipoUsuario.idTipo = '8';");
            if(resultSet==null){
                return null;
            }
            reportito = new ArrayList<>();
            while(resultSet.next()){
                rep = new TblUser();
                rep.setNomUser(resultSet.getString(1));
                reportito.add(rep);
            }
            resultSet.close();
            closeConnection(con);
            return reportito;
        }
        
        catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }


    public boolean AsignarReporteIng(TblUser usuario, Reporte reportito){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "call sp_GerenteSopIng(?, ?, ?)";
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
            preparedStatement.setString(1, reportito.getProblema());
            preparedStatement.setString(2, reportito.getEstatus());
            preparedStatement.setString(3, usuario.getNomUser());
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

    public boolean AsignarReporteMan(TblUser usuario, Reporte reportito){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "call sp_GerenteSopMan(?, ?, ?, ?)";
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
            preparedStatement.setString(1, reportito.getProblema());
            preparedStatement.setString(2, reportito.getEstatus());
            preparedStatement.setString(3, reportito.getSolucion());
            preparedStatement.setString(4, usuario.getNomUser());
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