<!DOCTYPE html>
<html>
<head>
    <title>SportStore</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }
        h1, h4, h3 {
            color: #2c3e50;
        }
        a {
            color: #2980b9;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table th, table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        table th {
            background-color: #2980b9;
            color: #fff;
        }
    </style>
</head>
<body class="container">
<h1>SportStore</h1>
<h4>Авторизация</h4>
<form action = "/login" method = "post">
    Эл. почта <input type = "email" name = "username"><br><br>
    Пароль <input type = "password" name = "password"><br><br>
    <input type = "hidden" name = "_csrf" value="${_csrf.token}">
    <input type = "submit" value = "Вход">
</form>
<a href = "/registration"> Зарегистрироваться</a>
</body>
</html>