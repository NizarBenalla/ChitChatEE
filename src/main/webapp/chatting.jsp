<%@ page import="java.util.List" %>
<%@ page import="com.nizar.chitchatee.models.Message" %>
<%@ page import="com.nizar.chitchatee.models.User" %>
<%@ page import="com.nizar.chitchatee.dao.impl.UserDAOImpl" %>
<%@ page import="com.nizar.chitchatee.dao.impl.MessageDAOImpl" %>

<!DOCTYPE html>
<html>
<head>
    <title>Chat Interface</title>
    <style>
        /* Reset default styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        /* Body styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            padding: 20px;
        }

        /* Chat room styles */
        .chat-room {
            height: 300px;
            width: 400px;
            border: 1px solid #ccc;
            padding: 10px;
            overflow-y: scroll;
        }

        .chat-room p {
            margin: 5px 0;
        }

        .chat-room b {
            font-weight: bold;
        }

        /* Input form styles */
        form {
            margin-top: 20px;
        }

        input[type="text"] {
            width: 300px;
            padding: 5px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"] {
            padding: 5px 10px;
            font-size: 14px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h1>Welcome to the chat room</h1>

<div class="chat-room" id="chatRoom">
    <%
        MessageDAOImpl messageDAO = new MessageDAOImpl();
        List<Message> messages = messageDAO.findAll();
        UserDAOImpl userDAO = new UserDAOImpl();
        for (Message message : messages) {
            User user = userDAO.findById(message.getUser_id());
            String username = (user != null && user.getUsername() != null) ? user.getUsername() : "Unknown User";
    %>
    <p><b><%= username %>:</b> <%= message.getContent() %></p>
    <%
        }
    %>
</div>

<form action="MessageServlet" method="post">
    <input type="text" name="message" placeholder="Type your message..." required>
    <input type="hidden" name="senderID2" value="${amina}">
    <input type="submit" value="Send">
</form>

<script>
    var chatRoom = document.getElementById('chatRoom');
    chatRoom.scrollTop = chatRoom.scrollHeight;
    document.getElementById("senderID").value = "";
</script>
</body>
</html>
