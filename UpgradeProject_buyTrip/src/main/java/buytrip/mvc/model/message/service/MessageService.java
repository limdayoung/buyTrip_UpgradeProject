package buytrip.mvc.model.message.service;

import java.util.List;

import buytrip.mvc.model.dto.MessageDTO;

public interface MessageService {
	
	
	List<MessageDTO> ChatList(String memberId);
	
	List<MessageDTO> SelectAll(String userId, String memberId);
	
	int insertMessage(String messageContent, String userId, String memberId);
	
	int UnreadMessage(String memberId);
	
	int messageState(String userId, String memberId);

}
