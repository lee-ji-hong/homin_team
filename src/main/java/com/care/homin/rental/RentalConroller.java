package com.care.homin.rental;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RentalConroller {
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
	public String waterpurifier() {
		return "rental/category/waterpurifierForm";
	}
}
