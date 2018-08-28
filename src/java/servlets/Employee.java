package servlets;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.API;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONException;
import org.json.JSONObject;
import servlets.SetLogin;

/**
 *
 * @author Windows 7
 */
@WebServlet("/employee")
public class Employee extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/views/employee.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        String name = request.getParameter("name");
        String nickname = request.getParameter("nickname");
        String cpf = request.getParameter("cpf");
        String gender = request.getParameter("gender");
        String id = (String) session.getAttribute("id");
        String e = (String) request.getParameter("id");
        String token = (String) session.getAttribute("token");
        String type = request.getParameter("type");
        
        API con;
        if(type.equals("employee-list")){
            con = new API("employees/fetch-all/"+id, "GET", token);
        }else if(type.equals("delete-employee")){
            con = new API("employees/delete/"+id, "GET", token);
        }else{
            con = new API("employees/create/"+id, "POST", token);
        }

        Hashtable<Integer, String> source = new Hashtable<Integer, String>();
        HashMap<String, String> map = new HashMap(source);
        if(!type.equals("employee-list") && !type.equals("delete-employee")){
            map.put("name", name);
            map.put("nickname", nickname);
            map.put("cpf", cpf);
            map.put("gender", gender);
        }

        String responseJSON = con.getJsonString(map);
        out.print(responseJSON);
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
