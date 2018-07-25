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
	 * �� ũ�Ѹ� (����Ʈ ���� �ܾ����-��ǰ�̸�, �̹���)
	 */
	@ResponseBody
	@RequestMapping("crawling")
	public Map<String, String> crawling(HttpServletRequest request) {

		String title=""; //selector
		String img=""; //selector
		String proName=""; //map key
		String image=""; //map key
		Map<String, String> map = new HashMap<>();
		

		//����ڷκ��� ���޹��� url ������
		String url = request.getParameter("url");
		System.out.println("url : "+url); //test
		
		//�̺��� "https://www.ebay.com/itm/Brother-1134DW-Overlock-Serger-Sewing-Machine-Refurbished/152963532333?_trkparms=%26rpp_cid%3D5abd1690b27cab521d8f6219%26rpp_icid%3D5abd437e36f1f9344576817e";
		//�˸��ٹ� "https://wholesaler.alibaba.com/product-detail/handbags-for-women-3-pcs-lady_60749800571.html?spm=a2700.wholesale.maylikever.7.468f7cfdBcyDbQ";   
		
		if(url.contains("ebay")) { //�̺���
			title="#itemTitle"; img="#icImg";
		}else if(url.contains("alibaba")) { //�˸��ٹ�
			title=".ma-title"; img="#J-image-icontent .iwrap a img";
		}
		
		try { 
			
			//����ڷκ��� ���޹��� url�� �ҽ� �ܾ����
			Document doc = Jsoup.connect(url).get();
			  
			//��ǰ�̸� ã��
			proName = doc.select(title).last().ownText();
			System.out.println("name �±� : "+proName); //test
			
	        //�̹��� ã��
			image = doc.select(img).attr("src");
			System.out.println("image �±� : "+image); //test
			
			//map�� ���
			map.put("proName", proName);
			map.put("image", image);
		
	   } catch (Exception e) {
	      //e.printStackTrace();
	   }
		
	return map;
	}
}
