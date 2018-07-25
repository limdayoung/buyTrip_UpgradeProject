package buytrip.mvc.model.user.dao;

import buytrip.mvc.model.dto.UserDTO;

public interface UserDAO {
	
	/**
	 * 회원가입하기
	 */
	public int signup(UserDTO userDTO);
	
	/**
	 * 로그인하기
	 */
	public UserDTO login(UserDTO userDTO2);
	
	
	public UserDTO selectUserById(String id);
	
	public void updateMember(UserDTO userDTO);
		
	/**
	 * 비밀번호 재설정하기
	 */
	public void updatePassword();
	
	/**
	 * 프로필 보기
	 */
	public void selectProfile();
	
	/**
	 * 프로필 수정하기
	 */
	public void updateProfile();
	
	/**
	 * 회원 탈퇴하기
	 */
	public int withdraw(String memberId, String memberPassword);
	
	/**
	 * 회원가입 아이디 중복체크
	 * */
	public int idCheck(String memberId);
	
	/**
	 * 회원탈퇴 비밀번호 체크
	 * */
	public int passCheck(String memberPassword);

	int UnreadMessage(String memberId);
	
}
