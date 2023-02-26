package com.Club_Futbol.app.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Club {
	
	@Id
	@GeneratedValue( strategy = GenerationType.IDENTITY)
	private Integer id; 
	
	@Column(length = 45, nullable = false, unique=true)
	private String nombre;
	
	@OneToOne
	@JoinColumn(name = "entrenador_id")
	private Entrenador entrenador;
	
	@ManyToOne
	@JoinColumn(name = "asociacion_id")
	private Asociacion asociacion;
	
	@ManyToMany
	@JoinTable(name = "club_competencia", joinColumns = @JoinColumn(name = "club_id"),
	inverseJoinColumns = @JoinColumn(name = "competencia_id"))
	private Set<Competicion> competicion = new HashSet<>();
	

	public Set<Competicion> getCompeticion() {
		return competicion;
	}

	public void setCompetencia(Set<Competicion> competicion) {
		this.competicion = competicion;
	}

	public Asociacion getAsociacion() {
		return asociacion;
	}

	public void setAsociacion(Asociacion asociacion) {
		this.asociacion = asociacion;
	}

	public Entrenador getEntrenador() {
		return entrenador;
	}

	public void setEntrenador(Entrenador entrenador) {
		this.entrenador = entrenador;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Club(Integer id, String nombre) {
		super();
		this.id = id;
		this.nombre = nombre;
	}

	public Club() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Club(Integer id) {
		super();
		this.id = id;
	}
	
	public Club( String nombre) {
		super();
		this.nombre = nombre;
	}
	
	
}