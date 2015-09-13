package br.com.estrelacarnes.dao;

import java.util.List;

import br.com.estrelacarnes.model.Categoria;

public interface CategoriaDAO {

	

	List<Categoria> listCategoriaAll();

	Categoria load(Categoria categoria);
	
}
