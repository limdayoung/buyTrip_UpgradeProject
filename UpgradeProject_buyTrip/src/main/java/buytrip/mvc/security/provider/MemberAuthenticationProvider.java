package buytrip.mvc.security.provider;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import buytrip.mvc.model.dto.UserDTO;
import buytrip.mvc.model.user.dao.UserDAO;


/**
 *  springSecurity에서 loginForm에 의해 id와 pwd를 입력하고
 *  로그인을 클릭했을때 인증과 권한에 대해 체크해주는 클래스.
 *  (authenticate()메소드가 자동 호출!!)
 * 
 * */
@Service //id="memberAuthenticationProvider" 
public class MemberAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		
		if(!this.supports(auth.getClass())) {
			return null;
		}
		
		//1. 인수로 들어오는 Authentication를 이용하여 id,pwd를 꺼낸다.
		String userId = auth.getName();//아이디
		
		UserDTO member = userDAO.selectUserById(userId);
		if(member==null) {
			throw new UsernameNotFoundException(userId + "는 없는 회원입니다.");
		}
		
		//2. db에서 사용자 정보를 가져온다.
		   //(비밀번호는 복호화 해서 비교한다.)
		String password = (String)auth.getCredentials();
		if(!passwordEncoder.matches(password, member.getMemberPassword())) {//첫번째 인수는 평문, 두번째 인수 암호화
			throw new UsernameNotFoundException("패스워드 오류입니다."+"뭐가 나오나 찍어보자"+member.getMemberPassword());
		}
		
		//3. db에 사용자 정보가 없으면 예외발생한다.
		
		//4. db에서 사용자 정보가 있다면 
		     //권한목록을 가져온다.
		 
//		List<Authority> list = authoritiesDAO.selectAuthorityByUserName(userId);
//		List<SimpleGrantedAuthority> authList = new ArrayList<>();
//		
//		for(Authority au:list) {
//			authList.add(new SimpleGrantedAuthority(au.getRole()));
//		}
		
		
		//최종적으로 인증된 사용자의 정보를 Authentication에 저장해서리턴한다.
		
		
		
		return new UsernamePasswordAuthenticationToken(member, null, null);
	}
	
	
	/**
	 * 인수로 전달된 Authentivation객체가 인증처리를 할수있는 객체인지 여부를
	 * 판단하는 메소드*/
	@Override
	public boolean supports(Class<?> auth) {
		// TODO Auto-generated method stub
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(auth);
	}

}
