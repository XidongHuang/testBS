package tony.project.language.filters;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tony.project.language.domain.Staff;
import tony.project.language.interfaces.StaffDM;

/**
 * Servlet Filter implementation class Login
 */
public class Login extends HttpFilter implements Filter {


	@Override
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		
		 System.out.println("Again");
		List<String> uncheckedURL = Arrays.asList("/login.html");

		String servletPath = request.getServletPath();

		if (uncheckedURL.contains(servletPath)) {
			chain.doFilter(request, response);
			return;
		}

		Staff staff = (Staff) request.getAttribute("staff");
		
		if (staff != null) {
			System.out.println("filter "+staff);
			chain.doFilter(request, response);
		}

		response.sendRedirect(request.getContextPath() + "/login.html");
	}

	
	
	
}
