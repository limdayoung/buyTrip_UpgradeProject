package buytrip.mvc.model.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {

	private String productCode;
	private String proposerId;
	private String productName;
	private String productImg;
	private String productUrl;
	private int productQty;
	private int productPrice;
	private String productDesc;
	private String requirement;
	private String requestedDate;
	private String	deadlineDate;
	private String departNation;
	private String arrivalNation;
	private String tradeState;
	private String nationCurrency;
	private String ceil;
	
	private String memberImg;	
	private String userDTO;
	
	private MultipartFile file;
	private List<String> imgList;
	
	
	public String getNationCurrency() {
		return nationCurrency;
	}
	public void setNationCurrency(String nationCurrency) {
		this.nationCurrency = nationCurrency;
	}
	public String getCeil() {
		return ceil;
	}
	public void setCeil(String ceil) {
		this.ceil = ceil;
	}
	
	public List<String> getImgList() {
		return imgList;
	}
	public void setImgList(List<String> imgList) {
		this.imgList = imgList;
	}
	public String getMemberImg() {
		return memberImg;
	}
	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}
	public String getUserDTO() {
		return userDTO;
	}
	public void setUserDTO(String userDTO) {
		this.userDTO = userDTO;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getProposerId() {
		return proposerId;
	}
	public void setProposerId(String proposerId) {
		this.proposerId = proposerId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public String getProductUrl() {
		return productUrl;
	}
	public void setProductUrl(String productUrl) {
		this.productUrl = productUrl;
	}
	public int getProductQty() {
		return productQty;
	}
	public void setProductQty(int productQty) {
		this.productQty = productQty;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public String getRequirement() {
		return requirement;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	public String getRequestedDate() {
		return requestedDate;
	}
	public void setRequestedDate(String requestedDate) {
		this.requestedDate = requestedDate;
	}
	public String getDeadlineDate() {
		return deadlineDate;
	}
	public void setDeadlineDate(String deadlineDate) {
		this.deadlineDate = deadlineDate;
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
	public String getTradeState() {
		return tradeState;
	}
	public void setTradeState(String tradeState) {
		this.tradeState = tradeState;
	}
}
