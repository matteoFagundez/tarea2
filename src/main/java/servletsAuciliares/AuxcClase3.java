package servletsAuciliares;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datatypes.DtClase;
import excepciones.NoExisteClase;
import excepciones.NoExisteProfesor;
import excepciones.SinActDep;
import interfaces.Fabrica;
import interfaces.IControlador;

/**
 * Servlet implementation class AuxCargaDatos
 */
@WebServlet("/AuxcClase3")
public class AuxcClase3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuxcClase3() {
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
        String actividad = request.getParameter("prodId2");
        String clase = request.getParameter("clase");
        System.out.println(institucion+" "+actividad+" "+clase);
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
			
			
			
			String n,d,du,c,f;
	        	DtClase ca=icon.buscarclase(clase);
		        
		        n="Clase: "+ca.getNombre();
		        d="Fecha: "+String.valueOf(ca.getFecha().getDate() +"/"+(ca.getFecha().getMonth()+1) + "/" +(ca.getFecha().getYear()+1900));
		        c="Url: "+ca.getUrl();		
				if(ca.getHoraInicio().getMinutes()<=9) {
					du ="Hora de inicio: "+ String.valueOf(ca.getHoraInicio().getHours() + ":0" +ca.getHoraInicio().getMinutes());
				}
				else {
					du ="Hora de inicio: "+String.valueOf(ca.getHoraInicio().getHours() + ":" +ca.getHoraInicio().getMinutes());
				}
				String horaR;
				if(ca.getFechaReg().getMinutes()<=9) {
					horaR=String.valueOf(ca.getFechaReg().getHours() + ":0" +ca.getFechaReg().getMinutes());
				}
				else {
					horaR=String.valueOf(ca.getFechaReg().getHours() + ":" +ca.getFechaReg().getMinutes());
				}
				f="Fecha de Reguistro: "+ca.getFechaReg().getDate()+"/"+(ca.getFechaReg().getMonth()+1)+"/"+(ca.getFechaReg().getYear()+1900)+"  "+horaR;
				
		        request.setAttribute("Clase", n);
		        request.setAttribute("Fecha", d);
		        request.setAttribute("HoraI", du);
		        request.setAttribute("Url", c);
		        request.setAttribute("FechaR", f);
		        request.setAttribute("Datos", "OK");
		        request.setAttribute("Titulo", "Datos de Clase Seleccionada:");
		        if(ca.getUrlI()==null||ca.getUrlI()==""){
		        	request.setAttribute("Imagen", "imagenes/nohayI.webp");
		        }else {
		        	String u=ca.getUrlI();
		        	request.setAttribute("Imagen", u);
		        }
	        System.out.println("pase aux 3");
			rd = request.getRequestDispatcher("/consultaClase.jsp");
			
			rd.forward(request, response);
		} catch (SinActDep | NoExisteClase e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        doGet(request, response);
	}

}