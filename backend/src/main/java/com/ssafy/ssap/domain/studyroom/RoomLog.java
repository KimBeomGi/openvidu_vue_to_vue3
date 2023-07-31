package com.ssafy.ssap.domain.studyroom;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.time.LocalTime;

import static jakarta.persistence.FetchType.LAZY;

@Entity
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "room_log")
public class RoomLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "room_title", length = 45)
    private String roomTitle;

    @Column(name = "enter_time", columnDefinition = "timestamp")
    private LocalDateTime enterTime;

    @Column(name = "spend_hour")
    private LocalTime spendHour;

    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "room_id")
    private Room room;

}
