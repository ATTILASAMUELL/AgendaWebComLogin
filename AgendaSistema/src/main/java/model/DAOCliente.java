package model;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class DAOCliente {
	
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
		
		
		public boolean inserirCliente(JavaBeansCliente Cadastrocliente) {
			
			
			String createSql = "insert into cliente (nome,email,idade,idUsuarioLogado) values(?,?,?,?)";
			
			try {
				
				Connection con = conectar();
				PreparedStatement pstm = con.prepareStatement(createSql);
				pstm.setString(1, Cadastrocliente.getNome());
				pstm.setString(2,Cadastrocliente.getEmail());
				pstm.setString(3,Cadastrocliente.getIdade());
				pstm.setString(4,Cadastrocliente.getIdUsuario());
				pstm.executeUpdate();
				
				con.close();
				return true;
				
			} catch( Exception e) {
				System.out.println(e);
				return false;
				
				
			}
			
			
		}
		
		public boolean selecionandoCliente(JavaBeansCliente cliente) {
			String update= "select * from cliente where idcon= ?";
			
			try {
				Connection conn = conectar();
				PreparedStatement pstm = conn.prepareStatement(update);
				pstm.setString(1, cliente.getIdcon());
				ResultSet rs = pstm.executeQuery();
				
				while(rs.next()) {
					cliente.setIdcon(rs.getString(1));
					cliente.setNome(rs.getString(2));
					cliente.setEmail(rs.getString(3));
					cliente.setIdade(rs.getString(4));
					
					return true;
				}
				conn.close();
				
			}catch(Exception e) { 
				System.out.println(e);
				return false;
				}
			return false;
			
			
			}

		public ArrayList<JavaBeansCliente>  listarCliente(String usuarioLogado){
			String read = "select * from cliente where idUsuarioLogado='"+usuarioLogado+"'";
			ArrayList<JavaBeansCliente>  armazenaCliente = new ArrayList<>();
			
			try {
				Connection con= conectar();
				PreparedStatement pstm = con.prepareStatement(read);
				ResultSet rs = pstm.executeQuery();
				
				while(rs.next()) {
					String idcon = rs.getString(1);
					String nome = rs.getString(2);
					String email = rs.getString(3);
					String idade = rs.getString(4);
					String idUsuario = rs.getString(5);
					
					armazenaCliente.add(new JavaBeansCliente(idcon,nome,email,idade,idUsuario));
					
				}
				con.close();
				return armazenaCliente;
				
				
			}catch(Exception e) {
				System.out.println(e);
				return null;
				
			}
			
			
			
			
			
		}
	
		public boolean finalizandoUpdate(JavaBeansCliente cliente) {
			String editando = "update cliente set nome=?, email=?,idade=? where idcon=?";
			
			
			try {
				
				
				
				
				Connection con = conectar();
				PreparedStatement pstm = con.prepareStatement(editando);
				pstm.setString(1, cliente.getNome());
				pstm.setString(2,cliente.getEmail());
				pstm.setString(3,cliente.getIdade());
				pstm.setString(4,cliente.getIdcon());
				
				
				pstm.executeUpdate();
				
				con.close();
				return true;
				
			} catch( Exception e) {
				System.out.println(e);
				return false;
				
				
			}
			
			
			
			
		}
	
		public boolean deletarContato(JavaBeansCliente clienteDeletado) {
			String delete= "delete from cliente where idcon=?";
			
			try {
				
				Connection con = conectar();
				PreparedStatement pstm = con.prepareStatement(delete);
				pstm.setString(1, clienteDeletado.getIdcon());
				
				
				
				pstm.executeUpdate();
				
				con.close();
				return true;
				
			} catch( Exception e) {
				System.out.println(e);
				return false;
				
				
			}
			
			
			
			
			}
}
