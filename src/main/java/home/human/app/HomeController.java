package home.human.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/selected")
	public String doJob(HttpServletRequest hsr,Model model) {
		String strPath=hsr.getParameter("path");
		if(strPath.equals("login")) {
			return "getinfo";
		}else if(strPath.equals("newbie")) {
			return "newbie";
		}else {
			return "home";
		}
	}
	
}
