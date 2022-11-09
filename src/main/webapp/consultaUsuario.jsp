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
     < <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet">
    
        <title>Consulta de Usuario</title>
        <meta charset="UTF-8">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="stylesheet" href="css/style2.css">
        <link rel="stylesheet" href="css/style3.css">
		<script>
		        function validacion(){
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


                <div class="container align-self-center p-6">
                     <center><h2 class="font-weight-bold mb-3"> Consulta Usuario</h2></center>
							<div class="form-row mb-2">
							<!-- --------------------------- ACA PONE LA DATA------------------------------------ -->
							<%if(use instanceof DtProfesor){
							DtProfesor p= (DtProfesor)use;%>
							
							<div class="titles-info" id="titles-info"> 
			                    <FONT COLOR="white">
						        <p> 
								<img class="imagen" src=<%if(use.getUrl()==null || use.getUrl()=="") {%>            
										            		"imagenes\user.png"  
											            <%}else{%>
											            	"<%=use.getUrl()%>"	
											            <%}%>						
								align="right" width="400" height="400">Nickname: <%=p.getNickname()%>&nbsp &nbsp &nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								<br>Nombre: <%=p.getNombre()%>       
								<br>Apellido: <%=p.getApellido()%><br>Fecha de Nacimiento: <%=p.getFechaNac().getDate()%>/<%=(p.getFechaNac().getMonth()+1)%>/<%=(p.getFechaNac().getYear()+1900)%>
								<br>Email: <%=p.getEmail()%><br>Descripcion: <br><%=p.getDescripcion()%><br>Bibliografia: <br><%=p.getBiografia()%><br>Sitio Web: <br><%=p.getSitioWeb()%><br>Rol: Profesor
								</p>
				                </FONT>
							</div>
                            <%}else{DtSocio s= (DtSocio)use;%>
						        <FONT COLOR="white">
						        <p> 
								<img class="imagen" src=<%if(use.getUrl()==null || use.getUrl()=="") {%>            
										            		"imagenes\user.png"  
											            <%}else{%>
											            	"<%=use.getUrl()%>"	
											            <%}%>						
								align="right" width="400" height="400">Nickname: <%=s.getNickname()%>&nbsp &nbsp &nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								<br>Nombre: <%=s.getNombre()%>       
								<br>Apellido: <%=s.getApellido()%><br>Fecha de Nacimiento: <%=s.getFechaNac().getDate()%>/<%=(s.getFechaNac().getMonth()+1)%>/<%=(s.getFechaNac().getYear()+1900)%>
								<br>Email: <%=s.getEmail()%><br>Rol: Socio
								</p>
				                </FONT>			               
                            <%} %>
                <%if(request.getAttribute("mostrarTablas")=="OK"){%>
	                <FONT COLOR="white"><h2 class="font-weight-bold mb-3"> Clases Asociadas</h2>
							<!-- ACA PONE LA DATA -->
                            <table class="table">
										<thead>
											<tr>
												<th>CLASE</th>
										    	<th>FECHA</th>
										    	<th>HORA DE INICIO</th>
										    	<th>URL</th>
										    	<th>FECHA DE REGUISTRO</th>
											</tr>
										</thead>
										<tbody>
											<%
											ArrayList<DtClase> clase = (ArrayList<DtClase>) request.getAttribute("clase"); 
											if (clase != null) {
													for (DtClase c : clase) {
											%>
											<tr>
												<th><%=c.getNombre()%></th>
												<td><%=c.getFecha().getDate()%>/<%=(c.getFecha().getMonth()+1)%>/<%=(c.getFecha().getYear()+1900)%></td>
												<%
												String horaI;
												if(c.getHoraInicio().getMinutes()<=9) {
													horaI=String.valueOf(c.getHoraInicio().getHours() + ":0" +c.getHoraInicio().getMinutes());
												}
												else {
													horaI=String.valueOf(c.getHoraInicio().getHours() + ":" +c.getHoraInicio().getMinutes());
												}
												%>
												<td>
												 <%=horaI%>
												</td>
												<td><%=c.getUrl()%></td>
												<%
												String horaR;
												if(c.getFechaReg().getMinutes()<=9) {
													horaR=String.valueOf(c.getFechaReg().getHours() + ":0" +c.getFechaReg().getMinutes());
												}
												else {
													horaR=String.valueOf(c.getFechaReg().getHours() + ":" +c.getFechaReg().getMinutes());
												}
												%>
												<td>
													<%=c.getFechaReg().getDate()%>/<%=(c.getFechaReg().getMonth()+1)%>/<%=(c.getFechaReg().getYear()+1900)%><%=" "+horaR%>
												</td>
														
		
											</tr>
											<%
												}
											}
											else{ 
												%>
											<tr>
												<th><li>vacio</li></th>
												<td><li>vacio</li></td>
												<td><li>vacio</li></td>
												<td><li>vacio</li></td>
												<td><li>vacio</li></td>
									
											
											</tr>
											<%
											}
											%>
										</tbody>
									</table>
								</FONT>
								
                </div>
                <form action="ConsultaUser" method="post">

								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text" for="inputGroupSelect01">Clase</label>
									</div>
									<select class="custom-select" id="selectclase" name="selectclase" required>
										<%
										if(clase != null){%>
										<option value="select">Seleccione Clase</option>
										<%
										for(DtClase ca : clase){%>
											<option value="<%=ca.getNombre()%>"><%=ca.getNombre()%></option>
										<%}}%>
									</select>
									<input type="submit" value="Enviar" name="enviar">
									<input id="prodId" name="MostrarDatos" type="hidden" value="OK">
								</div>
								
				</form>
  				 <%if(use instanceof DtProfesor){
						ArrayList<DtActDeportiva> actDepo = (ArrayList<DtActDeportiva>) request.getAttribute("actD");       		
				%>   
  				<h2 class="font-weight-bold mb-3">Actividades Deportivas Asociadas</h2>
							<FONT COLOR="white"><!-- ACA PONE LA DATA -->
								
									<table class="table">
										<thead>
											<tr>
												
											    <th>NOMBRE</th>
											    <th>DESCRIPCION</th>
											    <th>DURACION</th>
											    <th>COSTO</th>
											    <th>FECHA DE REGUISTRO</th>
											</tr>
										</thead>
										<tbody>
											<%
											if (actDepo != null) {
													for (DtActDeportiva dta : actDepo) {
											%>
											<tr>
												
												<td><%=dta.getNombre()%></td>
												<td><%=dta.getDescripcion()%></td>
												<td><%=	String.valueOf(dta.getDuracion()+" min")%></td>
												<td><%=	String.valueOf(dta.getCosto()+"$")%></td>
												<%
												String horaRa;
												if(dta.getFecha().getMinutes()<=9) {
													horaRa=String.valueOf(dta.getFecha().getHours() + ":0" +dta.getFecha().getMinutes());
												}
												else {
													horaRa=String.valueOf(dta.getFecha().getHours() + ":" +dta.getFecha().getMinutes());
												}
												%>
												<th><%=dta.getFecha().getDate()%>/<%=(dta.getFecha().getMonth()+1)%>/<%=(dta.getFecha().getYear()+1900)%><%=" "+horaRa%></th>
														
		
											</tr>
											<%
												}
											}
											else{ 
												%>
											<tr>
												<th><li>vacio</li></th>
												<td><li>vacio</li></td>
												<td><li>vacio</li></td>
												<td><li>vacio</li></td>
												<td><li>vacio</li></td>
											
											</tr>
											<%
											}
											%>
										</tbody>
									</table>
									</FONT>
									<form action="ConsultaUser" method="post">

									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text" for="inputGroupSelect01">Actividad</label>
										</div>
										<select class="custom-select" id="selectAct" name="selectAct" required>
											<%
											if(actDepo != null){%>
												<option value="select">Seleccione Actividad</option>
												<%for(DtActDeportiva ca : actDepo){%>
												<option value="<%=ca.getNombre()%>"><%=ca.getNombre()%></option>
											<%}}%>
										</select>
										<input type="submit" value="Enviar" name="enviar">
										<input id="prodId" name="MostrarDatos" type="hidden" value="OK">
									</div>
												
								</form>
							<%} %>
                
	               
	               <%if(request.getAttribute("Datos")=="OK"){  %>
	                <script>  
	                	validacion();   
	                </script>
	                </div>

               	  <%} %>
	             <%}else{ %>
	             	</div>
	             	<%if(use instanceof DtProfesor){%>
	            	<form action="ConsultaUser" method="post">
				            <button class="btn btn-primary width-100">Ver Actividades y Clases</button>
					</form>
	                <%} else{%>
	                <form action="ConsultaUser" method="post">    
				         <button class="btn btn-primary width-100"> Ver Actividades</button>			        
					</form>
					
	                <%} %>
	             <%} %>
	             

     	 
     </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
        
        
    </body>
</html>