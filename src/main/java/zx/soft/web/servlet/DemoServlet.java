package zx.soft.web.servlet;

import zx.soft.web.source.GetInterface;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class DemoServlet extends HttpServlet {
	
	GetInterface getInterface = new GetInterface();

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		PrintWriter writer = response.getWriter();
		Object result = getInterface.getData("http://localhost:8080/rpc-api/");
		writer.print(result);
	}

}
