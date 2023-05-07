/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.akar.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.Instant;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.akar.dao.PSResPass;
import org.akar.dao.PSUsuario;
import org.akar.helper.PSResPassHelper;

/**
 *
 * @author Axel Zarate Lozano
 */
@WebServlet(name = "VerCuenta", urlPatterns = {"/VerCuenta"})
public class VerCuenta extends HttpServlet {

    String msj = "Hola mundo";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VerCuenta</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<script>");
            out.println("alert(\""+msj+"\");");
            out.println("</script>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PSResPass tokenI = new PSResPassHelper().getToken(request);
        Timestamp ts = Timestamp.from(Instant.now());
        if(tokenI != null){
            if(ts.compareTo(tokenI.getResPass().getExp()) < 0){
                String correo = request.getParameter("correo");
                if(correo.equals(tokenI.getUsuario().getCorreo())){
                    PSUsuario usuario = new PSResPassHelper().verCuenta(request);
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("usuario", usuario);
                    response.sendRedirect("Home.jsp");
                }else{
                    msj = "Está intentando verificar un correo inválido.";
                }
            }else{
                msj = "Su token ha caducado";
            }
        }else{
            msj = "Su token es inválido";
        }
        processRequest(request, response);
    }
    
}
