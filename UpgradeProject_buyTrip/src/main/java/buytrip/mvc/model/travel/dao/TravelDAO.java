package buytrip.mvc.model.travel.dao;

import java.util.List;

import buytrip.mvc.model.dto.PagingVo;
import buytrip.mvc.model.dto.ProductDTO;
import buytrip.mvc.model.dto.TravelDTO;
import buytrip.mvc.model.dto.UserDTO;

public interface TravelDAO {

	/**
	 * addTrip ���� ���� �����Ͽ� �������� ���ã�� �߰��ϱ� (�˸����:�޼���,�������ǻ���ǰ)
	 */
	int insert(TravelDTO travelDTO);

	/**
	 * [mypage] ����� �������� �����ϱ�
	 */
	int delete(String arrivalDate);

	int selectListCnt(String nation);

	/**
	 * [mypage] ����� �������� �� �ֱ� ��� ��ü ����
	 */
	List<TravelDTO> selectAll(String memberId, PagingVo pagingVo);

	/**
	 * [mypage] ����� �������� �� �Ⱓ ���� ����
	 */
	List<TravelDTO> selectPast();

	/**
	 * ������ �˻� ��� �ܾ� �ڵ��ϼ�
	 */
	List<String> suggest(String word);

	/**
	 * [mypage] ������� �Ⱓ������
	 */
	List<TravelDTO> finishAll(String memberId);

	/**
	 * ������ �������� ��ǰlist ���� ��ϼ�
	 */
	List<ProductDTO> searchList(String nation, PagingVo pagingVo);

	int selectTotalPaging(String memberId);

	/**
	 * �ֱ� ��ϵ� ������ list
	 */
	List<TravelDTO> recentTravelList();

	/**
	 * ������ �������� ��ǰlist ���� ���ݼ�
	 */
	
	List<ProductDTO> costList(String nation,PagingVo paging);

	UserDTO selectUserById(String id);

	ProductDTO readOrderDetail(String productCode);

	List<UserDTO> offerList(String productCode);

}
