package Conexao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {

    private String servidor = "localhost";
    private String banco = "advocacia";
    private String usuario = "root";
    private String senha = "";

    public Connection getConexao() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(
                    "jdbc:mysql://" + servidor + "/" + banco,
                    usuario,
                    senha);

        } catch (Exception e) {
            return null;
        }
    }
}