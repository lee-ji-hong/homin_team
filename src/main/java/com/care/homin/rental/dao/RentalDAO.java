package com.care.homin.rental.dao;

import java.util.ArrayList;

import com.care.homin.rental.dto.RentalDTO;

public interface RentalDAO {
	// 카테고리별 제품
	ArrayList<RentalDTO> selectCategory(String category);
	// 제품 상세
	RentalDTO selectProduct(String prodNo);

}
