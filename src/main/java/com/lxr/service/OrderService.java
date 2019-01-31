package com.lxr.service;



public class OrderService {
	public static String createOrder() {
		char c = (char) (int) (Math.random() * 26 + 97);
		int count = (int) (Math.random() * 1000);
		String randomString = "";
		if (count < 10) {
			randomString = randomString + "000" + count;
		} else if (count < 100) {
			randomString = randomString + "00" + count;
		} else {
			randomString = randomString + "0" + count;
		}
		Long time = System.currentTimeMillis();

		String orderNumber = "v"+"-"+time +"-"+ c + randomString;
		System.out.println(orderNumber);
		return orderNumber;
	}
}
