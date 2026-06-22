<%@page import="java.util.ArrayList"%>
<%@page import="VO.Cliente"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes</title>
</head>

<body>

<h2>Clientes Cadastrados</h2>

<a href="cadastrar_cliente.jsp">
    Novo Cliente
</a>

<br><br>

<table border="1">

    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>CPF</th>
        <th>Status</th>
        <th>Última Alteração</th>
        <th>Ações</th>
    </tr>

<%

ArrayList<Cliente> lista =
(ArrayList<Cliente>)request.getAttribute("lista");

for(Cliente c : lista){

%>

<tr>

<td>
<%=c.getId()%>
</td>

<td>
<%=c.getNome()%>
</td>

<td>
<%=c.getCpf()%>
</td>

<td>
<%=c.getStatus()%>
</td>

<td>
<%=c.getUltimaAlteracao()%>
</td>

<td>

<a href="ClienteController?op=3&id=<%=c.getId()%>">
Editar
</a>

|

<a href="ClienteController?op=5&id=<%=c.getId()%>"
onclick="return confirm('Excluir cliente?')">
Excluir
</a>

|

<a href="GerarTxt?id=<%=c.getId()%>">
TXT
</a>

</td>

</tr>

<%
}
%>

</table>

</body>
</html>