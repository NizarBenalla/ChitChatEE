package com.nizar.chitchatee.controlers;

import com.nizar.chitchatee.dao.impl.UserDAOImpl;
import com.nizar.chitchatee.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class UserCreationServlet extends HttpServlet {
    private UserDAOImpl userDAO;

    public void init() {
        userDAO = new UserDAOImpl();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String username = request.getParameter("username");
        HttpSession session = request.getSession();
        String sessionID = session.getId();
        User nizar = new User();
        nizar.setUsername(username);
        nizar.setSessionID(sessionID);

        userDAO.save(nizar);

        int i = nizar.getId();
        request.setAttribute("amina", i);
        request.getRequestDispatcher("/chatting.jsp").forward(request, response);

    }

    public void destroy() {
    }
}
