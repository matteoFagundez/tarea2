<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
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
    <%if(request.getAttribute("login")!="OK"){ %>
	    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	    <script src="js/sweetAlert.js"></script>
    <%}%>
    
   
    
    <div class="container">
        <form action="IniciarSesion" method="post">
        <div class="card">
            <h3>Sign Up</h3>
            <div class="inputBox">
                <input type="text" required name="nameUser">
                <span>Username</span>
            </div>
            <div class="inputBox">
                <input type="password" required name="passwardUser">
                <span>Password</span>
            </div>
            
            <button>Enter</button>
        </div>
		</form>
    </div>
    
</body>
</html>