package model;

public class JavaBeansCliente {

	private String idcon;
	private String nome;
	private String email;
	private String idade;
	private String idUsuario;
	
	public JavaBeansCliente(String idcon, String nome, String email, String idade,String idUsuario) {
		super();
		this.idcon = idcon;
		this.nome = nome;
		this.email = email;
		this.idade = idade;
		this.idUsuario = idUsuario;
		
	}
	public JavaBeansCliente() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getIdcon() {
		return idcon;
	}
	public void setIdcon(String idcon) {
		this.idcon = idcon;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIdade() {
		return idade;
	}
	public void setIdade(String idade) {
		this.idade = idade;
	}
	public String getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(String idUsuario) {
		this.idUsuario = idUsuario;
	}
	
	
	

}
