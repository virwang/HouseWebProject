package tw.house._08_.mail;

import java.util.Random;

public class ActionMail {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Random random=new Random();
		Integer reset=random.nextInt(9)+1;
		System.out.println(reset);
		int num = (int)(Math.random()* (0-9+1)+1);
		System.out.println(num);
	}

}
