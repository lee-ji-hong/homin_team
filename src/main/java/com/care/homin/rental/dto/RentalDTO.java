package com.care.homin.rental.dto;

public class RentalDTO {
	private String product_no;
	private String product_name;
	private String product_filename;
	private String classification;
	public String getProduct_no() {
		return product_no;
	}
	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_filename() {
		return product_filename;
	}
	public void setProduct_filename(String product_filename) {
		this.product_filename = product_filename;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	
}
