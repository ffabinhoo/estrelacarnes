package br.com.estrelacarnes.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import br.com.estrelacarnes.model.Horario;
import br.com.estrelacarnes.model.Quadro;

public class DefaultHorarioDAO implements HorarioDAO, Serializable{
	
	
	private static final long serialVersionUID = -4756737758015483441L;
	private final EntityManager entityManager;
	
	protected  DefaultHorarioDAO() {
		this(null);
	}
	
	@Inject
	public DefaultHorarioDAO(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	@Override
	public void incluir(Horario horario) {
		this.entityManager.persist(horario);
	}

	@Override
	public Horario load(Horario horario) {
		return this.entityManager.find(Horario.class, horario.getId());
	}

	@Override
	public List<Horario> consultarTodosHorarios() {
		List<Horario> lista = new ArrayList<Horario>();
		String sql = "select i from Horario i order by ativo desc, horario asc";
		lista = entityManager.createQuery(sql, Horario.class).getResultList();
		return lista;
	}
	
	@Override
	public List<Horario> consultarTodosHorariosAtivos() {
		List<Horario> lista = new ArrayList<Horario>();
		String sql = "select i from Horario i where i.ativo = 'S' order by ativo desc, horario asc";
		lista = entityManager.createQuery(sql, Horario.class).getResultList();
		return lista;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Integer totalHorarioDisponivel(String idHorario, String data) {
		Integer total = 0;
		String sql = "select count(h.id) from Horario h,  Quadro q where h.id = q.idHorario "
				+ " and h.ativo = 'S' "
				+ " and DATE_FORMAT(q.data,'%d%m%Y') =  '"	+ data	+ "'"	
				+ " and h.id = " + idHorario ; 
		System.out.println(sql);
		Object valor = entityManager.createNativeQuery(sql).getSingleResult();
		String retorno = valor.toString();
		return Integer.valueOf(retorno);
	}
	
	public Quadro consultarPedidoNoQuadro(Integer idPedido) {
		Quadro quadro = new Quadro();
		String sql = "select q from Horario h,  Quadro q "
				//+ " where h.id = q.idHorario "
				+ " where h.ativo = 'S' "
				
				+ " and q.pedido.id = " + idPedido	
				
				
				+ "";
				
		System.out.println(sql);
		try{
		quadro = entityManager.createQuery(sql, Quadro.class).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
		
		return quadro;
	}
	
	


	@Override
	public void excluir(Horario horario) {
		horario = load(horario);
		Horario obj = this.entityManager.merge(horario);
		this.entityManager.remove(obj);
	}

	@Override
	public Horario update(Horario horario) {
		return this.entityManager.merge(horario);
	}

	@Override
	public Horario consultarPedidoHorario(Horario horario) {
		
		return null;
	}


	

	

	

	

	

	
	
	
	

}
