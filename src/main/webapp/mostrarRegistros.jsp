<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registros</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="text-center mb-4">Registros</h2>

    <div class="card shadow p-4">
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Nombre</th>
                    <th>Edad</th>
                    <th>Documento</th>
                    <th>Dirección</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/formulario_db", "root", "");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM personas");
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("nombre") %></td>
                    <td><%= rs.getInt("edad") %></td>
                    <td><%= rs.getString("documento") %></td>
                    <td><%= rs.getString("direccion") %></td>
                </tr>
                <%
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                %>
            </tbody>
        </table>
    </div>

    <div class="text-center mt-3">
        <a href="index.jsp" class="btn btn-secondary">Volver al formulario</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
