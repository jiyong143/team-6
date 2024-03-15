package community.controller;

import java.util.Scanner;

import db.community.mybatis.service.CommunityService;
import db.community.mybatis.service.CommunityServiceImp;

public class CommunityController  {
	
	private CommunityService cs = new CommunityServiceImp();
	public static Scanner sc = new Scanner(System.in);
	
	public void run() {
		int menu;
		do {
		printMainMenu();
		menu = sc.nextInt();
		runMenu(menu);
		}while(menu != 0);
		
	}
	
	public void runMenu(int menu) {
		
		
	}

	public void printMainMenu() {
		
		
	}
	

	

}
