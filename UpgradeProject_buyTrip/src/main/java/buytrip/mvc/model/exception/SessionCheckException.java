package buytrip.mvc.model.exception;

/**
 * aop���� ���� ���� üũ�� ������ ������ �߻��� ����
 * */
public class SessionCheckException  extends RuntimeException{
	public SessionCheckException() {}
	public SessionCheckException(String message) {
		super(message);
	}

}
