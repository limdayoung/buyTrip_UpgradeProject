package buytrip.mvc.model.deal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import buytrip.mvc.model.deal.dao.DealDAO;
import buytrip.mvc.model.dto.OfferDTO;

import buytrip.mvc.model.dto.OfferJoinProductDTO;
import buytrip.mvc.model.dto.ProductDTO;
import buytrip.mvc.model.dto.UserDTO;


@Service
@Transactional(propagation=Propagation.REQUIRED)
public class DealServiceImpl implements DealService {

	@Autowired
	private DealDAO dealDao;
	
	@Override
	public void offerDeal(String proposerId, String productCode, Authentication authentication) {
		UserDTO user = (UserDTO) authentication.getPrincipal();
		OfferDTO offer = new OfferDTO(makeOfferCode(), proposerId, user.getMemberId(), productCode, null);
		if(dealDao.offerDeal(offer)==0 || dealDao.updateProductStateToInDeal(offer)==0)
			throw new RuntimeException("배달 신청 실패");
	}
	
	static String makeOfferCode() {
		StringBuilder string = new StringBuilder();
		string.append("O");
		for(int i=0;i<10;i++)
			string.append((int)(Math.random()*10)+"");
		return string.toString();
	}
	
	@Override
	public void deleteDeal(String offerCode) {
		//product 배달 신청한 사람 수 count
		//사람 수에 따라 product 상태 업데이트
		if(dealDao.countDeal(offerCode)<2)
			if(dealDao.updateProductStateToNoOffer(offerCode)==0)
				throw new RuntimeException("삭제 실패, 업데이트 실패");
		//삭제
		if(dealDao.deleteDeal(offerCode)==0)
			throw new RuntimeException("삭제 실패");
	}

	@Override
	public void messages() {
		// TODO Auto-generated method stub

	}

	@Override
	public void messageDetail() {
		// TODO Auto-generated method stub

	}

	@Override
	public void sendMessage() {
		// TODO Auto-generated method stub

	}

	@Override
	public void notifications() {
		// TODO Auto-generated method stub

	}

	@Override
	public void readNotifications() {
		// TODO Auto-generated method stub

	}

	@Override
	public List<OfferJoinProductDTO> readDealsYet(String offerId) {
		return dealDao.readDealsYet(offerId);
	}
	
	@Override
	public List<OfferJoinProductDTO> readDealsAccepted(String offerId) {
		return dealDao.readDealsAccepted(offerId);
	}
	
	@Override
	public List<OfferJoinProductDTO> readDealsExpired(String offerId) {
		return dealDao.readDealsExpired(offerId);
	}

}
