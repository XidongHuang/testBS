package tony.project.language.servlet;

import java.io.File;
import java.io.FileDescriptor;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.mail.Session;
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String lNcSaving = request.getParameter("levelNcourseUpload");
		System.out.println(lNcSaving);
		
		
		
		File fold;
		InputStream fileContent = null;
		FileOutputStream fop = null;
		FileDescriptor fd = null;
		
		if(lNcSaving != null){
		
		try {

			Part a = request.getPart("file");
			String fileName = a.getSubmittedFileName();
			System.out.println(fileName);
			fileContent = a.getInputStream();
			System.out.println(fileContent);

			String excel = excelToJSONOM.getJSON(fileContent);
			System.out.println(excel);

			fold = new File("/home/tony/workspace/testBS/WebContent/json/L1Grammar.json");
			fop = new FileOutputStream(fold, false);

			fd = fop.getFD();
			if (!fold.exists()) {
				fold.createNewFile();
			}

			byte[] contentInByte = excel.getBytes();


			fop.write(contentInByte);
			fop.flush();
			fd.sync();
			
			String levelNCourse = "L1G";
			request.getSession().setAttribute("lNc", levelNCourse);
			
			response.sendRedirect("index.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				fileContent.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				fop.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		
		}

	}

}
