<%@page import="java.util.ArrayList"%>
<%@page import="VO.Cliente"%>
<%@page import="VO.Agendamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Agenda de Atendimento</title>
</head>
<body>
<center>
    <h1>Agenda de Atendimento</h1>

    <%
        ArrayList<Cliente> clientes =
                (ArrayList<Cliente>) request.getAttribute("clientes");
    %>

    <form method="post" action="AgendamentoController?op=1">

        Cliente:
        <select name="clienteId" required>
            <option value="">Selecione um cliente</option>

            <%
                if (clientes != null && !clientes.isEmpty()) {
                    for (Cliente c : clientes) {
            %>
                <option value="<%= c.getId() %>">
                    <%= c.getNome() %>
                </option>
            <%
                    }
                }
            %>
        </select>

        <br><br>

        Data:
        <input type="date" name="data" required>

        <br><br>

        Horário:
        <input type="time" name="horario" required>

        <br><br>

        Descrição:
        <input type="text" name="descricao" required>

        <br><br>

        <input type="submit" value="Agendar">
    </form>

    <hr>

    <h2>Atendimentos Agendados</h2>

    <%
        ArrayList<Agendamento> agenda =
                (ArrayList<Agendamento>) request.getAttribute("agenda");

        if (agenda != null && !agenda.isEmpty()) {

            out.print("<table border='1' width='80%' cellpadding='5' cellspacing='0'>");
            out.print("<tr>");
            out.print("<th>ID</th>");
            out.print("<th>ID Cliente</th>");
            out.print("<th>Data</th>");
            out.print("<th>Horário</th>");
            out.print("<th>Descrição</th>");
            out.print("</tr>");

            for (Agendamento a : agenda) {
                out.print("<tr>");
                out.print("<td>" + a.getId() + "</td>");
                out.print("<td>" + a.getClienteId() + "</td>");
                out.print("<td>" + a.getData() + "</td>");
                out.print("<td>" + a.getHorario() + "</td>");
                out.print("<td>" + a.getDescricao() + "</td>");
                out.print("</tr>");
            }

            out.print("</table>");

        } else {

            out.print("<p>Nenhum agendamento cadastrado.</p>");
        }
    %>

    <br>
    <a href="index.html">Página Inicial</a>
</center>
</body>
</html>