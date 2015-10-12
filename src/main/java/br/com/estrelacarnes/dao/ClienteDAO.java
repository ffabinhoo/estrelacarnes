package br.com.estrelacarnes.dao;

import java.util.List;

import br.com.estrelacarnes.model.Cliente;
import br.com.estrelacarnes.model.Endereco;

public interface ClienteDAO {
	
	void add(Cliente cliente);
	
	Cliente load(Cliente cliente);

	List<Cliente> listAll();
	
	void delete(Cliente cliente);

	void atualizar(Cliente cliente);
	
	Integer retornaMaxId();

	List<Cliente> consultarUsuarioPorTelefone(String telefone);

	void excluirCliente(Cliente cliente);

	void inserir(Cliente cliente);

	List<Cliente> consultarUsuarioPorNome(String nome);
	
	void inserirEndereco(Endereco endereco);

	List<Cliente> listarTodosUsuarios();

	void excluirEnderecoCliente(Cliente cliente);

	void excluirItensCliente(Cliente cliente);

	void excluirPedidosCliente(Cliente cliente);
	
	
}
