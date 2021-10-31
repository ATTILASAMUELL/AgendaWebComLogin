<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.JavaBeansCliente"%>
<%@ page import="java.util.ArrayList"%>
<%
	String verificador = "null";

	System.out.print(verificador);

	
	ArrayList<JavaBeansCliente> listaCliente = (ArrayList<JavaBeansCliente>)
	request.getAttribute("listaclientes");
	
	System.out.print(listaCliente);
	
	if(listaCliente != null){
		
		
		verificador = "ok";
		
		
	}

	

	


%>



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>Home</title>
<link rel="icon" href="img/logo.png">
<link rel="stylesheet" href="style.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body style="background: #363636;">
	<%
		String usuario = (String) session.getAttribute("usuarioLogado");
		if (usuario == null) {
	
			response.sendRedirect("login.jsp");
			verificador = "null";
		} else {
			

			
	
		}
	%>


	

	<div class="container">
		<nav
			class="navbar fixed-top navbar-expand-sm navbar-light bg-light navbar-dark bg-dark">
			<div class="container">
				<a href="index.jsp" class="navbar-brand mb-0 h1"> <img
					class="d-inline-block align-top" src="img/logo.png" width="30"
					height="30">
				</a>
				<button type="button" data-bs-toggle="collapse"
					data-bs-target="#navbarNav" class="navbar-toggler"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item active"><a href="index.jsp"
							class="nav-link active"> Home </a></li>
						<li class="nav-item active"><a href="adicionarCliente.jsp"
							class="nav-link ">| Adicionar Cliente </a></li>
						<li class="nav-item active" style="<%  if( listaCliente.size() < 1){out.print("display:none");}%>"><a href="gerandorelatorio"
							class="nav-link float-right">| Gerar Relatorio PDF</a></li>
							<li class="nav-item active"><a href="deslogar.jsp"
							class="nav-link float-right">| Deslogar</a></li>
					</ul>

				</div>
			</div>
		</nav>

		<br> <br> <br> <br> <br>
		<div class="hide" style="<%  if( listaCliente.size() < 1){out.print("display:none");}%>">

			<div class="card" style="margin: 20px; background: #1a2226 !important; border-radius: 10px !important;  ">
	
				<h1 class="exampleImputName" style="color: #DCDCDC;">Clientes:</h1>
	
	
				<table class="table table-dark table-hover  table-bordered">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Nome</th>
							<th scope="col">Email</th>
							<th scope="col">Idade</th>
							<th scope="col"></th>
						</tr>
					</thead>
	
					<tbody>
					
						<%	
							if(verificador != null){
						
								for(int i = 0; i < listaCliente.size(); i++) {%>
						
						<tr>
							<td><%=  listaCliente.get(i).getIdcon() %></td>
							<td><%=  listaCliente.get(i).getNome() %></td>
							<td><%=  listaCliente.get(i).getEmail() %></td>
							<td><%=  listaCliente.get(i).getIdade()%></td>
							<td>
								<a href="selecionando?idcon=<%= listaCliente.get(i).getIdcon()  %>" class="btn btn-primary">Editar</a>
								<a onclick="deletar(<%= listaCliente.get(i).getIdcon() %>)"   class="btn btn-danger">Deletar</a>
						</tr>
						<%}} %>
						
					</tbody>
	
	
				</table>
	
	
	
			</div>
		</div>
	</div>


	<script type="text/javascript">
		function deletar(idcon){
			console.log(idcon)
			
			
			
			swal({
				  title: "Você tem certeza?",
				  text: "Uma vez excluído, você não poderá recuperar este dado!",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
					
					
				    swal("Poof! Seu arquivo foi excluído!",  {
				    icon: "success",} );
				    
				    setTimeout(function(){
				    	window.location.href="deletando?idcon="+idcon
				    },1000);
					
				    
				    
				    
				  
				  
				  
				  
				  } else {
				    swal("Seu dado está seguro!");
				  }
				});
			
		
		}
	
	
	
	</script>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>


</body>
</html>