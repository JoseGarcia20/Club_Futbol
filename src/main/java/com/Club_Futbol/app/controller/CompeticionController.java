package com.Club_Futbol.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.Club_Futbol.app.entity.Competicion;
import com.Club_Futbol.app.repository.CompeticionRepositorio;

@Controller
public class CompeticionController {
	
	@Autowired
	private CompeticionRepositorio competicionRepositorio;
	
	@GetMapping("/verCompeticion")  
	public String listarCompeticion (Model model) {
		List<Competicion> listaCompeticion = competicionRepositorio.findAll();
		model.addAttribute("listaCompeticion", listaCompeticion);
		return "verCompeticion";
	}
	
	@GetMapping("/verCompeticion/formCompeticion")
	public String mostrarFormulario (Model model) {
		model.addAttribute("competicion", new Competicion());
		return "formCompeticion";
	}
	
	@PostMapping("/guardarCompeticion")
	public String guardarCompeticion (Competicion competicion) {
		competicionRepositorio.save(competicion);
		return "redirect:/verCompeticion";
	}
	
	@GetMapping("/competicion/editar/{id}")
	public String modificarCompeticion (@PathVariable("id") Integer id, Model model) {
		Competicion competicion = competicionRepositorio.findById(id).get();
		model.addAttribute("competicion", competicion);
		
		return "formCompeticion";
	}
	
	@GetMapping("/competicion/eliminar/{id}")
	public String eliminarCompeticion(@PathVariable("id") Integer id, Model model) {
		competicionRepositorio.deleteById(id);
		return "redirect:/verCompeticion";
	}
}
