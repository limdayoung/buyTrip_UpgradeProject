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
	
	
	//사진 저장 경로
		String path="";
		List<String> imgList = new ArrayList<>();
		List<String> imgList2 = new ArrayList<>();
		
	/**
	 * [mypage] 등록한 여행일정 중 전체 list and 기간이 지난 list를 보기
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
	 * [mypage] 등록한 여행일정 중 기한만료된 list 보기
	 */
	@RequestMapping("selectPast")
	@ResponseBody
	public List<TravelDTO> selectPast() {
		return travelService.selectPast();
	}

	/**
	 * [mypage] 저장된 여행일정에 등록된 상품 출력해주기.
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
	 * travel-searchList페이지 원하는 나라에 등록된 상품 출력해주기
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
	 * 상품리스트에서 detail페이지로 가기.
	 */
	@RequestMapping("detail")
	public String productDetail(String productCode,Model model, HttpServletRequest request) {
				//server path 구하기
				String contextPath = request.getContextPath();
				path = contextPath + "/resources/proImg/";
				
				ProductDTO productDTO = travelService.readOrderDetail(productCode);
				imgList = this.getImage(productDTO);
				
				//이미지list & dto 저장
				model.addAttribute("imgList", imgList);
				model.addAttribute("productDTO",productDTO);
					
					//offer제안한 list출력
				List<UserDTO> offerList = travelService.offerList(productCode);
					//offerlist 저장
				model.addAttribute("offerList", offerList);
					
		return "order/detail";
	}

	
	/**
	 * productDTO에서 꺼내온 image를 list에 담기
	 */
	public List<String> getImage(ProductDTO productDTO) {

		//이미지 뿌려주기
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
	 * addTrip 폼에 정보 기입하여 여행일정 즐겨찾기 추가하기 (알림기능:메세지,여행지의새상품)
	 */

	@RequestMapping("insert")
	public String insertTravel(TravelDTO travelDTO) {
		travelService.insert(travelDTO);
		return "forward:select";
	}

	/**
	 * [mypage] 등록한 여행일정 삭제하기
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
	 * order main 화면 출력
	 */
	@RequestMapping("/addTrip")
	public String addTrip() {
		return "travel/addTrip";
	}

}