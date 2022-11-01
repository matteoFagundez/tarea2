<%@page import="datatypes.DtSocio"%>
<%@page import="datatypes.DtProfesor"%>
<%@page import="datatypes.DtUsuario"%>
<%@page import="datatypes.DtClase"%>
<%@page import="datatypes.DtActDeportiva"%>

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
    
        <title>Consulta Actividad Deportiva</title>
        <meta charset="UTF-8">
        <link href="css/conclase.css" rel="stylesheet" type="text/css" />
		<link href="css/altaClaseaux.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="css/style3.css">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
        function validacion2(){
            var formvalido = true;


            <%String n,d,du,c2,f,i,t;n=(String) request.getAttribute("Clase");d=(String) request.getAttribute("Fecha");
            du=(String) request.getAttribute("HoraI");c2=(String) request.getAttribute("Url");f=(String) request.getAttribute("FechaR");
            i=(String) request.getAttribute("Imagen");t=(String)request.getAttribute("Titulo");%>
            Swal.fire({
            	title: '<%=t%>',
            	html:' <b><%=n%></b><br><b><%=d%></b><br><b><%=du%></b><br><b><%=c2%></b><br><b><%=f%></b>',
            	icon:'info',
            	backdrop: true,
            	imageUrl: '<%=i%>',
            	imageWidth: '400px',
            });

            return formvalido;

        }
    	</script>
        
        
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
            	<img class="avatar"src="imagenes\user.png"/>
            
            <%}else{%>

            	<img class="avatar"src="<%=use.getUrl()%>"/>
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
  
     <%if(request.getAttribute("Exito")=="OK"){ %>
	    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	    <script src="js/Exito.js"></script>
    <%}%>
       <div class="div-form">

	        <%
	    	ArrayList<DtInstitucionD> inst= (ArrayList<DtInstitucionD>)session.getAttribute("LIntitucines");
	    	%>  
       		<div class="container align-self-center p-6">
                    <h1 class="font-weight-bold mb-3"> Consulta Actividad Deportiva</h1>
                      <form action="MostrarActD" method="post">
							<div class="input-group mb-3">
								<div class="form-row mb-2">
								<!-- --------------------------- ACA PONE LA DATA------------------------------------ -->
									<label class="input-group-text" for="inputGroupSelect01">Institución:</label>
								</div>
								<select class="custom-select" id="inputGroupSelect01" name="institucion" required>						
									<%
									if(inst!=null){
									for(DtInstitucionD a:inst){%>
										<option value="<%=a.getNombre()%>"><%=a.getNombre()%></option>
									<%}}%>
									
								</select> 
								<input type="submit" value="Enviar" name="enviar">
								<input id="prodId" name="prodId" type="hidden" value="noup">							
								
							</div>
							</form>
							<%if(request.getAttribute("mostrarAct")=="OK"){ 
								String[] Act=(String[])request.getAttribute("Actdep");
							%>
								<FONT COLOR="white">
						     		<p>Institucion Seleccionada: <%=request.getAttribute("Institucion")%></p>
								</FONT>
								<form action="MostrarActD" method="post">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text" for="inputGroupSelect01">Actividad</label>
									</div>
									<select class="custom-select" id="inputGroupSelect03" name="Actividad" required>
										<%
										if(Act!=null){
										for(String ac:Act){%>
											<option value="<%=ac%>"><%=ac%></option>
										<%}}%>
									</select>
									<input type="submit"  value="Enviar" name="enviar">
									<input id="prodId" name="prodId" type="hidden" value="<%=request.getAttribute("Institucion")%>">
									<input id="prodId" name="prodIdA" type="hidden" value="noup">
									<input id="prodId" name="envioAct" type="hidden" value="OK">
								</div>
								</form>	
								
								<%if(request.getAttribute("mostrarClas")=="OK"){ 
									String[] Cl=(String[])request.getAttribute("clases");
								%>
								<FONT COLOR="white">
					     			<p>Actividad Seleccionada: <%=request.getAttribute("Actividad")%></p>
								</FONT>
								<form action="MostrarActD" method="post">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text" for="inputGroupSelect01">Clase</label>
										</div>
										<select class="custom-select" id="inputGroupSelect03" name="clase" required>
											<%
											if(Cl!=null){
											for(String c:Cl){%>
												<option value="<%=c%>"><%=c%></option>
											<%}}%>
										</select>
										<input type="submit"  value="Enviar" name="enviar">
										<input id="prodId" name="prodId" type="hidden" value="<%=request.getAttribute("Institucion")%>">
										<input id="prodId" name="prodIdA" type="hidden" value="<%=request.getAttribute("Actividad")%>">
										<input id="prodId" name="envioCl" type="hidden" value="OK">
									</div>
								</form>	
								<% }%>					
								<%if(request.getAttribute("Datos")=="OK"){  %>
					                <script>  
					                	validacion2();   
					                </script>
				               	  <%} %>	
			
							<%} %>         
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
                    <img class="imagenes" src="imagenes/ratam.jpg" >
                </div>
                <div class="carrusel-elemento">   
                    <img class="imagenes" src="imagenes/palavagos.gif">
                </div>
                <div class="carrusel-elemento">   
                    <img class="imagenes" src="imagenes/working.gif">                        
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