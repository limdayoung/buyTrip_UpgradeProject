package buytrip.mvc.model.travel.service;

import java.util.List;

import buytrip.mvc.model.dto.PagingVo;
import buytrip.mvc.model.dto.ProductDTO;
import buytrip.mvc.model.dto.TravelDTO;
import buytrip.mvc.model.dto.UserDTO;

public interface TravelService {
	
	
	/**
	 * addTrip ���� ���� �����Ͽ� �������� ���ã�� �߰��ϱ� (�˸����:�޼���,�������ǻ���ǰ)
	 */
	int insert (TravelDTO travelDTO);
	
	
	/**
	 * [mypage] ����� �������� �����ϱ�
	 */
	int delete(String travelNo);
	
	/**
	 * [mypage] ����� �������� �� ��ü list ����
	 */
	List<TravelDTO> selectAll(String memberId, PagingVo pagingVo);
	
	/**
	 * [mypage] ����� �������� �� ���Ѹ���� list ����
	 */
	List<TravelDTO> selectPast();
	
	/**
	 * ������ �ܾ� �ڵ��ϼ�
	 */
	List<String> suggest(String word);

	/**
	 * [mypage] ������� �Ⱓ������
	 */
	List<TravelDTO> finishAll(String memberId);
	
	/**
	 * mypage ������ ������ ��ǰ list
	 * @return
	 */
	public List<ProductDTO> searchList(String nation, PagingVo pagingVo);
	
	
	int selectTotalPaging(String memberId);
	
	 int SelectListCnt(String nation);


	List<TravelDTO> recentTravelList();
	
	/**
	 *���� ��
	 */
	List<ProductDTO> costList(String nation,PagingVo paging);


	UserDTO findMemberById(String memberId);


	ProductDTO readOrderDetail(String productCode);


	List<UserDTO> offerList(String productCode);
	

}
