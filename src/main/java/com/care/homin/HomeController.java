package com.care.homin;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.homin.rental.service.RentalService;


@Controller
public class HomeController {
	@Autowired RentalService service;
	
	@RequestMapping(value = "/")
	public String index(Model model) {
		model.addAttribute("formpath", "home");
		return "index";
	}
	
	@RequestMapping(value = "/index")
	public String index(Model model,@RequestParam String formpath) {
		model.addAttribute("formpath", formpath);
		return "index";
	}
	
	@RequestMapping(value = "/home")
	public void home() {}
	
	@RequestMapping(value = "/servicecenter")
	public String serviceCenter(Model model,@RequestParam String list) {
		model.addAttribute("list", list);
		return "/servicecenter/servicecenterForm";
	}
	@RequestMapping(value = "/board")
	public String board() {
		return "/board/boardForm";
	}
	@RequestMapping(value = "/write")
	public String write() {
		return "/board/writeForm";
	}
	@RequestMapping(value = "/view")
	public String view() {
		return "board/viewForm";
	}
	@RequestMapping(value = "/modify")
	public String modify() {
		return "board/boardModifyForm";
	}
	@RequestMapping(value = "/mypage")
	public String mypage() {
		return "mypage/mypageForm";
	}
	
	@RequestMapping(value = "/rental")
	public String rental(Model model,@RequestParam String category) {
		model.addAttribute("product",service.selectCategory(category));
		model.addAttribute("category", category);
		return "/rental/rentalForm";
	}
	
	@RequestMapping(value = "/product")
	public String product(Model model,@RequestParam String prodNo) {
		model.addAttribute("product",service.selectProduct(prodNo));
		return "/rental/productForm";
	}
	
}
