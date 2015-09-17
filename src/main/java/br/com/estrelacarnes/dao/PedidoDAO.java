package br.com.estrelacarnes.dao;

import java.util.List;

import br.com.estrelacarnes.model.Produto;

public interface PedidoDAO {
	
	
	
	List<Produto> listarProdutosPorCategoria(String id);

}
