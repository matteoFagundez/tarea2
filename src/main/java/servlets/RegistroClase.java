package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datatypes.DtActDeportiva;
import datatypes.DtClase;
import datatypes.DtUsuario;
import excepciones.ExisteRegistroAClase;
import excepciones.NoExisteClase;
import excepciones.NoExisteProfesor;
import excepciones.SinActDep;
import interfaces.Fabrica;
import interfaces.IControlador;

/**
 * Servlet implementation class AuxCargaDatos
 */
@WebServlet("/RegistroClase")
public class RegistroClase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistroClase() {
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
        
        String institucion=request.getParameter("prodId");
        if(institucion.equals("noup")) {
        	institucion = request.getParameter("institucion");
        	System.out.println("Primer caso");
        }
        String actividad = request.getParameter("prodIdA");
        if(actividad!=null&&actividad.equals("noup")) {
        	actividad = request.getParameter("Actividad");
        } 
        String MostrarMA = request.getParameter("envioAct");
        String MostrarMC = request.getParameter("envioCl");
        String Reguistrar = request.getParameter("envioReg");
        
        System.out.println(institucion+" "+actividad+" "+MostrarMA+" "+MostrarMC);
        try {
        	String[] act=icon.listarActividades(institucion);
			RequestDispatcher rd;
			request.setAttribute("Institucion", institucion);
			request.setAttribute("Actdep", act);
			request.setAttribute("mostrarAct", "OK");	
			request.setAttribute("Actividad", actividad);
			
		
			if(MostrarMA!=null&&MostrarMA.equals("OK")) {
		        request.setAttribute("mostrarClas", "OK");
		        String[] ca = icon.listarClase(institucion, actividad);
		        request.setAttribute("clases", ca);
			}
			
			if(MostrarMC!=null&&MostrarMC.equals("OK")) {
				String Ca= request.getParameter("clase");
				DtClase ca=icon.buscarclase(Ca); 
		        request.setAttribute("MostrarDClase", "OK");
		        request.setAttribute("DtClase", ca);
			}
			
			if(Reguistrar!=null&&Reguistrar.equals("OK")) {
				String nomC = request.getParameter("prodIdC");
				HttpSession sesion = request.getSession();
				DtUsuario use= (DtUsuario)sesion.getAttribute("usuario");
				try {
					icon.registroDictadoClases(nomC, actividad, institucion, use.getNickname());
					request.setAttribute("Titulo", "Se agrego con Exito");
					request.setAttribute("Tipo", "success");
					request.setAttribute("Imagen", "imagenes/exito.gif");
				} catch (ExisteRegistroAClase e) {
					request.setAttribute("Titulo", "Usted ya esta Reguistrado");
					request.setAttribute("Tipo", "error");
					request.setAttribute("Imagen", "imagenes/exito.gif");
					e.printStackTrace();
				}
				request.setAttribute("Datos", "OK");
			}
			rd = request.getRequestDispatcher("/RegistroClase.jsp");
			
			rd.forward(request, response);
		} catch (SinActDep | NoExisteClase e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        doGet(request, response);
	}

}