package com.care.homin.mypage.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.care.homin.login.LoginController;
import com.care.homin.login.dto.LoginDTO;
import com.care.homin.membership.dto.AllDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;
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
	@Override
	public PostcodeDTO infoAddr(String id) {
		PostcodeDTO postDto = mypageDao.infoAddr(id);
		return postDto;
	}
	@Override
	public String deleteProcAddr(String id) {
		boolean bool = mypageDao.deleteProcAddr(id);
		String result = "";
		if (bool == true)
			result = "주소지 삭제 완료!";
		else
			result = "주소지 삭제 실패";
		return result;
	}
	@Override
	public MemberDTO getUserInfo(String id) {
		LoginDTO loginDto = mypageDao.infoLogin(id);
		MemberDTO memberDto = mypageDao.infoMember(id);
		memberDto.setPw(loginDto.getPw());
		return memberDto;
	}
	
	@Autowired HttpSession session;
	@Override
	public String updateProc(MemberDTO memberDto) {
		Boolean check = (Boolean)session.getAttribute("authState");
		
		if(check == null) {
			return "이메일 인증 후 가입 할 수 있습니다.";
		}
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(memberDto.getPw());
		memberDto.setPw(securePw);
		
		boolean chk_login = mypageDao.updateLogin(memberDto);
		boolean chk_member = mypageDao.updateMember(memberDto);
		if (chk_login && chk_member)
			return "t";
		else
			return "f";
	}
	@Override
	public String updateAddrProc(PostcodeDTO postCode) {
		boolean chk = mypageDao.updateAddrProc(postCode);
		String result = "";
		if (chk)
			result = "주소지가 변경되었습니다";
		else
			result = "주소지 변경 실패";
		return result;
		
	}
	@Override
	public String registerAdProc(PostcodeDTO postCode) {
		boolean chk = mypageDao.registerAdProc(postCode);
		String result = "";
		if (chk)
			result = "주소지가 등록되었습니다";
		else
			result = "주소지 등록 실패";
		return result;
	}

	
}
