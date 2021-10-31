<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Editando Cliente</title>
<link rel="icon" href="img/logo.png">




<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet" href="styloAnimado.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>


</head>
<body style="height: 100%;background-color:#363636 !important; font-family: "Roboto", sans-serif;">

	<% 
		String usuario = (String) session.getAttribute("usuarioLogado");
		String idcon =(String) request.getAttribute("idcon");
		if(usuario == null|| idcon == null ){
			
			response.sendRedirect("login.jsp");
		}else{
			
		}
		
	%>
	
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
	
	
	<div class="global-container">
		
		<div class="card login-form">
			<div class="card-body"  style="height: 700px">
				<h1 class="card-title text-center">Editando Cliente</h1>
				<div class="card-text">
					<form  method="POST"  name="frmUpdateCliente" action="update" style="padding-top: 0px; font-size:13px;margin-top: 25px;">
						<div class="form-group">
							<label for="exampleImputName">Id:</label>
							<input readonly type="text"   name="idcon" class="form-control form-control-sm" id="exampleInputName" value="<% out.print(request.getAttribute("idcon")); %>">
						
						</div>
						
						<div class="form-group">
							<label for="exampleImputName">Nome:</label>
							<input type="text" name="nome" class="form-control form-control-sm" id="exampleInputName"  value="<% out.print(request.getAttribute("nome")); %>">
						
						</div>
						
						
						<div class="form-group">
							<label for="exampleImputEmail">Email:</label>
							<input type="email" name="email"  class="form-control form-control-sm" id="exampleInputEmail" value="<% out.print(request.getAttribute("email")); %>" >
						
						</div>
						
						<div class="form-group">
							<label for="exampleImputAge">Idade:</label>
							<input type="text" name="idade"  class="form-control form-control-sm" id="exampleInputAge" value="<% out.print(request.getAttribute("idade")); %>">
						
						</div>
						
						<input type="button" class="btn btn-block  btn-primary " value="Salvar">
						<a  href="redirecionar"  class="btn btn-block  btn-danger ">Voltar</a>
						<br>
					
					
					
					
					
					</form>
				
				
				
				</div>
			
			
			
			</div>
		
		</div>
	
	</div>
	
	
	<script>
		
	
		$('input[type="button"]').click(function(){
			var nome = frmUpdateCliente.nome.value
			var email =  frmUpdateCliente.email.value
			var idade =  frmUpdateCliente.idade.value
		
			
			
			
			
			if (nome.length < 8){
				
				
				$('.alert').removeClass("hide");
				$('.alert').addClass("show");
				$('.alert').addClass("showAlert");
				$('.msg').text('Atenção: Campo vazio , digite seu nome corretamente.');

				frmUpdateCliente.nome.focus()
				
				setTimeout(function(){
					$('.alert').addClass("hide");
					$('.alert').removeClass("show");
					
				},5000);
				
			
			}else if (email.indexOf('@') == -1 || email.length < 8){

				$('.alert').removeClass("hide");
				$('.alert').addClass("show");
				$('.alert').addClass("showAlert");
				$('.msg').text('Atenção: Campo esta faltando "@", digite  seu email corretamente.');

				frmUpdateCliente.email.focus()
				
				setTimeout(function(){
					$('.alert').addClass("hide");
					$('.alert').removeClass("show");
					
				},5000);
				
				
				
			}else if(idade.length < 1 ){
			
				$('.alert').removeClass("hide");
				$('.alert').addClass("show");
				$('.alert').addClass("showAlert");
				$('.msg').text('Atenção: Campo menor que 1 caracter, digite corretamente.');
				frmUpdateCliente.idade.focus()
				
				setTimeout(function(){
					$('.alert').addClass("hide");
					$('.alert').removeClass("show");
					
				},5000);
				
			
		
			
			}else{
				document.forms["frmUpdateCliente"].submit();
			}
			
		
		});
		
		$('.close-btn').click(function(){
				
			$('.alert').addClass("hide");
			$('.alert').removeClass("show");
			
				
		});
	
	
	</script>
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	

</body>
</html>