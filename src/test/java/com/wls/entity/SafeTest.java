package com.wls.entity;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

public class SafeTest {

	@Test
	public void test() {
		List<Safe> fs = new ArrayList<Safe>();
		fs.add(new Safe("q1","a1"));
		fs.add(new Safe("q2","a2"));
		fs.add(new Safe("q3","a3"));
		String string = JSON.toJSONString(fs);
		System.out.println(string);
	}
	@Test
	public void test2() {
		String s= "[{\"answer\":\"a1\",\"question\":\"q1\"},"
				+ "{\"answer\":\"a2\",\"question\":\"q2\"},"
				+ "{\"answer\":\"a3\",\"question\":\"q3\"}]";
		List<Safe> fs = JSONArray.parseArray(s,Safe.class);
		for (Safe safe : fs) {
			System.out.println(safe);
		}
		
	}

}
