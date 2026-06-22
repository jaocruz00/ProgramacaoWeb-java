<%@page import="VO.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Editar Cliente</title>
</head>
<body>
<center>
    <h1>Editar Cliente</h1>

    <%
        Cliente c = (Cliente) request.getAttribute("cliente");
    %>

    <% if (c != null) { %>
    <form method="post" action="ClienteController?op=4">

        <input type="hidden" name="id" value="<%= c.getId() %>">

        Nome: <input type="text" name="nome" value="<%= c.getNome() %>" required><br><br>

        Telefone: <input type="text" name="telefone" value="<%= c.getTelefone() %>"><br><br>

        CPF: <input type="text" name="cpf" value="<%= c.getCpf() %>" required><br><br>

        Tipo de Ação: <input type="text" name="tipoAcao" value="<%= c.getTipoAcao() %>"><br><br>

        Status do Processo:
        <select name="status">
            <option value="Em andamento" <%= "Em andamento".equals(c.getStatus()) ? "selected" : "" %>>Em andamento</option>
            <option value="Concluído" <%= "Concluído".equals(c.getStatus()) ? "selected" : "" %>>Concluído</option>
            <option value="Aguardando documentos" <%= "Aguardando documentos".equals(c.getStatus()) ? "selected" : "" %>>Aguardando documentos</option>
        </select><br><br>

        <input type="submit" value="Salvar Alterações">
    </form>
    <% } else { %>
        <p>Cliente não encontrado.</p>
    <% } %>

    <br>
    <a href="index.html">Página Inicial</a>
</center>
</body>
</html>
