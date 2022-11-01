<%@page import="datatypes.DtSocio"%>
<%@page import="datatypes.DtProfesor"%>
<%@page import="datatypes.DtUsuario"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@page import="java.io.ByteArrayInputStream"%>
 <%@page import="java.io.IOException"%>
 <%@page import="java.io.InputStream"%>
 <%@page import= "java.awt.Image" %>
 <%@page import= "javax.imageio.ImageIO" %>
 <%@page import="datatypes.DtInstitucionD"%>
 <%@page import="java.util.ArrayList"%>
	<%@page import="java.util.List"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	
<link rel="stylesheet"
	href="css/style2.css">
<title>Homepage</title>

    
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	
		
		
	 

</head>
<body>
   
   <%
   DtUsuario use= (DtUsuario)session.getAttribute("usuario");
   
   if(use==null){
	    RequestDispatcher rd;
        request.setAttribute("login", "Error");
   		rd = request.getRequestDispatcher("/InicioSesion.jsp");
        rd.forward(request, response);
   } 
   if(request.getAttribute("inicio")=="OK"){ %>

	   <script src="js/sweetAlertBienvenido.js"></script>
  	<%}
  	request.setAttribute("inicio", "Error"); 
  	request.setAttribute("login", "OK");
  	if(request.getAttribute("Notificacion")=="OK"){%>

		
 	   	<script src="js/sweetAlerttest2.js">aplicare();</script>
  	<%}
  	request.setAttribute("Notificacion", "OFF");
  	%>
   
		<nav class="navbar navbar-expand-lg navbar-light bg-light"> 
	 <img src="imagenes/logo.jfif" class="logo" alt="Main Logo">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="Home.jsp">Homepage <span class="sr-only">(current)</span> </a></li>
			<%if(use instanceof DtProfesor){//menus de profe %>
			<li class="nav-item"><a class="nav-link" data-toggle="dropdown" href="#">Clases</a>
		        <ul class="dropdown-menu">
					<li class="nav-item"><a class="nav-link" href="altaClase.jsp">Alta dictado clase</a></li>
					<li class="nav-item"><a class="nav-link" href="consultaClase.jsp">Consulta dictado clase</a></li>
				</ul>
     		</li>				
			<li class="nav-item"><a class="nav-link" data-toggle="dropdown" href="#">Ranking</a>
	    	    <ul class="dropdown-menu">
					<li class="nav-item"><a class="nav-link" href="rankingClases.jsp">Ranking dictado clase</a></li>
					<li class="nav-item"><a class="nav-link" href="rankingActDeportiva.jsp">Ranking actividades deportivas</a></li>
				</ul>
     		</li>
			<%}%>
			<%if(use instanceof DtSocio){//menus de socio %>
			<li class="nav-item"><a class="nav-link" data-toggle="dropdown" href="#">Clases</a>
	        	<ul class="dropdown-menu">
		         	<li class="nav-item"><a class="nav-link" href="RegistroClase.jsp">Registro a dictado clase</a></li>
					<li class="nav-item"><a class="nav-link" href="Working.jsp">Eliminar registro a dictado clase</a></li>
	        	</ul>
     		</li>
			<%}%>
			<li class="nav-item"><a class="nav-link" data-toggle="dropdown" href="#">Consultas</a>
		        <ul class="dropdown-menu">
					<li class="nav-item"><a class="nav-link" href="consultaUsuario.jsp">Consulta usuario</a></li>
					<li class="nav-item"><a class="nav-link" href="consultaActividadD.jsp">Consulta actividad deportiva</a></li>
				</ul>
     		</li>
     		
			<li class="nav-item"><a class="nav-link" href="modificarUsuario.jsp">Modificar Datos</a></li>
			
        	<li class="nav-item"><a class="nav-link" href="Outsesion.jsp">Cerrar Sesion</a></li>
        </ul>
        <ul>
         <%if(use.getUrl()==null || use.getUrl()=="") {%>            
            	<img class="avatar"src="imagenes/user.png"/>
            
            <%}else{%>
            	 <img class="avatar" src="<%=use.getUrl()%>"/>
             <%}
            	request.setAttribute("name", use.getNombre());
			%> 
            <h1 class="nav-item">${name}</hi> 
        </ul>

		
	</div>
	</nav>
    
    	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
  
</body>
</html>