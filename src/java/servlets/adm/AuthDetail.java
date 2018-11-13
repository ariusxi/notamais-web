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
 * @author lucas
 */
@WebServlet("/auth-detail")
public class AuthDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        String token = (String) session.getAttribute("token");
        String idUser = request.getParameter("id");

        API conn;
        Hashtable<Integer, String> source;
        HashMap<String, String> map;
        String responseJSON;
        String route;

        route = "auths/user/" + idUser;
        conn = new API(route, "GET", token);
        source = new Hashtable<Integer, String>();
        map = new HashMap(source);
        responseJSON = conn.getJsonString(map);
        request.setAttribute("auth-detail", responseJSON);

        if (session.getAttribute("id") == null) {
            response.sendRedirect("/notamais-web");
        } else {

            route = "users/get-user/" + idUser;
            conn = new API(route, "GET", token);
            source = new Hashtable<Integer, String>();
            map = new HashMap(source);
            responseJSON = conn.getJsonString(map);

            request.setAttribute("user-detail", responseJSON);

            String url = "/views/adm/auth-detail.jsp";

            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}