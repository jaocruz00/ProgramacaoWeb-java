<%@page import="java.util.ArrayList"%>
<%@page import="VO.Agendamento"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Agenda</title>

</head>

<body>

<h2>Agenda de Atendimento</h2>

<form action="AgendamentoController?op=1"
      method="post">

Data:

<br>

<input type="date"
       name="data"
       required>

<br><br>

Horário:

<br>

<select name="horario">

<option>08:00:00</option>

<option>09:00:00</option>

<option>10:00:00</option>

<option>11:00:00</option>

<option>14:00:00</option>

<option>15:00:00</option>

<option>16:00:00</option>

<option>17:00:00</option>

</select>

<br><br>

Descrição:

<br>

<input type="text"
       name="descricao"
       required>

<br><br>

<input type="submit"
       value="Agendar">

</form>

<hr>

<h3>Horários Ocupados</h3>

<table border="1">

<tr>

<th>Data</th>

<th>Horário</th>

<th>Descrição</th>

</tr>

<%

ArrayList<Agendamento> agenda =
(ArrayList<Agendamento>)
request.getAttribute("agenda");

if(agenda != null){

for(Agendamento a : agenda){

%>

<tr bgcolor="#ff9999">

<td>
<%=a.getData()%>
</td>

<td>
<%=a.getHorario()%>
</td>

<td>
<%=a.getDescricao()%>
</td>

</tr>

<%
}
}
%>

</table>

<br>

<a href="AgendamentoController?op=2">

Atualizar Agenda

</a>

<br><br>

<a href="index.html">

Voltar ao Menu

</a>

</body>

</html>