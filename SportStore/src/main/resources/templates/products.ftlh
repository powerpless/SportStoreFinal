<!DOC-TYPE html>
<html lang="ru">
<head>
    <title>products</title>
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
<h1>SportStore</h1><hr>
<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i></h3>
    <form action ="/logout" method = "post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type = "submit" value = "Выйти"/>
    </form>
    <#if user.isAdmin()>
        <a href="/admin">Панель администратора</a>
    </#if>
<#else>
    <a href ="/login">Войти</a>
</#if>
<hr>
<h4>Товары со всего города</h4>
<form action="/" method="get">
    Поиск по названию объявления: <label>
        <input type="text" name="title">
    </label><br>
    <input type="submit" value="Поиск"/>
</form>
<#list products as product>
    <div>
        <p>
            <b>${product.title}</b>  ${product.price} тг. | <a href="/product/${product.id}">Подробнее...</a>
        </p>
    </div>
    <#else>
    <h3>Товаров нет.</h3>
</#list>
<#if user.email??>
<hr>
<h3>Создать новый товар</h3>
    <form id="productForm" action="/product/create" method="post" enctype="multipart/form-data">
        <label for="title">Название объявления:</label>
        <input type="text" id="title" name="title" required placeholder="Введите название объявления"/><br><br>

        <label for="description">Описание объявления:</label>
        <input type="text" id="description" name="description" required placeholder="Введите описание объявления"/><br><br>

        <label for="category">Категория:</label>
        <input type="text" id="category" name="category" required placeholder="Введите категорию"/><br><br>

        <label for="price">Цена:</label>
        <input type="number" id="price" name="price" required placeholder="Введите цену товара"/><br><br>

        <label for="file1">Первая фотография:</label>
        <input type="file" id="file1" name="file1" required/><br><br>

        <label for="file2">Вторая фотография:</label>
        <input type="file" id="file2" name="file2"/><br><br>

        <label for="file3">Третья фотография:</label>
        <input type="file" id="file3" name="file3"/><br><br>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <button type="submit" id="submitButton" disabled>Добавить товар</button>
    </form>

    <script>
        function validateForm() {
            const title = document.getElementById("title").value;
            const description = document.getElementById("description").value;
            const category = document.getElementById("category").value;
            const price = document.getElementById("price").value;
            const file1 = document.getElementById("file1").files.length;
            const submitButton = document.getElementById("submitButton");

            if (title && description && category && price && file1 > 0) {
                submitButton.disabled = false;
            } else {
                submitButton.disabled = true;
            }
        }

        document.getElementById("title").addEventListener("input", validateForm);
        document.getElementById("description").addEventListener("input", validateForm);
        document.getElementById("category").addEventListener("input", validateForm);
        document.getElementById("price").addEventListener("input", validateForm);
        document.getElementById("file1").addEventListener("change", validateForm);

        window.onload = validateForm;
    </script>

</#if>
</body>
</html>