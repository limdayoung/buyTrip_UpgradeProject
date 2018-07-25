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
	 * Board������ ���� �ϱ�����
	 * session������ üũ�ϰ� session�� ������
	 * ������������ �̵�!(���ܹ߻�)
	 * */
	@Before("execution(public * kosta.mvc.controller.Board*.*(..))")
	public void before(JoinPoint point) {
		Object methodParams [] = point.getArgs();
		HttpSession session = (HttpSession)methodParams[0];
		
		//���� ���翩�� üũ
		if(session==null || session.getAttribute("loginUser")==null) {
			throw new SessionCheckException("�α��� �ϰ� �̿����ּ���!");
		}
		
	}
	
}





