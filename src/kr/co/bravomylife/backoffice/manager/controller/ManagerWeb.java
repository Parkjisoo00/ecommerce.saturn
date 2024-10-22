/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 himedia.co.kr에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: kr.co.himedia.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: managerWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241018155103][alstjsrla28#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.manager.controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.common.component.EmailCmpn;
import kr.co.bravomylife.common.dto.EmailDto;
import kr.co.bravomylife.backoffice.common.Common;
import kr.co.bravomylife.backoffice.manager.dto.ManagerDto;
import kr.co.bravomylife.backoffice.manager.service.ManagerSrvc;
import kr.co.bravomylife.util.security.HSwithSHA;
import kr.co.bravomylife.util.security.SKwithAES;

/**
 * @version 1.0.0
 * @author alstjsrla28#gmail.com
 * 
 * @since 2024-10-18
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.backoffice.manager.controller.ManagerWeb")
public class ManagerWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(ManagerWeb.class);
	
	@Autowired
	Properties staticProperties;
	
	@Autowired
	private MessageSourceAccessor dynamicProperties;
	
	@Inject
	private EmailCmpn emailCmpn;
	
	@Inject
	private ManagerSrvc managerSrvc;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-21
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	 
	@RequestMapping(value = "/console/manager/checkDuplicate.json", method = RequestMethod.POST, headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody boolean checkDuplicate(@RequestBody ManagerDto managerDto) {
		
		boolean isDuplicate = true;
		
		try {
			// 대칭키 암호화(AES-256)

			String staticKey	= staticProperties.getProperty("backoffice.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			managerDto.setEmail(aes.encode(managerDto.getEmail()));
			
			int count = managerSrvc.selectDuplicate(managerDto);
			
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
	 * @since 2024-10-21
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT: 이메일 인증은 가입(registerProc) 시로 변경함</p>
	 * <p>EXAMPLE:</p>
	 **/
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/console/manager/checkEmail.json", method = RequestMethod.POST, headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody boolean checkEmail(@RequestBody ManagerDto managerDto) {
		
		boolean isDuplicate = true;
		
		try {
			
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("backoffice.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);

			// 인증 이메일 발송
			EmailDto emailDto = new EmailDto();
			
			emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
			emailDto.setTo(new String[] {managerDto.getEmail()});
			emailDto.setSubject("이메일 인증");
			emailDto.setMessage("<b>가입</b>을 축하합니다.</br>"
						+ "하기 인증하기를 클릭하셔야 가입이 완료됩니다.</br></br>"
						+ "http://127.0.0.1:8080/console/manager/confirmEmail.web?email=" + URLEncoder.encode(aes.encode(managerDto.getEmail())));
			
			
			emailCmpn.send(emailDto);
			
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
	 * @since 2024-10-21
	 * <p>DESCRIPTION: 이메일 인증</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/console/manager/confirmEmail.web")
	public ModelAndView confirmEmail(HttpServletRequest request, HttpServletResponse response, ManagerDto managerDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			String staticKey	= staticProperties.getProperty("backoffice.enc.user.aes256.key", "[UNDEFINED]");
			@SuppressWarnings("unused")
			SKwithAES aes		= new SKwithAES(staticKey);
			
			managerDto.setEmail(URLDecoder.decode(managerDto.getEmail()));
			
			/*
			 *URLDecoder로 %2B가 +로 변환되어야 하는데 제대로 작동하지 않고 공백 ""으로 인식함
			managerDto.setEmail(URLDecoder.decode(email));
			String emailC = managerDto.getEmail();
			logger.debug("이메일" + emailC);
			*/
			
			if (managerSrvc.updateState(managerDto)) {
				request.setAttribute("script"	, "alert('이메일 인증이 완료되어 정상적으로 서비스를 이용할 있습니다.');");
				request.setAttribute("redirect"	, "/console/login/loginForm.web");
			}
			else {
				// [2024-10-01][TODO: 10분 이내에 인증되지 않은 이메일이므로 '#' + SEQ_MBR + '_' + EMAIL 패턴으로 업데이트]
				request.setAttribute("script"	, "alert('회원 가입 재시도 또는 고객센터에 문의하세요!');");
				request.setAttribute("redirect"	, "/console/");
			}
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".confirmEmail()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	@RequestMapping(value = "/console/manager/registerForm.web")
	public ModelAndView registerForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("backoffice/manager/registerForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/console/manager/registerProc.web")
	public ModelAndView registerProc(HttpServletRequest request, HttpServletResponse response, ManagerDto managerDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			// 해쉬 암호화(SHA-256)
			managerDto.setPasswd(HSwithSHA.encode(managerDto.getPasswd()));
			//logger.debug("암호화 후(Passwd): " + managerDto.getPasswd());
			
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("backoffice.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			managerDto.setEmail(aes.encode(managerDto.getEmail()));
			managerDto.setMng_nm(aes.encode(managerDto.getMng_nm()));
			managerDto.setPhone(aes.encode(managerDto.getPhone()));
			managerDto.setPost(aes.encode(managerDto.getPost()));
			managerDto.setAddr1(aes.encode(managerDto.getAddr1()));
			managerDto.setAddr2(aes.encode(managerDto.getAddr2()));
			//logger.debug("암호화 후(Email): " + managerDto.getEmail());
			//logger.debug("암호화 후(Name): " + managerDto.getName());
			//logger.debug("암호화 후(Phone): " + managerDto.getPhone());
			//logger.debug("암호화 후(Post + Addr1 + Addr2): " + managerDto.getPost() + " " + managerDto.getAddr1() + " " + managerDto.getAddr2());
			
			boolean insert = managerSrvc.insert(managerDto, aes.decode(managerDto.getPost()));
			
			if (insert) {
				
				logger.debug("가입 성공");
				
				// 인증 이메일 발송
				EmailDto emailDto = new EmailDto();
				
				emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
				emailDto.setTo(new String[] {aes.decode(managerDto.getEmail())});
				emailDto.setSubject("가입 축하 및 이메일 인증");
				emailDto.setMessage("<b>가입</b>을 축하합니다.</br>"
							+ "하기 인증하기를 10분 이내에 클릭하셔야 가입이 완료됩니다.</br></br>"
							+ "http://127.0.0.1:8080/console/member/confirmEmail.web?email=" + URLEncoder.encode(managerDto.getEmail()));
				
				emailCmpn.send(emailDto);
				
				// 가입 축하 이메일 발송
				/*
				EmailDto emailDto = new EmailDto();
				
				emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
				emailDto.setTo(new String[] {aes.decode(managerDto.getEmail())});
				emailDto.setSubject("가입 축하");
				emailDto.setMessage("<b>가입</b>을 축하합니다.");
				
				emailCmpn.send(emailDto);
				*/
			}
			else logger.debug("가입 실패");
			
			
			request.setAttribute("redirect"	, "/");
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
}
