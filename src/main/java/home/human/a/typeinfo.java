package home.human.a;

public class typeinfo {

	private int typecode;
	private String name;
	
	public typeinfo() {}
	public typeinfo(int typecode, String name) {
		
		this.typecode = typecode;
		this.name = name;
	}
	public int getTypecode() {
		return typecode;
	}
	public void setTypecode(int typecode) {
		this.typecode = typecode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
