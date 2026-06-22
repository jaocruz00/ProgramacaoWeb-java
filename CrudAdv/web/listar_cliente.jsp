<%@page import="java.util.ArrayList"%>
<%@page import="VO.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Clientes Cadastrados</title>
</head>
<body>
<center>
    <h1>Clientes Cadastrados</h1>

    <%
        ArrayList<Cliente> clientes = (ArrayList<Cliente>) request.getAttribute("lista");

        if (clientes != null && !clientes.isEmpty()) {
            out.print("<table border='1' width='90%' cellpadding='5' cellspacing='0'>");
            out.print("<tr>");
            out.print("<th>ID</th>");
            out.print("<th>Nome</th>");
            out.print("<th>Telefone</th>");
            out.print("<th>CPF</th>");
            out.print("<th>Tipo de Ação</th>");
            out.print("<th>Status</th>");
            out.print("<th>Ações</th>");
            out.print("</tr>");

            for (Cliente c : clientes) {
                out.print("<tr>");
                out.print("<td>" + c.getId()        + "</td>");
                out.print("<td>" + c.getNome()      + "</td>");
                out.print("<td>" + c.getTelefone()  + "</td>");
                out.print("<td>" + c.getCpf()       + "</td>");
                out.print("<td>" + c.getTipoAcao()  + "</td>");
                out.print("<td>" + c.getStatus()    + "</td>");
                out.print("<td>"
                        + "<a href='ClienteController?op=3&id=" + c.getId() + "'>Editar</a> | "
                        + "<a href='ClienteController?op=5&id=" + c.getId() + "' "
                        + "onclick=\"return confirm('Confirma exclusão?');\">Excluir</a> | "
                        + "<a href='GerarTxt?id=" + c.getId() + "'>Gerar TXT</a>"
                        + "</td>");
                out.print("</tr>");
            }
            out.print("</table>");
        } else {
            out.print("<p>Nenhum cliente cadastrado.</p>");
        }
    %>

    <br><br>
    <a href="index.html">Página Inicial</a>
</center>
</body>
</html>
