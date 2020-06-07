package com.cg.util;

import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * @author xuwenhao
 */
public class DateFormatUtil {

	/**
	 * 返回指定日志指定格式的日期字符串
	 * @param pattern
	 * @param date
	 * @return
	 */
	public static String getDate(String pattern,Date date){
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(date);
	}
}
