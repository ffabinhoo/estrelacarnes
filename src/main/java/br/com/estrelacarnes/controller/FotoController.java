package br.com.estrelacarnes.controller;

import java.io.File;
import java.io.IOException;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.caelum.vraptor.validator.Validator;
import br.com.estrelacarnes.dao.ClienteDAO;
import br.com.estrelacarnes.model.Cliente;

@Controller
public class FotoController {
	
	private final Result result;
	private final Validator validator;
	private final ClienteDAO clienteDAO;
	
	protected FotoController() {
		this(null, null, null);
	}
	
	@Inject
	public FotoController(Result result, ClienteDAO clienteDAO, Validator validator) {
		this.result = result;
		this.clienteDAO = clienteDAO;
		this.validator = validator;

	}
	
	public File foto(Cliente cliente) {
        return new File("/foto/" + cliente.getNome());
    }
	
	public File img(Cliente cliente) {
        return new File("/img/" + cliente.getNome());
    }
	
	@Post
	public void atualizaFoto(UploadedFile file) {
		File fotoSalva = new File("");
		if (System.getProperty("os.name").contains("Windows")){
			fotoSalva = new File("C:/Users/fabiomariana/git/brasilia/src/main/webapp/foto", file.getFileName());
		}else{
			fotoSalva = new File("/var/lib/tomcat7/webapps/brasilia/foto", file.getFileName());
		}
	    try {
	    	String path = fotoSalva.getCanonicalPath();
	    	System.out.println(path);
	    	System.out.println(System.getProperties());
	    	file.writeTo(fotoSalva);
		} catch (IOException e) {
			result.include("tipo", "error");
			result.include("mensagemNegrito", "Erro." + e);
			result.include("mensagem", "Arquivo nao enviado");
			result.redirectTo("/foto/index");
		}
	    result.include("mensagem", "Arquivo Enviado!");
		result.redirectTo("/foto/index");
	}
	
	@Post
	public void atualizaImg(UploadedFile file) {
		File fotoSalva = new File("");
		if (System.getProperty("os.name").contains("Windows")){
			//fotoSalva = new File("D:/Desenvolvimento/workspace/brasilia/src/main/webapp/img", file.getFileName());
			fotoSalva = new File("C:/Users/fabiomariana/git/brasilia/src/main/webapp/img", file.getFileName());
		}else{
			fotoSalva = new File("/var/lib/tomcat7/webapps/brasilia/img", file.getFileName());
		}
	    try {
	    	String path = fotoSalva.getCanonicalPath();
	    	System.out.println(path);
	    	System.out.println(System.getProperties());
	    	file.writeTo(fotoSalva);
		} catch (IOException e) {
			result.include("tipo", "error");
			result.include("mensagemNegrito", "Erro." + e);
			result.include("mensagem", "Arquivo nao enviado");
			result.redirectTo("/foto/index");
		}
	    result.include("mensagem", "Arquivo Enviado!");
		result.redirectTo("/img/upload");
	}
	
	@Path("/foto/index")
	public void index (){
		
	}
	
	@Path("/img/upload")
	public void upload (){
		
	}

}
