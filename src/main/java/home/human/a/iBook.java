package home.human.a;

import java.util.ArrayList;

public interface iBook {
	void dogetBook(int roomcode, int howmany, String day1, String day2, int total, String name, String mobile);
	ArrayList<Book> dofindBook(String day1, String day2);
	ArrayList<Booking> doAddBooking(String day1, String day2);
	void doDeleteBook(int roomcode);
	void doUpdateBook(int bookcode, int howmany, String name, String mobile);

}

