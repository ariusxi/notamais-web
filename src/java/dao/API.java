/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/**
 *
 * @author Windows 7
 */
public class API {
    
    private static final String baseurl = "https://notamaisapi.herokuapp.com/";
    private String query;
    private String method;
    
    public API(String query, String method){
        this.query = query;
        this.method = method;
    }
    
    public String getJsonString() throws RuntimeException{
        
        String requesturl = baseurl+""+query;
        
        StringBuilder strBuf = new StringBuilder();
        
        HttpURLConnection conn = null;
        BufferedReader reader = null;
        
        try{
            URL url = new URL(requesturl);
            conn  = (HttpURLConnection)url.openConnection();
            conn.setRequestMethod(method);
            conn.setRequestProperty("Accept", "application/json");
            
            if(conn.getResponseCode() != 200){
                throw new RuntimeException("HTTP GET Request Failed with Error code : "
                              + conn.getResponseCode());
            }
            
            reader = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
            String output = null;
            while((output = reader.readLine()) != null)
                strBuf.append(output);
        }catch(MalformedURLException e){
            e.printStackTrace();
        }catch(IOException e){
            e.printStackTrace();
        }finally{
            if(reader != null){
                try{
                    reader.close();
                }catch(IOException e){
                    e.printStackTrace();
                }
            }
            if(conn != null){
                conn.disconnect();
            }
        }
        
        return strBuf.toString();
        
    }
    
}
