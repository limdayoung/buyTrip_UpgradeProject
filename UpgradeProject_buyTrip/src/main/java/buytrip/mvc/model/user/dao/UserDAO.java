package buytrip.mvc.model.user.dao;

import buytrip.mvc.model.dto.UserDTO;

public interface UserDAO {
	
	/**
	 * ȸ�������ϱ�
	 */
	public int signup(UserDTO userDTO);
	
	/**
	 * �α����ϱ�
	 */
	public UserDTO login(UserDTO userDTO2);
	
	
	public UserDTO selectUserById(String id);
	
	public void updateMember(UserDTO userDTO);
		
	/**
	 * ��й�ȣ �缳���ϱ�
	 */
	public void updatePassword();
	
	/**
	 * ������ ����
	 */
	public void selectProfile();
	
	/**
	 * ������ �����ϱ�
	 */
	public void updateProfile();
	
	/**
	 * ȸ�� Ż���ϱ�
	 */
	public int withdraw(String memberId, String memberPassword);
	
	/**
	 * ȸ������ ���̵� �ߺ�üũ
	 * */
	public int idCheck(String memberId);
	
	/**
	 * ȸ��Ż�� ��й�ȣ üũ
	 * */
	public int passCheck(String memberPassword);

	int UnreadMessage(String memberId);
	
}
