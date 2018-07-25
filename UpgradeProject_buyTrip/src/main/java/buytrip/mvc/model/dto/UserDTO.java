package buytrip.mvc.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class UserDTO {
	private String memberId;
	private String memberName;
	private String memberPassword;
	private String memberImg;
	private String mobile;
	
	private OfferDTO offer;
	
	
	
	
	public OfferDTO getOffer() {
		return offer;
	}
	public void setOffer(OfferDTO offer) {
		this.offer = offer;
	}
	private MultipartFile file;
	
	public UserDTO() {}

	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberImg() {
		return memberImg;
	}
	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "UserDTO [memberId=" + memberId + ", memberName=" + memberName + ", memberPassword=" + memberPassword + ", mobile=" + mobile + "]";
	}
	
	

}
