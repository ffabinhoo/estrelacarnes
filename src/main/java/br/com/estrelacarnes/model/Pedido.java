package br.com.estrelacarnes.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class Pedido implements Serializable{
	
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GenericGenerator(name="idPedido", strategy="increment")
	@GeneratedValue(generator="idPedido")
	private Integer id;
	
	private String valor;
	
	private String status;
	
	private String idEntrega;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idCliente")
	private Cliente cliente = new Cliente();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getIdEntrega() {
		return idEntrega;
	}

	public void setIdEntrega(String idEntrega) {
		this.idEntrega = idEntrega;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	
	
	
	
}
