/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF bravomylife.CO.KR.
 * bravomylife.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 bravomylife.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 bravomylife.co.kr에 있으며,
 * bravomylife.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * bravomylife.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 bravomylife.co.kr All Rights Reserved.
 *
 *
 * Program		: com.github.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: LoginWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240930153637][lcm991224@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.member.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.mail.MailAuthenticationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.common.component.EmailCmpn;
import kr.co.bravomylife.common.dto.EmailDto;
import kr.co.bravomylife.front.common.Common;
import kr.co.bravomylife.front.member.dto.MemberDto;
import kr.co.bravomylife.front.member.service.MemberSrvc;
import kr.co.bravomylife.util.security.HSwithSHA;
import kr.co.bravomylife.util.security.SKwithAES;

/**
 * @version 1.0.0
 * @author lcm991224@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.front.member.controller.MemberWeb")
public class MemberWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(MemberWeb.class);
	
	@Autowired
	Properties staticProperties;
	
	@Autowired
	private MessageSourceAccessor dynamicProperties;
	
	@Inject
	private EmailCmpn emailCmpn;
	
	@Inject
	private MemberSrvc memberSrvc;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 비밀번호 재설정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/findPasswdResultProc.web")
	public ModelAndView findPasswdResultProc(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto, String tempPasswd) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			// DB에서 저장된 비밀번호 가져오기
			String dbPasswd = memberSrvc.selectPasswd(memberDto).getPasswd();
			
			// DB에서 저장된 비밀번호 가져오기
			//MemberDto dbMemberDto = memberSrvc.selectPasswd(memberDto); // MemberDto 객체를 반환받음

			// 비밀번호 추출
			//String dbPasswd = dbMemberDto.getPasswd(); // dbMemberDto에서 비밀번호를 추출하여 String 타입으로 저장
			
			// 입력한 임시 비밀번호와 DB에 저장된 비밀번호 비교
			if (tempPasswd.equals(dbPasswd)) {

				// 비밀번호 업데이트 실행
				boolean updateResult = memberSrvc.updatePasswd(memberDto);
				
				if (updateResult) {
					// 업데이트 성공
					request.setAttribute("script", "alert('비밀번호가 성공적으로 변경되었습니다.');");
					request.setAttribute("redirect", "/front/login/loginForm.web");

				} else {
					// 업데이트 실패
					request.setAttribute("script", "alert('비밀번호 변경에 실패하였습니다. 시스템 관리자에게 문의하세요.');");
					request.setAttribute("redirect", "/front/member/findPasswdResult.web");
				}
				
			}
			
		}catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".findPasswdResultProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-06
	 * <p>DESCRIPTION:비밀번호 재설정 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/member/findPasswdResult.web")
	public ModelAndView findPasswdResult(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/member/findPasswdResult");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".findPasswdResult()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-07
	 * <p>DESCRIPTION:비밀번호 찾기 페이지</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/member/findPasswProc.web")
	public ModelAndView findPasswProc(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/member/findPasswdForm");
			
			logger.debug("받아온 이메일" + " = " + memberDto.getEmail());
			logger.debug("받아온 이름"+ " = " + memberDto.getMbr_nm());
			//logger.debug("받아온 핸드폰" + " = " + memberDto.getPhone());
			
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setEmail(aes.encode(memberDto.getEmail()));
			memberDto.setMbr_nm(aes.encode(memberDto.getMbr_nm()));
			//memberDto.setPhone(aes.encode(memberDto.getPhone()));
			
			int check = memberSrvc.findPasswd(memberDto);
			
			logger.debug("받아온 check 값" + " = " + check);
			logger.debug("받아온 이메일 = " + memberDto.getEmail());
			
			if (check == 1) {
				
				// 인증 이메일 발송
				EmailDto emailDto = new EmailDto();
				
				emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
				emailDto.setTo(new String[] {aes.decode(memberDto.getEmail())});
				emailDto.setSubject("이메일 인증");
				emailDto.setMessage("<b>회원 정보가 확인되었습니다.</b>아래 주소에서 비밀번호를 재설정해 주십시오.<br>"
							+ "하기 인증하기를 클릭하셔야 가입이 완료됩니다.<br><br>"
							+ "<a href='http://127.0.0.1:8080/front/member/findPasswdResult.web'>여기를 클릭하여 페이지로 이동하십시오</a><br><br>"
							+ "해당 페이지로 이동하신 다음"
							+ "다음의 임시 비밀번호를 입력하시어 비밀번호를 재설정해주십시오."
							+ " <br><br> "
							+ "[임시 비밀번호: "
							+ memberDto.getPasswd()
							+ "]");
				
				emailCmpn.send(emailDto);
				
				request.setAttribute("script"	, "alert('회원 정보가 확인되었습니다!');");
				request.setAttribute("redirect"	, "/front/member/findPasswdForm.web");
				
				mav.setViewName("forward:/servlet/result.web");
				
			}
			else {
				request.setAttribute("script"	, "alert('일치하는 정보가 없습니다!');");
				request.setAttribute("redirect"	, "/front/member/findPasswdForm.web");
				
				mav.setViewName("forward:/servlet/result.web");
			}
			
		}catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".findPasswProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-06
	 * <p>DESCRIPTION:비밀번호 찾기 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/member/findPasswdForm.web")
	public ModelAndView findPasswdForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/member/findPasswdForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".findPasswdForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-06
	 * <p>DESCRIPTION:아이디 찾기</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/member/findIdForm.web")
	public ModelAndView findIdForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/member/findIdForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-06
	 * <p>DESCRIPTION:아이디 찾기 페이지</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/member/findIdResult.web")
	public ModelAndView findId(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			logger.debug("받아온 이름" + " = " + memberDto.getMbr_nm());
			
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setMbr_nm(aes.encode(memberDto.getMbr_nm()));
			
			MemberDto memberDto_ = memberSrvc.findId(memberDto);
			
			//memberDto.setEmail(aes.decode(memberDto_.getEmail()));
			//logger.debug("JSP에 보내는 이메일" + " = " + memberDto.getEmail());
			
			if (memberDto_ != null && memberDto_.getEmail() != null) {
				// 이메일 복호화 후 DTO에 설정
				memberDto.setEmail(aes.decode(memberDto_.getEmail()));
				logger.debug("JSP에 보내는 이메일 = " + memberDto.getEmail());
			
				// 아이디 찾기에 성공했을 때
				mav.addObject("findId", memberDto);
				mav.setViewName("front/member/findIdResult");
			}
			else {
				request.setAttribute("script"	, "alert('일치하는 이메일이 없습니다!');");
				request.setAttribute("redirect"	, "/front/member/findIdForm.web");
				
				mav.setViewName("forward:/servlet/result.web");
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".findIdForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-09-19
	 * <p>DESCRIPTION: 이메일 인증</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/front/member/confirmEmail.web")
	public ModelAndView confirmEmail(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			@SuppressWarnings("unused")
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setEmail(URLDecoder.decode(memberDto.getEmail()));
			
			/*
			 *URLDecoder로 %2B가 +로 변환되어야 하는데 제대로 작동하지 않고 공백 ""으로 인식함
			memberDto.setEmail(URLDecoder.decode(email));
			String emailC = memberDto.getEmail();
			logger.debug("이메일" + emailC);
			*/
			
			if (memberSrvc.updateState(memberDto)) {
				request.setAttribute("script"	, "alert('이메일 인증이 완료되어 정상적으로 서비스를 이용할 있습니다.');");
				request.setAttribute("redirect"	, "/front/login/loginForm.web");
			}
			else {
				// [2024-10-01][TODO: 10분 이내에 인증되지 않은 이메일이므로 '#' + SEQ_MBR + '_' + EMAIL 패턴으로 업데이트]
				request.setAttribute("script"	, "alert('회원 가입 재시도 또는 고객센터에 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".confirmEmail()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-01
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT: 이메일 인증은 가입(registerProc) 시로 변경함</p>
	 * <p>EXAMPLE:</p>
	 **/
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/front/member/checkEmail.json", method = RequestMethod.POST, headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody boolean checkEmail(@RequestBody MemberDto memberDto) {
		
		boolean isDuplicate = true;
		
		try {
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
		
			// 인증 이메일 발송
			EmailDto emailDto = new EmailDto();
			
			emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
			emailDto.setTo(new String[] {memberDto.getEmail()});
			emailDto.setSubject("이메일 인증");
			emailDto.setMessage("<b>가입</b>을 축하합니다.</br>"
						+ "하기 인증하기를 클릭하셔야 가입이 완료됩니다.</br></br>"
						+ "http://127.0.0.1:8080/front/member/confirmEmail.web?email=" + URLEncoder.encode(aes.encode(memberDto.getEmail())));
			
			//emailCmpn.send(emailDto);
			// 이메일 전송 시도 및 예외 처리
			try {
				emailCmpn.send(emailDto);
				logger.info("Email sent successfully to: " + memberDto.getEmail());
			} catch (MailAuthenticationException e) {
				logger.error("SMTP Authentication failed: " + e.getMessage(), e);
				throw e;  // 예외를 다시 던져 처리할 수 있도록 함
			} catch (Exception e) {
				logger.error("Failed to send email to: " + memberDto.getEmail(), e);
				throw e;
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".checkEmail()] " + e.getMessage(), e);
		}
		finally {}
		
		return isDuplicate;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-01
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	 
	@RequestMapping(value = "/front/member/checkDuplicate.json", method = RequestMethod.POST, headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody boolean checkDuplicate(@RequestBody MemberDto memberDto) {
		
		boolean isDuplicate = true;
		
		try {
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setEmail(aes.encode(memberDto.getEmail()));
			
			int count = memberSrvc.selectDuplicate(memberDto);
			
			if (count == 0) isDuplicate = false;
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".checkDuplicate()] " + e.getMessage(), e);
		}
		finally {}
		
		return isDuplicate;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-01
	 * <p>DESCRIPTION:회원가입 페이지</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/member/registerForm.web")
	public ModelAndView registerForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/member/registerForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-01
	 * <p>DESCRIPTION:회원가입 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/front/member/registerProc.web" , method = RequestMethod.POST)
	public ModelAndView registerProc(HttpServletRequest request, HttpServletResponse response
			, MemberDto memberDto
			, String term_1
			, String term_2
			, String term_3) {
		
		logger.debug(memberDto.getAge()+"");
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			if (term_1 == null || term_1.equals("")) term_1 = "N";
			if (term_2 == null || term_2.equals("")) term_2 = "N";
			if (term_3 == null || term_3.equals("")) term_3 = "N";
			
			//logger.debug(term_1);
			//logger.debug(term_2);
			//logger.debug(term_3);
			
			// [2024-10-01][TODO: 약관 갯수(JSP)에 무관하게 처리될 수 있도록 개선]
			String[] arrTermAgreement = {term_1, term_2, term_3};
			
			/*
			logger.debug("암호화 전: " + memberDto.getEmail());
			logger.debug("암호화 전: " + memberDto.getPasswd());
			logger.debug("암호화 전: " + memberDto.getMbr_nm());
			logger.debug("암호화 전: " + memberDto.getAge());
			logger.debug("암호화 전: " + memberDto.getGender());
			logger.debug("암호화 전: " + memberDto.getPhone());
			logger.debug("암호화 전: " + memberDto.getPost() + " " + memberDto.getAddr1() + " " + memberDto.getAddr2());
			*/
			if (memberDto.getFlg_email() == null || memberDto.getFlg_email().equals("")) memberDto.setFlg_email("N");
			if (memberDto.getFlg_sms() == null || memberDto.getFlg_sms().equals("")) memberDto.setFlg_sms("N");
			
			//logger.debug(memberDto.getFlg_email());
			//logger.debug(memberDto.getFlg_sms());
			
			// 해쉬 암호화(SHA-256)
			memberDto.setPasswd(HSwithSHA.encode(memberDto.getPasswd()));
			//logger.debug("암호화 후(Passwd): " + memberDto.getPasswd());
			
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setEmail(aes.encode(memberDto.getEmail()));
			memberDto.setMbr_nm(aes.encode(memberDto.getMbr_nm()));
			memberDto.setPhone(aes.encode(memberDto.getPhone()));
			memberDto.setPost(aes.encode(memberDto.getPost()));
			memberDto.setAddr1(aes.encode(memberDto.getAddr1()));
			memberDto.setAddr2(aes.encode(memberDto.getAddr2()));
			//logger.debug("암호화 후(Email): " + memberDto.getEmail());
			//logger.debug("암호화 후(Name): " + memberDto.getName());
			//logger.debug("암호화 후(Phone): " + memberDto.getPhone());
			//logger.debug("암호화 후(Post + Addr1 + Addr2): " + memberDto.getPost() + " " + memberDto.getAddr1() + " " + memberDto.getAddr2());
			
			boolean insert = memberSrvc.insert(memberDto, arrTermAgreement, aes.decode(memberDto.getPost()));
			
			if (insert) {
				
				logger.debug("가입 성공");
				
				// 인증 이메일 발송
				EmailDto emailDto = new EmailDto();
				
				emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
				emailDto.setTo(new String[] {aes.decode(memberDto.getEmail())});
				emailDto.setSubject("가입 축하 및 이메일 인증");
				emailDto.setMessage("<b>가입</b>을 축하합니다.</br>"
							+ "하기 인증하기를 10분 이내에 클릭하셔야 가입이 완료됩니다.</br></br>"
							+ "http://127.0.0.1:8080/front/member/confirmEmail.web?email=" + URLEncoder.encode(memberDto.getEmail()));
				
				emailCmpn.send(emailDto);
				
				// 가입 축하 이메일 발송
				/*
				EmailDto emailDto = new EmailDto();
				
				emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
				emailDto.setTo(new String[] {aes.decode(memberDto.getEmail())});
				emailDto.setSubject("가입 축하");
				emailDto.setMessage("<b>가입</b>을 축하합니다.");
				
				emailCmpn.send(emailDto);
				*/
			}
			else logger.debug("가입 실패");
			
			
			request.setAttribute("redirect"	, "/");
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch  (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}