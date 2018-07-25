package buytrip.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import buytrip.mvc.model.dto.PagingVo;
import buytrip.mvc.model.dto.ProductDTO;
import buytrip.mvc.model.dto.TravelDTO;
import buytrip.mvc.model.dto.UserDTO;
import buytrip.mvc.model.travel.service.TravelService;

@Controller
@RequestMapping("travel")
public class TravelController {

	@Autowired
	private TravelService travelService;
	
	
	//���� ���� ���
		String path="";
		List<String> imgList = new ArrayList<>();
		List<String> imgList2 = new ArrayList<>();
		
	/**
	 * [mypage] ����� �������� �� ��ü list and �Ⱓ�� ���� list�� ����
	 */
	@RequestMapping("select")
	public String selectAll(Model model, Authentication auth, PagingVo paging) {
		UserDTO userDTO = (UserDTO) auth.getPrincipal();
		String memberId = userDTO.getMemberId();
		List<TravelDTO> travelList = travelService.selectAll(memberId, paging);
		paging.setTotal(travelService.selectTotalPaging(memberId));
		List<TravelDTO> finishList = travelService.finishAll(memberId);
		model.addAttribute("travelList", travelList);
		model.addAttribute("p", paging);
		model.addAttribute("finishList", finishList);
		return "mypage/myTravelList_my";
	}

	/**
	 * [mypage] ����� �������� �� ���Ѹ���� list ����
	 */
	@RequestMapping("selectPast")
	@ResponseBody
	public List<TravelDTO> selectPast() {
		return travelService.selectPast();
	}

	/**
	 * [mypage] ����� ���������� ��ϵ� ��ǰ ������ֱ�.
	 */
	@RequestMapping("mytravelsearchProduct")
	public String mytravelsearchProduct(String arrNation, String deNation, Model model,
			buytrip.mvc.model.dto.PagingVo paging) {
		paging.setTotal(travelService.SelectListCnt(arrNation));
		
		System.out.println("-------------"+paging.getListCnt());
		
		model.addAttribute("searchProductList", travelService.searchList(arrNation, paging));
		model.addAttribute("p", paging);
		return "mypage/myTravel";
	}

	/**
	 * travel-searchList������ ���ϴ� ���� ��ϵ� ��ǰ ������ֱ�
	 */
	@RequestMapping("searchProductList")
	public String searchProductList(String arrivalNation, Model model, buytrip.mvc.model.dto.PagingVo paging) {
		paging.setTotal(travelService.SelectListCnt(arrivalNation));
		
		System.out.println("----------"+paging.getLast());
		model.addAttribute("arrivalNation", arrivalNation);
		model.addAttribute("searchProductList", travelService.searchList(arrivalNation, paging));
		model.addAttribute("p", paging);
		return "travel/searchList";
	}

	@RequestMapping("costList")
	public String costList(String arrivalNation,Model model, buytrip.mvc.model.dto.PagingVo paging) {
		paging.setTotal(travelService.SelectListCnt(arrivalNation));
		model.addAttribute("arrivalNation", arrivalNation);
		model.addAttribute("costList", travelService.costList(arrivalNation, paging));
		model.addAttribute("p", paging);
		return "travel/costList";
	}
	
	/**
	 * ��ǰ����Ʈ���� detail�������� ����.
	 */
	@RequestMapping("detail")
	public String productDetail(String productCode,Model model, HttpServletRequest request) {
				//server path ���ϱ�
				String contextPath = request.getContextPath();
				path = contextPath + "/resources/proImg/";
				
				ProductDTO productDTO = travelService.readOrderDetail(productCode);
				imgList = this.getImage(productDTO);
				
				//�̹���list & dto ����
				model.addAttribute("imgList", imgList);
				model.addAttribute("productDTO",productDTO);
					
					//offer������ list���
				List<UserDTO> offerList = travelService.offerList(productCode);
					//offerlist ����
				model.addAttribute("offerList", offerList);
					
		return "order/detail";
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
	 * addTrip ���� ���� �����Ͽ� �������� ���ã�� �߰��ϱ� (�˸����:�޼���,�������ǻ���ǰ)
	 */

	@RequestMapping("insert")
	public String insertTravel(TravelDTO travelDTO) {
		travelService.insert(travelDTO);
		return "forward:select";
	}

	/**
	 * [mypage] ����� �������� �����ϱ�
	 */
	@RequestMapping(value = "delete", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int deleteTravel(String travelNo) {
		System.out.println("controller = " + travelNo);
		return travelService.delete(travelNo);

	}

	@RequestMapping("suggest")
	@ResponseBody
	public List<String> suggest(String keyWord) {
		List<String> list = travelService.suggest(keyWord);
		return list;

	}

	/**
	 * order main ȭ�� ���
	 */
	@RequestMapping("/addTrip")
	public String addTrip() {
		return "travel/addTrip";
	}

}