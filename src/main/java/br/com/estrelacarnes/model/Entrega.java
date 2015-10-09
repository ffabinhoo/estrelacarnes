package br.com.estrelacarnes.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class Entrega implements Serializable{
	
	private static final long serialVersionUID = 1L;


	@Id
	@GenericGenerator(name="idEntrega", strategy="increment")
	@GeneratedValue(generator="idEntrega")
	private Integer id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idPedido")
	private Pedido pedido = new Pedido();
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idCliente")
	private Cliente cliente = new Cliente();
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idEndereco")
	private Endereco endereco = new Endereco();
	
	private Date data;
	
	private String tipoEntrega;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Pedido getPedido() {
		return pedido;
	}

	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public String getTipoEntrega() {
		return tipoEntrega;
	}

	public void setTipoEntrega(String tipoEntrega) {
		this.tipoEntrega = tipoEntrega;
	}
	
	

}
