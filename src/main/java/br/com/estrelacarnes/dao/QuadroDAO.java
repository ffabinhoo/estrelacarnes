package br.com.estrelacarnes.dao;

import java.util.List;

import br.com.estrelacarnes.model.Horario;
import br.com.estrelacarnes.model.Quadro;

public interface QuadroDAO {

	void incluir(Quadro quadro);

	Quadro load(Quadro quadro);
	
	Quadro consultarQuadroPorEntrega(Integer entrega);

	List<Quadro> consultarTodosQuadros();
	
	void excluir(Quadro quadro);
	
	Quadro update(Quadro quadro);



}
