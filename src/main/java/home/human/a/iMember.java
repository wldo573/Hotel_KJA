package home.human.a;

public interface iMember {
	void doSignin(String realname,String userid,String passcode);
	int doCheckUser(String userid,String passcode);
}
