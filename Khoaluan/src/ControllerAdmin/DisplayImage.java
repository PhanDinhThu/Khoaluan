package ControllerAdmin;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DisplayImage")
public class DisplayImage extends HttpServlet {
	
    private static final int DEFAULT_BUFFER_SIZE = 10240; // 10KB.

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
    	String imageId = request.getParameter("imageId");
    	
    	
    	response.setContentType("image/jpeg");  
        ServletOutputStream out;  
        out = response.getOutputStream();  
        FileInputStream fin = new FileInputStream(imageId);  
          
        BufferedInputStream bin = new BufferedInputStream(fin);  
        BufferedOutputStream bout = new BufferedOutputStream(out);  
        int ch =0; ;  
        while((ch=bin.read())!=-1)  
        {  
        bout.write(ch);  
        }  
          
        bin.close();  
        fin.close();  
        bout.close();  
        out.close();  
    }


}
