package com.care.homin.basket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.homin.basket.dao.IBasketDAO;
import com.care.homin.basket.dto.BasketDTO;
import com.care.homin.rental.dto.RentalDTO;

@Service
public class BasketServiceImpl implements IBasketService{
	@Autowired IBasketDAO basketDao;
	
	@Override
	public String  basketProduct(String no_, String id) {
		RentalDTO dto = basketDao.searchProduct(no_);
		String result = "";
		if (dto != null) {
			BasketDTO basketDto = new BasketDTO();
			basketDto.setId(id);
			basketDto.setProduct_no(no_);
			basketDto.setProduct_name(dto.getProduct_name());
			basketDto.setClassification(dto.getClassification());
			basketDto.setPrice(dto.getPrice());
			boolean chk = basketDao.putProduct(basketDto);
			if (chk) {
				result = "장바구니에 추가되었습니다";
			} else {
				result = "장바구니 추가 오류";
			}
		} else {
			result = "상품번호에 대한 정보가 없습니다";
		}
		return result;
	}
	
}
