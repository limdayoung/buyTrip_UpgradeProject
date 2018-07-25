package buytrip.mvc.model.run.service;

import java.util.List;
import java.util.Map;

import buytrip.mvc.model.dto.HighestDealDTO;
import buytrip.mvc.model.dto.ProductDTO;

public interface RunService {

	/**
	 * [travel page] 최근 등록된 여행일정 보여주기
	 */
	public void recentAddTrips();
	
	/**
	 * [order page] 최근 직구자가 등록한 상품 보여주기 (정렬 : 최신순)
	 */
	public void recentOrders();
	
	/**
	 * [main page] 최근 완료된 주문 보여주기
	 */
	public void recentCompletedOrders();
	
	/**
	 * [main page] 거래성사율 Top3나라 보여주기(등록수 대비 거래완료수)
	 * @return 
	 */
	public List<HighestDealDTO> highestDeal();
	
	/**
	 * 회원 강퇴시키기
	 */
	public void fire();
	
	/**
	 * travel페이지 에서 최신 등록 상품 TOP4
	 */
	public List<ProductDTO> recentTop4();
	
	/**
	 * 환율 디비에 저장하기
	 */
	int updateExchange(Map<String, String> map);
	
}
