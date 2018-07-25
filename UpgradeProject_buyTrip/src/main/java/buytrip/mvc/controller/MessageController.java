package buytrip.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import buytrip.mvc.model.dto.MessageDTO;
import buytrip.mvc.model.dto.UserDTO;
import buytrip.mvc.model.message.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	private MessageService messageService;

	@RequestMapping("/chatForm")
	public String MessageList(Model model, Authentication auth, String userId, HttpServletRequest request) {

		UserDTO userDTO = (UserDTO) auth.getPrincipal();

		String memberId = userDTO.getMemberId();

		List<MessageDTO> list = messageService.SelectAll(userId, memberId);
		
		messageService.messageState(userId, memberId);
		
		int count = messageService.UnreadMessage(memberId);
		
		request.getSession().setAttribute("count", count);

		model.addAttribute("list", list);
		model.addAttribute("userId", userId);

		return "mypage/chatForm";
	}
	
	@RequestMapping("message/select")
	@ResponseBody
	public List<MessageDTO> messageList(Authentication auth, String userId){
		
		UserDTO userDTO = (UserDTO) auth.getPrincipal();

		String memberId = userDTO.getMemberId();
		
		return messageService.SelectAll(userId, memberId);
	}
	
	@RequestMapping("chat/chatList")
	public String ChatList1(Model model, Authentication auth) {

		UserDTO userDTO = (UserDTO) auth.getPrincipal();

		String memberId = userDTO.getMemberId();
		
		//String unread = messageService.UnreadMessage(memberId);

		List<MessageDTO> chatList = messageService.ChatList(memberId);
		
		int count = messageService.UnreadMessage(memberId);
		
		model.addAttribute("list", chatList);
		model.addAttribute("count", count);

		return "mypage/chatList";
	}

	@RequestMapping("/chatList")
	public String ChatList(Model model, Authentication auth) {

		UserDTO userDTO = (UserDTO) auth.getPrincipal();

		String memberId = userDTO.getMemberId();
		
		//String unread = messageService.UnreadMessage(memberId);

		List<MessageDTO> chatList = messageService.ChatList(memberId);
		
		int count = messageService.UnreadMessage(memberId);
		
		model.addAttribute("list", chatList);
		model.addAttribute("count", count);

		return "mypage/chatList";
	}

	@RequestMapping(value = "/insertMessage")
	@ResponseBody
	public String insertMessage(String messageContent, Authentication auth, String userId) {
            System.out.println(1111);
		UserDTO userDTO = (UserDTO) auth.getPrincipal();

		String memberId = userDTO.getMemberId();

		int re = messageService.insertMessage(messageContent, userId, memberId);
		
		return "chatForm";
	}
	
	
	/*public String unreadMessage(Authentication auth, Model model) {
		
		UserDTO userDTO = (UserDTO) auth.getPrincipal();

		String memberId = userDTO.getMemberId();
		
		int count = messageService.UnreadMessage(memberId);
		
		List<MessageDTO> chatList = messageService.ChatList(memberId);
		
		model.addAttribute("count", count);
		model.addAttribute("list", chatList);
		
		return "tiles/header";
	}*/

}
