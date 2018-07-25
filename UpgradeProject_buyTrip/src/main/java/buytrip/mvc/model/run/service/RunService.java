package buytrip.mvc.model.run.service;

import java.util.List;
import java.util.Map;

import buytrip.mvc.model.dto.HighestDealDTO;
import buytrip.mvc.model.dto.ProductDTO;

public interface RunService {

	/**
	 * [travel page] �ֱ� ��ϵ� �������� �����ֱ�
	 */
	public void recentAddTrips();
	
	/**
	 * [order page] �ֱ� �����ڰ� ����� ��ǰ �����ֱ� (���� : �ֽż�)
	 */
	public void recentOrders();
	
	/**
	 * [main page] �ֱ� �Ϸ�� �ֹ� �����ֱ�
	 */
	public void recentCompletedOrders();
	
	/**
	 * [main page] �ŷ������� Top3���� �����ֱ�(��ϼ� ��� �ŷ��Ϸ��)
	 * @return 
	 */
	public List<HighestDealDTO> highestDeal();
	
	/**
	 * ȸ�� �����Ű��
	 */
	public void fire();
	
	/**
	 * travel������ ���� �ֽ� ��� ��ǰ TOP4
	 */
	public List<ProductDTO> recentTop4();
	
	/**
	 * ȯ�� ��� �����ϱ�
	 */
	int updateExchange(Map<String, String> map);
	
}
