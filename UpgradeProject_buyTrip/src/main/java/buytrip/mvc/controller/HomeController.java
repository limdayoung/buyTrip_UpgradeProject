package buytrip.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import buytrip.mvc.model.message.service.MessageService;

@Controller
public class HomeController {

	@Autowired
	private MessageService messageService;

	@RequestMapping("/")
	public String index() {
		return "user/index"; //WEB-INF/views/index.jsp
	}
	
	/*
	@RequestMapping("/{url}")
	public void url() {} //WEB-INF/views/{url}.jsp
	
	@RequestMapping("/{url}/{url}")
	public void url2() {} //WEB-INF/views/{url}.jsp
	*/
	
	@ExceptionHandler
	public ModelAndView exceptionHandler(Exception e) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("errMessage", e.getMessage());
		mv.setViewName("error/errorMessage");
		return mv;
	}
}


