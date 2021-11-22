package com.care.homin.rental;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.homin.rental.dto.RentalDTO;
import com.care.homin.rental.service.RentalService;

@Controller
public class RentalConroller {
	@Autowired RentalService service;
	
	@RequestMapping(value = "/dryer")
	public String dryer() {
		return "rental/category/dryerForm";
	}
	@RequestMapping(value = "/aircleaner")
	public String aircleaner() {
		return "rental/category/aircleanerForm";
	}
	@RequestMapping(value = "/microwave")
	public String microwave() {
		return "rental/category/microwaveForm";
	}
	@RequestMapping(value = "/refrigerator")
	public String refrigerator() {
		return "rental/category/refrigeratorForm";
	}
	@RequestMapping(value = "/washmachine")
	public String washmachine() {
		return "rental/category/washmachineForm";
	}
	@RequestMapping(value = "/waterpurifier")
	public String waterpurifier(String category) {
		return "rental/category/waterpurifierForm";
	}
}
