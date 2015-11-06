package tony.project.language.servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import tony.project.language.formatter.ExcelToJSON;
import tony.project.language.interfaces.ExcelToJSONOM;






@WebServlet("/handleServlet")
@MultipartConfig
public class HandleServlet extends HttpServlet {
	
	ExcelToJSONOM excelToJSONOM = new ExcelToJSON();
	
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		Part a = request.getPart("file");
		String fileName = a.getSubmittedFileName();
		System.out.println(fileName);
		InputStream fileContent = a.getInputStream();
		System.out.println(fileContent);
		
//		byte[] b = new byte[1024];
//		int len;
//		while((len = fileContent.read(b)) != -1){
//			String str = new String(b,0,len);
//			System.out.println(str);
//			
//		}
		
		String excel = excelToJSONOM.getJSON(fileContent);
		System.out.println(excel);
	
		
	}
	

	
	
}
