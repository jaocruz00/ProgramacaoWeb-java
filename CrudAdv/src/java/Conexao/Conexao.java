package Conexao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {

    private String servidor = "localhost";
    private String banco = "advocacia";
    private String usuario = "root";
    private String senha = "";

    /*
     MODO DEBUG: lança a exceção real em vez de devolver null,
     para o erro completo aparecer na tela do navegador.
    */
    public Connection getConexao() throws Exception {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new Exception("DRIVER MYSQL NÃO ENCONTRADO NO CLASSPATH. "
                    + "O .jar mysql-connector-java não está sendo incluído no projeto. "
                    + "Detalhe: " + e.toString(), e);
        }

        try {
            return DriverManager.getConnection(
                    "jdbc:mysql://" + servidor + "/" + banco
                    + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
                    usuario,
                    senha);
        } catch (Exception e) {
            throw new Exception("FALHA AO CONECTAR NO MYSQL. "
                    + "Verifique se o serviço MySQL está rodando, se o banco '"
                    + banco + "' existe, e se usuário/senha estão corretos. "
                    + "Detalhe: " + e.toString(), e);
        }
    }
}
