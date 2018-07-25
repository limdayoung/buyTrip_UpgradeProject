package buytrip.mvc.model.exception;

/**
 * aop에서 세션 유무 체크후 세션이 없을때 발생할 예외
 * */
public class SessionCheckException  extends RuntimeException{
	public SessionCheckException() {}
	public SessionCheckException(String message) {
		super(message);
	}

}
