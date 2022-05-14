package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UserDetails;
import service.IUserDetailsService;
import service.UserDetailsServiceImpl;


	@WebServlet("/UserDetails")
	public class UserDetailsServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
	    public UserDetailsServlet() {
	        super();
	    }

	    @WebEndPoint(name="UserDetailsServiceImpl")
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.sendRedirect("/user/user.jsp");
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	String action = request.getParameter("action");
	    	
	    	if(action.equalsIgnoreCase("NE")) { 
	    		IUserDetailsService userService = new UserDetailsServiceImpl();
	    		userService.addUserDetail(new UserDetails(
	    				0, 
	    				request.getParameter("name"), 
	    				request.getParameter("address"), 
	    				request.getParameter("phone"), 
	    				request.getParameter("email"), 
	    				request.getParameter("acc")));
	    	
	    		response.sendRedirect("/user/user.jsp");
	    	}
	    	else if(action.equalsIgnoreCase("UP")) {
	    		IUserDetailsService userService = new UserDetailsServiceImpl();
	    		userService.updateUser(Integer.parseInt(request.getParameter("id")), new UserDetails(
	    				Integer.parseInt(request.getParameter("id")), 
	    				request.getParameter("name"), 
	    				request.getParameter("address"), 
	    				request.getParameter("phone"), 
	    				request.getParameter("email"), 
	    				request.getParameter("acc")));
	    		  		
	    		response.sendRedirect("/user/user.jsp");
	    	}
	    	else if(action.equalsIgnoreCase("DL")) {
	    		IUserDetailsService userService = new UserDetailsServiceImpl();
	    		userService.removeUserDetail(Integer.parseInt(request.getParameter("id")));
	    		
	    		response.sendRedirect("/user/user.jsp");
	    	}
	    	
		}

}
