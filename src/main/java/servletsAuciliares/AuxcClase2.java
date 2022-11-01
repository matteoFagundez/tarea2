package servletsAuciliares;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import excepciones.NoExisteClase;
import excepciones.NoExisteProfesor;
import excepciones.SinActDep;
import interfaces.Fabrica;
import interfaces.IControlador;

/**
 * Servlet implementation class AuxCargaDatos
 */
@WebServlet("/AuxcClase2")
public class AuxcClase2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuxcClase2() {
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

        String institucion = request.getParameter("prodId");
        String actividad = request.getParameter("Actividad");
        System.out.println(institucion+" "+actividad);
        try {
        	String[] act=icon.listarActividades(institucion);
			RequestDispatcher rd;
			request.setAttribute("Institucion", institucion);
			request.setAttribute("Actdep", act);
			request.setAttribute("mostrarAct", "OK");
			request.setAttribute("mostrarClas", "OK");
			String[] clases=icon.listarClase(institucion, actividad);
			request.setAttribute("Clase1", clases);
			request.setAttribute("Actividad", actividad);
			 System.out.println("ok aux2");
			
			
			request.setAttribute("Clase", "a");
	        request.setAttribute("Fecha", "a");
	        request.setAttribute("HoraI", "a");
	        request.setAttribute("Url", "a");
	        request.setAttribute("FechaR", "a");
	        request.setAttribute("Titulo", "Datos de Clase Seleccionada:");
	        request.setAttribute("Datos", "off");

	        request.setAttribute("Imagen", "imagenes/nohayI.webp");
	       
	        rd = request.getRequestDispatcher("/consultaClase.jsp");
			rd.forward(request, response);
		} catch (SinActDep | NoExisteClase e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        doGet(request, response);
	}

}