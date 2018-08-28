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
import javax.servlet.http.HttpSession;

/**
 *
 * @author lucas
 */
@WebServlet(name = "user-edit", urlPatterns = {"/user-edit"})
public class UserEdit extends HttpServlet {

    String POST = "POST";
    String GET = "GET";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        String idUser = session.getAttribute("id").toString();
        String token = session.getAttribute("token").toString();

        String route = "users/get-profile/" + idUser;
        API con = new API(route, GET, token);

        Hashtable<Integer, String> source = new Hashtable<Integer, String>();
        HashMap<String, String> map = new HashMap(source);

        String responseJson = con.getJsonString(map);
        request.setAttribute("userData", responseJson);

        String url = "/views/edit-user.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        String token = (String) session.getAttribute("token");
        String idUser = (String) session.getAttribute("id");
        String name = (String) request.getParameter("name");
        String email = (String) request.getParameter("email");
        String nickname = (String) request.getParameter("nickname");
        String cpf = (String) request.getParameter("cpf");
        String gender = (String) request.getParameter("gender");
        String newPassword = (String) request.getParameter("newpassword");
        String confirmNewPassword = (String) request.getParameter("confirmnewpassword");

        String route = "users/update-profile/" + idUser;
        API con = new API(route, POST, token);

        Hashtable<Integer, String> source = new Hashtable<Integer, String>();
        HashMap<String, String> map = new HashMap(source);

        map.put("name", name);
        map.put("email", email);
        map.put("nickname", nickname);
        map.put("cpf", cpf);
        map.put("gender", gender);
        if (!newPassword.equals("")) {
            map.put("password", newPassword);
        }

        String responseJSON = con.getJsonString(map);
        out.print(responseJSON);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
