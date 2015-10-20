package br.com.estrelacarnes.dao;

import br.com.estrelacarnes.model.Entrega;

public interface EntregaDAO {

	void incluir(Entrega entrega);

	Entrega load(Entrega entrega);

}
