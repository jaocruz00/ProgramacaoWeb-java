package Controller;

import DAO.ClienteDAO;
import VO.Cliente;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ClienteController extends HttpServlet {

    protected void processRequest(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int operacao =
                Integer.parseInt(request.getParameter("op"));

        ClienteDAO dao = new ClienteDAO();

        switch (operacao) {

            /*
             CADASTRAR
             op=1
            */
            case 1 -> {

                Cliente c = new Cliente();

                c.setNome(
                        request.getParameter("nome"));

                c.setTelefone(
                        request.getParameter("telefone"));

                c.setCpf(
                        request.getParameter("cpf"));

                c.setTipoAcao(
                        request.getParameter("tipoAcao"));

                c.setStatus(
                        request.getParameter("status"));

                response.sendRedirect(
                        "resultado.jsp?result="
                        + dao.inserir(c));
            }

            /*
             LISTAR
             op=2
            */
            case 2 -> {

                request.setAttribute(
                        "lista",
                        dao.listar());

                RequestDispatcher rd =
                        request.getRequestDispatcher(
                                "/listar_clientes.jsp");

                rd.forward(request, response);
            }

            /*
             BUSCAR PARA EDIÇÃO
             op=3
            */
            case 3 -> {

                int id =
                        Integer.parseInt(
                                request.getParameter("id"));

                request.setAttribute(
                        "cliente",
                        dao.buscar(id));

                RequestDispatcher rd =
                        request.getRequestDispatcher(
                                "/editar_cliente.jsp");

                rd.forward(request, response);
            }

            /*
             ALTERAR
             op=4
            */
            case 4 -> {

                Cliente c = new Cliente();

                c.setId(
                        Integer.parseInt(
                                request.getParameter("id")));

                c.setNome(
                        request.getParameter("nome"));

                c.setTelefone(
                        request.getParameter("telefone"));

                c.setCpf(
                        request.getParameter("cpf"));

                c.setTipoAcao(
                        request.getParameter("tipoAcao"));

                c.setStatus(
                        request.getParameter("status"));

                response.sendRedirect(
                        "resultado.jsp?result="
                        + dao.alterar(c));
            }

            /*
             EXCLUIR
             op=5
            */
            case 5 -> {

                int id =
                        Integer.parseInt(
                                request.getParameter("id"));

                response.sendRedirect(
                        "resultado.jsp?result="
                        + dao.excluir(id));
            }
        }
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controller de Clientes";
    }
}