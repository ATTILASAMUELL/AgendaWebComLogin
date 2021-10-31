<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.JavaBeansCliente"%>
<%@ page import="java.util.ArrayList"%>

<%
	String verificador = null;


	
	ArrayList<JavaBeansCliente> listaCliente = (ArrayList<JavaBeansCliente>)
	request.getAttribute("listaclientes");
	
	if(listaCliente != null){
		verificador = "ok";
		
	}

	

	


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">



<title>Adicionar Cliente</title>
<link rel="icon" href="img/logo.png">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="styleCadastroCliente.css">
</head>
<body>
	
	<% 
		String usuario = (String) session.getAttribute("usuarioLogado");
		if(usuario == null){
			
			response.sendRedirect("login.jsp");
		}else{
			
		}
		
	%>
	
	
	
	
	<div class="container">
		<nav class="navbar fixed-top navbar-expand-sm navbar-light bg-light navbar-dark bg-dark">
			<div class="container">
				<a href="index.jsp" class="navbar-brand mb-0 h1">
				<img class="d-inline-block align-top"  src="img/logo.png" width="30" height="30">
				</a>
				<button type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" class="navbar-toggler" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item active cursore"><a href="redirecionar" 
							class="nav-link active cursore"> Home </a></li>
					
					<li class="nav-item active">
						<a href="deslogar.jsp" class="nav-link float-right">|   Deslogar</a>
					</li>
				</ul>
				
				</div>
			</div>
		</nav>
		
	<br>
	<br>
	<br>
	<br>
	
	<div class="alert hide ">
	<span class="fas fa-exclamation-circle"></span>
	<span class="msg">Atenção:</span>
	<span class="close-btn">
		<span class="fas fa-times"></span>
	</span>
		
	</div>
		
		
	<br>
	<br>
	<br>
	<br>
	<br>




	<div class="global-container">
		
		<div class="card login-form">
			<div class="card-body">
				<h1 class="card-title text-center">Adicionar Cliente</h1>
				<div class="card-text">
					<form  method="POST"  name="frmCadastroCliente" action="cadastrandoCliente">
						<div class="form-group">
							<label for="exampleImputName">Nome:</label>
							<input type="text" name="nome" class="form-control form-control-sm" id="exampleInputName">
						
						</div>
						
						
						
						
						<div class="form-group">
							<label for="exampleImputEmail">Email:</label>
							<input type="email" name="email"  class="form-control form-control-sm" id="exampleInputEmail">
						
						</div>
						
						<div class="form-group">
							<label for="exampleImputAge">Idade:</label>
							<input type="email" name="idade"  class="form-control form-control-sm" id="exampleInputAge">
						
						</div>
						
						<input type="button" class="btn btn-block  btn-primary " value="Salvar">
						<a  href="redirecionar" class="btn btn-block  btn-danger ">Voltar</a>
						<br>
					
					
					
					
					
					</form>
				
				
				
				</div>
			
			
			
			</div>
		
		</div>
	
	</div>


	
	</div>
	
	


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>


<script>
		
	
		$('input[type="button"]').click(function(){
			var nome = frmCadastroCliente.nome.value
			var email =  frmCadastroCliente.email.value
			var idade = frmCadastroCliente.idade.value
			
			
			
			
			
			
			if (nome.length <  10){
				
				
				$('.alert').removeClass("hide");
				$('.alert').addClass("show");
				$('.alert').addClass("showAlert");
				$('.msg').text('Atenção: Campo vazio , digite seu usuário corretamente.');

				frmCadastroCliente.nome.focus()
				
				setTimeout(function(){
					$('.alert').addClass("hide");
					$('.alert').removeClass("show");
					
				},5000);
				
			
			}else if (email.indexOf('@') == -1 || email.length < 8){

				$('.alert').removeClass("hide");
				$('.alert').addClass("show");
				$('.alert').addClass("showAlert");
				$('.msg').text('Atenção: Campo esta faltando "@" ou pouco caracter, digite  seu usuário corretamente.');

				frmCadastroCliente.email.focus()
				
				setTimeout(function(){
					$('.alert').addClass("hide");
					$('.alert').removeClass("show");
					
				},5000);
				
				
				
			}else if(idade.length < 1 ){
			
				$('.alert').removeClass("hide");
				$('.alert').addClass("show");
				$('.alert').addClass("showAlert");
				$('.msg').text('Atenção: Campo pouco caracter, digite  sua senha corretamente.');
				frmCadastroCliente.idade.focus()
				
				setTimeout(function(){
					$('.alert').addClass("hide");
					$('.alert').removeClass("show");
					
				},5000);
				
			
		
			
			}else{
				document.forms["frmCadastroCliente"].submit();
			}
			
		
		});
		
		$('.close-btn').click(function(){
				
			$('.alert').addClass("hide");
			$('.alert').removeClass("show");
			
				
		});
	
	
	</script>




</body>
</html>