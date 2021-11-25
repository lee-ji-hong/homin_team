package com.care.homin.rental;


import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.homin.rental.service.RentalService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;


@Controller
public class RentalController {
	@Autowired RentalService service;
	@Autowired HttpSession session;
	private IamportClient api;
	
	// 토큰 발급
	public RentalController() {
		this.api = new IamportClient("4550188229898136","d14634a7203799f7081d4658664899c7e241ecea4eda82144d32e27c1b36c50bd17fbe0c137cd0d4");
	}
	
	@ResponseBody
	@RequestMapping(value="/check/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
	{	
			return api.paymentByImpUid(imp_uid);
	}
	
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
