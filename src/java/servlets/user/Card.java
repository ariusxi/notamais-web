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
 * @author Chu
 */
@WebServlet(name = "card", urlPatterns = {"/card"})
public class Card extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url = "/views/user/cards.jsp";
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
        
        String cardNumber = request.getParameter("number");
        String holder = request.getParameter("holder");
        String expirationDate = request.getParameter("expiration-date");
        String securityCode = request.getParameter("security-code");
        String brand = request.getParameter("brand");
        String type = request.getParameter("card-type");
        String cardId = request.getParameter("id");
        
        String id = (String) session.getAttribute("id");
        String token = (String) session.getAttribute("token");
        String methodType = request.getParameter("methodType");
        
        
        API con;
        if (methodType.equals("card-list")) {
            con = new API("cards/" + id, "GET", token);
        } else if (methodType.equals("card-update")) {
            con = new API("cards/update/" + id, "POST", token);
        } else if (methodType.equals("card-delete")) {
            con = new API("cards/delete/" + cardId, "DELETE", token);
        } else {
            con = new API("cards/create/" + id, "POST", token);
        }
        
        Hashtable<Integer, String> source = new Hashtable<Integer, String>();
        HashMap<String, String> map = new HashMap(source);
        
        if (!methodType.equals("card-list") && !methodType.equals("card-update")) {
            map.put("CardNumber", cardNumber);
            map.put("Holder", holder);
            map.put("ExpirationDate", expirationDate);
            map.put("SecurityCode", securityCode);
            map.put("Brand", brand);
            map.put("type", type);
        }
        
        String responseJSON = con.getJsonString(map); 
        out.println(responseJSON);
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}