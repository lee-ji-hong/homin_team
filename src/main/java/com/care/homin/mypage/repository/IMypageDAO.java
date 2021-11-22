package com.care.homin.mypage.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.care.homin.login.dto.LoginDTO;
import com.care.homin.membership.dto.MemberDTO;

@Repository
public interface IMypageDAO {
	LoginDTO infoLogin(String id);
	MemberDTO infoMember(String id);
	MemberDTO infoMemberByNo(int no);
	ArrayList<MemberDTO> infoList();
	boolean deleteProc(String id);
}
