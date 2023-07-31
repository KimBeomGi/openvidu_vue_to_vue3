package com.ssafy.ssap.repository;

import com.ssafy.ssap.domain.studyroom.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomRepository extends JpaRepository<Room, Long> {

    @Modifying
    @Query("UPDATE Room r SET r.isValid = false WHERE r.id = :roomId")
    void setValidToZeroByRoomId(@Param("roomId") Long roomId);
}
