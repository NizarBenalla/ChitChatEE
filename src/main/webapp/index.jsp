<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>JSP - Chat Room</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
    </style>
</head>

<body>
<br/>
<form method="post" action="hello-servlet" class="container">
    <div class="mb-3">
        <label for="username" class="form-label">Nom :</label>
        <input type="text" class="form-control" id="username" name="username">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
