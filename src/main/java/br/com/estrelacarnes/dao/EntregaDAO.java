package br.com.estrelacarnes.dao;

import java.util.List;

import br.com.estrelacarnes.model.Cliente;
import br.com.estrelacarnes.model.Endereco;
import br.com.estrelacarnes.model.Entrega;

public interface EntregaDAO {

	void incluir(Entrega entrega);

	Entrega load(Entrega entrega);

	List<Entrega> consultarEnderecoEntrega(Endereco endereco);

	List<Entrega> consultarEntregasCliente(Cliente cliente);

}
