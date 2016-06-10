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
public class Quadro implements Serializable{

	private static final long serialVersionUID = -608419721106315574L;

	@Id
	@GenericGenerator(name="idQuadro", strategy="increment")
	@GeneratedValue(generator="idQuadro")
	private Integer id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idPedido")
	private Pedido pedido = new Pedido();
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idHorario")
	private Horario horario = new Horario();
	
	
	private Date data;


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


	public Horario getHorario() {
		return horario;
	}


	public void setHorario(Horario horario) {
		this.horario = horario;
	}


	public Date getData() {
		return data;
	}


	public void setData(Date data) {
		this.data = data;
	}
	
}
