package com.care.homin.rental.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.homin.membership.dao.IMemberDAO;
import com.care.homin.rental.dao.RentalDAO;
import com.care.homin.rental.dto.RentalDTO;

@Service
public class RentalService {
	@Autowired RentalDAO dao;
	
	
	public ArrayList<RentalDTO> selectCategory(String category) {
		return dao.selectCategory(category);
	}

	public RentalDTO selectProduct(String prodNo) {
		return dao.selectProduct(prodNo);
	}
	
	@Autowired IMemberDAO mDao;
	public void info(Model model, String id, String prodNo) {
		model.addAttribute("productInfo",dao.selectProduct(prodNo));
		model.addAttribute("memberInfo",mDao.memberProc(id));
		model.addAttribute("memberPostcode",mDao.selectPost(id));
	}
}
