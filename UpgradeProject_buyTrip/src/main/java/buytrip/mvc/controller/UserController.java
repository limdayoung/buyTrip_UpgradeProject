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
	
	//���� ���� ���
	String path="";
		
	//ȸ������������ ��й�ȣ ��ȣȭó���� ���� ��ü�� ���Թ޴´�
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	/**
	 * mypage view�� ���
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
	 * ȸ������ �� ����
	 */
	@RequestMapping("/signup")
	public String signupForm(UserDTO userDTO) {
		userService.signup(userDTO);
		
		return "redirect:/";
	}
	
	/**
	 * ȸ�������ϱ�
	 */
	@RequestMapping("/signupForm")	
	public void signup() {}
	
	/**
	 * �α��� �� ����
	 */
	@RequestMapping("/loginForm")
	public void loginForm() {}
	
	/**
	 * �α����ϱ�
	 */
	@RequestMapping("/login")
	public void login(){
		System.out.println("user/login�� Controller �����...");
	}
	
	/**
	 * �α׾ƿ��ϱ�
	 */
	@RequestMapping("/logout")
	public void logout() {}
	
	
	/**
	 * ��й�ȣ ã�� �� ����
	 */
	@RequestMapping("/passwordForm")
	public void passwordForm() {}
	
	@RequestMapping("/updateForm") 
	public String updateForm() {
		return "user/updateForm";
	}
	
	/**
	 * ȸ������ �����ϱ�
	 */
	@RequestMapping("/updateMemberAction")
	public String updateMemberAction(String password, UserDTO vo,
			MultipartHttpServletRequest mtRequest, HttpSession session, Authentication auth) {
		
		UserDTO pvo=(UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		boolean b=passwordEncoder.matches(password, pvo.getMemberPassword());
		System.out.println("password, pvo.getMemberPassword()"+password+ pvo.getMemberPassword());
		if(b) {
		System.out.println("1. MemberVO  :: "+vo);
		//ȸ������ �������� Spring Security ���� ȸ�������� ��ȯ�޴´�
		
		
		System.out.println("2. Spring Security ���� ���� �� ȸ������:" + pvo);
		
		//������ ��й�ȣ�� ��ȣȭ�Ѵ� 
		String encodePassword=passwordEncoder.encode(vo.getMemberPassword());
		vo.setMemberPassword(encodePassword);
		
		System.out.println("**********************************************");
		// ������ ȸ�������� Spring Security ���� ȸ�������� ������Ʈ�Ѵ�
		pvo.setMemberPassword(encodePassword);
		pvo.setMemberName(vo.getMemberName());
		pvo.setMobile(vo.getMobile());
		System.out.println("3. Spring Security ���� ���� �� ȸ������:" + pvo);
		}
		else {
			throw new  RuntimeException ("��й�ȣ �����̹Ƿ� �����ȵ˴ϴ�.");
		}
		
		//----------------------ȸ������ ����----------------------------------
		//���� ���� ��� ���ϱ�
		String savePath = session.getServletContext().getRealPath("/resources/member");
		
		//ȸ������ ÷��
		MultipartFile Img = mtRequest.getFile("file");
		if(Img.getSize()>0) {
			//������ ���ϸ�
			String memberImg = System.currentTimeMillis()+"_"+Img.getOriginalFilename();
			vo.setMemberImg(memberImg);
			try {
				//������ ��ο� ���� ����
				Img.transferTo(new File(savePath+"/"+memberImg));
			} catch (IllegalStateException | IOException e) {
				//e.printStackTrace();
			}
			userService.updateMember(vo);
		}
		return "redirect:/";
	}
	
	/**
	 * ��й�ȣ ���� �缳���ϱ�
	 */
	@RequestMapping("/updatePassword")
	public void updatePassword() {
	}
	
	
	/**
	 * Ư�� ȸ�� �˻��ϱ�
	 */
	@RequestMapping("user/findMember")
	public ModelAndView findMember(HttpServletRequest request) {
		String id = request.getParameter("id");
		UserDTO userdto=userService.findMemberById(id);
		return new ModelAndView("user/findMember_result","userdto",userdto);
	}
	
	
	
	/**
	 * ������ ���� �� ����
	 */
	@RequestMapping("/profileForm")
	public void profileForm() {
		//UserDTO user = dao.selectProfile();
		//return new ModelAndView("", "user" , user);
	}
	
	/**
	 * ������ �����ϱ�
	 */
	@RequestMapping("/updateProfile")
	public void updateProfile() {
		//UserDTO dbUser = updateProfile(user);
		//return new ModelAndView("", "user" , dbUser);
	}
	
	/**
	 * ȸ�� Ż���ϱ�
	 */
	@RequestMapping("/withdraw")
	public String withdraw(String memberId , String memberPassword) {
		userService.withdraw(memberId, memberPassword);
		return "redirect:/";
	}
	
	/**
	 * ȸ������ �ߺ�üũ
	 * */
	@RequestMapping("idcheckAjax")
	@ResponseBody
	public String idCheckAjax(HttpServletRequest request) {
		return userService.idCheck(request.getParameter("memberId"));
	}
	
	/**
	 * ��й�ȣ DBüũ
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
	    //���Խ��ο� ���� ����Ű ���� �߻�    
	    sendEmail(email, authNum);
	    //�̸�������
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
	    //���Խ��ο� ���� ����Ű ���� �߻�
	    
	    UserDTO userDTO= userService.findMemberById(email);
	    
	    String encodePassword=passwordEncoder.encode(authNum);
	    userDTO.setMemberPassword(encodePassword);
	    userService.updateMember(userDTO);
	    
	    sendEmail(email, authNum);
	    //�̸�������
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
	    //�̸��� �߼� �޼ҵ�
		
		System.out.println(authNum);
		
	    SimpleMailMessage mailMessage = new SimpleMailMessage();
	    mailMessage.setSubject("[�̸��� ����] ȸ������ �ȳ� .");
	    mailMessage.setFrom("bytrip@gmail.com");
	    mailMessage.setText("[�̸��� ����]ȸ�������� ȯ���մϴ�. ������ȣ�� Ȯ�����ּ���. [ "+authNum+" ]");
	    mailMessage.setTo(email);
	    try {
	        mailSender.send(mailMessage);
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	}
	
	public void sendEmailPass(String email , String authNum ) {
	    //�̸��� �߼� �޼ҵ�
		
		System.out.println(authNum);
		
	    SimpleMailMessage mailMessage = new SimpleMailMessage();
	    mailMessage.setSubject("��й�ȣ ã�� .[�̸��� ����]");
	    mailMessage.setFrom("bytrip@gmail.com");
	    mailMessage.setText("[�̸��� ����]�ӽ� ��ι�ȣ�� �����帳�ϴ�. �� ��й�ȣ�� �ٲ��ּ���! �������� ����� ������!!. [ "+authNum+" ]");
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
