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
import servlets.SetLogin;

/**
 *
 * @author Windows 7
 */
@WebServlet("/first-login")
public class FirstLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if(session.getAttribute("id")==null){
            response.sendRedirect("/notamais-web");
        }else{
            String url = "/views/user/first-login.jsp";
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

        String user = session.getAttribute("id").toString();
        String token = session.getAttribute("token").toString();
        String plan = request.getParameter("plan");
        String CardNumber = request.getParameter("CardNumber");
        String Holder = request.getParameter("Holder");
        String ExpirationDate = request.getParameter("ExpirationDate");
        String SecurityCode = request.getParameter("SecurityCode");
        String Brand = request.getParameter("Brand");
        String method = request.getParameter("method");

        
        
        API con = null;
        if(method.equals("pay")){
            con = new API("contracts/create", "POST", token);
        }else if(method.equals("test")){
            con = new API("contracts/test", "POST", token);
        }
        
        Hashtable<Integer, String> source = new Hashtable<Integer, String>();
        HashMap<String, String> map = new HashMap(source);
        if(method.equals("pay")){
            CardNumber = CardNumber.replace(" ", "");
            String[] date = ExpirationDate.split("/");
            ExpirationDate = date[0]+ "/20" + date[1];
           
            map.put("plan", plan);
            map.put("user", user);
            map.put("CardNumber", CardNumber);
            map.put("Holder", Holder);
            map.put("ExpirationDate", ExpirationDate);
            map.put("SecurityCode", SecurityCode);
            map.put("Brand", Brand);
            map.put("cardType", "CreditCard");
        }else if(method.equals("test")){
            map.put("user", user);
        }

        String responseJSON = con.getJsonString(map);
        
        try {
            JSONObject json = new JSONObject(responseJSON);
            
            out.print(responseJSON);
            

        } catch (JSONException ex) {
            Logger.getLogger(SetLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
