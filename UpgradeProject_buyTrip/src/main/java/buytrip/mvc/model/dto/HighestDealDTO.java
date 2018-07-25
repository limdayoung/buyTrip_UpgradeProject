package buytrip.mvc.model.dto;

/**
 * ��ǰ��ϼ� Top3 ���� (��ǰ��ϼ�, �ŷ��Ϸ��, �ŷ���)
 * (travel ������)
 */
public class HighestDealDTO {

   private String arrivalNation; //��߳���
   private int completedDealNumber; //�Ϸ�� �ŷ���
   private int orderNumber; //��ǰ��ϼ�
   private int deal; //�ŷ���
   
   private String nationImg; //���� �̹���
   
   
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