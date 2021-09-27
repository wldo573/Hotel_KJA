package home.human.a;

public class Booking {
	int roomcode;
	String name;
	String type;
	int howmany;
	int howmuch;
	public Booking(int roomcode, String name, String type, int howmany, int howmuch) {
		this.roomcode = roomcode;
		this.name = name;
		this.type = type;
		this.howmany = howmany;
		this.howmuch = howmuch;
	}
	public Booking() {
	}
	public int getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getHowmany() {
		return howmany;
	}
	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}
	public int getHowmuch() {
		return howmuch;
	}
	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}
	
	
}
