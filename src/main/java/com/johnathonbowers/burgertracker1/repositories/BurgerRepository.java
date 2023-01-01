package com.johnathonbowers.burgertracker1.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.johnathonbowers.burgertracker1.models.Burger;

public interface BurgerRepository extends CrudRepository<Burger, Long>{
	
	// this method retrieves all the burgers from the database
	List<Burger> findAll();
	
}
