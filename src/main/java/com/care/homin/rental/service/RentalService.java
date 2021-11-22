package com.care.homin.rental.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.homin.rental.dao.RentalDAO;
import com.care.homin.rental.dto.RentalDTO;

@Service
public class RentalService {
	@Autowired RentalDAO dao;

	public ArrayList<RentalDTO> selectCategory(String category) {
		
		return dao.selectCategory(category);
	}
	
}
