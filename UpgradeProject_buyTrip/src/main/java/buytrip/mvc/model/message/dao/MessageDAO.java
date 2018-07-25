package buytrip.mvc.model.message.dao;

import java.util.List;

import buytrip.mvc.model.dto.MessageDTO;

public interface MessageDAO {
	
	/**
	 * 채팅 리스트 출력
	 */
	List<MessageDTO> ChatList(String memberId);
	
	
	
	/**
	 * 오고갔던 메세지 출력
	 */
	List<MessageDTO> SelectAll(String userId, String receiverId);
	
	
	int UnreadMessage(String memberId);
	
	
	
	int insertMessage(String messageContent, String userId, String memberId);
	
	
	
	int messageState(String userId, String memberId);

}
