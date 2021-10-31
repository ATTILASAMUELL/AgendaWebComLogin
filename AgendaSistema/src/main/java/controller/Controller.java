package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import model.DAO;
import model.DAOCliente;
import model.JavaBeans;
import model.JavaBeansCliente;

/**
 * Servlet implementation class Controller
 */
@WebServlet(urlPatterns={"/Controller", "/usuariologin", "/cadastrandoUsuario", "/cadastrandoCliente", "/redirecionar", "/selecionando", "/update", "/deletando","/gerandorelatorio"})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DAO dao = new DAO();
    JavaBeans cadastro = new JavaBeans();
    DAOCliente daoCliente = new DAOCliente();
    JavaBeansCliente Cadastrocliente = new JavaBeansCliente();
    String usuarioLog;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		if (action.equals("/redirecionar")){
			redirecinando(request,response);
		}else if(action.equals("/selecionando")) {
			selecionando(request,response);
		}else if(action.equals("/deletando")) {
			deletandoItem(request,response);
		}else if(action.equals("/gerandorelatorio")) {
			gerandorelatoriopdf(request,response);
		}
		
		
	}
	
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("usuario");
		String senha  =request.getParameter("senha");
		
		Boolean respostabd = dao.verificador(nome, senha);
		
		if(respostabd) {
			HttpSession session = request.getSession();
			session.setAttribute("usuarioLogado", nome);
			usuarioLog = nome;
			
			if(usuarioLog != null) {
				ArrayList<JavaBeansCliente> listando = daoCliente.listarCliente(usuarioLog);
				request.setAttribute("listaclientes", listando);
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}else {
				request.setAttribute("erro", "Email/Senha incorretos");
				
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request,response);
				}
			
			
			
			
			
			
			
			
		}else {
			
			request.setAttribute("erro", "Email/Senha incorretos");
			
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request,response);
			
			
		}
		
		
		
	}
	protected void listarClientes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}
		
	protected void cadastrandoUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("usuario");
		String email= request.getParameter("email");
		String senha  =request.getParameter("senhaConfirma");
		String confirmas=  request.getParameter("senha");
		
		// Setar no objeto:
		cadastro.setNome(nome);
		cadastro.setEmail(email);
		cadastro.setSenha(senha);
		cadastro.setConfirmacao(confirmas);
		
		
		
		Boolean resultado = (Boolean) dao.inserirContato(cadastro);
		
		if(resultado) {
			response.sendRedirect("login.jsp");
			
		}else {
			response.sendRedirect("cadastroLogin.jsp");
		}
		
	}

	protected void cadastrandoCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter("nome");
		String email= request.getParameter("email");
		String idade  =request.getParameter("idade");
		
		
		
	
		// Setar no objeto:
		Cadastrocliente.setNome(nome);
		Cadastrocliente.setEmail(email);
		Cadastrocliente.setIdade(idade);
		Cadastrocliente.setIdUsuario(usuarioLog);
		
		
		
		Boolean resultado = (Boolean) daoCliente.inserirCliente(Cadastrocliente) ;
		
		if(resultado) {
			ArrayList<JavaBeansCliente> listando = daoCliente.listarCliente(usuarioLog);
			request.setAttribute("listaclientes", listando);
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
			
			
			
		}else {
			response.sendRedirect("adicionarCliente.jsp");
		}
		
	}
	protected void redirecinando(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<JavaBeansCliente> listando = daoCliente.listarCliente(usuarioLog);
		request.setAttribute("listaclientes", listando);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
		
	}
	protected void selecionando(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String idcon = request.getParameter("idcon");
		Cadastrocliente.setIdcon(idcon);
		daoCliente.selecionandoCliente(Cadastrocliente);
		
		request.setAttribute("idcon", Cadastrocliente.getIdcon());
		request.setAttribute("nome", Cadastrocliente.getNome());
		request.setAttribute("email", Cadastrocliente.getEmail());
		request.setAttribute("idade", Cadastrocliente.getIdade());
		
		
		RequestDispatcher rd = request.getRequestDispatcher("editando.jsp");
		rd.forward(request, response);
		
	}
	protected void FinalizandoEditacaoCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Cadastrocliente.setIdcon(request.getParameter("idcon"));
		Cadastrocliente.setNome(request.getParameter("nome"));
		Cadastrocliente.setEmail(request.getParameter("email"));
		Cadastrocliente.setIdade(request.getParameter("idade"));
		
		
		System.out.println("idcon:"+request.getParameter("idcon"));
		System.out.println(request.getParameter("nome"));
		
		
		Boolean verificacao = daoCliente.finalizandoUpdate(Cadastrocliente);
		
		if(verificacao) {
			
			ArrayList<JavaBeansCliente> listando = daoCliente.listarCliente(usuarioLog);
			request.setAttribute("listaclientes", listando);
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
			
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("editando.jsp");
			rd.forward(request, response);
		}
		
		
		
	
	
	
	}
	
	protected void deletandoItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idcon = request.getParameter("idcon");
		Cadastrocliente.setIdcon(idcon);
		Boolean verificador = daoCliente.deletarContato(Cadastrocliente);
		
		ArrayList<JavaBeansCliente> listando = daoCliente.listarCliente(usuarioLog);
		request.setAttribute("listaclientes", listando);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
		
		
		
		
		
	}
	
	protected void gerandorelatoriopdf(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Document documento = new Document();
		try {
			//tipo do documento
			response.setContentType("apllication/pdf");
			
			//nome do documento
			
			response.addHeader("Content-Disposition", "inline; filename=" + "clientes.pdf");
			//Criar pdf:
			PdfWriter.getInstance(documento, response.getOutputStream());
			
			//abre documento:
			documento.open();
			
			// gerar conteudo:
			documento.add(new Paragraph("Lista de Clientes:"));
			
			PdfPTable tabela = new PdfPTable(3);
			documento.add(new Paragraph(" "));
			
			PdfPCell col1 = new PdfPCell(new Paragraph("Nome"));
			PdfPCell col2 = new PdfPCell(new Paragraph("Email"));
			PdfPCell col3 = new PdfPCell(new Paragraph("Idade"));
			
			
			tabela.addCell(col1);
			tabela.addCell(col2);
			tabela.addCell(col3);
			
			ArrayList<JavaBeansCliente> tabelaClienteLista = daoCliente.listarCliente(usuarioLog);
			for (int i = 0; i < tabelaClienteLista.size(); i++) {
				tabela.addCell(tabelaClienteLista.get(i).getNome());
				tabela.addCell(tabelaClienteLista.get(i).getEmail()   );
				tabela.addCell(tabelaClienteLista.get(i).getIdade() );
			}
			
			documento.add(tabela);
			
			
			//fechando documento:
			documento.close();
			
			
			
			
		} catch(Exception e) {
			System.out.println(e);
			documento.close();
		}
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getServletPath();
		
		if(action.equals("/usuariologin")){
			login(request,response);
		
		}else if (action.equals("/cadastrandoUsuario")) {
			
			cadastrandoUsuario(request,response);
		}else if(action.equals("/cadastrandoCliente")){
			
			cadastrandoCliente(request,response);
			
			
		}else if(action.equals("/update")){
			
			FinalizandoEditacaoCliente(request,response);
			
			
		}else {
			response.sendRedirect("TelaLogin.html");
			
		}
	}

}
