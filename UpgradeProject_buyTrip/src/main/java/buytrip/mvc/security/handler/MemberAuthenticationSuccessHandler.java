package buytrip.mvc.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import buytrip.mvc.model.dto.UserDTO;
import buytrip.mvc.model.message.service.MessageService;

@Component
public class MemberAuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler
		implements AuthenticationSuccessHandler {
	
	@Autowired
	private MessageService messageService;

	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		UserDTO userDTO = (UserDTO)auth.getPrincipal();
		String memberId = userDTO.getMemberId();
		
		System.out.println("============================ memberId = "+memberId+"   ========================");
		
		int count = messageService.UnreadMessage(memberId);
		
		request.getSession().setAttribute("count", count);
		
		request.getRequestDispatcher("user/index").forward(request, response);
		
	}


	
	

}
