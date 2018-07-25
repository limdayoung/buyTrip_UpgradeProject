package buytrip.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import buytrip.mvc.model.deal.service.DealService;
import buytrip.mvc.model.dto.OfferJoinProductDTO;
import buytrip.mvc.model.dto.UserDTO;

@Controller
@RequestMapping("/deal")
public class DealController {

	@Autowired
	private DealService dealService;
	
	/**
	 * 직구자에게 구매 제안하기 (직구자에게 알림, 자동 메세지 발송)
	 */

	@RequestMapping("/offerDeal")
	public String offerDeal(String proposerId, String productCode, Authentication authentication) {
		System.out.println(proposerId+","+productCode+",");
		dealService.offerDeal(proposerId, productCode, authentication);
		return "betweenOfferDeal";
	}
	
	/**
	 * 직구자에게 제안한 배달 신청 취소하기
	 */
	@RequestMapping("/deleteDeal")
	public String deleteDeal(String offerCode) {
		System.out.println(offerCode);
		dealService.deleteDeal(offerCode);
		return "betweenOfferDeal";
	}
	
	/**
	 * 마이페이지-내 배달 목록에서 배달 신청 목록 읽어오기
	 */
	@RequestMapping("/readDeals")
	public ModelAndView readDeals(Authentication authentication) {
		ModelAndView mv = new ModelAndView();
		
		UserDTO user = (UserDTO) authentication.getPrincipal();
		List<OfferJoinProductDTO> listYet = dealService.readDealsYet(user.getMemberId());
		List<OfferJoinProductDTO> listAccepted = dealService.readDealsAccepted(user.getMemberId());
		List<OfferJoinProductDTO> listExpired = dealService.readDealsExpired(user.getMemberId());
		mv.addObject("offerJoinProductListYet", listYet);
		mv.addObject("offerJoinProductListAccepted", listAccepted);
		mv.addObject("offerJoinProductListExpired", listExpired);
		mv.setViewName("mypage/myOfferList_my");
		
		return mv;
	}
	
	/**
	 * 메시지 list 보기
	 */
	@RequestMapping("/messages")	
	public void messages() {}
	
	/**
	 * 메시지 상세보기
	 */
	@RequestMapping("/messageDetail")
	public void messageDetail() {}
	
	/**
	 * 메시지 - 대화하기
	 */
	@RequestMapping("/sendMessage")
	public void sendMessage(){}
	
	/**
	 * 알림 list 보기
	 */
	@RequestMapping("/notifications")
	public void notifications() {}
	
	/**
	 * 알림 별 해당페이지 이동하기
	 */
	/*@RequestMapping("/{?}")
	public void readNotifications() {}*/
	
	
}
