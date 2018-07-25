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
	 * �����ڿ��� ���� �����ϱ� (�����ڿ��� �˸�, �ڵ� �޼��� �߼�)
	 */

	@RequestMapping("/offerDeal")
	public String offerDeal(String proposerId, String productCode, Authentication authentication) {
		System.out.println(proposerId+","+productCode+",");
		dealService.offerDeal(proposerId, productCode, authentication);
		return "betweenOfferDeal";
	}
	
	/**
	 * �����ڿ��� ������ ��� ��û ����ϱ�
	 */
	@RequestMapping("/deleteDeal")
	public String deleteDeal(String offerCode) {
		System.out.println(offerCode);
		dealService.deleteDeal(offerCode);
		return "betweenOfferDeal";
	}
	
	/**
	 * ����������-�� ��� ��Ͽ��� ��� ��û ��� �о����
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
	 * �޽��� list ����
	 */
	@RequestMapping("/messages")	
	public void messages() {}
	
	/**
	 * �޽��� �󼼺���
	 */
	@RequestMapping("/messageDetail")
	public void messageDetail() {}
	
	/**
	 * �޽��� - ��ȭ�ϱ�
	 */
	@RequestMapping("/sendMessage")
	public void sendMessage(){}
	
	/**
	 * �˸� list ����
	 */
	@RequestMapping("/notifications")
	public void notifications() {}
	
	/**
	 * �˸� �� �ش������� �̵��ϱ�
	 */
	/*@RequestMapping("/{?}")
	public void readNotifications() {}*/
	
	
}
