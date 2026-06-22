<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Cliente</title>
</head>
<body>
<center>
    <h1>Cadastro de Cliente</h1>

    <form method="post" action="ClienteController?op=1">

        Nome: <input type="text" name="nome" required><br><br>

        Telefone: <input type="text" name="telefone"><br><br>

        CPF: <input type="text" name="cpf" required><br><br>

        Tipo de Ação: <input type="text" name="tipoAcao"><br><br>

        Status do Processo:
        <select name="status">
            <option value="Em andamento">Em andamento</option>
            <option value="Concluído">Concluído</option>
            <option value="Aguardando documentos">Aguardando documentos</option>
        </select><br><br>

        <input type="submit" value="Cadastrar">
    </form>

    <br>
    <a href="index.html">Página Inicial</a>
</center>
</body>
</html>
