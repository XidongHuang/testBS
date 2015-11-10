package tony.project.language.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tony.project.language.domain.ScoresDetail;
import tony.project.language.interfaces.ScoresDetailDM;


@WebServlet("/loadServlet")
public class LoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ScoresDetailDM scoresDetailDM = new ScoresDetail();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String levelAndcourse = request.getParameter("levelNcourse");
		
		System.out.println(levelAndcourse);
		
		String methodName = "load" + levelAndcourse;
		
		Method method = null;
		
		
		try {
			
			method = getClass().getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
			
			method.invoke(this, request,response);
		} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException e) {

			response.sendRedirect("error.jsp");
			
		}
		
		
		
		
		
		
		response.setContentType("text/html;chartset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			out.println(levelAndcourse);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	}
	
	
	private void loadL1G(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String filterConditionName = "CourseCode";
		String filterConditionValue = "15WinL1Gar";
		
		List<ScoresDetail> scoresDetails = (ArrayList<ScoresDetail>)scoresDetailDM.loadScoresDetails(filterConditionName, filterConditionValue);
		System.out.println(scoresDetails);
		
	}
	
	

}
