package com.xiezhyan.generation.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 *	version:主要用于输出信息，不同的级别可以限制在控制台输出，避免使用System.out()来进行输出信息
 *			在正式环境中可以在log4j.properties中设置输出级别
 *			EBUG < INFO < WARN < ERROR
 *-------------------------------------
 *	author:xiezhyan
 *	date:2017-5-9
 */
public class LogUtil {

	private static final Logger logger = LoggerFactory.getLogger(LogUtil.class);
	
	public static void d(String msg) {
		logger.debug(msg);
	}
	
	public static void i(String msg) {
		logger.info(msg);
	}
	
	public static void w(String msg) {
		logger.warn(msg);
	}
	
	public static void e(String msg) {
		logger.error(msg);
	}
	
	
}
