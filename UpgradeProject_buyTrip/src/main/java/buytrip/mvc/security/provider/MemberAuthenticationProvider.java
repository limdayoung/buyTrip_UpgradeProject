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
 *  springSecurity���� loginForm�� ���� id�� pwd�� �Է��ϰ�
 *  �α����� Ŭ�������� ������ ���ѿ� ���� üũ���ִ� Ŭ����.
 *  (authenticate()�޼ҵ尡 �ڵ� ȣ��!!)
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
		
		//1. �μ��� ������ Authentication�� �̿��Ͽ� id,pwd�� ������.
		String userId = auth.getName();//���̵�
		
		UserDTO member = userDAO.selectUserById(userId);
		if(member==null) {
			throw new UsernameNotFoundException(userId + "�� ���� ȸ���Դϴ�.");
		}
		
		//2. db���� ����� ������ �����´�.
		   //(��й�ȣ�� ��ȣȭ �ؼ� ���Ѵ�.)
		String password = (String)auth.getCredentials();
		if(!passwordEncoder.matches(password, member.getMemberPassword())) {//ù��° �μ��� ��, �ι�° �μ� ��ȣȭ
			throw new UsernameNotFoundException("�н����� �����Դϴ�."+"���� ������ ����"+member.getMemberPassword());
		}
		
		//3. db�� ����� ������ ������ ���ܹ߻��Ѵ�.
		
		//4. db���� ����� ������ �ִٸ� 
		     //���Ѹ���� �����´�.
		 
//		List<Authority> list = authoritiesDAO.selectAuthorityByUserName(userId);
//		List<SimpleGrantedAuthority> authList = new ArrayList<>();
//		
//		for(Authority au:list) {
//			authList.add(new SimpleGrantedAuthority(au.getRole()));
//		}
		
		
		//���������� ������ ������� ������ Authentication�� �����ؼ������Ѵ�.
		
		
		
		return new UsernamePasswordAuthenticationToken(member, null, null);
	}
	
	
	/**
	 * �μ��� ���޵� Authentivation��ü�� ����ó���� �Ҽ��ִ� ��ü���� ���θ�
	 * �Ǵ��ϴ� �޼ҵ�*/
	@Override
	public boolean supports(Class<?> auth) {
		// TODO Auto-generated method stub
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(auth);
	}

}
