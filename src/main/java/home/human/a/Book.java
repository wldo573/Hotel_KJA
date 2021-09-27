package home.human.a;
  
public class Book{
	int roomcode;
	int bookcode;
	String name;
	String typename;
	int howmany;
	int max_howmany;
	String day1;
	String day2;
	int total;
	String username;
	String mobile;
	//생성자 두개
	public Book() {
	}
	
	public Book(int roomcode, int bookcode, String name, String typename, int howmany, int max_howmany, String day1,
			String day2, int total, String username, String mobile) {
		this.roomcode = roomcode;
		this.bookcode = bookcode;
		this.name = name;
		this.typename = typename;
		this.howmany = howmany;
		this.max_howmany = max_howmany;
		this.day1 = day1;
		this.day2 = day2;
		this.total = total;
		this.username = username;
		this.mobile = mobile;
	}

	public int getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}
	public int getBookcode() {
		return bookcode;
	}
	public void setBookcode(int bookcode) {
		this.bookcode = bookcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public int getHowmany() {
		return howmany;
	}
	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}
	public int getMax_howmany() {
		return max_howmany;
	}
	public void setMax_howmany(int max_howmany) {
		this.max_howmany = max_howmany;
	}
	public String getDay1() {
		return day1;
	}
	public void setDay1(String day1) {
		this.day1 = day1;
	}
	public String getDay2() {
		return day2;
	}
	public void setDay2(String day2) {
		this.day2 = day2;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
}
