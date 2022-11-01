<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script>
        function validacion(){
            var formvalido = true;

            var nom = document.getElementById("nombre").value;
            if(nom == null || nom.length == 0){
                alert("El nombre no puede estar vacío");
                formvalido = false;
            }

            var edad = document.getElementById("edad").value;
            if(isNaN(edad)){
                alert("La edad no contiene solo números.");
                formvalido = false;
            }

            var aficion = document.getElementById("aficion").selectedIndex;
            if(aficion==null || aficion==0){
                alert("La afición no ha sido seleccionada.");
                formvalido = false;
            }else{
            	var a=  document.getElementById("aficion").value;
            	Swal.fire({
            	    title: "Venta realizada",
            	    confirmButtonText: "Aceptar",
            	});
            }

            var contacto = document.getElementById("contarme").checked;
            if(!contacto)
            {
                alert("No has marcado el check");
                formvalido = false;
            }

            var radioseleccionado = false;
            var transporte = document.getElementsByName("transporte");
            for (let index = 0; index < transporte.length; index++) {
                if(transporte[index].checked){
                    radioseleccionado = true;
                }
            }
            if(!radioseleccionado)
            {
                alert("No has marcado ningún medio de transporte en el radio.");
                formvalido = false;
            }

            return formvalido;

        }
    </script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function test(){
            var formvalido = true;
            var name=document.getElementById("name").value;
            if(name==pepe){
            	var a=document.getElementById("name").value ;
            	alert("sdasdad");	
            	formvalido = false;
            }
            else{
            	alert("No es pepe");
            	formvalido = false;
            }
            return formvalido;
        }
            
     </script>
</head>
<body>
    <h1>Validación Formulario Javascript</h1>
    <br />
    <form method="GET" action="" onsubmit="return validacion()" >
        Nombre: <input type="text" name="nombre" id="nombre" /><br/>
        Edad: <input type="text" name="edad" id="edad" /><br/>
        Afición:
        <select id="aficion" name="aficion">
            <option value="10">Selecciona una afición</option>
            <option value="1">Futbol</option>
            <option value="2">Tenis</option>
            <option value="Baloncesto">Baloncesto</option>
        </select>
        <br/>
        <input type="checkbox" name="contarme" id="contarme"> Quiero que me contacten
        <br/>
        Transporte:<br/>
        <input type="radio" name="transporte" id="coche" value="coche">Coche <br/>
        <input type="radio" name="transporte" id="moto" value="moto"> Moto <br/>
        <input type="radio" name="transporte" id="motopatin" value="motopatin"> Monopatin <br/>
        <input type="radio" name="transporte" id="bicicleta" value="bicicleta"> Bicicleta <br/>
        <br/>
        <input type="submit" value="Enviar" name="enviar"> 
    </form>
	
	 
	
	<form method="GET" action="" onsubmit="return test()" >
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
											 <select id="aficion" name="aficion">	
											<tr>
												
												<td>Pedro</td>
												<td>a</td>
												<td>b</td>
												<td>c</td>
												<th>d</th>
												<th><input type="submit" value="Enviar" name="1" value="pepe"></th>
														
		
											</tr>
											
											<tr>
												<th><li>vacio</li></th>
												<td><li>vacio</li></td>
												<td><li>vacio</li></td>
												<td><li>vacio</li></td>
												<td><li>vacio</li></td>
											
											</tr>
											</select>

										</tbody>
									</table>
		</form>

</body>

