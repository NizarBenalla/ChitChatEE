<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Chat Interface</title>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #36393f;
            color: #fff;
            padding: 20px;
        }

        .chat-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .chat-room {
            height: 300px;
            width: 400px;
            border: 1px solid #ccc;
            background-color: #2f3136;
            padding: 10px;
            overflow-y: scroll;
            margin-bottom: 20px;
            border-radius: 10px;
        }

        .chat-room p {
            margin: 5px 0;
            color: #fff;
        }

        .chat-room b {
            font-weight: bold;
            color: #fff;
        }

        .message-form {
            display: flex;
            align-items: center;
        }

        .message-form input[type="text"] {
            width: 300px;
            padding: 5px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 3px;
            background-color: #36393f;
            color: #fff;
        }

        .message-form input[type="submit"] {
            padding: 5px 10px;
            font-size: 14px;
            background-color: #7289da;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .message-form input[type="submit"]:hover {
            background-color: #677bc4;
        }
    </style>
</head>

<body>
<div class="chat-container">
    <h1>Welcome to the chat room</h1>

    <div class="chat-room" id="chatRoom"></div>

    <form action="MessageServlet" method="post" id="messageForm" class="message-form">
        <input type="text" name="message" placeholder="Type your message..." required>
        <input type="hidden" name="senderID2" value="${userID}">
        <input type="submit" value="Send">
    </form>
</div>

<script>
    function refreshChatRoom() {
        $.ajax({
            url: 'chatting.jsp',
            type: 'GET',
            success: function (data) {
                $('#chatRoom').html(data);
                $('#chatRoom').scrollTop($('#chatRoom')[0].scrollHeight);
            },
            error: function () {
                console.log('Error occurred while refreshing the chat room.');
            }
        });
    }

    refreshChatRoom();

    setInterval(refreshChatRoom, 3000);

    $('#messageForm').submit(function (e) {
        e.preventDefault();

        var formData = $(this).serialize();

        $.ajax({
            url: 'MessageServlet',
            type: 'POST',
            data: formData,
            success: function () {
                $('#messageForm')[0].reset();
                refreshChatRoom();
            },
            error: function () {
                console.log('Error occurred while sending the message.');
            }
        });
    });
</script>
</body>
</html>
