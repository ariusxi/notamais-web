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
 * @author lucas
 */
@WebServlet("/invitations")
public class Invitations extends HttpServlet {

    String POST = "POST";
    String GET = "GET";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("id") == null) {
            response.sendRedirect("/notamais-web");
        } else {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html;charset=UTF-8");

            String idCounter = session.getAttribute("id").toString();
            String token = session.getAttribute("token").toString();

            String route = "relationships/counter/" + idCounter;
            API con = new API(route, GET, token);

            Hashtable<Integer, String> source = new Hashtable<Integer, String>();
            HashMap<String, String> map = new HashMap(source);

            String responseJson = con.getJsonString(map);
            request.setAttribute("invitations", responseJson);

            String url = "/views/counter/invitations.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        String id = (String) request.getParameter("id");
        String token = (String) session.getAttribute("token");

        API con = new API("relationships/accept/" + id, "GET", token);

        Hashtable<Integer, String> source = new Hashtable<Integer, String>();
        HashMap<String, String> map = new HashMap(source);

        String responseJSON = con.getJsonString(map);
        out.print(responseJSON);

    }

}
