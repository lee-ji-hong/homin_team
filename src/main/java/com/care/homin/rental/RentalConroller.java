package com.care.homin.rental;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.homin.rental.service.RentalService;


@Controller
public class RentalConroller {
	@Autowired RentalService service;
	@Autowired HttpSession session;
	
	
	@RequestMapping(value = "/productOrder")
	public String productOrder(Model model, @RequestParam String prodNo) {
		String id = (String)session.getAttribute("id");
		service.info(model, id, prodNo);
		return "rental/productOrderForm";
	}
	@RequestMapping(value = "/order")
	public String order(Model model, @RequestParam String prodNo) {
		String id = (String)session.getAttribute("id");
		service.info(model, id, prodNo);
		return "rental/orderForm";
	}
}
