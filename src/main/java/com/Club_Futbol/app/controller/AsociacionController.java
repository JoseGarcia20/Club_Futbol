package com.Club_Futbol.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.Club_Futbol.app.entity.Asociacion;
import com.Club_Futbol.app.repository.AsociacionRepositorio;

@Controller
public class AsociacionController {
	
	@Autowired
	private AsociacionRepositorio asociacionRepositorio;

	@GetMapping("/verAsociacion")  
	public String listarAsociacion (Model model) {
		List<Asociacion> listaAsociacion = asociacionRepositorio.findAll();
		model.addAttribute("listaAsociacion", listaAsociacion);
		return "verAsociacion";
	}
	
	@GetMapping("/verAsociacion/formAsociacion")
	public String mostrarFormulario (Model model) {
		model.addAttribute("asociacion", new Asociacion());
		return "formAsociacion";
	}
	
	@PostMapping("/guardarAsociacion")
	public String guardarAsociacion (Asociacion asociacion) {
		asociacionRepositorio.save(asociacion);
		return "redirect:/verAsociacion";
	}
	
	@GetMapping("/asociacion/editar/{id}")
	public String modificarAsociacion (@PathVariable("id") Integer id, Model model) {
		Asociacion asociacion = asociacionRepositorio.findById(id).get();
		model.addAttribute("asociacion", asociacion);
		
		return "formAsociacion";
	}
	
	@GetMapping("/asociacion/eliminar/{id}")
	public String eliminarAsociacion(@PathVariable("id") Integer id, Model model) {
		asociacionRepositorio.deleteById(id);
		return "redirect:/verAsociacion";
	}
	
}
