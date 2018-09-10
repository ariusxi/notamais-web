/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/**
 *
 * @author Windows 7
 */
public class API {

    //Produção
    private static final String baseurl = "https://notamaisapi.herokuapp.com/";
    //Desenvolvimento
    //private static final String baseurl = "http://localhost:3000/";
    private String token;
    private String query;
    private String method;
    

    public API(String query, String method, String token) {
        this.query = query;
        this.method = method;
        this.token = token;
    }

    public String getJsonString(HashMap<String, String> postDataParams) throws RuntimeException, IOException {

        String requesturl = baseurl + "" + query;

        StringBuilder strBuf = new StringBuilder();

        HttpURLConnection conn = null;
        BufferedReader reader = null;

        InputStreamReader res;

        try {
            URL url = new URL(requesturl);
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod(method);
            conn.setRequestProperty("Accept", "application/json");
            conn.setRequestProperty("x-access-token", token);

            if (method.equals("POST")) {
                conn.setDoInput(true);
                conn.setDoOutput(true);

                OutputStream os = conn.getOutputStream();
                BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(os, "UTF-8"));
                writer.write(getPostDataString(postDataParams));

                writer.flush();
                writer.close();
                os.close();
            }
            
            if(conn.getResponseCode() != 200 && conn.getResponseCode() != 201){
                String line, response = "";
                InputStream errorstream = conn.getErrorStream();
                BufferedReader br = new BufferedReader(new InputStreamReader(errorstream));
                while((line = br.readLine()) != null){
                    response += line;
                }
                
                return response;
            }
            
            reader = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
            String output = null;
            while ((output = reader.readLine()) != null) {
                strBuf.append(output);
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                conn.disconnect();
            }
        }

        System.out.println(strBuf.toString());
        return strBuf.toString();

    }
    
    public String multipart(String filepath, String filefield, String fileMimeType) throws IOException{
        HttpURLConnection conn = null;
        DataOutputStream outputStream = null;
        InputStream inputStream = null;
        BufferedReader reader = null;
        
        StringBuilder strBuf = new StringBuilder();
        
        String twoHyphens = "--";
        String boundary = "*****" + Long.toString(System.currentTimeMillis()) + "*****";
        String lineEnd = "\r\n";
        
        String result = "";
        String requesturl = baseurl + "" + query;
        
        int bytesRead, bytesAvailable, bufferSize;
        byte[] buffer;
        int maxBufferSize = 1 * 1024 * 1024;
        
        String[] q = filepath.split("/");
        int idx = q.length - 1;
        
        try{
            File file = new File(filepath);
            FileInputStream fileInputStream = new FileInputStream(file);
            
            URL url = new URL(requesturl);
            conn = (HttpURLConnection) url.openConnection();
            
            conn.setDoInput(true);
            conn.setDoOutput(true);
            conn.setUseCaches(false);
            
            conn.setRequestMethod(method);
            conn.setRequestProperty("Connection", "Keep-Alive");
            conn.setRequestProperty("User-Agent", "Android Multipart HTTP Client 1.0");
            conn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
            
            outputStream = new DataOutputStream(conn.getOutputStream());
            outputStream.writeBytes(twoHyphens + boundary + lineEnd);
            outputStream.writeBytes("Content-Disposition: form-data; name=\"" + filefield + "\"; filename=\"" + q[idx] + "\"" + lineEnd);
            outputStream.writeBytes("Content-Type: " + fileMimeType + lineEnd);
            outputStream.writeBytes("Content-Transfer-Encoding: binary" + lineEnd);
            
            outputStream.writeBytes(lineEnd);
            
            bytesAvailable = fileInputStream.available();
            bufferSize = Math.min(bytesAvailable, maxBufferSize);
            buffer = new byte[bufferSize];
            
            bytesRead = fileInputStream.read(buffer, 0, bufferSize);
            while (bytesRead > 0){
                outputStream.write(buffer, 0, bufferSize);
                bytesAvailable = fileInputStream.available();
                bufferSize = Math.min(bytesAvailable, maxBufferSize);
                bytesRead = fileInputStream.read(buffer, 0, bufferSize);
            }
            
            outputStream.writeBytes(lineEnd);
            
            if(conn.getResponseCode() != 200 && conn.getResponseCode() != 201){
                String line, response = "";
                InputStream errorstream = conn.getErrorStream();
                BufferedReader br = new BufferedReader(new InputStreamReader(errorstream));
                while((line = br.readLine()) != null){
                    response += line;
                }
                
                return response;
            }
            
            reader = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
            String output = null;
            while ((output = reader.readLine()) != null) {
                strBuf.append(output);
            }
        }catch(Exception e){
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                conn.disconnect();
            }
        }

        System.out.println(strBuf.toString());
        return strBuf.toString();
    }

    private String getPostDataString(HashMap<String, String> params) throws UnsupportedEncodingException {
        StringBuilder result = new StringBuilder();
        boolean first = true;
        for (Map.Entry<String, String> entry : params.entrySet()) {
            if (first) {
                first = false;
            } else {
                result.append("&");
            }

            System.out.println(entry.getKey());
            result.append(URLEncoder.encode(entry.getKey(), "UTF-8"));
            result.append("=");
            result.append(URLEncoder.encode(entry.getValue(), "UTF-8"));
        }

        return result.toString();
    }

}
