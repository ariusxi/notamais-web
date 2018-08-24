/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.API;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
        HttpSession session = request.getSession();

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
        try {
            JSONObject json = new JSONObject(responseJSON);
            if (json.has("message")) {
                out.print(responseJSON);
            } else {
                JSONObject data = json.getJSONObject("data");

                String token = json.get("token").toString();
                String userID = data.get("id").toString();
                String userEmail = data.get("email").toString();
                String userName = data.get("name").toString();
                Object userRoles = data.get("roles").toString();

                Pattern p = Pattern.compile("()\\w+");
                Matcher m = p.matcher(userRoles.toString());
                if (m.find()) {
                    userRoles = m.group(0);
                }

                session.setAttribute("token", token);
                session.setAttribute("id", userID);
                session.setAttribute("email", userEmail);
                session.setAttribute("name", userName);
                session.setAttribute("roles", userRoles);
                
                out.print(data);
                
            }

        } catch (JSONException ex) {
            Logger.getLogger(SetLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
