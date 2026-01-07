package com.onestop.codeitsoft.eventBackend.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.onestop.codeitsoft.eventBackend.entity.Event;

@Repository
public interface EventDao extends JpaRepository<Event, Integer> {

	@Query(nativeQuery = true, value = "SELECT * FROM event WHERE company_Id =:companyId AND branch_Id =:branchId AND event_name =:eventName")
	public Optional<Event> getEventByCompanyIdAndBranchIdAndEventName(int companyId, int branchId, String eventName);

	@Query(nativeQuery = true, value = "SELECT * FROM event WHERE company_id =:companyId AND branch_id =:branchId ORDER BY event_id DESC")
	public List<Event> getEventListByCompanyIdAndBranchId(int companyId, int branchId);

	@Query(nativeQuery = true, value = "SELECT * FROM event WHERE event_id=:eventId")
	public Event getEventByCompanyIdBranchIdAndEventId(@Param("eventId") int eventId);

	@Query(nativeQuery = true, value = "SELECT * FROM event WHERE event_id=:eventId")
	public Event getEventDetailsById(int eventId);

	@Query(nativeQuery = true, value = "SELECT * FROM event WHERE company_id =:companyId AND branch_id =:branchId AND "
			+" (:eventStartDate IS NULL OR :eventStartDate =0 OR event_start_date =:eventStartDate) AND"
			+" (:eventLastDate IS NULL OR :eventLastDate =0 OR event_last_date =:eventLastDate) AND"
			+ "(:categoryId =0 OR category_category_id =:categoryId) AND "
			+ "(:venueId =0 OR venue_venue_id =:venueId) AND "
			+ "category_category_id IS NOT NULL AND venue_venue_id IS NOT NULL ORDER BY event_id DESC")
	public List<Event> getEventFilterList(@Param("companyId") int companyId, @Param("branchId") int branchId, @Param("categoryId") int categoryId, @Param("venueId") int venueId, 
			@Param("eventStartDate") String eventStartDate, @Param("eventLastDate") String eventLastDate);
	
	@Query(nativeQuery = true, value = "SELECT * FROM event ORDER BY event_id DESC")
	public List<Event> getEventList();

	@Query(nativeQuery = true, value = "SELECT * FROM event WHERE event_start_date > CURDATE()")
	public List<Event> getUpcomingEventList();
	
	@Query(nativeQuery = true, value = "SELECT * FROM event WHERE event_last_date < CURDATE()")
	public List<Event> getCompletedEventList();
	
	@Query(nativeQuery = true, value = "SELECT * FROM EVENT WHERE event_last_date >= CURDATE() AND event_start_date <= CURDATE()")
	public List<Event> getLiveEventList();

	@Query(nativeQuery = true, value = "SELECT * FROM event WHERE company_Id =:companyId AND branch_Id =:branchId AND event_id <>:eventId AND event_name =:eventName")
	public Optional<Event> getEventByCompanyIdAndBranchIdAndEventIdAndEventNameExceptThis(int companyId,
			int branchId, int eventId, String eventName);


}

