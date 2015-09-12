package zx.soft.video.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zx.soft.video.Impl.UserDao;
import zx.soft.video.model.Users;



public class LoginServlet extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Users users = new Users();
		users.setUname(request.getParameter("uname").toString());
		users.setUpass(request.getParameter("upass").toString());
		System.out.println(users.getUname());
		System.out.println(users.getUpass());
		if((new UserDao().login(users)) == null){
			//fail
			response.sendRedirect("login.jsp");
		}else{
			//sucess
			HttpSession session = request.getSession(false);
			session.setAttribute("uname", users.getUname());
			response.sendRedirect("servlet");
		}

	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
