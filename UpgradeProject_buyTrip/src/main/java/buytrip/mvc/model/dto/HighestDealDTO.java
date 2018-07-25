package buytrip.mvc.model.dto;

/**
 * 상품등록수 Top3 나라 (상품등록수, 거래완료수, 거래율)
 * (travel 페이지)
 */
public class HighestDealDTO {

   private String arrivalNation; //출발나라
   private int completedDealNumber; //완료된 거래수
   private int orderNumber; //상품등록수
   private int deal; //거래율
   
   private String nationImg; //나라 이미지
   
   
   public String getArrivalNation() {
      return arrivalNation;
   }
   public void setArrivalNation(String departNation) {
      this.arrivalNation = departNation;
   }
   public int getCompletedDealNumber() {
      return completedDealNumber;
   }
   public void setCompletedDealNumber(int completedDealNumber) {
      this.completedDealNumber = completedDealNumber;
   }
   public int getOrderNumber() {
      return orderNumber;
   }
   public void setOrderNumber(int orderNumber) {
      this.orderNumber = orderNumber;
   }
   public int getDeal() {
      return deal;
   }
   public void setDeal(int deal) {
      this.deal = deal;
   }
   public String getNationImg() {
      return nationImg;
   }
   public void setNationImg(String nationImg) {
      this.nationImg = nationImg;
   }

}