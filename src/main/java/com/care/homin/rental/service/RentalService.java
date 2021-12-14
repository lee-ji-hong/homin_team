package com.care.homin.rental.service;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.homin.membership.dao.IMemberDAO;
import com.care.homin.rental.dao.RentalDAO;
import com.care.homin.rental.dto.RentalDTO;
import com.care.homin.rental.dto.orderDTO;

@Service
public class RentalService {
	@Autowired RentalDAO dao;
	
	
	public ArrayList<RentalDTO> selectCategory(String category) {
		return dao.selectCategory(category);
	}

	public RentalDTO selectProduct(String prodNo) {
		dao.productUpHit(prodNo);
		return dao.selectProduct(prodNo);
	}
	
	@Autowired IMemberDAO mDao;
	public void info(Model model, String id, String prodNo) {
		model.addAttribute("productInfo",dao.selectProduct(prodNo));
		model.addAttribute("memberInfo",mDao.memberProc(id));
		model.addAttribute("memberPostcode",mDao.selectPost(id));
	}
	
	public String selectProductImg(String productName){
		return dao.selectProductImg(productName);
	}

	public void orderHistory(orderDTO dto) {
		dao.orderHistoryProc(dto);
	}

	public void selectOrderHistory(String no, Model model) {
		orderDTO dto = dao.selectOrderHistory(no);
		model.addAttribute("orderHistory",dto);
		model.addAttribute("productImg",dao.selectProductImg(dto.getProductName()));
		model.addAttribute("classification", dao.selectClassification(dto.getProductName()));
	}
	public String selectClassification(String productName) {
		return dao.selectClassification(productName);
	}

	public ArrayList<RentalDTO> selectTopViews() {
		return dao.selectTopViews();
	}

	public void upOrderCount(String no) {
		dao.upOrderCount(no);
	}

	public ArrayList<RentalDTO> selectOrderCount() {
		return dao.selectOrderCount();
	}

	public void cancleOrder(String uid) {
		dao.cancleOrder(uid);
	}

	public void deleteProduct(String no) {
		RentalDTO dto = dao.selectProduct(no);
		String fileName = dao.selectProductImg(dto.getProduct_name());
		File deleteFile = new File("C:\\Users\\qp375\\git\\homin_team\\src\\main\\webapp\\resources\\image\\"+dto.getClassification()+"\\"+fileName);
		deleteFile.delete();
		dao.deleteProduct(no);
		
	}

	public String productInsert(MultipartHttpServletRequest multi) {
		RentalDTO check = dao.selectProduct(multi.getParameter("product_no"));
		if(check == null) {
			RentalDTO product = new RentalDTO();
			MultipartFile file = multi.getFile("product_filename");
			String originFileName = file.getOriginalFilename();
			product.setProduct_no(multi.getParameter("product_no"));
			product.setClassification(multi.getParameter("classification"));
			product.setProduct_name(multi.getParameter("product_name"));
			product.setProduct_filename(originFileName);
			product.setPrice(multi.getParameter("price"));
			product.setHit(0);
			product.setOrderCount(0);
			
			File save = new File("C:\\Users\\qp375\\git\\homin_team\\src\\main\\webapp\\resources\\image\\"+multi.getParameter("classification")+"\\"+originFileName);
			try {
				file.transferTo(save);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			dao.productInsert(product);
			return "t";
		}else {
			return "f";
		}
	}
	
	// 아직 미완
	public void productModify(MultipartHttpServletRequest product) {
		RentalDTO check = dao.selectProduct(product.getParameter("product_no"));
		if(check != null) {
			RentalDTO pr = new RentalDTO();
			MultipartFile file = product.getFile("product_filename");
			String originFileName = file.getOriginalFilename();
			
			pr.setProduct_no(product.getParameter("product_no"));
			// 카테고리 변경시 이미지 경로 수정
			pr.setClassification(product.getParameter("classification"));
			pr.setProduct_name(product.getParameter("product_name"));
			pr.setPrice(product.getParameter("price"));
			dao.productModify(pr);
			if(file.isEmpty() == false) {
				// 파일경로 수정후 기존파일삭제 새로운파일 업로드
				pr.setProduct_filename(originFileName);
			}
		}else {
			
		}
		
	}
}
