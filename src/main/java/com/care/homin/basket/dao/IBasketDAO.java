package com.care.homin.basket.dao;

import org.springframework.stereotype.Repository;

import com.care.homin.basket.dto.BasketDTO;
import com.care.homin.rental.dto.RentalDTO;

@Repository
public interface IBasketDAO {

	//상품 번호로 조회 후 장바구니 테이블에 삽입
	RentalDTO searchProduct(String no_);
	boolean putProduct(BasketDTO basketDto);
	
}
