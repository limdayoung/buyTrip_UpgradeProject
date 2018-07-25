package buytrip.mvc.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import buytrip.mvc.model.dto.UserDTO;
import buytrip.mvc.model.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	//사진 저장 경로
	String path="";
		
	//회원정보수정시 비밀번호 암호화처리를 위한 객체를 주입받는다
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	/**
	 * mypage view단 출력
	 * @return
	 */
	@RequestMapping("/mypage")
	public ModelAndView mypage(Authentication auth) {
		UserDTO userDTO = (UserDTO)auth.getPrincipal();
		String memberId = userDTO.getMemberId();
		UserDTO userdto = userService.findMemberById(memberId);
		return new ModelAndView("mypage/mypage_my", "userdto", userdto);
	}
	
	@RequestMapping("index")
	public String index() {
		return "user/index";
	}
	
	/**
	 * 회원가입 폼 띄우기
	 */
	@RequestMapping("/signup")
	public String signupForm(UserDTO userDTO) {
		userService.signup(userDTO);
		
		return "redirect:/";
	}
	
	/**
	 * 회원가입하기
	 */
	@RequestMapping("/signupForm")	
	public void signup() {}
	
	/**
	 * 로그인 폼 띄우기
	 */
	@RequestMapping("/loginForm")
	public void loginForm() {}
	
	/**
	 * 로그인하기
	 */
	@RequestMapping("/login")
	public void login(){
		System.out.println("user/login의 Controller 실행됨...");
	}
	
	/**
	 * 로그아웃하기
	 */
	@RequestMapping("/logout")
	public void logout() {}
	
	
	/**
	 * 비밀번호 찾기 폼 띄우기
	 */
	@RequestMapping("/passwordForm")
	public void passwordForm() {}
	
	@RequestMapping("/updateForm") 
	public String updateForm() {
		return "user/updateForm";
	}
	
	/**
	 * 회원정보 수정하기
	 */
	@RequestMapping("/updateMemberAction")
	public String updateMemberAction(String password, UserDTO vo,
			MultipartHttpServletRequest mtRequest, HttpSession session, Authentication auth) {
		
		UserDTO pvo=(UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		boolean b=passwordEncoder.matches(password, pvo.getMemberPassword());
		System.out.println("password, pvo.getMemberPassword()"+password+ pvo.getMemberPassword());
		if(b) {
		System.out.println("1. MemberVO  :: "+vo);
		//회원정보 수정위해 Spring Security 세션 회원정보를 반환받는다
		
		
		System.out.println("2. Spring Security 세션 수정 전 회원정보:" + pvo);
		
		//변경할 비밀번호를 암호화한다 
		String encodePassword=passwordEncoder.encode(vo.getMemberPassword());
		vo.setMemberPassword(encodePassword);
		
		System.out.println("**********************************************");
		// 수정한 회원정보로 Spring Security 세션 회원정보를 업데이트한다
		pvo.setMemberPassword(encodePassword);
		pvo.setMemberName(vo.getMemberName());
		pvo.setMobile(vo.getMobile());
		System.out.println("3. Spring Security 세션 수정 후 회원정보:" + pvo);
		}
		else {
			throw new  RuntimeException ("비밀번호 오류이므로 수정안됩니다.");
		}
		
		//----------------------회원사진 수정----------------------------------
		//사진 저장 경로 구하기
		String savePath = session.getServletContext().getRealPath("/resources/member");
		
		//회원사진 첨부
		MultipartFile Img = mtRequest.getFile("file");
		if(Img.getSize()>0) {
			//저장할 파일명
			String memberImg = System.currentTimeMillis()+"_"+Img.getOriginalFilename();
			vo.setMemberImg(memberImg);
			try {
				//지정한 경로에 사진 저장
				Img.transferTo(new File(savePath+"/"+memberImg));
			} catch (IllegalStateException | IOException e) {
				//e.printStackTrace();
			}
			userService.updateMember(vo);
		}
		return "redirect:/";
	}
	
	/**
	 * 비밀번호 인증 재설정하기
	 */
	@RequestMapping("/updatePassword")
	public void updatePassword() {
	}
	
	
	/**
	 * 특정 회원 검색하기
	 */
	@RequestMapping("user/findMember")
	public ModelAndView findMember(HttpServletRequest request) {
		String id = request.getParameter("id");
		UserDTO userdto=userService.findMemberById(id);
		return new ModelAndView("user/findMember_result","userdto",userdto);
	}
	
	
	
	/**
	 * 프로필 수정 폼 띄우기
	 */
	@RequestMapping("/profileForm")
	public void profileForm() {
		//UserDTO user = dao.selectProfile();
		//return new ModelAndView("", "user" , user);
	}
	
	/**
	 * 프로필 수정하기
	 */
	@RequestMapping("/updateProfile")
	public void updateProfile() {
		//UserDTO dbUser = updateProfile(user);
		//return new ModelAndView("", "user" , dbUser);
	}
	
	/**
	 * 회원 탈퇴하기
	 */
	@RequestMapping("/withdraw")
	public String withdraw(String memberId , String memberPassword) {
		userService.withdraw(memberId, memberPassword);
		return "redirect:/";
	}
	
	/**
	 * 회원가입 중복체크
	 * */
	@RequestMapping("idcheckAjax")
	@ResponseBody
	public String idCheckAjax(HttpServletRequest request) {
		return userService.idCheck(request.getParameter("memberId"));
	}
	
	/**
	 * 비밀번호 DB체크
	 * */
	@RequestMapping("passCheckAjax")
	@ResponseBody
	public String passCheckAjax(HttpServletRequest request) {
		String pass= request.getParameter("pwd");
		return userService.passCheck(pass);
	}
	
	
	
	@RequestMapping(value="/emailAuth" , produces="text/plain;charset=utf-8")
	@ResponseBody
	public String emailAuth(HttpServletRequest request) {
	    ModelAndView mav = new ModelAndView();
	        
	    String email = request.getParameter("email");
	    String authNum = "";
	        
	    authNum = randomNum();
	    //가입승인에 사용될 인증키 난수 발생    
	    sendEmail(email, authNum);
	    //이메일전송
	    String str = authNum;
	        
	    return str;    
	}
	
	
	
	
	
	@RequestMapping(value="/emailAuthPass" , produces="text/plain;charset=utf-8")
	@ResponseBody
	public String emailAuthPass(HttpServletRequest request) {
	    ModelAndView mav = new ModelAndView();
	        
	    String email = request.getParameter("email");
	    String authNum = "";
	       
	    authNum = randomNum();
	    //가입승인에 사용될 인증키 난수 발생
	    
	    UserDTO userDTO= userService.findMemberById(email);
	    
	    String encodePassword=passwordEncoder.encode(authNum);
	    userDTO.setMemberPassword(encodePassword);
	    userService.updateMember(userDTO);
	    
	    sendEmail(email, authNum);
	    //이메일전송
	    String str = authNum;
	        
	        
	    return str;
	}
	
	private String randomNum() {
	    StringBuffer buffer = new StringBuffer();
	        
	    for( int i = 0 ; i <= 6 ; i++) {
	        int n = (int)(Math.random()*10);
	        buffer.append(n);
	    }
	        
	    return buffer.toString();
	}
	
	public void sendEmail(String email , String authNum ) {
	    //이메일 발송 메소드
		
		System.out.println(authNum);
		
	    SimpleMailMessage mailMessage = new SimpleMailMessage();
	    mailMessage.setSubject("[이메일 제목] 회원가입 안내 .");
	    mailMessage.setFrom("bytrip@gmail.com");
	    mailMessage.setText("[이메일 내용]회원가입을 환영합니다. 인증번호를 확인해주세요. [ "+authNum+" ]");
	    mailMessage.setTo(email);
	    try {
	        mailSender.send(mailMessage);
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	}
	
	public void sendEmailPass(String email , String authNum ) {
	    //이메일 발송 메소드
		
		System.out.println(authNum);
		
	    SimpleMailMessage mailMessage = new SimpleMailMessage();
	    mailMessage.setSubject("비밀번호 찾기 .[이메일 제목]");
	    mailMessage.setFrom("bytrip@gmail.com");
	    mailMessage.setText("[이메일 내용]임시 비민번호를 보내드립니다. 꼭 비밀번호를 바꿔주세요! 다음에는 까먹지 마세요!!. [ "+authNum+" ]");
	    mailMessage.setTo(email);
	    try {
	        mailSender.send(mailMessage);
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	}
	
	@RequestMapping("notification")
	public String form() {
		return "user/notification";
	}
	
	
}
