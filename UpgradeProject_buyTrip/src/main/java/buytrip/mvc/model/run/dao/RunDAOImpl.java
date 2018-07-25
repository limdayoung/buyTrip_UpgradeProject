package buytrip.mvc.model.run.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import buytrip.mvc.model.dto.HighestDealDTO;
import buytrip.mvc.model.dto.ProductDTO;

@Repository
public class RunDAOImpl implements RunDAO {

	@Autowired
	private SqlSession session;
	
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
		return session.selectList("runMapper.highestDeal");
	}

	@Override
	public void fire() {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ProductDTO> recentTop4() {
			return session.selectList("runMapper.recentTop4");
	}
	
	@Override
	public int updateExchange(Map<String, String> map) {
		return session.insert("runMapper.updateExchange", map);
	}

}
