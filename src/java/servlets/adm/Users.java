/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.adm;

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
@WebServlet("/users")
public class Users extends HttpServlet {


    String POST = "POST";
    String GET = "GET";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/views/adm/users.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
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

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String value = request.getParameter("value");
        String valueFloat = request.getParameter("valueFloat");
        String qtdeXML = request.getParameter("qtdeXML");
        String id = request.getParameter("id");
        String token = (String) session.getAttribute("token");
        String type = request.getParameter("type");

        API con = new API("", "", "");
        if (type.equals("users-list")) {
            con = new API("users/fetch-all/", "GET", token);
        }

        Hashtable<Integer, String> source = new Hashtable<Integer, String>();
        HashMap<String, String> map = new HashMap(source);

        if (!type.equals("users-list") && !type.equals("users-update")) {
            map.put("name", name);
            map.put("email", description);
        }
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
