package buytrip.mvc.model.user.service;

import buytrip.mvc.model.dto.UserDTO;

public interface UserService {

	/**
	 * ȸ�������ϱ�
	 */
	public int signup(UserDTO userDTO);
	
	/**
	 * �α����ϱ�
	 */
	public UserDTO login(UserDTO uesrDTO);
	
	public UserDTO findMemberById(String id);
	
	/**
	 * ��й�ȣ �缳���ϱ�
	 */
	public void updatePassword();
	
	public void updateMember(UserDTO userDTO);
	
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
	public String idCheck(String memberId);
	
	/**
	 * ȸ��Ż�� ��й�ȣ üũ
	 * */
	public String passCheck(String memberPassword);

	int UnreadMessage(String memberId);
	
}
