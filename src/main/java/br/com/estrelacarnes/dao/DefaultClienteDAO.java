package br.com.estrelacarnes.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.estrelacarnes.model.Cliente;

public class DefaultClienteDAO implements ClienteDAO, Serializable{
	
	private static final long serialVersionUID = -4756737758015483441L;
	private final EntityManager entityManager;
	
	protected  DefaultClienteDAO() {
		this(null);
	}
	
	@Inject
	public DefaultClienteDAO(EntityManager entityManager) {
		this.entityManager = entityManager;
	}
	
	@Override
	public void add(Cliente cliente) {
		
		this.entityManager.persist(cliente);
	}

	@Override
	public Cliente load(Cliente cliente) {
		return this.entityManager.find(Cliente.class, cliente.getId());
	}
	
	@Override
	public List<Cliente> listAll() {
		return entityManager.createQuery("select m from Cliente m", Cliente.class).getResultList();
	}

	@Override
	public void delete(Cliente cliente) {
		Cliente obj = this.entityManager.merge(cliente);
		this.entityManager.remove(obj);
		
	}

	@Override
	public void atualizar(Cliente cliente) {
		this.entityManager.merge(cliente);
		
	}
	
	public Integer retornaMaxId(){
		Integer valor = entityManager.createQuery("select max(id)+1 from Cliente ", Integer.class).getSingleResult();
		return valor;
	}

	@Override
	public Cliente consultarUsuarioPorTelefone(String telefone) {
		return entityManager.createQuery("select c from Cliente c where c.telefone = " + telefone, Cliente.class).getSingleResult();
		
	}

}
