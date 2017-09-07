package com.wls.service;

import java.util.List;

import com.wls.entity.Message;

public interface MessageService {
	int addMessage(Message message);
	Message selectMsg(String email);
	//自己发送的信息
	List<Message> fromMeMsg(String email);
	//别人发来的信息
	List<Message> toMeMsg(String email);
	
	int updateMsg(Message message);
}
