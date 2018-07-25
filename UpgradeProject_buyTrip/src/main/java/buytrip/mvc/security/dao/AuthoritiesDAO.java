package buytrip.mvc.security.dao;

import java.util.List;

import buytrip.mvc.model.dto.AuthorityDTO;

public interface AuthoritiesDAO {

	/**
	 * ����� ���� ���
	 * (�� USER(���̵�)�� �������� ������ ���� �� �ִ�.
	 * */
	int insertAuthority(AuthorityDTO authority);
	
	/**
	 * id�� �ش��ϴ� ���� �˻�.
	 * */
	List<AuthorityDTO> selectAuthorityByUserName(String userName);
}






