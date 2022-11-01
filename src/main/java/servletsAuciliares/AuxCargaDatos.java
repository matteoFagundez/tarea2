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
@WebServlet("/AuxCargaDatos")
public class AuxCargaDatos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuxCargaDatos() {
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
        String nombre = request.getParameter("nomClase");
        String url = request.getParameter("url");

        String institucion = request.getParameter("institucion");
        try {
        	System.out.println("hola "+institucion+" "+nombre+" "+url+" ");	 
        	String[] act=icon.listarActividades(institucion);
			try {
				String[] Prof=icon.listarProfesoresInt(institucion);
				RequestDispatcher rd;
	            request.setAttribute("Institucion", institucion);
	            request.setAttribute("Actdep", act);
	            request.setAttribute("Profes", Prof);
	            request.setAttribute("Nombre", nombre);
	            request.setAttribute("Url", url);
	            System.out.println("hola "+institucion+" "+nombre+" "+url+" ");	        	rd = request.getRequestDispatcher("/ConaltaClase.jsp");
	            rd.forward(request, response);
			} catch (NoExisteProfesor e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SinActDep e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        doGet(request, response);
	}

}