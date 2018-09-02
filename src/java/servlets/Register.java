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
 * @author Windows 7
 */
@WebServlet("/register")
public class Register extends HttpServlet {

     /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/views/public/register.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        
        String name = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String nickname = request.getParameter("nickname");
        String cpf = request.getParameter("cpf");
        String type = request.getParameter("type");
        String fantasia = request.getParameter("fantasia");
        String cnpj = request.getParameter("cnpj");
        String ie = request.getParameter("ie");
        String telephone = request.getParameter("telephone");
        
        String route = "";
        
        if(type.equals("counter")){
            route = "users/create-counter";
        }else{
            route = "users/create";
        }
        
        API con = new API(route, "POST", "");
        
        Hashtable<Integer, String> source = new Hashtable<Integer, String>();
        HashMap<String, String> map = new HashMap(source);
        map.put("name", name);
        map.put("email", email);
        map.put("password", password);
        map.put("gender", gender);
        if(!nickname.equals("")){
            map.put("nickname", nickname);
        }
        map.put("cpf", cpf);
        if(type.equals("user")){
            map.put("fantasia", fantasia);
            map.put("cnpj", cnpj);
            map.put("ie", ie);
            map.put("telephone", telephone);
        }
        
        try{
            String responseJSON = con.getJsonString(map);

            try{
                JSONObject json = new JSONObject(responseJSON);
                if(json.has("message")){
                    out.println(responseJSON);
                }else{
                    out.println("ERRO");
                }
            }catch(JSONException ex){
                Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            }
        }catch(IOException ex){
            ex.printStackTrace();
        }
        
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
