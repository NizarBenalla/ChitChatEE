package com.nizar.chitchatee.controlers;

import com.nizar.chitchatee.dao.impl.MessageDAOImpl;
import com.nizar.chitchatee.models.Message;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "MessageServlet", value = "/MessageServlet")
public class MessageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Message myMessage = new Message();
        MessageDAOImpl messageDAO = new MessageDAOImpl();
        HttpSession session = request.getSession();
        String sessionID = session.getId();
        String content = request.getParameter("message");
        int parameterValue;
        String value = request.getParameter("senderID2");
        try {
            parameterValue = Integer.parseInt(value);
        } catch (NumberFormatException e) {
            parameterValue = 1;
            e.printStackTrace();
        }

        myMessage.setContent(content);
        myMessage.setUser_id(Integer.parseInt(String.valueOf(parameterValue)));
        myMessage.setSession(sessionID);
        messageDAO.save(myMessage);
        this.getServletContext().getRequestDispatcher("/chatting.jsp").forward(request, response);

    }
}
