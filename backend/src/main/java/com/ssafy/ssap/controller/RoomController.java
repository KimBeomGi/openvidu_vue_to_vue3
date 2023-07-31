package com.ssafy.ssap.controller;

import com.ssafy.ssap.common.MessageFormat;
import com.ssafy.ssap.dto.RoomCreateDto;
import com.ssafy.ssap.service.RoomService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/rooms")
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequiredArgsConstructor
public class RoomController {

    private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
    private final RoomService roomService;

    @PostMapping("/add")
    public ResponseEntity<Map<String, Object>> add(@RequestBody RoomCreateDto roomCreateDto) {
        Map<String, Object> resultMap = new HashMap<>();
        HttpStatus status = null;
        try {
            Long roomId = roomService.create(roomCreateDto);
            logger.debug("{} 스터디룸 생성 성공", roomId);
            resultMap.put("message", MessageFormat.SUCCESS);
            status = HttpStatus.ACCEPTED;
        } catch (Exception e) {
            logger.error("스터디룸 생성 실패: ", e);
            resultMap.put("message", MessageFormat.SERVER_FAIL);
            status = HttpStatus.INTERNAL_SERVER_ERROR;
        }

        return new ResponseEntity<Map<String, Object>>(resultMap, status);
    }

    @DeleteMapping("/{roomno}")
    public ResponseEntity<?> close(@PathVariable("roomno") Long roomNo) {
        Map<String, Object> resultMap = new HashMap<>();
        HttpStatus status = null;
        try {
            roomService.close(roomNo);
            logger.debug("{} 스터디룸 폐쇄 성공", roomNo);
            resultMap.put("message", MessageFormat.SUCCESS);
            status = HttpStatus.ACCEPTED;
        } catch (Exception e) {
            logger.error("스터디룸 폐쇄 실패: ", e);
            resultMap.put("message", MessageFormat.SERVER_FAIL);
            status = HttpStatus.INTERNAL_SERVER_ERROR;
        }

        return new ResponseEntity<Map<String, Object>>(resultMap, status);
    }
}
