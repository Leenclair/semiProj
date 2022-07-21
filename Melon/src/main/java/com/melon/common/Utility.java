package com.melon.common;

import java.sql.Timestamp;
import java.util.Date;

public class Utility {

	public static String displayNew(Timestamp regdate) {
		String result = "";
		Date today = new Date();
		// getTime() : 1970.01.01 이후 경과된 시간을 밀리초로 나타내는 메소드
		long time = today.getTime() - regdate.getTime();
		time = time / (1000 * 60);

		if(time < 30) {
			result = "<img style=\"margin-right: 8px;\" src='../images/new.jpg'>";
		}

		return result;
	}
	private static class TIME_MAXIMUM {

		public static final int SEC = 60;

		public static final int MIN = 60;

		public static final int HOUR = 24;

		public static final int DAY = 30;

		public static final int MONTH = 12;

	}
	public static String checkTime(Timestamp regdate) {

		long curTime = System.currentTimeMillis();
		long regTime = regdate.getTime();
		long diffTime = (curTime - regTime) / 1000;


		String msg = "";
		if (diffTime < TIME_MAXIMUM.SEC) {
			// sec
			msg = "방금 전";
		} else if ((diffTime /= TIME_MAXIMUM.SEC) < TIME_MAXIMUM.MIN) {
			// min
			msg = diffTime + "분 전";
		} else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.HOUR) {
			// hour
			msg = (diffTime) + "시간 전";
		} else if ((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.DAY) {
			// day
			msg = (diffTime) + "일 전";
		} else if ((diffTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.MONTH) {
			// day
			msg = (diffTime) + "달 전";

		} else {
			msg = (diffTime) + "년 전";
		}

		return msg;
	}

}
