package com.care.homin.rental.dao;

import java.util.ArrayList;

import com.care.homin.rental.dto.RentalDTO;

public interface RentalDAO {

	ArrayList<RentalDTO> selectCategory(String category);

}
