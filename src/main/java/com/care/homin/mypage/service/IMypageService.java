package com.care.homin.mypage.service;

import java.util.ArrayList;

import com.care.homin.membership.dto.AllDTO;
import com.care.homin.membership.dto.MemberDTO;

public interface IMypageService {
	public AllDTO infoMgmt(String id);
	public ArrayList<MemberDTO> infoManage();
	public AllDTO infoMgUs(int parseInt);
	public boolean deleteProc(String id);
}
