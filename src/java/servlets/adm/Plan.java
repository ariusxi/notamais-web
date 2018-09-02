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
 * @author Windows 7
 */
@WebServlet("/plan")
public class Plan extends HttpServlet {

    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
     */
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

        String url = "/views/adm/plan.jsp";
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
        String description = request.getParameter("description");
        String valueFloat = request.getParameter("valueFloat");
        String qtdeXML = request.getParameter("qtdeXML");
        String id = request.getParameter("id");
        String token = (String) session.getAttribute("token");
        String type = request.getParameter("type");

        API con;
        if (type.equals("plan-list")) {
            con = new API("plans/fetch-all", "GET", token);
        } else if (type.equals("plan-update")) {
            con = new API("plans/update/" + id, "POST", token);
        } else if (type.equals("plan-delete")) {
            con = new API("plans/delete/" + id, "GET", token);
        } else {
            con = new API("plans/create", "POST", token);
        }

        Hashtable<Integer, String> source = new Hashtable<Integer, String>();
        HashMap<String, String> map = new HashMap(source);

        if (!type.equals("plan-list") && !type.equals("plan-update")) {
            map.put("name", name);
            map.put("description", description);
            map.put("value", valueFloat);
            map.put("qtdeXML", qtdeXML);
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
