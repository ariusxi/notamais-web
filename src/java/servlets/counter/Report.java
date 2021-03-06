/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.counter;

import dao.API;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Hashtable;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author VBSNET-5
 */
@WebServlet("/report")
public class Report extends HttpServlet {


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        
        String token = (String) session.getAttribute("token");
        String id = request.getParameter("id");
        
        API con = null;
        con = new API("files/values/" + id, "GET", token);

        
        Hashtable<Integer, String> source = new Hashtable<Integer, String>();
        HashMap<String, String> map = new HashMap(source);
        String responseJSON = con.getJsonString(map);

        request.setAttribute("nfes", responseJSON);
        
        
        
        if (session.getAttribute("id") == null) {
            response.sendRedirect("/notamais-web");
        } else {
            String url = "/views/counter/report.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } 
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        
        String cliente = (String)request.getParameter("cliente");
        String token = (String) session.getAttribute("token");
        String begin = (String) request.getParameter("begin");
        String end = (String) request.getParameter("end");

        Hashtable<Integer, String> source = new Hashtable<Integer, String>();
        HashMap<String, String> map = new HashMap(source);
        API con = new API("files/values/" + cliente, "POST", token);;
        map.put("begin", begin);
        map.put("end", end);
 
      /*  else if(type.equals("delete-counter")){
            con = new API("relationships/delete/" + idConvite, "POST", token); 
        } 
        */
           
        String responseJSON = con.getJsonString(map);
        out.println(responseJSON);
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
