package com.johnathonbowers.burgertracker1.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.johnathonbowers.burgertracker1.models.Burger;
import com.johnathonbowers.burgertracker1.repositories.BurgerRepository;

@Service
public class BurgerService {

	// adding the burger repository as a dependency
	private final BurgerRepository burgerRepository;
	
	public BurgerService(BurgerRepository burgerRepository) {
		this.burgerRepository = burgerRepository;
	}
	
	// returns all the burgers
	public List<Burger> allBurgers() {
		return burgerRepository.findAll();
	}
	
	// creates a burger
	public Burger createBurger(Burger burger) {
		return burgerRepository.save(burger);
	}
	
	// retrieves a burger
	public Burger findBurger(Long id) {
		Optional<Burger> optionalBurger = burgerRepository.findById(id);
		if(optionalBurger.isPresent()) {
			return optionalBurger.get();
		} else {
			return null;
		}
	}
	
	// updates a burger
	public Burger updateBurger(Burger burger) {
		return burgerRepository.save(burger);
	}
	
	// deletes a book
	public void deleteBurger(Long id) {
		burgerRepository.deleteById(id);
	}
	
}
