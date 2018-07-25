package buytrip.mvc.model.dto;

public class OfferJoinProductDTO {
	private String offerCode;
	private ProductDTO productDTO;

	public String getOfferCode() {
		return offerCode;
	}

	public void setOfferCode(String offerCode) {
		this.offerCode = offerCode;
	}

	public ProductDTO getProductDTO() {
		return productDTO;
	}

	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}

}
