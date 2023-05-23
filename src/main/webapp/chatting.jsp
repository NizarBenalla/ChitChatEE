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
        /* Style the chat room interface */
        .chat-room {
            height: 300px;
            width: 400px;
            border: 1px solid #ccc;
            padding: 10px;
            overflow-y: scroll;
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
    <p><b><%= username %>:</b> <%= message.getContent() %>
    </p>
    <%
        }
    %>
</div>

<form action="MessageServlet" method="post">
    <input type="text" name="message" placeholder="Type your message..." required>
    <input type="hidden" name="senderID2" value=senderID>
    <input type="submit" value="Send">
</form>


<script>
    var chatRoom = document.getElementById('chatRoom');
    chatRoom.scrollTop = chatRoom.scrollHeight;
    document.getElementById("senderID").value = "<%= request.getParameter("amina") %>";

</script>
</body>
</html>
