/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.adm;

import dao.API;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet("/user-profile")
public class UserProfile extends HttpServlet {




    String POST = "POST";
    String GET = "GET";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String id = request.getParameter("id").toString();
        String token = session.getAttribute("token").toString();

        String rotaAPI = "users/get-user/" + id;
        API api = new API(rotaAPI, GET, token);

        String json = api.getJsonString(new HashMap<String, String>());
        request.setAttribute("user", json);

        rotaAPI = "contracts/user/" + id;
        api = new API(rotaAPI, GET, token);
        
        json = api.getJsonString(new HashMap<String, String>());
        request.setAttribute("plano", json);
        
        if(session.getAttribute("id")==null){
            response.sendRedirect("/notamais-web");
        }else{
            String url = "/views/adm/user-profile.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
