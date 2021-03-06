package io.uicp.tincat.mantou.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.apache.commons.codec.digest.DigestUtils;

public class StringUtil {

	public static String getRandomString(int length) {
		String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();

		for (int i = 0; i < length; ++i) {
			int number = random.nextInt(62);// [0,62)

			sb.append(str.charAt(number));
		}
		return sb.toString();
	}

	public static String getMD5(String s) {
		return DigestUtils.md5Hex(s);
	}

	public static String getActionUrl(String url) {
		int i = url.indexOf("action");
		if (i > -1) {
			return url.substring(0, i + 6);
		} else {
			return url;
		}

	}

	public static String getTimeString() {
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = format.format(date);
		return now;
	}

	public static void main(String[] args) {
		String s = "/mantou/page_history.action?user=jojo&pageCode=2";
		System.out.println(getActionUrl(s));
	}
}
