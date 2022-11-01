package servlets;


import java.io.IOException;
import java.util.Date;

import excepciones.ClaseRepetidaExcepcion;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datatypes.DtClase;
import interfaces.Fabrica;
import interfaces.IControlador;

import java.io.*;
import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;
import java.awt.image.WritableRaster;
import java.io.File;



@WebServlet("/AgregarClase")
public class AgregarClase extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AgregarClase() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Fabrica fabrica = Fabrica.getInstancia();
        IControlador icon = fabrica.getIControlador();
        String nombre = request.getParameter("nomClase");
        String url = request.getParameter("url");

        String institucion = request.getParameter("institucion");
        String profe = request.getParameter("Profesor");
        String actividad = (String)request.getParameter("Actividad");
        // open image
        File imagen = new File(request.getParameter("foto"));
        String Url ="imagenes/"+request.getParameter("foto");
        //BufferedImage bufferedImage = ImageIO.read(imagen);
        byte[] buffer = new byte[(int) imagen.length()];
         //get DataBufferBytes from Raster
    
  

        try {
            Date fechaSis = new Date();

            Date fech =new Date();
            Date hor =new Date();
            
            System.out.println("hola\n");
            System.out.println("hola "+institucion+" "+profe+" "+actividad+" "+nombre+" "+url+" "+fechaSis+" "+fech+" "+hor);
            DtClase x= new DtClase(nombre, fech, hor, url,fechaSis,Url, buffer, null, null, null);
            icon.altaClase(x,institucion,actividad,profe);
            request.setAttribute("mensaje ", "Se ha ingresado correctamente la clase " + nombre + " en el sistema.");
            System.out.println("Paso el test\n");
            RequestDispatcher rd;
            request.setAttribute("Exito", "OK");
        	rd = request.getRequestDispatcher("/altaClase.jsp");
            rd.forward(request, response);
        } catch (ClaseRepetidaExcepcion e) {
            throw new RuntimeException(e);
        }
    }}