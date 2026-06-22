<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro Cliente</title>
</head>

<body>

<h2>Cadastro de Cliente</h2>

<form action="ClienteController?op=1" method="post">

Nome:

<br>

<input
type="text"
name="nome"
required>

<br><br>

Telefone:

<br>

<input
type="text"
name="telefone"
required>

<br><br>

CPF:

<br>

<input
type="text"
name="cpf"
required>

<br><br>

Tipo de Ação:

<br>

<select name="tipoAcao">

<option>Judicial</option>

<option>Extra Judicial</option>

<option>INSS</option>

<option>Recurso de Multa</option>

<option>Trabalhista</option>

</select>

<br><br>

Status:

<br>

<select name="status">

<option>Em andamento</option>

<option>Fase 1</option>

<option>Fase 2</option>

<option>Fase 3</option>

<option>Concluído</option>

</select>

<br><br>

<input
type="submit"
value="Cadastrar">

</form>

<br>

<a href="index.html">
Voltar
</a>

</body>
</html>