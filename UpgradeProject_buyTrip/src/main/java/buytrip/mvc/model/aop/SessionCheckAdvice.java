package buytrip.mvc.model.aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import buytrip.mvc.model.exception.SessionCheckException;

@Component
@Aspect
public class SessionCheckAdvice {

	/**
	 * Board영역을 접근 하기전에
	 * session유무를 체크하고 session이 없으면
	 * 예외페이지로 이동!(예외발생)
	 * */
	@Before("execution(public * kosta.mvc.controller.Board*.*(..))")
	public void before(JoinPoint point) {
		Object methodParams [] = point.getArgs();
		HttpSession session = (HttpSession)methodParams[0];
		
		//세션 존재여부 체크
		if(session==null || session.getAttribute("loginUser")==null) {
			throw new SessionCheckException("로그인 하고 이용해주세요!");
		}
		
	}
	
}





