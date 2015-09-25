package br.com.estrelacarnes.dao;

import java.util.List;

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

}
