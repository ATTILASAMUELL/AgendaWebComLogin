<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>Cadastro</title>
<link rel="icon" href="img/logo.png">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="styloAnimationCliente.css">


<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div class="alert hide">
	<span class="fas fa-exclamation-circle"></span>
	<span class="msg">Atenção:</span>
	<span class="close-btn">
		<span class="fas fa-times"></span>
	</span>
	
	</div>



	<form class="box" method="POST"  name="frmCadastro" action="cadastrandoUsuario">
	<h1>Cadastro</h1>
	<input type="text" name="usuario" placeholder="Nome Completo">
	<input type="text" name="email" placeholder="Email">
	<input type="password" name="senha" placeholder="Senha">
	<input type="password" name="senhaConfirma" placeholder="Confirmar Senha">
	<input type="button"  name="" value="Confirmar Cadastro">
	<a  style="border:0;
	width: 50px;
	font-size: 13px;
	background:none;
	display:block;
	margin: 18px auto;
	text-align:center;
	border: 2px solid  	#A52A2A;
	padding: 13px 13px;
	text-decoration:none; 

	outline: none;
	color: white;
	border-radius: 24px;
	transition: 0.25s;
	cursor:pointer;
	
	
	" href="login.jsp" >Voltar</a>
	
	
	</form>
	
	
	
	
	
	<script>
		
	
		$('input[type="button"]').click(function(){
			var usuario = frmCadastro.usuario.value
			var email =  frmCadastro.email.value
			var senha =  frmCadastro.senha.value
			var senhaConfirma = frmCadastro.senhaConfirma.value
			
		
			
			
			
			
			if (usuario ==  ""){
				
				
				$('.alert').removeClass("hide");
				$('.alert').addClass("show");
				$('.alert').addClass("showAlert");
				$('.msg').text('Atenção: Campo nome  vazio , digite seu nome corretamente.');

				frmLogin.usuario.focus()
				
				setTimeout(function(){
					$('.alert').addClass("hide");
					$('.alert').removeClass("show");
					
				},5000);
				
			
			}else if (email.length < 10){

				$('.alert').removeClass("hide");
				$('.alert').addClass("show");
				$('.alert').addClass("showAlert");
				$('.msg').text('Atenção: Campo email está com pouco caracter!!!');

				frmLogin.email.focus()
				
				setTimeout(function(){
					$('.alert').addClass("hide");
					$('.alert').removeClass("show");
					
				},5000);
				
				
				
			}else if (email.indexOf('@') == -1 || email.indexOf(' ') === 1){

				$('.alert').removeClass("hide");
				$('.alert').addClass("show");
				$('.alert').addClass("showAlert");
				$('.msg').text('Atenção: Campo esta faltando "@" ou campo vazio, digite  seu email corretamente.');

				frmLogin.email.focus()
				
				setTimeout(function(){
					$('.alert').addClass("hide");
					$('.alert').removeClass("show");
					
				},5000);
				
				
				
			}else if(senha.length < 8 || senha.indexOf('@') == -1 || senha.indexOf('#') == -1){
			
				$('.alert').removeClass("hide");
				$('.alert').addClass("show");
				$('.alert').addClass("showAlert");
				$('.msg').text('Atenção: Campo menor que 8 caracter ou está faltando caracter especial como "@" e "#"');
				frmLogin.senha.focus()
				
				setTimeout(function(){
					$('.alert').addClass("hide");
					$('.alert').removeClass("show");
					
				},5000);
				
			
		
			
			}
				
				
				
			else{
				
				document.forms["frmCadastro"].submit();
			}
			
		
		});
		
		$('.close-btn').click(function(){
				
			$('.alert').addClass("hide");
			$('.alert').removeClass("show");
			
				
		});
	
	
	</script>

</body>
</html>