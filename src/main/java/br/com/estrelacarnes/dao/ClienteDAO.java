package br.com.estrelacarnes.dao;

import java.util.List;

import br.com.estrelacarnes.model.Cliente;

public interface ClienteDAO {
	
	void add(Cliente cliente);
	
	Cliente load(Cliente cliente);

	List<Cliente> listAll();
	
	void delete(Cliente cliente);

	void atualizar(Cliente cliente);
	
	Integer retornaMaxId();

	List<Cliente> consultarUsuarioPorTelefone(String telefone);
	
	
}
