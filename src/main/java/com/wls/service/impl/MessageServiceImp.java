package com.wls.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wls.dao.MessageDao;
import com.wls.entity.Message;
import com.wls.service.MessageService;
@Service
public class MessageServiceImp implements MessageService {
	@Resource
	MessageDao dao;
	@Override
	public int addMessage(Message message) {
		return dao.addMessage(message);
	}

	@Override
	public Message selectMsg(String email) {
		return dao.selectMsg(email);
	}

	@Override
	public List<Message> fromMeMsg(String email) {
		return dao.fromMeMsg(email);
	}

	@Override
	public List<Message> toMeMsg(String email) {
		return dao.toMeMsg(email);
	}

	@Override
	public int updateMsg(Message message) {
		return dao.updateMsg(message);
	}

}
