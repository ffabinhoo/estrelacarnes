package br.com.estrelacarnes.dao;

import java.util.List;

import br.com.estrelacarnes.model.Cliente;
import br.com.estrelacarnes.model.Complemento;
import br.com.estrelacarnes.model.Item;
import br.com.estrelacarnes.model.Pedido;
import br.com.estrelacarnes.model.Preparo;
import br.com.estrelacarnes.model.Produto;

public interface PedidoDAO {
	
	
	
	List<Produto> listarProdutosPorCategoria(Integer id);
	
	List<Preparo> listarPreparos();
	
	List<Complemento> listarComplementos();

	void inserirItem(Item item);

	Pedido abrirPedido(Pedido pedido);
	
	List<Item> listarItensPorPedido(Integer idPedido);

	Pedido load(Pedido pedidoobj);
	
	Item mostrarItem(Integer idItem);
	
	Pedido load(Integer idPedido);
	
	List<Pedido> listarPedidosAbertos();

	void excluirItem(Item item);

	void excluirPedido(Pedido pedido);

	void excluirItensPedido(Pedido pedido);

	void alterarItem(Item item);

	Pedido alterarPedido(Pedido pedidoObj);

	List<Pedido> listarPedidos(String fechados);

	List<Pedido> consultarPedido(String status, String inicio, String fim);

	List<Pedido> listarPedidosEnviadosHoje();

	List<Pedido> consultarHistoricoPedido(Cliente cliente);

	

}
