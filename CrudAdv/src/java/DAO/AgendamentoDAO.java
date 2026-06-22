package DAO;

import Conexao.Conexao;
import VO.Agendamento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AgendamentoDAO{

    /*
     Salvar novo agendamento
    */
    public String inserir(Agendamento a) {

        try {

            Connection con = new Conexao().getConexao();

            String sql =
                    "INSERT INTO agendamento "
                    + "(data_atendimento, horario, descricao) "
                    + "VALUES (?, ?, ?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, a.getData());
            ps.setString(2, a.getHorario());
            ps.setString(3, a.getDescricao());

            ps.execute();

            con.close();

            return "Agendamento realizado com sucesso";

        } catch (Exception e) {

            return "Erro ao agendar";
        }
    }

    /*
     Lista todos os agendamentos
    */
    public ArrayList<Agendamento> listar() {

        ArrayList<Agendamento> lista =
                new ArrayList<>();

        try {

            Connection con =
                    new Conexao().getConexao();

            String sql =
                    "SELECT * FROM agendamento "
                    + "ORDER BY data_atendimento";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Agendamento a =
                        new Agendamento();

                a.setId(rs.getInt("id"));

                a.setData(
                        rs.getString("data_atendimento"));

                a.setHorario(
                        rs.getString("horario"));

                a.setDescricao(
                        rs.getString("descricao"));

                lista.add(a);
            }

            con.close();

        } catch (Exception e) {

        }

        return lista;
    }

    /*
     Verifica se horário está ocupado
    */
    public boolean horarioOcupado(
            String data,
            String horario) {

        try {

            Connection con =
                    new Conexao().getConexao();

            String sql =
                    "SELECT * "
                    + "FROM agendamento "
                    + "WHERE data_atendimento=? "
                    + "AND horario=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, data);
            ps.setString(2, horario);

            ResultSet rs =
                    ps.executeQuery();

            boolean ocupado =
                    rs.next();

            con.close();

            return ocupado;

        } catch (Exception e) {

            return true;
        }
    }
}