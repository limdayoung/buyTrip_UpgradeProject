package buytrip.mvc.model.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import buytrip.mvc.model.dto.ProductDTO;
import buytrip.mvc.model.dto.UserDTO;
import buytrip.mvc.model.order.dao.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public int insertOrder(ProductDTO productDTO) {
		return orderDAO.insertOrder(productDTO);
	}

	@Override
	public List<ProductDTO> readOrder(String proposerId) {
		return orderDAO.readOrder(proposerId);
	}

	@Override
	public ProductDTO readOrderDetail(String productCode) {
		
		return orderDAO.readOrderDetail(productCode);
	}

	@Override
	public int updateOrder(ProductDTO productDTO) {
		
		
		return orderDAO.updateOrder(productDTO);
	}

	@Override
	public int deleteOrder(String proposerId, String productCode) {
		 
		return orderDAO.deleteOrder(proposerId, productCode);
	}


	@Override
	public List<ProductDTO> completeOrder(String proposerId, String tradeState) {

		return null;
	}

	
	public List<ProductDTO> letedOrder(String proposerId) {
		
		return orderDAO.letedOrder(proposerId);
	}
	@Override
	public List<ProductDTO> searchTripOrders(String arrivalNation) {
		return null;
	}

	@Override
	public ProductDTO readUserOrder() {
		return null;
	}

	@Override
	public List<UserDTO> offerList(String productCode) {
		return orderDAO.offerList(productCode);
	}
	@Override
	public List<ProductDTO> offer(String proposerId) {
		return orderDAO.offer(proposerId);
	}
	@Override
	public List<ProductDTO> completeOrder(String proposerId) {

		return orderDAO.completeOrder(proposerId);
	}

	@Override
	public int updateOfferStateCompelete(String offercode) {
		return orderDAO.updateOfferStateCompelete(offercode);
		
	}

	@Override
	public int updateProductState(String offercode) {
		return orderDAO.updateProductState(offercode);
		
	}


}
