package Controller;

import DAO.ClienteDAO;
import VO.Cliente;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GerarTxt extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int id =
                Integer.parseInt(
                        request.getParameter("id"));

        ClienteDAO dao =
                new ClienteDAO();

        Cliente c =
                dao.buscar(id);

        response.setContentType(
                "text/plain");

        response.setHeader(
                "Content-Disposition",
                "attachment; filename=cliente.txt");

        PrintWriter out =
                response.getWriter();

        out.println(
                "RELATÓRIO DE CLIENTE");

        out.println();

        out.println(
                "Nome: "
                + c.getNome());

        out.println(
                "CPF: "
                + c.getCpf());

        out.println(
                "Telefone: "
                + c.getTelefone());

        out.println(
                "Tipo de Ação: "
                + c.getTipoAcao());

        out.println(
                "Status: "
                + c.getStatus());

        out.println(
                "Última Alteração: "
                + c.getUltimaAlteracao());
    }
}