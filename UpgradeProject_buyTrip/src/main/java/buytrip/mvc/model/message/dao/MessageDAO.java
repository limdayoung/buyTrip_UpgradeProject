package buytrip.mvc.model.message.dao;

import java.util.List;

import buytrip.mvc.model.dto.MessageDTO;

public interface MessageDAO {
	
	/**
	 * ä�� ����Ʈ ���
	 */
	List<MessageDTO> ChatList(String memberId);
	
	
	
	/**
	 * ������ �޼��� ���
	 */
	List<MessageDTO> SelectAll(String userId, String receiverId);
	
	
	int UnreadMessage(String memberId);
	
	
	
	int insertMessage(String messageContent, String userId, String memberId);
	
	
	
	int messageState(String userId, String memberId);

}
