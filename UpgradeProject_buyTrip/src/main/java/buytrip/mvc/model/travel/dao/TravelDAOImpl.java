package buytrip.mvc.model.travel.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import buytrip.mvc.model.dto.PagingVo;
import buytrip.mvc.model.dto.ProductDTO;
import buytrip.mvc.model.dto.TravelDTO;
import buytrip.mvc.model.dto.UserDTO;

@Repository
public class TravelDAOImpl implements TravelDAO {

	@Autowired
	private SqlSession sqlSession;

	/**
	 * ������ ���
	 */
	public int insert(TravelDTO travelDTO) {

		return sqlSession.insert("TravelMapper.insertTravel", travelDTO);
	}

	/**
	 * mypage���� �ִ� ������ ����Ʈ ���.
	 */
	@Override
	public List<TravelDTO> selectAll(String memberId, PagingVo pagingVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("start", pagingVo.getStart());
		map.put("last", pagingVo.getLast());

		return sqlSession.selectList("TravelMapper.selectTravel", map);
	}

	@Override
	public int selectTotalPaging(String memberId) {
		return sqlSession.selectOne("selectTotalPaging", memberId);
	}

	/**
	 * mypage���� �ִ� �Ⱓ ���� ������ ����Ʈ ���.
	 */
	public List<TravelDTO> finishAll(String memberId) {
		return sqlSession.selectList("TravelMapper.selectFinishTravel", memberId);
	}

	@Override
	public List<TravelDTO> selectPast() {

		return sqlSession.selectList("TravelMapper.selectTravelPast");
	}

	@Override
	public int delete(String travelNo) {

		System.out.println("Dao = " + travelNo);
		return sqlSession.delete("TravelMapper.deleteTravel", travelNo);
	}

	@Override
	public List<String> suggest(String word) {
		return sqlSession.selectList("TravelMapper.selectSuggest", word);
	}

	// [mypage]���� ���ã�� ������ Ŭ���ϸ� ��ǰlist
	@Override
	public List<ProductDTO> searchList(String nation, PagingVo pagingVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("nation", nation);
		map.put("start", pagingVo.getStart());
		map.put("last", pagingVo.getLast());

		return sqlSession.selectList("TravelMapper.search", map);
	}

	@Override
	public int selectListCnt(String nation) {
		return sqlSession.selectOne("TravelMapper.selectListCnt", nation);
	}

	@Override
	public List<TravelDTO> recentTravelList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("TravelMapper.selectRecentTravel");
	}



	   @Override
	   public List<ProductDTO> costList(String nation, PagingVo pagingVo) {      
	      Map<String, Object> map = new HashMap<>();
	      map.put("nation", nation);
	      map.put("start", pagingVo.getStart());
	      map.put("last", pagingVo.getLast());
	      return sqlSession.selectList("TravelMapper.costList",map);   
	      }
	
	
	public UserDTO selectUserById(String id) {
		
		return sqlSession.selectOne("userMapper.selectUserById" , id);
	}
	
	@Override
	public ProductDTO readOrderDetail(String productCode) {
	
		return sqlSession.selectOne("orderMapper.myDetail", productCode);
	}
	
	@Override
	public List<UserDTO> offerList(String productCode) {
		return sqlSession.selectList("orderMapper.myUserOffer", productCode);
	}

}
