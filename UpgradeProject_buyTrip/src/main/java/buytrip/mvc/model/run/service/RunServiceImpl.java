package buytrip.mvc.model.run.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import buytrip.mvc.model.dto.HighestDealDTO;
import buytrip.mvc.model.dto.ProductDTO;
import buytrip.mvc.model.run.dao.RunDAO;

@Service
public class RunServiceImpl implements RunService {

	@Autowired
	private RunDAO runDAO;
	
	@Override
	public void recentAddTrips() {
		// TODO Auto-generated method stub

	}

	@Override
	public void recentOrders() {
		// TODO Auto-generated method stub

	}

	@Override
	public void recentCompletedOrders() {
		// TODO Auto-generated method stub

	}

	@Override
	public List<HighestDealDTO> highestDeal() {
		return runDAO.highestDeal();
	}

	@Override
	public void fire() {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ProductDTO> recentTop4() {
		return runDAO.recentTop4();
	}
	
	
	@Override
	public int updateExchange(Map<String, String> map) {
		return runDAO.updateExchange(map);
	}

}
