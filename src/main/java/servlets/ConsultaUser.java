package servlets;

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
@WebServlet("/ConsultaUser")
public class ConsultaUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsultaUser() {
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
		String MostrarDatos= request.getParameter("MostrarDatos");
		

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
 		
 		if(MostrarDatos!=null&&MostrarDatos.equals("OK")) {
 			String nomclase = request.getParameter("selectclase");
 	        String nomact = request.getParameter("selectAct");
 			String n,d,du,c,f;
 	        if(nomclase!=null||nomclase=="select") {
 	        	DtClase ca=icon.buscarclase(nomclase);
 		        
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
 	        }else if(nomact!=null||nomact!="select") {
 	        	DtActDeportiva a= icon.buscaractividad(nomact);
 	        	n="Actividad: "+a.getNombre();
 	        	d="Descripcion: "+a.getDescripcion();
 	        	du="Duracion: "+a.getDuracion()+" min";
 	        	c="Costo: $"+a.getCosto();
 	        	String horaR;
 				if(a.getFecha().getMinutes()<=9) {
 					horaR=String.valueOf(a.getFecha().getHours() + ":0" +a.getFecha().getMinutes());
 				}
 				else {
 					horaR=String.valueOf(a.getFecha().getHours() + ":" +a.getFecha().getMinutes());
 				}
 	        	f="Fecha de Reguistro: "+a.getFecha().getDate()+"/"+(a.getFecha().getMonth()+1)+"/"+(a.getFecha().getYear()+1900)+"  "+horaR;
 	        	request.setAttribute("Clase", n);
 		        request.setAttribute("Fecha", d);
 		        request.setAttribute("HoraI", du);
 		        request.setAttribute("Url", c);
 		        request.setAttribute("FechaR", f);
 		        request.setAttribute("Datos", "OK");
 		        request.setAttribute("Titulo", "Datos de Actividad Seleccionada:");
 		        if(a.getUrlI()==null||a.getUrlI()==""){
 		        	request.setAttribute("Imagen", "imagenes/nohayI.webp");
 		        }else {
 		        	String u=a.getUrlI();
 		        	request.setAttribute("Imagen", u);
 		        }
 	        }
 		}
 		request.setAttribute("mostrarTablas", "OK");
 		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("/consultaUsuario.jsp");
		rd.forward(request, response);
	}

}
