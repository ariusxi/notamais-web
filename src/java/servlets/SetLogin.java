/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

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

/**
 *
 * @author lucas
 */
@WebServlet("/login")
public class SetLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/views/login.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        response.setContentType("text/html;charset=UTF-8");

        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String ip = request.getRemoteAddr();

        API con = new API("users/auth", "POST", "");

        Hashtable<Integer, String> source = new Hashtable<Integer, String>();
        HashMap<String, String> map = new HashMap(source);
        map.put("email", login);
        map.put("password", password);
        map.put("ip", ip);

        String responseJSON = con.getJsonString(map);

        out.print(responseJSON);
    }

}
