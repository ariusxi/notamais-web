/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.counter;

import servlets.user.EditUser;
import dao.API;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "edit-counter", urlPatterns = {"/edit-counter"})
public class EditCounter extends HttpServlet {

    String POST = "POST";
    String GET = "GET";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        String idCounter = session.getAttribute("id").toString();
        String token = session.getAttribute("token").toString();

        String route = "users/get-profile/" + idCounter;
        API con = new API(route, GET, token);

        Hashtable<Integer, String> source = new Hashtable<Integer, String>();
        HashMap<String, String> map = new HashMap(source);

        String responseJson = con.getJsonString(map);
        out.print(session.getAttribute("email"));
        request.setAttribute("counterData", responseJson);

        out.print(responseJson);

        String url = "/views/counter/edit-counter.jsp";
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
        JSONObject json;
        try {
            json = new JSONObject(responseJSON);
            if (json.has("message")) {
                if (json.get("message").equals("Perfil atualizado com sucesso")) {
                    session.setAttribute("email", email);
                    session.setAttribute("name", name);
                    out.print(json.get("message"));
                }
            } else {
                out.print(responseJSON);
            }
        } catch (JSONException ex) {
            Logger.getLogger(EditUser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
