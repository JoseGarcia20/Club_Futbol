package com.Club_Futbol.app.entity;

import javax.persistence.*;

@Entity
public class Jugador {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String nombre;
	private String apellido;
	private String numero;
	private String posicion;
	
	@ManyToOne
	@JoinColumn(name = "club_id")
	private Club club;


	public Jugador() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Jugador(Integer id, String nombre, String apellido, String numero, String posicion, Club club) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.apellido = apellido;
		this.numero = numero;
		this.posicion = posicion;
		this.club = club;
	}
	
	public Jugador(String nombre, String apellido, String numero, String posicion, Club club) {
		super();
		this.nombre = nombre;
		this.apellido = apellido;
		this.numero = numero;
		this.posicion = posicion;
		this.club = club;
	}
	
	

	public Jugador(String nombre) {
		super();
		this.nombre = nombre;
	}

	public Club getClub() {
		return club;
	}

	public void setClub(Club club) {
		this.club = club;
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

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getPosicion() {
		return posicion;
	}

	public void setPosicion(String posicion) {
		this.posicion = posicion;
	}

}
