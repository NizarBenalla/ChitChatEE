<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.nizar.chitchatee.models.Message" %>
<%@ page import="com.nizar.chitchatee.models.User" %>
<%@ page import="com.nizar.chitchatee.dao.impl.UserDAOImpl" %>
<%@ page import="com.nizar.chitchatee.dao.impl.MessageDAOImpl" %>

<%
    MessageDAOImpl messageDAO = new MessageDAOImpl();
    List<Message> messages = messageDAO.findAll();
    UserDAOImpl userDAO = new UserDAOImpl();
    for (Message message : messages) {
        User user = userDAO.findById(message.getUser_id());
        String username = (user != null && user.getUsername() != null) ? user.getUsername() : "Unknown User";
%>
<div class="message">
    <span class="user"><%= username %>:</span>
    <span class="content"><%= message.getContent() %></span>
</div>
<%
    }
%>
