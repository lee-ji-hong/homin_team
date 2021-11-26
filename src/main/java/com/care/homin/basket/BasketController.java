package com.care.homin.basket;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.homin.basket.service.IBasketService;

@Controller
public class BasketController {
	private static final Logger logger = LoggerFactory.getLogger(BasketController.class);
	
	@Autowired IBasketService basketSvc;
	
	@ResponseBody
	@RequestMapping("basketProduct")
	public HashMap<String, String> basketProduct(@RequestBody HashMap<String, String> map, HttpSession session){
//		logger.warn(map.get("no"));
		String no_ = map.get("no");
		String id = (String) session.getAttribute("id");
		
		String msg = basketSvc.basketProduct(no_, id);
		map.put("msg", msg);
//		HashMap<String, BasketDTO> mapRes = new HashMap<String, BasketDTO>();
		return map;
	}
}
