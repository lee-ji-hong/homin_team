package com.care.homin.mypage.service;

import java.util.ArrayList;

import com.care.homin.login.dto.LoginDTO;
import com.care.homin.membership.dto.AllDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;

public interface IMypageService {
	public AllDTO infoMgmt(String id);
	public AllDTO infoMgUs(int parseInt);
	public boolean deleteProc(String id);
	public PostcodeDTO infoAddr(String id);
	public String deleteProcAddr(String id);
	public MemberDTO getUserInfo(String id);
	public String updateProc(MemberDTO memberDto);
	public String updateAddrProc(PostcodeDTO postCode);
	public String registerAdProc(PostcodeDTO postCode);
}
