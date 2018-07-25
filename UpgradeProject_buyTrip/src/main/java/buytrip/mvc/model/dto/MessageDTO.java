package buytrip.mvc.model.dto;

public class MessageDTO {

	private String productCode, senderId, receiverId, messageContent, sendTime, userId, memberImg, memberName;
	private int count, unread;

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}


	public int getUnread() {
		return unread;
	}

	public void setUnread(int unread) {
		this.unread = unread;
	}

	public String getUserId() {
		return userId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberImg() {
		return memberImg;
	}

	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

}
