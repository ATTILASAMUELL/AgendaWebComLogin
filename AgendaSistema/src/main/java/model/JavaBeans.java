package model;

public class JavaBeans {
	
	private String idcon;
	private String nome;
	private String email;
	private String senha;
	private String confirmacao;
	
	
	
	public JavaBeans() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public JavaBeans(String idcon, String nome, String email, String senha, String confirmacao) {
		super();
		this.idcon = idcon;
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.confirmacao = confirmacao;
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
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getConfirmacao() {
		return confirmacao;
	}
	public void setConfirmacao(String confirmacao) {
		this.confirmacao = confirmacao;
	}
	
	
	

}
