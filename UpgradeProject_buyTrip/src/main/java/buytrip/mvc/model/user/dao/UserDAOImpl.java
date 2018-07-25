package buytrip.mvc.model.user.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import buytrip.mvc.model.dto.UserDTO;


@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SqlSession session;

	@Override
	public int signup(UserDTO userDTO) {
		return session.insert("userMapper.registerUser",userDTO);
	}

	@Override
	public UserDTO login(UserDTO userDTO) {
		return session.selectOne("userMapper.login", userDTO);
	}
	
	
	@Override
	public UserDTO selectUserById(String id) {
		
		return session.selectOne("userMapper.selectUserById" , id);
	}
	
	
	//회원정보 수정
	@Override
	public void updateMember(UserDTO userDTO) {
		session.update("userMapper.updateMember",userDTO);			
	}
	
	
	@Override
	public void updatePassword() {
		// TODO Auto-generated method stub
		
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
		Map<String, String> map = new HashMap();
		map.put("memberId", memberId);
		map.put("memberPassword", memberPassword);
		return session.delete("userMapper.delete", map);
	}
	
	
	public int idCheck(String memberId) {
		 return session.selectOne("userMapper.idcheck",memberId);
	}
	
	public int passCheck(String memberPassword) {
		return session.selectOne("userMapper.passCheck", memberPassword);
	}

	@Override
	public int UnreadMessage(String memberId) {
		// TODO Auto-generated method stub
		return session.selectOne("messageMapper.unreadMessage", memberId);
	}

}
