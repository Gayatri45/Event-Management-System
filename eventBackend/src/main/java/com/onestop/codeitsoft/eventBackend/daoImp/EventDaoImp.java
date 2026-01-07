package com.onestop.codeitsoft.eventBackend.daoImp;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onestop.codeitsoft.eventBackend.dao.EventDao;
import com.onestop.codeitsoft.eventBackend.entity.Event;

@Service
public class EventDaoImp{
	
	@Autowired
	EventDao eventDao;
	
	public Event saveEvent(Event event) {
		return eventDao.save(event);
	}

	public Optional<Event> getEventByCompanyIdBranchIdAndEventName(int companyId, int branchId, String eventName) {
		return eventDao.getEventByCompanyIdAndBranchIdAndEventName(companyId, branchId, eventName);
	}

	public List<Event> getEventListByCompanyIdAndBranchId(int companyId, int branchId) {
		return eventDao.getEventListByCompanyIdAndBranchId(companyId, branchId);
	}

	public Event getEventByCompanyIdBranchIdAndEventId(int eventId) {
		return eventDao.getEventByCompanyIdBranchIdAndEventId(eventId);
	}

	public Event getEventDetailsById(int eventId) {
		return eventDao.getEventDetailsById(eventId);
	}

	public List<Event> getEventFilterList(int companyId, int branchId, int categoryId, int venueId, String eventStartDate, String eventLastDate) {
		return eventDao.getEventFilterList(companyId, branchId, categoryId, venueId, eventStartDate, eventLastDate);
	}

	public List<Event> getEventList() {		
		return eventDao.getEventList();
	}

	public List<Event> getUpcomingEventList() {
		return eventDao.getUpcomingEventList();
	}

	public List<Event> getCompletedEventList() {
		return eventDao.getCompletedEventList();
	}

	public List<Event> getLiveEventList() {
		return eventDao.getLiveEventList();
	}

	public Optional<Event> getEventByCompanyIdAndBranchIdAndEventIdAndEventNameExceptThis(int companyId,
			int branchId, int eventId, String eventName) {
		return eventDao.getEventByCompanyIdAndBranchIdAndEventIdAndEventNameExceptThis(companyId, branchId, eventId, eventName);
	}

}
