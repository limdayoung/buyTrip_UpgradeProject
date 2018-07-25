package buytrip.mvc.model.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import buytrip.mvc.model.dto.ProductDTO;
import buytrip.mvc.model.dto.UserDTO;
import buytrip.mvc.model.order.dao.OrderDAO;


public interface OrderService {
	

	/**
	 * 상품 등록하기
	 */
	public int insertOrder(ProductDTO productDTO);
	
	/**
	 * [mypage] 등록한 상품 lsit 보기
	 */
	public List<ProductDTO> readOrder(String proposerId);
	
	/**
	 * [mypage] 등록한 상품 상세보기
	 */
	public ProductDTO readOrderDetail(String productCode);
	
	/**
	 * [mypage] 등록한 상품 수정하기
	 */
	public int updateOrder(ProductDTO productDTO);
	
	/**
	 * [mypage] 등록한 상품 삭제하기
	 */
	public int deleteOrder(String proposerId, String productCode);
	
	/**
	 * [mypage] 등록한 상품 거래완료 처리하기
	 */
	
	public List<ProductDTO> completeOrder(String proposerId, String tradeState);
		
	/**
	 * [mypage] 등록한 상품 중 거래완료/기한만료된 상품 list 보기
	 */
	public List<ProductDTO> letedOrder(String proposerId);
		
	
	/**
	 * 여행지 검색에 따른 직구자의 등록상품 list 보기
	 */
	public List<ProductDTO> searchTripOrders(String arrivalNation);
	
	/**
	 * 직구자가 등록한 상품 상세보기 (1.상품정보, 2.직구자정보, 3.여행자의 제안정보)
	 */
	public ProductDTO readUserOrder();
	
	/**
	 *[mypage]offerlist
	 */
	public List<UserDTO> offerList(String productCode);
	
	/**
	 * 마이페이지 거래중
	 */
	public List<ProductDTO> offer(String proposerId);
	
	/**
	 * [mypage] 등록한 상품 거래완료 처리하기
	 */
	
	public List<ProductDTO> completeOrder(String proposerId);

	/**
	 * offer수락
	 * @param offercode
	 * @return 
	 */
	public int updateOfferStateCompelete(String offercode);
	
	/*
	 * 상품 state바꾸기.
	 */
	public int updateProductState(String offercode);

	
	
}
