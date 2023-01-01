package com.johnathonbowers.burgertracker1.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.johnathonbowers.burgertracker1.models.Burger;
import com.johnathonbowers.burgertracker1.services.BurgerService;

@Controller
public class BurgerController {

	@Autowired
	BurgerService burgerService;
	
	@GetMapping("/")
	public String getAll(@ModelAttribute("burger") Burger burger, Model model) {
		List<Burger> allBurgers = burgerService.allBurgers();
		model.addAttribute("allBurgers", allBurgers);
		return "index.jsp";
	}
	
	@PostMapping("/burgers/add")
	public String createBurger(@Valid @ModelAttribute("burger") Burger burger, BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<Burger> allBurgers = burgerService.allBurgers();
			model.addAttribute("allBurgers", allBurgers);
			return "index.jsp";
		} else {
			burgerService.createBurger(burger);
			return "redirect:/";
		}
	}
}