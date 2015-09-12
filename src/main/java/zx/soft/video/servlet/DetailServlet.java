package zx.soft.video.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zx.soft.video.Impl.DetailDao;
import zx.soft.video.model.Details;

public class DetailServlet extends HttpServlet {

	private static final long serialVersionUID = -6718499963140222139L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				  List<Details> list = new DetailDao().getDetails();
				  request.setAttribute("list", list);
				  request.getRequestDispatcher("table.jsp").forward(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	

}
