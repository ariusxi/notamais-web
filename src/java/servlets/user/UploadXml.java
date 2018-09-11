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
        
        String url = "/views/user/upload-xml.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
        
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       /* PrintWriter out = response.getWriter();

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        
              
        String id = (String) session.getAttribute("id");
        String token = (String) session.getAttribute("token");
        String methodType = request.getParameter("methodType");

        
         API con;
        if(methodType.equals("upload")) {
            con = new API("files/" + id, "POST", token);
        }
        else{
           con = new API("/files/delete/" + id, "DELETE", token);
            
       */ }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
