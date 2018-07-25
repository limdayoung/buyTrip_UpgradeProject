package buytrip.mvc.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import buytrip.mvc.model.dto.ProductDTO;
import buytrip.mvc.model.dto.TravelDTO;
import buytrip.mvc.model.dto.UserDTO;
import buytrip.mvc.model.order.service.OrderService;
import buytrip.mvc.model.travel.service.TravelService;
import buytrip.mvc.model.user.service.UserService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;
		
	@Autowired
	private TravelService travelService;
	
	@Autowired
	private UserService userService;
	
	String path="";
	//���� ���� ���
	  List<String> imgList = new ArrayList<>();
	   List<String> imgList2 = new ArrayList<>();
	   List<String> imgList3 = new ArrayList<>();
	   List<String> imgList4 = new ArrayList<>();
	
	/**
	 * order main ȭ�� ���
	 */
	@RequestMapping("/order")
	public String mainview(Model model) {
		
		List<TravelDTO> list = travelService.recentTravelList();
		
		model.addAttribute("list", list);
		
		return "order/order";
	}
	
	/**
	 * ��ǰ ����ϱ� �� ����
	 */
	@RequestMapping("/orderForm")
	public String insertOrderForm() {
      return "order/orderForm"; 
	}
	
	/**
	 * ��ǰ ����ϱ� - ���� �̹���
	 */
	@RequestMapping("/insertOrder")
	public String insertOrder(ProductDTO productDTO, MultipartHttpServletRequest mtRequest,
			Model model, Authentication auth, HttpSession session) throws Exception {
		
		//id�� �ޱ�
		UserDTO userDTO = (UserDTO)auth.getPrincipal();
		String memberId = userDTO.getMemberId();

		//productDTO�� �α��ε� id ����
		productDTO.setProposerId(memberId);

		//����list ��������
		List<MultipartFile> flist = mtRequest.getFiles("file");
		String fileName = "";
		
		//��� ��ǰ�̹��� ������(����)
		String savePath = session.getServletContext().getRealPath("/resources/proImg");
		//����list�� 1�̻��̶��
		if(flist.size()>1) {
			for(MultipartFile mpf : flist) {
				
				//���� ���ϸ�
				String fName = System.currentTimeMillis()+"_"+mpf.getOriginalFilename();
				
				//������ ������ ���� ����
				mpf.transferTo(new File(savePath+"/"+fName));
				
				//productDTO�� ProductImg�� ������ �����̸�(��)
				fileName += fName+"|";
			}
		}
		if(productDTO.getProductImg()!=null) {
			fileName += productDTO.getProductImg();
		}
		//productDTO�� 1���̻��� ���ϸ� ����
		productDTO.setProductImg(fileName);
		
		//��ǰ ����ϱ�
		orderService.insertOrder(productDTO);

		return "redirect:/";
	}
		

	
	/**
	 * [mypage] ����� ��ǰ list ����
	 */
	@RequestMapping("/readOrders")
	public String readOrder(Model model, Authentication auth, HttpServletRequest request
			,HttpSession session) {
			
		UserDTO userDTO = (UserDTO)auth.getPrincipal();
		String memberId = userDTO.getMemberId();
		
		List<ProductDTO> list = orderService.readOrder(memberId);	
		List<ProductDTO> list2 =orderService.offer(memberId);
		List<ProductDTO> list3 =orderService.completeOrder(memberId);
		List<ProductDTO> list4 =orderService.letedOrder(memberId);
		
		
	    for(ProductDTO productDTO : list) {
	         imgList = this.getImage(productDTO);
	         productDTO.setImgList(imgList);
	      }
	      for(ProductDTO productDTO : list2) {
	         imgList2 = this.getImage(productDTO);
	         productDTO.setImgList(imgList2);
	      }
	      for(ProductDTO productDTO : list3) {
	         imgList3 = this.getImage(productDTO);
	         productDTO.setImgList(imgList);
	      }
	      for(ProductDTO productDTO : list4) {
	         imgList4 = this.getImage(productDTO);
	         productDTO.setImgList(imgList2);
	      }
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		
		return "mypage/mypageProductList_my";
	}
	
	/**
	 * [mypage] ����� ��ǰ �󼼺��� - ���� �̹���
	 */
	@RequestMapping("/readOrderDetail")
	public String readOrderDetail(String productCode, Model model, HttpServletRequest request,
			Authentication auth){
		//id�� �ޱ�
		UserDTO userDTO = (UserDTO)auth.getPrincipal();
		String memberId = userDTO.getMemberId();
		System.out.println("������ memberId : "+memberId);		
		UserDTO userdto = userService.findMemberById(memberId);
		
		//server path ���ϱ�
		String contextPath = request.getContextPath();
		path = contextPath + "/resources/proImg/";
		
		ProductDTO productDTO = orderService.readOrderDetail(productCode);
		imgList = this.getImage(productDTO);
		
		//�̹���list & dto ����
		model.addAttribute("imgList", imgList);
		model.addAttribute("productDTO",productDTO);
		model.addAttribute("userDto",userdto);
			
			//offer������ list���
			List<UserDTO> offerList = orderService.offerList(productCode);
			
			
			//offerlist ����
			model.addAttribute("offerList", offerList);
			
		return "mypage/mypageDetail";
	}

	/**
	 * productDTO���� ������ image�� list�� ���
	 */
	public List<String> getImage(ProductDTO productDTO) {

		//�̹��� �ѷ��ֱ�
		String imgName = productDTO.getProductImg();
		
		String [] imgArr = imgName.split("\\|");
		List<String> imgList = new ArrayList<>();  
		for(String image : imgArr) {
			if(image.contains("https://")||image.contains(".com")) {
				imgList.add(image);
			}else {
				imgList.add(path+image);
			}
		}
		return imgList;
	}
	
	/**
	 * [mypage] ����� ��ǰ �����ϱ� �� ����
	 */
	@RequestMapping("/updateOrderForm")
	public ModelAndView updateOrderFom(String productCode) {
		ProductDTO productDTO = orderService.readOrderDetail(productCode);
		return new ModelAndView("mypage/updateOrder","productDTO",productDTO);
	}
	
	/**
	 * [mypage] ����� ��ǰ �����ϱ�
	 */
	@RequestMapping("/updateOrder")
	@ResponseBody
	public ModelAndView updateOrder(ProductDTO productDTO) {
	orderService.updateOrder(productDTO);
	ProductDTO proDTO=orderService.readOrderDetail(productDTO.getProductCode());
	
		
		return new ModelAndView("forward:readOrderDetail", "productCode", proDTO.getProductCode());
	}
	
	/**
	 * [mypage] ����� ��ǰ �����ϱ�
	 */
	@RequestMapping("/deleteOrder")
	
	public String  deleteOrder(Authentication auth, String productCode) {
		
		UserDTO userDTO = (UserDTO)auth.getPrincipal();
		String memberId = userDTO.getMemberId();
		orderService.deleteOrder(memberId, productCode);
		return "redirect:order";
	}
	
	/**
	 * [mypage] ����� ��ǰ �ŷ��Ϸ� ó���ϱ�
	 */
	@RequestMapping("/completeOrder")
	public void completeOrder() {
	}
	
	

	/**
	 * ������ �˻��� ���� �������� ��ϻ�ǰ list ����
	 */
	@RequestMapping("/searchTripOrders")
	public void searchTripOrders() {
	}
	
	/**
	 * �����ڰ� ����� ��ǰ �󼼺��� (1.��ǰ����, 2.����������, 3.�������� ��������)
	 */
	@RequestMapping("/readUserOrder")
	public void  readUserOrder() {
	}
	
	/**
	 * �����ڰ� ��ϻ� ��ǰ�� ������ Ȯ���Ҷ�.
	 */
	@RequestMapping("/compeleteoffer")
	public String compeleteoffer(Authentication auth,String offercode,String offerId) {
		System.out.println(offercode);
		int result = orderService.updateOfferStateCompelete(offercode);
		int result2 = orderService.updateProductState(offercode);
		
		return "redirect:/";
	}
	  
	
	
}
