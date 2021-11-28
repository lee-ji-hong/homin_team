package com.care.homin.mypage.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.homin.login.LoginController;
import com.care.homin.login.dto.LoginDTO;
import com.care.homin.membership.dto.AllDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.mypage.repository.IMypageDAO;

@Service
public class MypageServiceImpl implements IMypageService{
	@Autowired IMypageDAO mypageDao;
	
	public AllDTO infoMgmt(String id) {
		LoginDTO loginDto = mypageDao.infoLogin(id);
//		System.out.println("loginDto.getId()"+loginDto.getId());
		MemberDTO memberDto = mypageDao.infoMember(id);
//		System.out.println("memberDto.getId()"+memberDto.getId());
		AllDTO allDto = new AllDTO();
		if (loginDto != null && memberDto != null) {
			allDto.setNo(memberDto.getNo());
			allDto.setId(loginDto.getId());
			allDto.setNickname(memberDto.getNickname());
			allDto.setPhone(memberDto.getPhone());
			allDto.setEmail(memberDto.getEmail());
			return allDto;
		} else {
			return null;
		}
	}
	@Override
	public ArrayList<MemberDTO> infoManage() {
		ArrayList<MemberDTO> list = mypageDao.infoList();
		return list;
	}
	@Override
	public AllDTO infoMgUs(int no) {
		MemberDTO memberDto = mypageDao.infoMemberByNo(no);
		LoginDTO loginDto = mypageDao.infoLogin(memberDto.getId());
		AllDTO allDto = new AllDTO();
		if (loginDto != null && memberDto != null) {
			allDto.setNo(memberDto.getNo());
			allDto.setId(loginDto.getId());
			allDto.setNickname(memberDto.getNickname());
			allDto.setPhone(memberDto.getPhone());
			allDto.setEmail(memberDto.getEmail());
			return allDto;
		} else {
			return null;
		}
	}
	@Override
	public boolean deleteProc(String id) {
		boolean bool = mypageDao.deleteProc(id);
		return bool;
	}

	
}
