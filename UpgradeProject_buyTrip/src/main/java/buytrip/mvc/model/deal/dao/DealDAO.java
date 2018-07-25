package buytrip.mvc.model.deal.dao;


import java.util.List;

import buytrip.mvc.model.dto.OfferDTO;
import buytrip.mvc.model.dto.OfferJoinProductDTO;


public interface DealDAO {
	
	/**
	 * 직구자에게 배달 제안하기 (직구자에게 알림, 자동 메세지 발송)
	 */
	public int offerDeal(OfferDTO offer);
	
	/**
	 * 직구자에게 배달을 제안하고 상품 상태 업데이트하기
	 */
	public int updateProductStateToInDeal(OfferDTO offer);
	
	/**
	 * 직구자에게 제안했던 배달 신청 취소하기
	 */
	public int deleteDeal(String offerCode);
	
	/**
	 * 해당 상품의 배달 신청자 수 count하기
	 */
	public int countDeal(String offerCode);
	
	/**
	 * 해당 상품의 state를 바꾸기
	 */
	public int updateProductStateToNoOffer(String offerCode);
	
	/**
	 * 마이페이지-내 배달 목록에서 아직 확정되지 않은 배달 신청 목록 읽어오기
	 */
	public List<OfferJoinProductDTO> readDealsYet(String offerId);
	
	/**
	 * 마이페이지-내 배달 목록에서 확정된 배달 신청 목록 읽어오기
	 */
	public List<OfferJoinProductDTO> readDealsAccepted(String offerId);
	
	/**
	 * 마이페이지-내 배달 목록에서 기간 만료된 배달 신청 목록 읽어오기
	 */
	public List<OfferJoinProductDTO> readDealsExpired(String offerId);
	
	/**
	 * 메시지 list 보기
	 */
	public void messages();
	
	/**
	 * 메시지 상세보기
	 */
	public void messageDetail();
	
	/**
	 * 메시지 - 대화하기
	 */
	public void sendMessage();
	
	/**
	 * 알림 list 보기
	 */
	public void notifications();
	
	/**
	 * 알림 별 해당페이지 이동하기
	 */
	public void readNotifications();
	
}
