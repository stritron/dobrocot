<%@ page import="ru.inno.entity.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>--%>

<%@ page pageEncoding="UTF-8" %>
<%--
  Created by IntelliJ IDEA.
  User: ilya
  Date: 2019-02-12
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dobrocot</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.5/css/bootstrap-select.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.5/js/bootstrap-select.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.5/js/i18n/defaults-*.min.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark  justify-content-end">
    <ul class="navbar-nav">
        <%
            if (null == request.getAttribute("user")) {
                out.println("<li class=\"nav-item\"><a class=\"nav-link\" href=\"" + request.getContextPath() + "/\">Привет, Гость! </a></li>");
                out.println("<li class=\"nav-item\"><a class=\"nav-link\" href=\"" + request.getContextPath() + "/registration\">Регистрация</a></li>");
                out.println("<li class=\"nav-item\"><a class=\"nav-link\" href=\"" + request.getContextPath() + "/login\">Войти</a></li>");

            } else {
                out.println("<li class=\"nav-item\"><a class=\"nav-link\" href=\"" + request.getContextPath() + "/\">Привет, " + request.getAttribute("user") + "!</a></li>");
                out.println("<li class=\"nav-item\"><a class=\"nav-link\" href=\"" + request.getContextPath() + "/cabinet\">Личный кабинет</a></li>");
                out.println("<li class=\"nav-item\"><a class=\"nav-link\" href=\"" + request.getContextPath() + "/logout\">Выйти</a></li>");
            }
        %>
    </ul>
</nav>
<br>
<p>Текущее время: <%= new java.util.Date() %>
    <br/>
    Введите параметры поиска автомобиля!<br/>
    <form action="${pageContext.request.contextPath}/" method="post">
<p>
    <label>
        <select class="form-control" name="mark">
            <option selected disabled>Марка</option>
            <%
                List<Mark> marks = (List<Mark>) ((Map<String, Object>) request.getAttribute("filterOption")).get("marks");
                for (Mark mark : marks) {
                    out.println("<option value=" + mark.getId() + ">" + mark.getName() + "</option>");
                }
            %>
        </select>
    </label>

    <label>
        <select class="form-control" name="model">
            <option selected disabled>Модель</option>
            <%
                List<Model> models = (List<Model>) ((Map<String, Object>) request.getAttribute("filterOption")).get("models");
                for (Model model : models) {
                    out.println("<option value=" + model.getId() + ">" + model.getName() + "</option>");
                }
            %>
        </select>
    </label>

    <label>
        <select class="form-control" name="color">
            <option selected disabled>Цвет</option>
            <%
                List<Color> colors = (List<Color>) ((Map<String, Object>) request.getAttribute("filterOption")).get("colors");
                for (Color color : colors) {
                    out.println("<option value=" + color.getId() + ">" + color.getName() + "</option>");
                }
            %>
        </select>
    </label>

    <label>
        <select class="form-control" name="engine">
            <option selected disabled>Объем</option>
            <%
                List<Engine> engines = (List<Engine>) ((Map<String, Object>) request.getAttribute("filterOption")).get("engines");
                for (Engine engine : engines) {
                    out.println("<option value=" + engine.getId() + ">" + engine.getName() + "</option>");
                }
            %>
        </select>
    </label>

    <input class="btn btn-primary" type="submit" value="Поиск">
</p>
</form>

<br/>
<br/>
Найденные авто:<br/>
<!-- Modal body -->
<div class="modal-body">
    <table class="table table-striped table-sm">
        <thead class="thead-dark">
        <tr>
            <th>Владелец</th>
            <th>Марка</th>
            <th>Модель</th>
            <th>Год выпуска</th>
            <th>Количество сидений</th>
            <th>Цвет</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Car> cars = (List<Car>) request.getAttribute("result");
            if (!(null == cars)) {
                for (Car car : cars) {
                    out.println("<tr><form action=\"" + request.getContextPath() + "/carreserve\" method=\"post\">" +
                            "<td>" + car.getOwner().getName() + "</td>" +
                            "<td>" + car.getMark().getName() + "</td>" +
                            "<td>" + car.getModel().getName() + "</td>" +
                            "<td>" + car.getAssembledate().toString() + "</td>" +
                            "<td>" + car.getNumberofseats() + "</td>" +
                            "<td>" + car.getColor().getName() + "</td>" +
                            "<td>" + "<button name=\"car_id\" type=\"submit\" value=" + car.getId() + ">Выбрать</button></p></form>" + "</td>"
                            + "</tr>"
                    );
                }
            } else out.println("Ничего не найдено");
        %></tbody>
    </table>
</div>
</body>
</html>

