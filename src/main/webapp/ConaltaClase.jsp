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

 <%@page import="java.util.ArrayList"%>
	<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
     <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->	
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet">
        <<title> Alta de dictado de Clase</title>
        <meta charset="UTF-8">
        <link href="css/altaClase.css" rel="stylesheet"/>
        <link href="css/altaClaseaux.css" rel="stylesheet"/>
        <link rel="stylesheet" href="css/style3.css">
    </head>

    </head>
    <body>
     <%DtUsuario use= (DtUsuario)session.getAttribute("usuario");
   
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
    <%
    ArrayList<DtInstitucionD> inst= (ArrayList<DtInstitucionD>)session.getAttribute("LIntitucines");
    String a=(String)request.getAttribute("Nombre");
    String b=(String)request.getAttribute("Url");
    String c=(String)request.getAttribute("Institucion");
    
    request.setAttribute("name", a);
    request.setAttribute("url2", b);
    request.setAttribute("Inst", c);
    
    String[] prof=(String[])request.getAttribute("Profes");
    String[] Act=(String[])request.getAttribute("Actdep");
    %>
       <div class="div-form">


                <div class="container align-self-center p-6">
                    <h2 class="font-weight-bold mb-3"> Alta de dictado de clases</h2>
     

                    <form action="AgregarClase" method="post">

                        <div class="form-row mb-2">
                            <div class="form-group col-md-6">
                                <label class="font-weight-bold">Nombre <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" placeholder="Nombre de la clase" name="nomClase" required value="${name}">
                            </div>
                            <div class="form-group col-md-6">
                                <label class="font-weight-bold">Url <span class="text-danger">*</span></label>
                                <input type="url" id="url" name="url" class="form-control" placeholder="Ingrese URL" name="url" required value="${url2}">
                              
                            </div>
                        </div>
                        
                       	<div class="input-group mb-3">
							<div class="input-group-prepend">
								<label class="input-group-text" for="inputGroupSelect01">Institucion</label>
							</div>
							<select class="custom-select" id="inputGroupSelect01" name="institucion" required>
								<option selected>${Inst}</option>						
							</select>
						</div>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<label class="input-group-text" for="inputGroupSelect01">Profesor</label>
							</div>
							<select class="custom-select" id="inputGroupSelect02" name="Profesor" required>
								<%
								if(prof!=null){
									int i=0;
								for(String pr:prof){%>
									<option value="<%=pr%>"><%=pr%></option>
								<%}}%>
							</select>
						</div>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<label class="input-group-text" for="inputGroupSelect01">Actividad</label>
							</div>
							<select class="custom-select" id="inputGroupSelect03" name="Actividad" required>
								<%
								if(Act!=null){
									int i=0;
								for(String ac:Act){%>
									<option value="<%=ac%>"><%=ac%></option>
								<%}}%>
							</select>
						</div>
						
						<div class="form-group mb-4">
                            <label class="font-weight-bold">Fecha <span class="text-danger">*</span></label>
                            <input type="date" id="fecha" class="form-control" name="fecha" required>
                        </div>
                        <div class="form-group mb-4">
                            <label class="font-weight-bold">Hora <span class="text-danger">*</span></label>
                            <input type="time" id="hora" class="form-control" name="hora" required>
                        </div>
                        <div class="form-group mb-4">
                            <label class="font-weight-bold">Foto <span class="text-danger">*</span></label>
                            <input type="file" id="file" class="form-control" name="foto">
                        </div>

                        <button type="submit" id="btnRegistrar" class="btn btn-primary width-100">Reg??strar</button>
                        
                    </form>
                </div>
           </div>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
        <div id="carrusel-contenido">
            <div id="carrusel-caja">
                <div class="carrusel-elemento">
                    <img class="imagenes" src="imagenes/instituto1.jpg" >
                </div>
                <div class="carrusel-elemento">   
                    <img class="imagenes" src="imagenes/instituto2.jpg">
                </div>
                <div class="carrusel-elemento">   
                    <img class="imagenes" src="imagenes/instituto3.jpg">                        
                </div>
            </div>
        </div>
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
		crossorigin="anonymous">
	</script>
    </body>
</html>