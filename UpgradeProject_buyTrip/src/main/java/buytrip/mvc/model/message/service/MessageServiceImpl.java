package buytrip.mvc.model.message.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import buytrip.mvc.model.dto.MessageDTO;
import buytrip.mvc.model.message.dao.MessageDAO;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageDAO messageDAO;

	@Override
	public List<MessageDTO> SelectAll(String userId, String memberId) {
		// TODO Auto-generated method stub
		
		
		return messageDAO.SelectAll(userId, memberId);
	}

	@Override
	public List<MessageDTO> ChatList(String memberId) {
		// TODO Auto-generated method stub
		return messageDAO.ChatList(memberId);
	}

	@Override
	public int insertMessage(String messageContent, String userId, String memberId) {
		// TODO Auto-generated method stub
		
		System.out.println("MessageServiceImpl = "+messageContent+" + "+userId+ " : "+ memberId);
		
		return messageDAO.insertMessage(messageContent, userId, memberId);
	}

	@Override
	public int UnreadMessage(String memberId) {
		// TODO Auto-generated method stub
		return messageDAO.UnreadMessage(memberId);
	}

	@Override
	public int messageState(String userId, String memberId) {
		// TODO Auto-generated method stub
		return messageDAO.messageState(userId, memberId);
	}

}
