package br.com.estrelacarnes.dao;

import java.util.List;

import br.com.estrelacarnes.model.Complemento;
import br.com.estrelacarnes.model.Preparo;
import br.com.estrelacarnes.model.Produto;

public interface PedidoDAO {
	
	
	
	List<Produto> listarProdutosPorCategoria(Integer id);
	
	List<Preparo> listarPreparos();
	
	List<Complemento> listarComplementos();

}
