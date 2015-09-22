package br.com.estrelacarnes.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Pedido implements Serializable{
	
	
	private static final long serialVersionUID = 1L;

	@Id
	private Integer id;
	
	private String valor;
	
	private String status;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idCliente")
	private Cliente cliente = new Cliente();
	
	
	
	
}
