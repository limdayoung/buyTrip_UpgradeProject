package buytrip.mvc.websocket;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import buytrip.mvc.model.dto.UserDTO;

public class EchoHandler extends TextWebSocketHandler {
	
	private Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	private List<WebSocketSession> connectedUsers;
	
	public EchoHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
	}
	
	/**
	 * ���� ���� Event Method
	 * @param : WebSocketSession ������ �����
	 */
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		logger.info(session.getPrincipal().getName() + " �� �����߽��ϴ�!!");
		
		logger.info("���� IP : " + session.getRemoteAddress().getHostName());
		connectedUsers.add(session);
		
	
	}
	
	/**
	 * 2���� �̺�Ʈ ó��
	 * 1. Send : Ŭ���̾�Ʈ�� �������� �޽��� ����
	 * 2. Emit : ������ ����Ǿ� �ִ� Ŭ���̾�Ʈ�鿡�� �޽��� ����
	 * 
	 * @param : WebSocketSession �޽����� ���� Ŭ���̾�Ʈ
	 * @param : TextMessage �޽����� ����
	 */
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		MessageVO messageVO = MessageVO.convertMessage(message.getPayload());
        String hostName = "";
 
        for (WebSocketSession webSocketSession : connectedUsers) {
            if (messageVO.getType().equals("all")) {
                if (!session.getId().equals(webSocketSession.getId())) {
                    webSocketSession.sendMessage(
                            new TextMessage(session.getRemoteAddress().getHostName() + " �� " + messageVO.getMessage()));
                }
            } else {
                hostName = webSocketSession.getRemoteAddress().getHostName();
                if (messageVO.getTo().equals(hostName)) {
                    webSocketSession.sendMessage(
                            new TextMessage(
                                    "<span style='color:red; font-weight: bold;' >"
                                    + session.getRemoteAddress().getHostName() + "�� " + messageVO.getMessage()
                                    + "</span>") );
                    break;
                }
            }
        }
	}
	
	/**
	 * Ŭ���̾�Ʈ�� ������ ���� ����
	 * 
	 * @param : WebSocketSession ������ ���� Ŭ���̾�Ʈ
	 * @param : CloseStatus ���� ���� (Ȯ�� �ʿ�)
	 */
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info(session.getId() + " �� ���� ����");
		connectedUsers.remove(session);
	}
	
}
