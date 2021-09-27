package home.human.a;

import java.util.ArrayList;

public interface iRoom {

	ArrayList<Roominfo> getRoomList();
	ArrayList<typeinfo> getTypeList();
	void doDeleteRoom(int roomcode);
	void doAddRoom(String roomname,int rtype,int howmany,int howmuch);
	void doUpdateRoom(int roomcode,String roomname,int roomtype,int howmany,int howmuch);
	void doUploadRoom(String roomname, String roomtype, int howmany1, int howmany2, int day1, int day2, String mobile1,
			String name1);
}
