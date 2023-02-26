package com.Club_Futbol.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Club_Futbol.app.entity.Club;
import com.Club_Futbol.app.entity.Jugador;
import com.Club_Futbol.app.repository.ClubRepositorio;
import com.Club_Futbol.app.repository.JugadorRepositorio;

@Controller
public class JugadorController {
	
	@Autowired
	private JugadorRepositorio jugadorRepositorio;
	
	@Autowired
	private ClubRepositorio clubRepositorio;
	
	@GetMapping("/verJugador/formJugador")
	public String insertarJugador (Model model) {
		
		List<Club> listaClub = clubRepositorio.findAll();
		
		model.addAttribute("jugador", new Jugador());
		model.addAttribute("listaClub", listaClub);
		
		return "formJugador";
	}
	
	@PostMapping("/guardarJugador")
	public String guardarJugador (Jugador jugador) {
		jugadorRepositorio.save(jugador);
		return "redirect:/verJugador";
	}
	
	@GetMapping("/verJugador")
	public String verJugador (Model model) {
		List<Jugador> listaJugador = jugadorRepositorio.findAll();
		model.addAttribute("listaJugador", listaJugador);
		return "verJugador";
	}
	
	@GetMapping("/jugador/editar/{id}")
	public String modificarJugador (@PathVariable("id") Integer id, Model model) {
		Jugador jugador = jugadorRepositorio.findById(id).get();
		model.addAttribute("jugador", jugador);
		
		List<Club> listaClub = clubRepositorio.findAll();
		model.addAttribute("listaClub", listaClub);
		
		return "formJugador";
	}
	
	@GetMapping("/jugador/eliminar/{id}")
	public String eliminarJugador(@PathVariable("id") Integer id, Model model) {
		jugadorRepositorio.deleteById(id);
		return "redirect:/verJugador";
	}
	
}
