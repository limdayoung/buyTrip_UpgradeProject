package buytrip.mvc.model.message.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import buytrip.mvc.model.dto.MessageDTO;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MessageDTO> SelectAll(String userId, String memberId) {
		
		Map<String, String> map = new HashMap();
		map.put("userId", userId);
		map.put("memberId", memberId);
		

		
		return sqlSession.selectList("messageMapper.selectMessage", map);
	}

	@Override
	public List<MessageDTO> ChatList(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("messageMapper.chatList", memberId);
	}

	@Override
	public int insertMessage(String messageContent, String userId, String memberId) {
		
		
		Map<String, String> map = new HashMap();
		map.put("userId", userId);
		map.put("memberId", memberId);
		map.put("messageContent", messageContent);
		
		System.out.println("MessageDaoImpl = "+messageContent+" : "+userId+ " : "+ memberId);
		
		return sqlSession.insert("messageMapper.insertMessage", map);
	}

	@Override
	public int UnreadMessage(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("messageMapper.unreadMessage", memberId);
	}

	@Override
	public int messageState(String userId, String memberId) {
		
		Map<String, String> map = new HashMap();
		map.put("userId", userId);
		map.put("memberId", memberId);
		
		return sqlSession.update("messageMapper.updateState", map);
	}

}
