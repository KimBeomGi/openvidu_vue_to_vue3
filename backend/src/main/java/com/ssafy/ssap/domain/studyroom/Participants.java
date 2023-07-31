package com.ssafy.ssap.domain.studyroom;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import static jakarta.persistence.FetchType.LAZY;

@Entity
@Getter
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class Participants {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "is_out", columnDefinition = "TINYINT(1)")
    @ColumnDefault("false")
    private Boolean isOut;

    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "role")
    private ParticipantsRoleNs role;

    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "room_id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Room room;
}
