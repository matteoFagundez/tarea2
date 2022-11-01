package servlets;


import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import excepciones.ClaseRepetidaExcepcion;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datatypes.DtClase;
import datatypes.DtUsuario;
import interfaces.Fabrica;
import interfaces.IControlador;

import java.io.*;
import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;
import java.awt.image.WritableRaster;
import java.io.File;



@WebServlet("/ModificarUsuario")
public class ModificarUsuario extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ModificarUsuario() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Fabrica fabrica = Fabrica.getInstancia();
        IControlador icon = fabrica.getIControlador();
        String nick = request.getParameter("nick");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");

        String fechaString = request.getParameter("fecha");
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-YYYY");
        Date fecha;
        
        String password = request.getParameter("password");
        String Url = request.getParameter("Url");
        String oldUrl = request.getParameter("oldUrl");
        String fullUrl;

		try {
			fecha = sdf.parse(fechaString);
	        if(Url == null || Url =="") {
	        	fullUrl = oldUrl; 

	        }else {
	        	fullUrl = "imagenes/"+Url;
	        	
	        }
	        icon.modificarUsuario(nick, nombre, apellido, fecha, password, fullUrl);
			 
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
 
		
        HttpSession sesion = request.getSession();
        sesion.removeAttribute("usuario");
        DtUsuario user =icon.login(nick, password);
        sesion.setAttribute("usuario", user);
        RequestDispatcher rd;
        rd = request.getRequestDispatcher("/modificarUsuario.jsp");
        request.setAttribute("Exito", "OK");
        rd.forward(request, response);
        //////
        /* RequestDispatcher rd;
		request.setAttribute("Exito", "OK");
		rd = request.getRequestDispatcher("/InicioSesion.jsp");
		rd.forward(request, response);*/


    }}