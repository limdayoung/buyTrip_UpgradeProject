package buytrip.mvc.model.deal.service;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import buytrip.mvc.model.dto.OfferDTO;

import buytrip.mvc.model.dto.OfferJoinProductDTO;
import buytrip.mvc.model.dto.ProductDTO;

@Service
public interface DealService {

	/**
	 * �����ڿ��� ���� �����ϱ� (�����ڿ��� �˸�, �ڵ� �޼��� �߼�)
	 */
	public void offerDeal(String proposerId, String productCode, Authentication authentication);
	
	/**
	 * �����ڿ��� �����ߴ� ��� ��û ����ϱ�
	 */
	public void deleteDeal(String offerCode);
	
	/**
	 * ����������-�� ��� ��Ͽ��� ��� ��û ��� �о����, ��� ��û�� ���� Ȯ������ ���� ���
	 */
	public List<OfferJoinProductDTO> readDealsYet(String offerId);
	
	/**
	 * ����������-�� ��� ��Ͽ��� ��� ��û ��� �о����, ��� ��û�� Ȯ���� ���
	 */
	public List<OfferJoinProductDTO> readDealsAccepted(String offerId);
	
	/**
	 * ����������-�� ��� ��Ͽ��� ��� ��û ��� �о����, ��� ��û�� ����� ���
	 */
	public List<OfferJoinProductDTO> readDealsExpired(String offerId);
	
	/**
	 * �޽��� list ����
	 */
	public void messages();
	
	/**
	 * �޽��� �󼼺���
	 */
	public void messageDetail();
	
	/**
	 * �޽��� - ��ȭ�ϱ�
	 */
	public void sendMessage();
	
	/**
	 * �˸� list ����
	 */
	public void notifications();
	
	/**
	 * �˸� �� �ش������� �̵��ϱ�
	 */
	public void readNotifications();
	
}
