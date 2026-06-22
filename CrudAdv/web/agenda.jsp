<%@page import="java.util.ArrayList"%>
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

    <h2>Novo Agendamento</h2>
    <form method="post" action="AgendamentoController?op=1">
        Data: <input type="date" name="data" required><br><br>
        Horário: <input type="time" name="horario" required><br><br>
        Descrição:<br>
        <textarea name="descricao" rows="4" cols="40"></textarea><br><br>
        <input type="submit" value="Agendar">
    </form>

    <br><br>
    <h2>Agendamentos</h2>

    <%
        ArrayList<Agendamento> agenda = (ArrayList<Agendamento>) request.getAttribute("agenda");

        if (agenda != null && !agenda.isEmpty()) {
            out.print("<table border='1' width='80%' cellpadding='5' cellspacing='0'>");
            out.print("<tr><th>Data</th><th>Horário</th><th>Descrição</th></tr>");
            for (Agendamento a : agenda) {
                out.print("<tr>");
                out.print("<td>" + a.getData()      + "</td>");
                out.print("<td>" + a.getHorario()   + "</td>");
                out.print("<td>" + a.getDescricao() + "</td>");
                out.print("</tr>");
            }
            out.print("</table>");
        } else {
            out.print("<p>Nenhum agendamento cadastrado.</p>");
        }
    %>

    <br><br>
    <a href="index.html">Página Inicial</a>
</center>
</body>
</html>
