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
	 * 접속 관련 Event Method
	 * @param : WebSocketSession 접속한 사용자
	 */
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		logger.info(session.getPrincipal().getName() + " 님 접속했습니다!!");
		
		logger.info("연결 IP : " + session.getRemoteAddress().getHostName());
		connectedUsers.add(session);
		
	
	}
	
	/**
	 * 2가지 이벤트 처리
	 * 1. Send : 클라이언트가 서버에게 메시지 보냄
	 * 2. Emit : 서버에 연결되어 있는 클라이언트들에게 메시지 보냄
	 * 
	 * @param : WebSocketSession 메시지를 보낸 클라이언트
	 * @param : TextMessage 메시지의 내용
	 */
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		MessageVO messageVO = MessageVO.convertMessage(message.getPayload());
        String hostName = "";
 
        for (WebSocketSession webSocketSession : connectedUsers) {
            if (messageVO.getType().equals("all")) {
                if (!session.getId().equals(webSocketSession.getId())) {
                    webSocketSession.sendMessage(
                            new TextMessage(session.getRemoteAddress().getHostName() + " ▶ " + messageVO.getMessage()));
                }
            } else {
                hostName = webSocketSession.getRemoteAddress().getHostName();
                if (messageVO.getTo().equals(hostName)) {
                    webSocketSession.sendMessage(
                            new TextMessage(
                                    "<span style='color:red; font-weight: bold;' >"
                                    + session.getRemoteAddress().getHostName() + "▶ " + messageVO.getMessage()
                                    + "</span>") );
                    break;
                }
            }
        }
	}
	
	/**
	 * 클라이언트가 서버와 연결 종료
	 * 
	 * @param : WebSocketSession 연결을 끊은 클라이언트
	 * @param : CloseStatus 연결 상태 (확인 필요)
	 */
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info(session.getId() + " 님 접속 종료");
		connectedUsers.remove(session);
	}
	
}
