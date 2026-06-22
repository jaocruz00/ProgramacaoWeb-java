package DAO;

import Conexao.Conexao;
import VO.Cliente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ClienteDAO {

    /*
     Inserir cliente no banco
    */
    public String inserir(Cliente c) {

        try {

            Connection con = new Conexao().getConexao();

            String sql = "INSERT INTO cliente "
                    + "(nome, telefone, cpf, tipo_acao, status_processo) "
                    + "VALUES (?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, c.getNome());
            ps.setString(2, c.getTelefone());
            ps.setString(3, c.getCpf());
            ps.setString(4, c.getTipoAcao());
            ps.setString(5, c.getStatus());

            ps.execute();

            con.close();

            return "Cliente cadastrado com sucesso";

        } catch (Exception e) {

            return "Erro ao cadastrar cliente";
        }
    }

    /*
     Listar todos os clientes
    */
    public ArrayList<Cliente> listar() {

        ArrayList<Cliente> lista = new ArrayList<>();

        try {

            Connection con = new Conexao().getConexao();

            String sql = "SELECT * FROM cliente";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Cliente c = new Cliente();

                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                c.setTelefone(rs.getString("telefone"));
                c.setCpf(rs.getString("cpf"));
                c.setTipoAcao(rs.getString("tipo_acao"));
                c.setStatus(rs.getString("status_processo"));
                c.setUltimaAlteracao(
                        rs.getString("ultima_alteracao"));

                lista.add(c);
            }

            con.close();

        } catch (Exception e) {

        }

        return lista;
    }

    /*
     Buscar cliente pelo ID
    */
    public Cliente buscar(int id) {

        Cliente c = new Cliente();

        try {

            Connection con = new Conexao().getConexao();

            String sql = "SELECT * FROM cliente WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                c.setTelefone(rs.getString("telefone"));
                c.setCpf(rs.getString("cpf"));
                c.setTipoAcao(rs.getString("tipo_acao"));
                c.setStatus(rs.getString("status_processo"));
            }

            con.close();

        } catch (Exception e) {

        }

        return c;
    }

    /*
     Atualizar cliente
    */
    public String alterar(Cliente c) {

        try {

            Connection con = new Conexao().getConexao();

            String sql = "UPDATE cliente SET "
                    + "nome=?, "
                    + "telefone=?, "
                    + "cpf=?, "
                    + "tipo_acao=?, "
                    + "status_processo=?, "
                    + "ultima_alteracao=NOW() "
                    + "WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, c.getNome());
            ps.setString(2, c.getTelefone());
            ps.setString(3, c.getCpf());
            ps.setString(4, c.getTipoAcao());
            ps.setString(5, c.getStatus());
            ps.setInt(6, c.getId());

            ps.execute();

            con.close();

            return "Cliente atualizado com sucesso";

        } catch (Exception e) {

            return "Erro ao atualizar cliente";
        }
    }

    /*
     Excluir cliente
    */
    public String excluir(int id) {

        try {

            Connection con = new Conexao().getConexao();

            String sql = "DELETE FROM cliente WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ps.execute();

            con.close();

            return "Cliente removido com sucesso";

        } catch (Exception e) {

            return "Erro ao remover cliente";
        }
    }
}