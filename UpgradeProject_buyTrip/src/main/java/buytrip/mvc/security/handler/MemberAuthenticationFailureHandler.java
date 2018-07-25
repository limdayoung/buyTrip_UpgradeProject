package buytrip.mvc.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

/**
 *  springSecurity설정문서에서 authentication-failure-handler-ref="" 를 작성해놓으면
 *  인증(로그인) 될때 실패하게 되면 MemberAuthenticationFailureHandler 클래스의
 *   onAuthenticationFailure()메소드가 자동 호출된다.
 * */
@Component //id="memberAuthenticationFailureHandler"
public class MemberAuthenticationFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse res, 
			AuthenticationException ex)
			throws IOException, ServletException {
		req.setAttribute("errorMessage", ex.getMessage());
		req.getRequestDispatcher("/WEB-INF/views/user/loginForm.jsp").forward(req, res);

	}

}
