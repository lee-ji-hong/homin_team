package com.care.homin.mypage.repository;

import org.springframework.stereotype.Repository;

import com.care.homin.login.dto.LoginDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;

@Repository
public interface IMypageDAO {
	LoginDTO infoLogin(String id);
	MemberDTO infoMember(String id);
	MemberDTO infoMemberByNo(int no);
	PostcodeDTO infoAddr(String id);
	
	boolean deleteProc(String id);
	boolean deleteProcAddr(String id);
	
	boolean updateLogin(MemberDTO memberDto);
	boolean updateMember(MemberDTO memberDto);
	boolean updateAddrProc(PostcodeDTO postCode);
	
	boolean registerAdProc(PostcodeDTO postCode);
}
