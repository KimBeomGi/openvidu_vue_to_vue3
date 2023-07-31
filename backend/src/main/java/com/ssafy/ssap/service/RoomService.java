package com.ssafy.ssap.service;

import com.ssafy.ssap.domain.studyroom.Participants;
import com.ssafy.ssap.domain.studyroom.ParticipantsRoleNs;
import com.ssafy.ssap.domain.studyroom.Room;
import com.ssafy.ssap.domain.studyroom.RoomLog;
import com.ssafy.ssap.dto.RoomCreateDto;
import com.ssafy.ssap.repository.ParticipantsRepository;
import com.ssafy.ssap.repository.RoomLogRepository;
import com.ssafy.ssap.repository.RoomRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class RoomService {

    private final RoomRepository roomRepository;
    private final ParticipantsRepository participantsRepository;
    private final RoomLogRepository roomLogRepository;

    /**
     * 스터디룸 생성
     */
    @Transactional
    public Long create(RoomCreateDto roomCreateDto) throws Exception {
        // 방 추가
        Room room = Room.builder()
                .title(roomCreateDto.getTitle())
                .quota(roomCreateDto.getQuota())
                .isPrivacy(roomCreateDto.getIsPrivacy())
                .isValid(true)
                .password(roomCreateDto.getPassword())
                .endTime(LocalDateTime.now().plusHours(roomCreateDto.getEndHour()).plusMinutes(roomCreateDto.getEndMinute()))
                .imagePath(roomCreateDto.getImagePath())
                .rule(roomCreateDto.getRule())
                .build();
        roomRepository.save(room);

        // 참여자 추가 (방장)
        Participants participants = Participants.builder()
                .isOut(false)
                .role(new ParticipantsRoleNs("방장"))
                .room(room)
                .build();
        participantsRepository.save(participants);

        // 접속 기록 추가
        RoomLog roomLog = RoomLog.builder()
                .roomTitle(room.getTitle())
                .enterTime(LocalDateTime.now())
                .room(room)
                .build();
        roomLogRepository.save(roomLog);

        return room.getId();
    }

    /**
     * 스터디룸 폐쇄
     */
    @Transactional
    public void close(Long roomNo) {
        // 방에 접속한 사람들의 room_log 데이터 업데이트
        roomLogRepository.updateSpendHourByAllRoomId(roomNo);

        roomRepository.setValidToZeroByRoomId(roomNo);
    }
}
