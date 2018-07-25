package buytrip.mvc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CrawlingController {
	
	/**
	 * 웹 크롤링 (사이트 정보 긁어오기-상품이름, 이미지)
	 */
	@ResponseBody
	@RequestMapping("crawling")
	public Map<String, String> crawling(HttpServletRequest request) {

		String title=""; //selector
		String img=""; //selector
		String proName=""; //map key
		String image=""; //map key
		Map<String, String> map = new HashMap<>();
		

		//사용자로부터 전달받은 url 꺼내기
		String url = request.getParameter("url");
		System.out.println("url : "+url); //test
		
		//이베이 "https://www.ebay.com/itm/Brother-1134DW-Overlock-Serger-Sewing-Machine-Refurbished/152963532333?_trkparms=%26rpp_cid%3D5abd1690b27cab521d8f6219%26rpp_icid%3D5abd437e36f1f9344576817e";
		//알리바바 "https://wholesaler.alibaba.com/product-detail/handbags-for-women-3-pcs-lady_60749800571.html?spm=a2700.wholesale.maylikever.7.468f7cfdBcyDbQ";   
		
		if(url.contains("ebay")) { //이베이
			title="#itemTitle"; img="#icImg";
		}else if(url.contains("alibaba")) { //알리바바
			title=".ma-title"; img="#J-image-icontent .iwrap a img";
		}
		
		try { 
			
			//사용자로부터 전달받은 url의 소스 긁어오기
			Document doc = Jsoup.connect(url).get();
			  
			//상품이름 찾기
			proName = doc.select(title).last().ownText();
			System.out.println("name 태그 : "+proName); //test
			
	        //이미지 찾기
			image = doc.select(img).attr("src");
			System.out.println("image 태그 : "+image); //test
			
			//map에 담기
			map.put("proName", proName);
			map.put("image", image);
		
	   } catch (Exception e) {
	      //e.printStackTrace();
	   }
		
	return map;
	}
}
