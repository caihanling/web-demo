package zx.soft.video.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zx.soft.video.Impl.DetailDao;
import zx.soft.video.model.Details;


public class UpdateServlet extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Details detail = new Details();
		detail.setDid(Integer.parseInt(request.getParameter("did").toString()));
		detail.setDescribe(request.getParameter("describe").toString());
		new DetailDao().updateDescribe(detail);
		
		List<Details> list = new DetailDao().getDetails();
		request.setAttribute("list", list);
		request.getRequestDispatcher("table.jsp").forward(request, response);

	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
//	public static void main (String args[]){
//		Details details = new Details();
//		details.setDid(1);
//		details.setDescribe("abcd");
//		new DetailDao().updateDescribe(details);
//		List list = new DetailDao().getDetails();
//		System.err.println(list.get(0).toString());
//	}

}
