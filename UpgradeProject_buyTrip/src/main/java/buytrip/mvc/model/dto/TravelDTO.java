package buytrip.mvc.model.dto;

public class TravelDTO {

	private String travelNo;
	private String memberId;
	private String departNation;
	private String arrivalNation;
	private String arrivalDate;
	private String inputDate;
	private String notification;
	private String nationName;
	private String memberImg;
	private String countProduct;
	
	
	

	
	public String getCountProduct() {
		return countProduct;
	}

	public void setCountProduct(String countProduct) {
		this.countProduct = countProduct;
	}

	public String getMemberImg() {
		return memberImg;
	}

	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}

	public String getNationName() {
		return nationName;
	}

	public void setNationName(String nationName) {
		this.nationName = nationName;
	}

	public String getTravelNo() {
		return travelNo;
	}

	public void setTravelNo(String travelNo) {
		this.travelNo = travelNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getDepartNation() {
		return departNation;
	}

	public void setDepartNation(String departNation) {
		this.departNation = departNation;
	}

	public String getArrivalNation() {
		return arrivalNation;
	}

	public void setArrivalNation(String arrivalNation) {
		this.arrivalNation = arrivalNation;
	}

	public String getArrivalDate() {
		return arrivalDate;
	}

	public void setArrivalDate(String arrivalDate) {
		this.arrivalDate = arrivalDate;
	}

	public String getInputDate() {
		return inputDate;
	}

	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}

	public String getNotification() {
		return notification;
	}

	public void setNotification(String notification) {
		this.notification = notification;
	}

}
