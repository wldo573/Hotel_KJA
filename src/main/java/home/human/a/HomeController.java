package home.human.a;

import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private HttpSession session;
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/")
	public String dohome() {
		return "getinfo";
	}
	
	@RequestMapping("/home")
	public String dohome2() {
		return "home";
	}
	
	@RequestMapping("/login")
	public String  doLogin() {
		return "login";
	}

	
	@RequestMapping("/selected")
	public String doJob(HttpServletRequest hsr,Model model) {
		String strPath=hsr.getParameter("path");
		if(strPath.equals("login")) {
			return "getinfo";
		}else if(strPath.equals("newbie")) {
			return "newbie";
		}else {
			return "getinfo";
		}
	}
	@RequestMapping("/getinfo")
	public String getInfo() {
		return "getinfo";
	}
	@RequestMapping("/newbie")
	public String donewbie() {
		return "newbie";
	}
	@RequestMapping(value="/check_user",method=RequestMethod.POST)
	//@RequestMapping("/info")
	public String check_user(HttpServletRequest hsr,Model model) {
		//session 쓰려면 HttpServletRequest hsr필요
		String userid=hsr.getParameter("userid");
		String passcode=hsr.getParameter("passcode1");
		
		iMember member=sqlSession.getMapper(iMember.class);
		int n =member.doCheckUser(userid, passcode);
		if(n>0) {
			HttpSession session=hsr.getSession();
			session.setAttribute("loginid", userid);//RequestMapping의 경로이름
			return "redirect:/booking";
			//booking을 띄우기전에 redirect:쓰면 리턴전에 코드를 읽어줌
		}else {//비등록회원
			return "getinfo";
		}

	}
	
	@RequestMapping(value="/booking",method=RequestMethod.GET)
	public String booking(HttpServletRequest hsr,Model model) {
		HttpSession session=hsr.getSession();
		String loginid=(String)session.getAttribute("loginid");
		if(session.getAttribute("loginid")==null) {
			return "redirect:/getinfo";
		}else {
			iRoom room=sqlSession.getMapper(iRoom.class);
			ArrayList<typeinfo> ti=room.getTypeList();
			model.addAttribute("type",ti);
			return "booking";
		}

	}
	
	@RequestMapping(value="/signin",method=RequestMethod.POST,
			produces ="application/text; charset=utf8")
	public String doSignin(HttpServletRequest hsr) {
		String realname=hsr.getParameter("realname");
		String userid=hsr.getParameter("userid");
		String passcode=hsr.getParameter("passcode1");
		iMember member=sqlSession.getMapper(iMember.class);
		member.doSignin(realname,userid,passcode);
		return "getinfo";
	}
	
	@RequestMapping("/info2")
	public String doInfo2(HttpServletRequest hsr,Model model) {
		String rname=hsr.getParameter("realname");
		String id=hsr.getParameter("userid");
		String pass1=hsr.getParameter("passcode1");
		String pass2=hsr.getParameter("passcode2");
		String m=hsr.getParameter("moblie");
		model.addAttribute("realname",rname);
		model.addAttribute("userid",id);
		model.addAttribute("passcode1",pass1);
		model.addAttribute("passcode2",pass2);
		model.addAttribute("moblie",m);
		return "newinfo";
	}
	
	@RequestMapping("/room")
	public String room(HttpServletRequest hsr,Model model) {
		HttpSession session=hsr.getSession();
		if(session.getAttribute("loginid")==null) {
			return "redirect:/login";
		}
		//System.out.println("loginid ["+session.getAttribute("loginid")+"]");
		iRoom room=sqlSession.getMapper(iRoom.class);
		
		/*ArrayList<Roominfo> roominfo=room.getRoomList();
		model.addAttribute("list",roominfo);
		*/
		ArrayList<typeinfo> ti=room.getTypeList();
		model.addAttribute("type",ti);
		return "room";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest hsr) {
		HttpSession session=hsr.getSession();
		session.invalidate();
		return "redirect:/getinfo";
	}
	

	@RequestMapping(value="/getRoomList",method=RequestMethod.POST,
					produces ="application/text; charset=utf8")
	@ResponseBody//자바객체를 HTTP요청의 바디내용으로 매핑하여 클라이언트로 전송한다
	public String getRoomList(HttpServletRequest hsr) {
		iRoom room=sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> roominfo=room.getRoomList();
		//찾아진 데이터로 JSONArray만들기
		JSONArray ja = new JSONArray();
		for(int i=0; i<roominfo.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomcode",roominfo.get(i).getRoomcode());//jo.put(이름,값);
			jo.put("roomname", roominfo.get(i).getRoomname());
			jo.put("typename", roominfo.get(i).getTypename());
			jo.put("howmany", roominfo.get(i).getHowmany());
			jo.put("howmuch", roominfo.get(i).getHowmuch());
			ja.add(jo);
		}
		//System.out.println(ja.toString());
		return ja.toString();
	}
	
	@RequestMapping(value="/deleteRoom",method=RequestMethod.POST,
			produces ="application/text; charset=utf8")
	@ResponseBody//호출
	public String deleteRoom(HttpServletRequest hsr) {
		int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
		System.out.println("roomcode["+roomcode+"]");
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doDeleteRoom(roomcode);
		return "ok";
	}
	
	@RequestMapping(value="/addRoom",method=RequestMethod.POST,
			produces ="application/text; charset=utf8")
	@ResponseBody
	public String addRoom(HttpServletRequest hsr) {
		String rname=hsr.getParameter("roomname");
		int rtype=Integer.parseInt(hsr.getParameter("roomtype"));
		int howmany=Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch=Integer.parseInt(hsr.getParameter("howmuch"));
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doAddRoom(rname, rtype, howmany, howmuch);
		return "ok";
	}
	///select할땐 이거 !!!!
	@RequestMapping(value="/addBook",method=RequestMethod.POST,
			produces ="application/text; charset=utf8")
	@ResponseBody
	public String doFindBooked(HttpServletRequest hsr) {
		String day1=hsr.getParameter("day1");
		String day2=hsr.getParameter("day2");
		iBook book=sqlSession.getMapper(iBook.class);

		ArrayList<Book> arBook=book.dofindBook(day1, day2);
		//찾아진 데이터로 JSONArray만들기
		JSONArray ja = new JSONArray();
		System.out.println(arBook.size());
		for(int i=0; i<arBook.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomcode",arBook.get(i).getRoomcode());
			jo.put("bookcode",arBook.get(i).getBookcode());//jo.put(이름,값);
			jo.put("name",arBook.get(i).getName());
			jo.put("typename",arBook.get(i).getTypename());
			jo.put("howmany", arBook.get(i).getHowmany());
			jo.put("max_howmany",arBook.get(i).getMax_howmany());
			jo.put("day1", arBook.get(i).getDay1());
			jo.put("day2", arBook.get(i).getDay2());
			jo.put("total", arBook.get(i).getTotal());
			jo.put("username", arBook.get(i).getUsername());
			jo.put("mobile", arBook.get(i).getMobile());
			ja.add(jo);
		}
		return ja.toString();
	}
	
	@RequestMapping(value="/addBooking",method=RequestMethod.POST,
			produces ="application/text; charset=utf8")
	@ResponseBody
	public String addBooking(HttpServletRequest hsr) {
		String day1=hsr.getParameter("day1");
		String day2=hsr.getParameter("day2");
		iBook book=sqlSession.getMapper(iBook.class);
		ArrayList<Booking> arBooking=book.doAddBooking(day1, day2);
		//찾아진 데이터로 JSONArray만들기
		JSONArray ja = new JSONArray();
		System.out.println("size="+arBooking.size());
		for(int i=0; i<arBooking.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomcode",arBooking.get(i).getRoomcode());
			jo.put("name",arBooking.get(i).getName());
			jo.put("type",arBooking.get(i).getType());
			jo.put("howmany",arBooking.get(i).getHowmany());
			jo.put("howmuch",arBooking.get(i).getHowmuch());
			ja.add(jo);
		}
		return ja.toString();
	}
	
	@RequestMapping(value="/updateRoom",method=RequestMethod.POST,
					produces ="application/text; charset=utf8")
	@ResponseBody
	public String updateRoom(HttpServletRequest hsr) {
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doUpdateRoom(Integer.parseInt(hsr.getParameter("roomcode")),
				hsr.getParameter("roomname"),
				Integer.parseInt(hsr.getParameter("roomtype")),
				Integer.parseInt(hsr.getParameter("howmany")),
				Integer.parseInt(hsr.getParameter("howmuch")));
		return "ok";
	}
	
	@RequestMapping(value="/getBook",method=RequestMethod.POST)
	@ResponseBody
	public String getBook(HttpServletRequest hsr) {
		int roomcode =Integer.parseInt(hsr.getParameter("roomcode"));		
		int howmany=Integer.parseInt(hsr.getParameter("howmany"));
		String day1=hsr.getParameter("day1");
		String day2=hsr.getParameter("day2");
		int total=Integer.parseInt(hsr.getParameter("total"));
		String name=hsr.getParameter("name");
		String mobile=hsr.getParameter("mobile");
		iBook book=sqlSession.getMapper(iBook.class);
		book.dogetBook(roomcode,howmany,day1,day2,total,name,mobile);
		return "ok";
	}
	
	@RequestMapping(value="/deleteBook",method=RequestMethod.POST,
			produces ="application/text; charset=utf8")
	@ResponseBody//호출
	public String deleteBook(HttpServletRequest hsr) {
		int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
		System.out.println("roomcode["+roomcode+"]");
		iBook book=sqlSession.getMapper(iBook.class);
		book.doDeleteBook(roomcode);
		return "ok";
	}
	
	@RequestMapping(value="/updateBook",method=RequestMethod.POST,
			produces ="application/text; charset=utf8")
		@ResponseBody
		public String doUpdateBook(HttpServletRequest hsr) {
		iBook book=sqlSession.getMapper(iBook.class);
		book.doUpdateBook(Integer.parseInt(hsr.getParameter("bookcode")),
		Integer.parseInt(hsr.getParameter("howmany")),
		hsr.getParameter("name"),
		hsr.getParameter("mobile"));
		return "ok";
	}

}