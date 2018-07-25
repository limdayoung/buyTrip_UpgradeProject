package buytrip.mvc.model.deal.dao;


import java.util.List;

import buytrip.mvc.model.dto.OfferDTO;
import buytrip.mvc.model.dto.OfferJoinProductDTO;


public interface DealDAO {
	
	/**
	 * �����ڿ��� ��� �����ϱ� (�����ڿ��� �˸�, �ڵ� �޼��� �߼�)
	 */
	public int offerDeal(OfferDTO offer);
	
	/**
	 * �����ڿ��� ����� �����ϰ� ��ǰ ���� ������Ʈ�ϱ�
	 */
	public int updateProductStateToInDeal(OfferDTO offer);
	
	/**
	 * �����ڿ��� �����ߴ� ��� ��û ����ϱ�
	 */
	public int deleteDeal(String offerCode);
	
	/**
	 * �ش� ��ǰ�� ��� ��û�� �� count�ϱ�
	 */
	public int countDeal(String offerCode);
	
	/**
	 * �ش� ��ǰ�� state�� �ٲٱ�
	 */
	public int updateProductStateToNoOffer(String offerCode);
	
	/**
	 * ����������-�� ��� ��Ͽ��� ���� Ȯ������ ���� ��� ��û ��� �о����
	 */
	public List<OfferJoinProductDTO> readDealsYet(String offerId);
	
	/**
	 * ����������-�� ��� ��Ͽ��� Ȯ���� ��� ��û ��� �о����
	 */
	public List<OfferJoinProductDTO> readDealsAccepted(String offerId);
	
	/**
	 * ����������-�� ��� ��Ͽ��� �Ⱓ ����� ��� ��û ��� �о����
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
