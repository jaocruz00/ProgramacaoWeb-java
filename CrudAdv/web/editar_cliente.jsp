<%@page import="VO.Cliente"%>

<%

Cliente c =
(Cliente)request.getAttribute("cliente");

%>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Cliente</title>
</head>

<body>

<h2>Editar Cliente</h2>

<form action="ClienteController?op=4" method="post">

<input
type="hidden"
name="id"
value="<%=c.getId()%>">

Nome:

<br>

<input
type="text"
name="nome"
value="<%=c.getNome()%>">

<br><br>

Telefone:

<br>

<input
type="text"
name="telefone"
value="<%=c.getTelefone()%>">

<br><br>

CPF:

<br>

<input
type="text"
name="cpf"
value="<%=c.getCpf()%>">

<br><br>

Tipo de Ação:

<br>

<select name="tipoAcao">

<option
<%=c.getTipoAcao().equals("Judicial")?"selected":""%>>
Judicial
</option>

<option
<%=c.getTipoAcao().equals("Extra Judicial")?"selected":""%>>
Extra Judicial
</option>

<option
<%=c.getTipoAcao().equals("INSS")?"selected":""%>>
INSS
</option>

<option
<%=c.getTipoAcao().equals("Recurso de Multa")?"selected":""%>>
Recurso de Multa
</option>

<option
<%=c.getTipoAcao().equals("Trabalhista")?"selected":""%>>
Trabalhista
</option>

</select>

<br><br>

Status:

<br>

<select name="status">

<option
<%=c.getStatus().equals("Em andamento")?"selected":""%>>
Em andamento
</option>

<option
<%=c.getStatus().equals("Fase 1")?"selected":""%>>
Fase 1
</option>

<option
<%=c.getStatus().equals("Fase 2")?"selected":""%>>
Fase 2
</option>

<option
<%=c.getStatus().equals("Fase 3")?"selected":""%>>
Fase 3
</option>

<option
<%=c.getStatus().equals("Concluído")?"selected":""%>>
Concluído
</option>

</select>

<br><br>

<input
type="submit"
value="Salvar Alterações">

</form>

</body>
</html>