package com.care.homin;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
<<<<<<< HEAD
=======
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
	
>>>>>>> parent of 87670af (Merge branch 'main' into hawon)
}
