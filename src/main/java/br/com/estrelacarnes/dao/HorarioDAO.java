package br.com.estrelacarnes.dao;

import java.util.List;

import br.com.estrelacarnes.model.Horario;

public interface HorarioDAO {

	void incluir(Horario horario);

	Horario load(Horario horario);

	List<Horario> consultarTodosHorarios();
	
	List<Horario> consultarTodosHorariosAtivos();

	void excluir(Horario horario);
	
	Horario update(Horario horario);

	Horario consultarPedidoHorario(Horario horario);

	List<Horario> consultarTodosHorariosDisponiveis(String horario);

}
