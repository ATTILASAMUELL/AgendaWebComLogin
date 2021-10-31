<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
 
 <%  String erro =(String) request.getAttribute("erro");  
 	 
 
 %>   
    
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>Login</title>
<link rel="icon" href="img/logo.png">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="styloAnimationCliente.css">





<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div class="alert hide ">
	<span class="fas fa-exclamation-circle"></span>
	<span class="msg">Atenção:</span>
	<span class="close-btn">
		<span class="fas fa-times"></span>
	</span>
	
	</div>
	
	<div class="<% if(erro != null){
		out.print("alert show   showAlert");
		
	} %> ">
	<span class="<% if(erro != null){
		out.print("fas fa-exclamation-circle");
		
	} %> "></span>
	<span class="<% if(erro != null){
		out.print("msg");
		
	} %>"> <% if(erro != null){
		out.print("Atenção: Login/Senha incorreto!!!");
		
	} %></span>
	<span class="<% if(erro != null){
		out.print("close-btn");
		
	} %>">
		<span class="<% if(erro != null){
		out.print("fas fa-times");
		
	} %>"></span>
	</span>
	
	</div>
	




	<form class="box"  method="POST"  name="frmLogin" action="usuariologin" >
	<h1>Login</h1>
	
	<input type="text" name="usuario" placeholder="Email">
	<input type="password" name="senha" placeholder="Senha">
	<input type="button"  name="" value="Login">
	<br>
	<a  style="border:0;
	
	
	color: white;

	cursor:pointer;
	
	
	" href="cadastroLogin.jsp" >Cadastrar -se....</a>
	
	
	</form>
	
	
	
	
	
	<script>
		
	
		$('input[type="button"]').click(function(){
			var usuario = frmLogin.usuario.value
			var senha =  frmLogin.senha.value
		
			
			
			
			
			if (usuario ==  ""){
				
				
				$('.alert').removeClass("hide");
				$('.alert').addClass("show");
				$('.alert').addClass("showAlert");
				$('.msg').text('Atenção: Campo vazio , digite seu usuário corretamente.');

				frmLogin.usuario.focus()
				
				setTimeout(function(){
					$('.alert').addClass("hide");
					$('.alert').removeClass("show");
					
				},5000);
				
			
			}else if (usuario.indexOf('@') == -1){

				$('.alert').removeClass("hide");
				$('.alert').addClass("show");
				$('.alert').addClass("showAlert");
				$('.msg').text('Atenção: Campo esta faltando "@", digite  seu usuário corretamente.');

				frmLogin.usuario.focus()
				
				setTimeout(function(){
					$('.alert').addClass("hide");
					$('.alert').removeClass("show");
					
				},5000);
				
				
				
			}else if(senha.length < 8 ){
			
				$('.alert').removeClass("hide");
				$('.alert').addClass("show");
				$('.alert').addClass("showAlert");
				$('.msg').text('Atenção: Campo menor que 8 caracter, digite  sua senha corretamente.');
				frmLogin.senha.focus()
				
				setTimeout(function(){
					$('.alert').addClass("hide");
					$('.alert').removeClass("show");
					
				},5000);
				
			
		
			
			}else{
				document.forms["frmLogin"].submit();
			}
			
		
		});
		
		$('.close-btn').click(function(){
				
			$('.alert').addClass("hide");
			$('.alert').removeClass("show");
			
				
		});
	
	
	</script>

</body>
</html>