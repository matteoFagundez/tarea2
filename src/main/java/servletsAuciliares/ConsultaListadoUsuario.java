package servletsAuciliares;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datatypes.DtActDeportiva;
import datatypes.DtClase;
import datatypes.DtProfesor;
import datatypes.DtSocio;
import datatypes.DtUsuario;
import excepciones.NoExisteClase;
import excepciones.SinActDep;
import interfaces.Fabrica;
import interfaces.IControlador;

/**
 * Servlet implementation class ConsultaListadoUsuario
 */
@WebServlet("/ConsultaListadoUsuario")
public class ConsultaListadoUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsultaListadoUsuario() {
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
		HttpSession sesion = request.getSession();
		DtUsuario use= (DtUsuario)sesion.getAttribute("usuario");
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();

 		if(use instanceof DtProfesor) {

			 DtProfesor p =(DtProfesor)use;
			 try {
				ArrayList<DtActDeportiva> actD = (ArrayList<DtActDeportiva>) icon.listarDatoActdepP(p);
				request.setAttribute("actD", actD);
				ArrayList<DtClase> clase = (ArrayList<DtClase>) icon.listarDatoClasedeP(p);
				request.setAttribute("clase", clase);
			} catch (SinActDep | NoExisteClase e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {

			DtSocio s=(DtSocio) use;
			try {
				ArrayList<DtClase> clase = (ArrayList<DtClase>) icon.listarDatoClasedeS(s);
				request.setAttribute("clase", clase);
			} catch (NoExisteClase e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		RequestDispatcher rd;
		rd = request.getRequestDispatcher("/consultaUsuario2.jsp");
		rd.forward(request, response);
	}

}
