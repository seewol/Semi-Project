package semi.project.bookmaroo.member.service;

import semi.project.bookmaroo.member.model.vo.Message;
import semi.project.bookmaroo.member.model.vo.SmsResponse;

public interface SmsService {

	SmsResponse sendSms(Message message) throws Throwable;
	
}
