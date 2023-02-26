package com.Club_Futbol.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ControllerInicio {
	
	@GetMapping("/")
	public String verPaginaInicio(){
		return "bloqueo";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/inicio")
	public String inicio() {
		return "inicio";
	}
	
}