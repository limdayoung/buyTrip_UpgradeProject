package buytrip.mvc.model.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import buytrip.mvc.model.dto.AuthorityDTO;
import buytrip.mvc.model.dto.UserDTO;
import buytrip.mvc.model.user.dao.UserDAO;
import buytrip.mvc.security.dao.AuthoritiesDAO;
import buytrip.mvc.security.util.RoleConstants;

@Transactional
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private AuthoritiesDAO authDAO;
	
	@Autowired
    private PasswordEncoder passwordEncoder;

	@Override
	@Transactional
	public int signup(UserDTO userDTO) {
		//��й�ȣ�� ��ȣȭ..
		userDTO.setMemberPassword(passwordEncoder.encode(userDTO.getMemberPassword()));
		
		int result = userDAO.signup(userDTO);
		//���� ���
		authDAO.insertAuthority(new AuthorityDTO(userDTO.getMemberId(), RoleConstants.ROLE_MEMBER));
		
		return result;
	}

	@Override
	public UserDTO login(UserDTO userDTO) {
		return userDAO.login(userDTO);

	}
	
	@Override
	public UserDTO findMemberById(String id) {		
		return userDAO.selectUserById(id);
	}

	@Override
	public void updatePassword() {
		// TODO Auto-generated method stub
	}
	
	@Override
	public void updateMember(UserDTO userDTO) {
		//�Է��� ��й�ȣ�� ���ؼ� ������Ʈ�����ϰ�
		userDAO.updateMember(userDTO);
	}

	@Override
	public void selectProfile() {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateProfile() {
		// TODO Auto-generated method stub

	}

	@Override
	public int withdraw(String memberId, String memberPassword) {
		UserDTO userDTO = userDAO.selectUserById(memberId);
		
		boolean b = passwordEncoder.matches(memberPassword, userDTO.getMemberPassword());
		if(passwordEncoder.matches(memberPassword, userDTO.getMemberPassword())){
			int re =  userDAO.withdraw(memberId, userDTO.getMemberPassword());
			if(re==0)throw new RuntimeException("�������� �ʾҽ��ϴ�.");
		}else{
			throw new  RuntimeException ("��й�ȣ �����̹Ƿ� Ż��ȵ˴ϴ�.");
		}
		return 1;
	}
	
	public String idCheck(String memberId) {
		int chk=userDAO.idCheck(memberId);
		return (chk==0) ? "ok":"fail"; 	
	}
	
	public String passCheck(String memberPassword) {
		
		
		int chk=userDAO.passCheck(memberPassword);
		return (chk==0) ? "ok":"fail";
	}

	@Override
	public int UnreadMessage(String memberId) {
		// TODO Auto-generated method stub
		return userDAO.UnreadMessage(memberId);
	}
	
}
