package library;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.bookMgr;


@WebServlet("/insertPost")
public class insertPost extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		bookMgr bMgr = new bookMgr();
		bMgr.insertBoard(request);
		response.sendRedirect("main.jsp");
	}

}
