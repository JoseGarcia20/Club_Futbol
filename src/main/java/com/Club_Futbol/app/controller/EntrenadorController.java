package com.Club_Futbol.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.Club_Futbol.app.entity.Entrenador;
import com.Club_Futbol.app.repository.EntrenadorRepositorio;

@Controller
public class EntrenadorController {

	@Autowired
	private EntrenadorRepositorio entrenadorRepositorio;
	
	@GetMapping("/verEntrenador")  
	public String listarEntrenador (Model model) {
		List<Entrenador> listaEntrenador = entrenadorRepositorio.findAll();
		model.addAttribute("listaEntrenador", listaEntrenador);
		return "verEntrenador";
	}
	
	@GetMapping("/verEntrenador/formEntrenador")
	public String mostrarFormulario (Model model) {
		model.addAttribute("entrenador", new Entrenador());
		return "formEntrenador";
	}
	
	@PostMapping("/guardarEntrenador")
	public String guardarClub (Entrenador entrenador) {
		entrenadorRepositorio.save(entrenador);
		return "redirect:/verEntrenador";
	}
	
	@GetMapping("/entrenador/editar/{id}")
	public String modificarEntrenador (@PathVariable("id") Integer id, Model model) {
		Entrenador entrenador = entrenadorRepositorio.findById(id).get();
		model.addAttribute("entrenador", entrenador);
		
		return "formEntrenador";
	}
	
	@GetMapping("/entrenador/eliminar/{id}")
	public String eliminarEntrenador(@PathVariable("id") Integer id, Model model) {
		entrenadorRepositorio.deleteById(id);
		return "redirect:/verEntrenador";
	}
	
}
