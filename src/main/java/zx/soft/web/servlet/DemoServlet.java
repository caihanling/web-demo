package zx.soft.web.servlet;

import zx.soft.web.source.GetInterface;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by jimbo on 9/17/15.
 */
public class DemoServlet extends HttpServlet {

    GetInterface getInterface = new GetInterface();
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        response.setCharacterEncoding("UTF-8");
        PrintWriter writer = response.getWriter();
        Object result = getInterface.getData("http://192.168.6.200:8080/apt-api/");
        writer.print(result);
    }
}
