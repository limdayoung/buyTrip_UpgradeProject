package buytrip.mvc.model.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import buytrip.mvc.model.dto.ProductDTO;
import buytrip.mvc.model.dto.UserDTO;
import buytrip.mvc.model.order.dao.OrderDAO;


public interface OrderService {
	

	/**
	 * ��ǰ ����ϱ�
	 */
	public int insertOrder(ProductDTO productDTO);
	
	/**
	 * [mypage] ����� ��ǰ lsit ����
	 */
	public List<ProductDTO> readOrder(String proposerId);
	
	/**
	 * [mypage] ����� ��ǰ �󼼺���
	 */
	public ProductDTO readOrderDetail(String productCode);
	
	/**
	 * [mypage] ����� ��ǰ �����ϱ�
	 */
	public int updateOrder(ProductDTO productDTO);
	
	/**
	 * [mypage] ����� ��ǰ �����ϱ�
	 */
	public int deleteOrder(String proposerId, String productCode);
	
	/**
	 * [mypage] ����� ��ǰ �ŷ��Ϸ� ó���ϱ�
	 */
	
	public List<ProductDTO> completeOrder(String proposerId, String tradeState);
		
	/**
	 * [mypage] ����� ��ǰ �� �ŷ��Ϸ�/���Ѹ���� ��ǰ list ����
	 */
	public List<ProductDTO> letedOrder(String proposerId);
		
	
	/**
	 * ������ �˻��� ���� �������� ��ϻ�ǰ list ����
	 */
	public List<ProductDTO> searchTripOrders(String arrivalNation);
	
	/**
	 * �����ڰ� ����� ��ǰ �󼼺��� (1.��ǰ����, 2.����������, 3.�������� ��������)
	 */
	public ProductDTO readUserOrder();
	
	/**
	 *[mypage]offerlist
	 */
	public List<UserDTO> offerList(String productCode);
	
	/**
	 * ���������� �ŷ���
	 */
	public List<ProductDTO> offer(String proposerId);
	
	/**
	 * [mypage] ����� ��ǰ �ŷ��Ϸ� ó���ϱ�
	 */
	
	public List<ProductDTO> completeOrder(String proposerId);

	/**
	 * offer����
	 * @param offercode
	 * @return 
	 */
	public int updateOfferStateCompelete(String offercode);
	
	/*
	 * ��ǰ state�ٲٱ�.
	 */
	public int updateProductState(String offercode);

	
	
}
