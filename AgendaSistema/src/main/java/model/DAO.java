package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAO {
	
	//Parâmetro de Conexão:
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/dbagenda?useTimezone=True&serverTimezone=UTC";
	
	private String user = "root";
	private String password = "1234";
	
	//Metodo de conexão:
	
	private Connection conectar() {
		Connection con = null;
		
		try {
			
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			return con;
		}catch(Exception e) {
			System.out.println(e);
			return null;
			
			
		}
		
		
		
	}
	//teste de conexão:
	public void testeConexão() {
		
		try {
			Connection con = conectar();
			System.out.println(con);
			con.close();
			
		} catch(Exception e) {
			System.out.println(e);
			
			
			
		}
		
		
		
	}
	
	public boolean inserirContato(JavaBeans cadastro) {
		
		
		String createSql = "insert into tblogin (nome,email,senha,confirmasenha) values(?,?,?,?)";
		
		try {
			
			Connection con = conectar();
			PreparedStatement pstm = con.prepareStatement(createSql);
			pstm.setString(1, cadastro.getNome());
			pstm.setString(2,cadastro.getEmail());
			pstm.setString(3,cadastro.getSenha());
			pstm.setString(4,cadastro.getConfirmacao());
			pstm.executeUpdate();
			
			con.close();
			return true;
			
		} catch( Exception e) {
			System.out.println(e);
			return false;
			
			
		}
		
		
	}
	
	public  boolean verificador(String usuarioSolicitado, String senha){
		String read = "select * from tblogin where email= '"+ usuarioSolicitado +"' ";
			
		
		
		try 
		{
			Connection con = conectar();
			
			
			PreparedStatement pstm = con.prepareStatement(read);
			ResultSet rs = pstm.executeQuery();
			rs.next();
			
			
			String email = rs.getString("email");
			String senhabd = rs.getString("senha");
			
			
				
			if(email.equals(usuarioSolicitado) && senhabd.equals(senha)) {
				return true;
			}else {
				return false;
			}
				
			
			
		}catch(Exception e )
		{
			return false;
			
		}
		
		
		
		
		
	}
	
	

}
