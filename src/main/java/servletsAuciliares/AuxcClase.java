package servletsAuciliares;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import excepciones.NoExisteProfesor;
import excepciones.SinActDep;
import interfaces.Fabrica;
import interfaces.IControlador;

/**
 * Servlet implementation class AuxCargaDatos
 */
@WebServlet("/AuxcClase")
public class AuxcClase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuxcClase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getInstancia();
        IControlador icon = fabrica.getIControlador();

        String institucion = request.getParameter("institucion");
        try {
        	String[] act=icon.listarActividades(institucion);
			RequestDispatcher rd;
			request.setAttribute("Institucion", institucion);
			request.setAttribute("Actdep", act);
			request.setAttribute("mostrarAct", "OK");
			rd = request.getRequestDispatcher("/consultaClase.jsp");
			rd.forward(request, response);
		} catch (SinActDep e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        doGet(request, response);
	}

}