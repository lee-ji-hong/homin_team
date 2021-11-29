package com.care.homin.mypage;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.SessionScope;

import com.care.homin.login.dto.LoginDTO;
import com.care.homin.login.service.ILoginService;
import com.care.homin.membership.dto.AllDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;
import com.care.homin.mypage.service.IMypageService;

@Controller
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Autowired IMypageService mypageSvc;
	@Autowired ILoginService loginSvc;
	
	@RequestMapping("mypageProc")
	public String mypage() {
		return "forward:index?formpath=mypage";
	}
	//정보관리 위한 비밀번호 확인
	@ResponseBody
	@RequestMapping("pwCheckProc")
	public HashMap<String, String> idPwCheck(LoginDTO loginDto, @RequestBody HashMap<String, String> map) {
//			logger.warn("map : " + map.get("id"));
//			logger.warn("map : " + map.get("pw"));
		
		loginDto.setId(map.get("id"));
		loginDto.setPw(map.get("pw"));
//			logger.warn("loginDto : " + loginDto.getId());
//			logger.warn("loginDto : " + loginDto.getPw());
		
		MemberDTO chk = loginSvc.loginProc(loginDto);
		if (chk == null)
			map.put("msg", "비밀번호가 일치하지 않습니다.");
		else
			map.put("msg", "");
		return map;
	}
	//사용자, 회원 조회
	@RequestMapping("/info/mgmt")
	public String infoMgmt(Model model, String id) {
		AllDTO allDto = mypageSvc.infoMgmt(id);
		
		if (allDto != null)
			model.addAttribute("allDto", allDto);
		return "mypage/info/user/mgmt";
	}
	//사용자, 회원 수정
	@RequestMapping("/mgmt/confirmPwForUdMb")
	public String confirmPwForUdMb() {
		return "mypage/info/user/confirmPwForUdMb";
	}
	@RequestMapping("/mgmt/updateMbForm")
	public String updateMbForm(String id, Model model) {
		LoginDTO userInfo = mypageSvc.getUserInfo(id);
		model.addAttribute("userInfo", userInfo);
		return "mypage/info/user/updateMbForm";
	}
	@RequestMapping("mgmt/updateProc")
	public String updateProc(MemberDTO memberDto, Model model, HttpSession session) {
		String msg = mypageSvc.updateProc(memberDto);
		if (msg.equals("t")) {
			session.invalidate();
			model.addAttribute("msg", "회원정보 수정 완료!");
			
			model.addAttribute("formpath", "home");
			return "index";
		} else {
			model.addAttribute("msg", "회원정보 수정오류 발생");
			
			return "forward:index?formpath=home";
		}
	}
	//사용자, 회원 탈퇴
	@RequestMapping("/mgmt/confirmPw")
	public String confirmPw() {
		return "mypage/info/user/confirmPw";
	}
	@RequestMapping("mgmt/deleteProc")
	public String deleteProc(LoginDTO loginDto, Model model, HttpSession session) {
//			logger.warn("loginDto.getId() : " + loginDto.getId());
//			logger.warn("loginDto.getPw() : " + loginDto.getPw());
		boolean bool = mypageSvc.deleteProc(loginDto.getId());
		if (bool) {
			session.invalidate();
			model.addAttribute("msg", "회원 탈퇴 완료");
			model.addAttribute("formpath", "home");
			return "index";
		} else {
			model.addAttribute("formpath", "mgmt/confirmPw");
			return "index";
		}
	}
	
	//사용자, 주소 조회
	@RequestMapping("/info/addr")
	public String infoAddr(Model model, String id, HttpSession session) {
		logger.warn("id : " + id);
		if (id == null)
			id = (String) session.getAttribute("id");
		PostcodeDTO pc = mypageSvc.infoAddr(id);
		
		model.addAttribute("postCode", pc);
		return "mypage/info/user/addr";
	}
	//사용자, 주소 수정
	@RequestMapping("/addr/updateAdForm")
	public String updateAdForm() {
		return "mypage/info/user/updateAdForm";
	}
	@RequestMapping("addr/updateProc")
	public String updateAddrProc(PostcodeDTO postCode, HttpSession session, Model model) {
//		logger.warn("session.getAttribute(\"id\") : " + session.getAttribute("id"));
		String id = (String) session.getAttribute("id");
		postCode.setId(id);
		String msg = mypageSvc.updateAddrProc(postCode);
		if (msg.equals("주소지가 변경되었습니다")) {
			model.addAttribute("msg", msg);
			model.addAttribute("formpath", "mypage");
			return "index";
		} else 
			model.addAttribute("formpath", "addr/updateAdForm");
			return "index";
	}
	
	//사용자, 주소 삭제
	@RequestMapping("/addr/confirmPw")
	public String confirmPwForAddr() {
		return "mypage/info/user/confirmPwAddr";
	}
	@RequestMapping("addr/deleteProc")
	public String deleteProcAddr(LoginDTO loginDto, Model model) {
		String msg = mypageSvc.deleteProcAddr(loginDto.getId());
		
		model.addAttribute("msg", msg);
		model.addAttribute("formpath", "info/addr");
		return "index";
	}
	//사용자, 주소 추가
	@RequestMapping("/addr/registerAdForm")
	public String registerAdForm() {
		return "mypage/info/user/registerAdForm";
	}
	@RequestMapping("registerAddrProc")
	public String registerAdProc(PostcodeDTO postCode, HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		postCode.setId(id);
		
		String msg = mypageSvc.registerAdProc(postCode);
		logger.warn(msg);
		if (msg.equals("주소지가 등록되었습니다")) {
			model.addAttribute("msg", msg);
			model.addAttribute("formpath", "info/addr");
			return "index";
		} else {
			model.addAttribute("formpath", "addr/registerAdForm");
			return "index";
		}
	}
	@RequestMapping(value = "myinquiry")
	public String myinquiry(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		model.addAttribute("myinquiry",mypageSvc.myInquiry(id));
		return "mypage/myinquiryForm";
	}
	@RequestMapping(value = "myinquiryView")
	public String myinquiryView(Model model, String no) {
		mypageSvc.myInquiryView(no,model);
		return "mypage/myinquiryViewForm";
	}
	
}
