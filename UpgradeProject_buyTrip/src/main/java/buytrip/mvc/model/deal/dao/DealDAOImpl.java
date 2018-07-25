package buytrip.mvc.model.deal.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import buytrip.mvc.model.dto.OfferDTO;

import buytrip.mvc.model.dto.OfferJoinProductDTO;


@Repository
public class DealDAOImpl implements DealDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public int offerDeal(OfferDTO offer) {
		return session.insert("offerDeal", offer);
	}

	@Override
	public int deleteDeal(String offerCode) {
		return session.delete("deleteDeal", offerCode);
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
		return session.selectList("readDealsYet", offerId);
	}
	
	@Override
	public List<OfferJoinProductDTO> readDealsAccepted(String offerId) {
		return session.selectList("readDealsAccepted", offerId);
	}
	
	@Override
	public List<OfferJoinProductDTO> readDealsExpired(String offerId) {
		return session.selectList("readDealsExpired", offerId);
	}

	@Override
	public int updateProductStateToInDeal(OfferDTO offer) {
		return session.update("updateProductState", offer);
	}

	@Override
	public int countDeal(String offerCode) {
		List<String> list = new ArrayList<String>();
		return session.selectList("countDeal", offerCode).size();
	}

	@Override
	public int updateProductStateToNoOffer(String offerCode) {
		return session.update("updateProductStateToNoOffer", offerCode);
	}

}
