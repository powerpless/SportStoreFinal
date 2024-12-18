<!DOCTYPE html>
<html lang="ru">
<head>
    <title>INFO</title>
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
</head >
<body class="container">
<h1>Product</h1><hr>
<h4>подробная информация о товаре</h4>
<#list images as img>
    <img src="/images/${img.id}" width = "60px" height="60px"/><br><br>
</#list>
<b>Название товара: </b>${product.title}<br>
<b>Описание товара: </b>${product.description}<br>
<b>Категория: </b>${product.category}<br>
<b>Цена: </b>${product.price}<br>
<b>Автор товара: </b><a href="/user/${product.user.id}">  ${product.user.name}</a><br>
<form action ="/product/delete/${product.id}" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type = "submit" value = "Удалить товар"/>
</form>
<form action="/product/update/${product.id}" method="post">
    <input type="hidden" name="_method" value="PUT">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="text" name="title" placeholder="Название" value="${product.title}">
    <input type="number" name="price" placeholder="Цена" value="${product.price}">
    <button type="submit">Изменить товар</button>
</form>
</body>
</html>