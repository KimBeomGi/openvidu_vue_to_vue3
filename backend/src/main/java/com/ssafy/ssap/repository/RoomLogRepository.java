package com.ssafy.ssap.repository;

import com.ssafy.ssap.domain.studyroom.RoomLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomLogRepository extends JpaRepository<RoomLog, Long> {

    @Modifying(clearAutomatically = true, flushAutomatically = true)
    @Query(value = "UPDATE room_log SET spend_hour = TIME(TIMESTAMPDIFF(SECOND, enter_time, CURRENT_TIMESTAMP)) WHERE room_id = :roomId", nativeQuery = true)
    void updateSpendHourByAllRoomId(@Param("roomId") Long roomId);
}
