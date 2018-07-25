package buytrip.mvc.model.travel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import buytrip.mvc.model.dto.PagingVo;
import buytrip.mvc.model.dto.ProductDTO;
import buytrip.mvc.model.dto.TravelDTO;
import buytrip.mvc.model.dto.UserDTO;
import buytrip.mvc.model.travel.dao.TravelDAO;

@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class TravelServiceImpl implements TravelService {

	@Autowired
	private TravelDAO travelDAO;

	@Override
	public int insert(TravelDTO travelDTO) {
		return travelDAO.insert(travelDTO);
	}

	/**
	 * mypage 여행관리 여행계획부분.
	 */
	@Override
	public List<TravelDTO> selectAll(String memberId, PagingVo pagingVo) {
		return travelDAO.selectAll(memberId, pagingVo);
	}

	@Override
	public int selectTotalPaging(String memberId) {
		return travelDAO.selectTotalPaging(memberId);
	}

	/**
	 * mypage 여행관리 과거여행 부분.
	 */
	public List<TravelDTO> finishAll(String memberId) {
		return travelDAO.finishAll(memberId);
	}

	@Override
	public List<TravelDTO> selectPast() {
		return travelDAO.selectPast();
	}

	/**
	 * mypage 저장한 여행지 상품 list
	 * 
	 * @return
	 */
	@Override
	public List<ProductDTO> searchList(String nation, PagingVo pagingVo) {
		return travelDAO.searchList(nation, pagingVo);
	}

	@Override
	public int SelectListCnt(String nation) {
		return travelDAO.selectListCnt(nation);
	}

	@Override
	public int delete(String travelNo) {
		System.out.println("service = " + travelNo);
		return travelDAO.delete(travelNo);
	}

	@Override
	public List<String> suggest(String word) {
		return travelDAO.suggest(word);

	}

//가격순
	@Override
	public List<ProductDTO> costList(String nation,PagingVo paging) {
		return travelDAO.costList(nation,paging);
	}
	
	@Override
	public List<TravelDTO> recentTravelList() {
		// TODO Auto-generated method stub
		return travelDAO.recentTravelList();
	}
	
	@Override
	public UserDTO findMemberById(String id) {		
		return travelDAO.selectUserById(id);
	}
	
	@Override
	public ProductDTO readOrderDetail(String productCode) {
		
		return travelDAO.readOrderDetail(productCode);
	}
	
	@Override
	public List<UserDTO> offerList(String productCode) {
		return travelDAO.offerList(productCode);
	}

}
