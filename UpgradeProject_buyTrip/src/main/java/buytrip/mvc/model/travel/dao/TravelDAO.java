package buytrip.mvc.model.travel.dao;

import java.util.List;

import buytrip.mvc.model.dto.PagingVo;
import buytrip.mvc.model.dto.ProductDTO;
import buytrip.mvc.model.dto.TravelDTO;
import buytrip.mvc.model.dto.UserDTO;

public interface TravelDAO {

	/**
	 * addTrip 폼에 정보 기입하여 여행일정 즐겨찾기 추가하기 (알림기능:메세지,여행지의새상품)
	 */
	int insert(TravelDTO travelDTO);

	/**
	 * [mypage] 등록한 여행일정 삭제하기
	 */
	int delete(String arrivalDate);

	int selectListCnt(String nation);

	/**
	 * [mypage] 등록한 여행일정 중 최근 등록 전체 보기
	 */
	List<TravelDTO> selectAll(String memberId, PagingVo pagingVo);

	/**
	 * [mypage] 등록한 여행일정 중 기간 만료 보기
	 */
	List<TravelDTO> selectPast();

	/**
	 * 여행지 검색 기능 단어 자동완성
	 */
	List<String> suggest(String word);

	/**
	 * [mypage] 여행관리 기간만료탭
	 */
	List<TravelDTO> finishAll(String memberId);

	/**
	 * 여행지 넣으면은 상품list 보기 등록순
	 */
	List<ProductDTO> searchList(String nation, PagingVo pagingVo);

	int selectTotalPaging(String memberId);

	/**
	 * 최근 등록된 여행지 list
	 */
	List<TravelDTO> recentTravelList();

	/**
	 * 여행지 넣으면은 상품list 보기 가격순
	 */
	
	List<ProductDTO> costList(String nation,PagingVo paging);

	UserDTO selectUserById(String id);

	ProductDTO readOrderDetail(String productCode);

	List<UserDTO> offerList(String productCode);

}
