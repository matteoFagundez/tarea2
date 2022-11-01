package servlets;


import java.io.IOException;
import java.util.Date;
import java.util.List;

import excepciones.ClaseRepetidaExcepcion;
import excepciones.NoexsiteIntDep;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datatypes.DtClase;
import datatypes.DtInstitucionD;
import datatypes.DtProfesor;
import datatypes.DtUsuario;
import interfaces.Fabrica;
import interfaces.IControlador;

import java.io.*;
import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;
import java.awt.image.WritableRaster;
import java.io.File;



@WebServlet("/IniciarSesion")
public class IniciarSesion extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public IniciarSesion() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Fabrica fabrica = Fabrica.getInstancia();
        IControlador icon = fabrica.getIControlador();
        String nombre = request.getParameter("nameUser");
        String passward = request.getParameter("passwardUser");
        
        System.out.println("Nombre "+nombre+" Passward "+ passward);
        DtUsuario user=icon.login(nombre, passward);
        HttpSession sesion = request.getSession();
        if(user != null) {
        	sesion.setAttribute("usuario", user);
        	RequestDispatcher rd;
            request.setAttribute("inicio", "OK");
            request.setAttribute("login", "OK");
           
            try {
				List<DtInstitucionD> inst=icon.listadoDtIntiDtInstitucion();
				
				sesion.setAttribute("LIntitucines",inst);
				System.out.println("Guarde las inst"+inst);
			} catch (NoexsiteIntDep e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} 
            
        	rd = request.getRequestDispatcher("/Home.jsp");
            rd.forward(request, response);
        }else {
            RequestDispatcher rd;
            request.setAttribute("login", "Error");
        	rd = request.getRequestDispatcher("/InicioSesion.jsp");
            rd.forward(request, response);
        }
        
		doGet(request, response);
       
    }}