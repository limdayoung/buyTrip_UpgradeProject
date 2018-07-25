package buytrip.mvc.model.dto;

public class OfferDTO {
	private String offerCode;
	private String proposerId;
	private String offerId;
	private String productCode;
	private String offerDate;
	
	public OfferDTO() {}
	
	public OfferDTO(String offerCode, String proposerId, String offerId, String productCode, String offerDate) {
		super();
		this.offerCode = offerCode;
		this.proposerId = proposerId;
		this.offerId = offerId;
		this.productCode = productCode;
		this.offerDate = offerDate;
	}


	public String getOfferCode() {
		return offerCode;
	}
	public void setOfferCode(String offerCode) {
		this.offerCode = offerCode;
	}
	public String getProposerId() {
		return proposerId;
	}
	public void setProposerId(String proposerId) {
		this.proposerId = proposerId;
	}
	public String getOfferId() {
		return offerId;
	}
	public void setOfferId(String offerId) {
		this.offerId = offerId;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getOfferDate() {
		return offerDate;
	}
	public void setOfferDate(String offerDate) {
		this.offerDate = offerDate;
	}
	
	
}
