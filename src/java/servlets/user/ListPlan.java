/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.user;

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
@WebServlet("/list-plan")
public class ListPlan extends HttpServlet {

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
        
        HttpSession session = request.getSession();
        if(session.getAttribute("id")==null){
            response.sendRedirect("/notamais-web");
        }else{
            String id = (String) session.getAttribute("id");
            String token = (String) session.getAttribute("token");

            String rotaAPI = "plans/";
            API api = new API(rotaAPI, "GET", "");

            String json = api.getJsonString(new HashMap<String, String>());
            request.setAttribute("planos", json);

            rotaAPI = "contracts/user/" + id;
            api = new API(rotaAPI, "GET", token);

            json = api.getJsonString(new HashMap<String, String>());
            request.setAttribute("plano", json);





            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/user/list-plan.jsp");
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
        
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        String token = (String) session.getAttribute("token");
         String methodType = request.getParameter("methodType");
        
        API con = null;
        
        Hashtable<Integer, String> source = new Hashtable<Integer, String>();
        HashMap<String, String> map = new HashMap(source);
        
        if (methodType.equals("card-list")){
            con = new API("cards/" + id, "GET", token); 
        }
        else if(methodType.equals("contracts-change")){
            con = new API("contracts/change/", "POST", token);
            map.put("user", id);
            map.put("card", request.getParameter("idCartao"));
            map.put("plan", request.getParameter("idPlano"));
             
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
