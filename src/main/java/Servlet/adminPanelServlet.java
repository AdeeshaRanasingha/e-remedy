package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.OderModel;
import Services.orderServices;


@WebServlet("/adminPanelServlet")
public class adminPanelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public adminPanelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<OderModel> orders = orderServices.showData();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("adminPanel.jsp").forward(request, response);
        
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
