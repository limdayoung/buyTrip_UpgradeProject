package buytrip.mvc.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import buytrip.mvc.model.dto.HighestDealDTO;
import buytrip.mvc.model.run.service.RunService;

@Controller
public class RunController {

	@Autowired
	private RunService runService;
	
	/**
	 * [travel page] 최근 등록된 여행일정 보여주기
	 */
	@RequestMapping("/run/recentAddTrips")
	public void recentAddTrips() {}
	
	/**
	 * [order page] 최근 직구자가 등록한 상품 보여주기 (정렬 : 최신순)
	 */
	@RequestMapping("/run/recentOrders")	
	public void recentOrders() {}
	
	/**
	 * [main page] 최근 완료된 주문 보여주기
	 */
	@RequestMapping("/run/recentCompletedOrders")
	public void recentCompletedOrders() {}
	
	/**
	 * [main page] 거래성사율 Top3나라 보여주기(등록수 대비 거래완료수)
	 */
	@RequestMapping("/travel/travel")
	public String highestDeal(Model model){
		model.addAttribute("list", runService.highestDeal());
		model.addAttribute("recentList", runService.recentTop4());
		return "travel/travel";
	}
	
	/**
	 * 회원 강퇴시키기
	 */
	@RequestMapping("/run/fire")
	public void fire(){}
	
	
	// 환율 api가져오는 것 성공.
		// 스케줄. 매일 오전 10시 15 @Scheduled(cron="0 15 10 ? * *")
		@Scheduled( cron="0 15 10 ? * *" )
		public void exchange() {
			try {
				// 현재시간 구하기.
				SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
				Date currentTime = new Date();
				String mTime = mSimpleDateFormat.format(currentTime);

				// 환율 api가져오기
				String address = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=DHhyDEPEvZgb056ertFLcLc95uWpiONh&searchdate="
						+ mTime + "&data=AP01";
				URL url = new URL(address);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

				String json = br.readLine();

				List<Map<String, String>> exchangeList = new ArrayList<Map<String, String>>();
				JSONParser parser = new JSONParser();
				JSONArray result;
				try {
					result = (JSONArray) parser.parse(json);
					for (int i = 0; i < result.size(); i++) {
						Map<String, String> exchange = new HashMap();
						JSONObject obj = (JSONObject) result.get(i);

						String city = (String) obj.get("cur_unit");
						String money = (String) obj.get("tts");
						String name = (String) obj.get("cur_nm");
						exchange.put("city", city);
						exchange.put("money", money);
						runService.updateExchange(exchange);
						System.out.println(city+","+money);
					}
					System.out.println("환율 update완료.");
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
}
