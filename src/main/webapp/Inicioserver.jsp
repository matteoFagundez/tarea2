<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciador de Pagina</title>
    <link href = "css/style.css" rel="stylesheet">
    
</head>
<style>
		body{
			background: url("imagenes/InicioS/fondo.jpg");
			background-position: center center;
	
		}
		
		.container{
			margin: 0 auto;
			margin-top: | | auto;
			background: rgba(0, 0, 0, 0.6);
			border-radius: 15px;
		}
	</style>
<body>
  		
		<div class="container">
	        <form action="Iniciarserver" method="post">
	        <div class="card">  
	             <h3>Inicio de pagina</h3>
	            <button>Iniciar</button>
	        </div>
			</form>
		</div>
</body>
</html>