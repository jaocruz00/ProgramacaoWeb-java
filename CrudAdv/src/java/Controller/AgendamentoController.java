package Controller;

import DAO.AgendamentoDAO;
import VO.Agendamento;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AgendamentoController
        extends HttpServlet {

    protected void processRequest(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int operacao =
                Integer.parseInt(
                        request.getParameter("op"));

        AgendamentoDAO dao =
                new AgendamentoDAO();

        switch (operacao) {

            /*
             Agendar
            */
            case 1 -> {

                Agendamento a =
                        new Agendamento();

                a.setData(
                        request.getParameter("data"));

                a.setHorario(
                        request.getParameter("horario"));

                a.setDescricao(
                        request.getParameter("descricao"));

                if (dao.horarioOcupado(
                        a.getData(),
                        a.getHorario())) {

                    response.sendRedirect(
                            "resultado.jsp?result=Horário já ocupado");

                } else {

                    response.sendRedirect(
                            "resultado.jsp?result="
                            + dao.inserir(a));
                }
            }

            /*
             Listar Agenda
            */
            case 2 -> {

                request.setAttribute(
                        "agenda",
                        dao.listar());

                RequestDispatcher rd =
                        request.getRequestDispatcher(
                                "/agenda.jsp");

                rd.forward(
                        request,
                        response);
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
        return "Agenda";
    }
}