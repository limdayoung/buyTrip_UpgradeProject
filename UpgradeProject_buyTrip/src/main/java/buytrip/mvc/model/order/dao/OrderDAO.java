package buytrip.mvc.model.order.dao;

import java.util.List;

import buytrip.mvc.model.dto.ProductDTO;
import buytrip.mvc.model.dto.UserDTO;

public interface OrderDAO {

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
	 * /기한만료된 상품 list 보기
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
	 *offerlist
	 */
	public List<UserDTO> offerList(String productCode);
	
	/**
	 * [mypage] 등록한 상품 거래완료 처리하기
	 */
	public List<ProductDTO> completeOrder(String proposerId);
	
	public List<ProductDTO> offer(String proposerId);
	
	
	/**
	 * completeOffer 
	 */
	public int updateOfferStateCompelete(String offercode);

	public int updateProductState(String offercode);
}
