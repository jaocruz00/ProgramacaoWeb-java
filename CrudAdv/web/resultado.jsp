<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Resultado</title>
</head>
<body>
<center>
    <h1>Resultado da Operação</h1>
    <h2><%= request.getParameter("result") %></h2>
    <br><br>
    <a href="index.html">Página Inicial</a>
</center>
</body>
</html>
