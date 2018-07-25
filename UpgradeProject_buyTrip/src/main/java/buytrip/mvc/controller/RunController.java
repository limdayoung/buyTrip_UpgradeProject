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
	 * [travel page] �ֱ� ��ϵ� �������� �����ֱ�
	 */
	@RequestMapping("/run/recentAddTrips")
	public void recentAddTrips() {}
	
	/**
	 * [order page] �ֱ� �����ڰ� ����� ��ǰ �����ֱ� (���� : �ֽż�)
	 */
	@RequestMapping("/run/recentOrders")	
	public void recentOrders() {}
	
	/**
	 * [main page] �ֱ� �Ϸ�� �ֹ� �����ֱ�
	 */
	@RequestMapping("/run/recentCompletedOrders")
	public void recentCompletedOrders() {}
	
	/**
	 * [main page] �ŷ������� Top3���� �����ֱ�(��ϼ� ��� �ŷ��Ϸ��)
	 */
	@RequestMapping("/travel/travel")
	public String highestDeal(Model model){
		model.addAttribute("list", runService.highestDeal());
		model.addAttribute("recentList", runService.recentTop4());
		return "travel/travel";
	}
	
	/**
	 * ȸ�� �����Ű��
	 */
	@RequestMapping("/run/fire")
	public void fire(){}
	
	
	// ȯ�� api�������� �� ����.
		// ������. ���� ���� 10�� 15 @Scheduled(cron="0 15 10 ? * *")
		@Scheduled( cron="0 15 10 ? * *" )
		public void exchange() {
			try {
				// ����ð� ���ϱ�.
				SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
				Date currentTime = new Date();
				String mTime = mSimpleDateFormat.format(currentTime);

				// ȯ�� api��������
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
					System.out.println("ȯ�� update�Ϸ�.");
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
