/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
 * @author Isabela
 */
@WebServlet(name = "upload-xml", urlPatterns = {"/upload-xml"})
public class UploadXml extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        if(session.getAttribute("id")==null){
            response.sendRedirect("/notamais-web");
        }else{
        
            String idUser = session.getAttribute("id").toString();
            String token = session.getAttribute("token").toString();

            String rotaAPI = "contracts/user/" + idUser;
            API api = new API(rotaAPI, "GET", token);

            String json = api.getJsonString(new HashMap<String, String>());
            request.setAttribute("plano", json);


            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/user/upload-xml.jsp");
            dispatcher.forward(request, response);
        
        }
        
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        
              
        String id = (String) session.getAttribute("id");
        String token = (String) session.getAttribute("token");
        String methodType = request.getParameter("methodType");
        
        String rotaAPI = "plans/";
        API api = new API(rotaAPI, "GET", "");
        
       
        
        rotaAPI = "contracts/user/" + id;
        api = new API(rotaAPI, "GET", token);
         String json = api.getJsonString(new HashMap<String, String>());
        request.setAttribute("plano", json);
       

        Hashtable<Integer, String> source = new Hashtable<Integer, String>();
        HashMap<String, String> map = new HashMap(source);
        API con;
        switch(methodType){
            case "list-xml":
                con = new API("files/user/" + id, "GET", token);
                break;
            default: 
                con = new API("/files/delete/" + id, "DELETE", token);
                break;
        }
        
        String responseJSON = con.getJsonString(map); 
        
        
        out.print(responseJSON);
        
        
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
