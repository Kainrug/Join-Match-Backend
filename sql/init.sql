-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-04-11 10:11:43.081

-- tables
-- Table: Chat
CREATE TABLE Chat (
                      Chat_ID int  NOT NULL,
                      chat_name varchar(20)  NOT NULL,
                      CONSTRAINT Chat_pk PRIMARY KEY (Chat_ID)
);

-- Table: Chat_Participant
CREATE TABLE Chat_Participant (
                                  User_user_ID int  NOT NULL,
                                  Chat_Chat_ID int  NOT NULL,
                                  CONSTRAINT Chat_Participant_pk PRIMARY KEY (User_user_ID,Chat_Chat_ID)
);

-- Table: Competiton
CREATE TABLE Competiton (
                            competition_ID int  NOT NULL,
                            date timestamp  NOT NULL,
                            Sport_object_object_ID int  NOT NULL,
                            CONSTRAINT Competiton_pk PRIMARY KEY (competition_ID)
);

-- Table: Competiton_Team
CREATE TABLE Competiton_Team (
                                 competition_ID int  NOT NULL,
                                 team_ID int  NOT NULL,
                                 CONSTRAINT Competiton_Team_pk PRIMARY KEY (competition_ID,team_ID)
);

-- Table: Event
CREATE TABLE Event (
                       event_ID int  NOT NULL,
                       number_of_participants int  NOT NULL,
                       cost decimal(6,2)  NOT NULL,
                       ownet_ID int  NOT NULL,
                       Sport_object_object_ID int  NOT NULL,
                       Event_Visibility_id int  NOT NULL,
                       status varchar(50)  NOT NULL,
                       score_team1 int  NOT NULL,
                       score_team2 int  NOT NULL,
                       CONSTRAINT Event_pk PRIMARY KEY (event_ID)
);

-- Table: Event_Rating
CREATE TABLE Event_Rating (
                              event_rating_ID int  NOT NULL,
                              Event_event_ID int  NOT NULL,
                              User_user_ID int  NOT NULL,
                              rating int  NOT NULL,
                              comment varchar(500)  NULL,
                              created_at timestamp  NOT NULL,
                              CONSTRAINT Event_Rating_pk PRIMARY KEY (event_rating_ID)
);

-- Table: Event_Visibility
CREATE TABLE Event_Visibility (
                                  id int  NOT NULL,
                                  name varchar(100)  NOT NULL,
                                  CONSTRAINT Event_Visibility_pk PRIMARY KEY (id)
);

-- Table: Friendship
CREATE TABLE Friendship (
                            friend_user1_ID int  NOT NULL,
                            friend_user2_ID int  NOT NULL,
                            CONSTRAINT Friendship_pk PRIMARY KEY (friend_user1_ID,friend_user2_ID)
);

-- Table: Message
CREATE TABLE Message (
                         message_ID int  NOT NULL,
                         sender_ID int  NOT NULL,
                         receiver_Chat_ID int  NOT NULL,
                         text varchar(50)  NOT NULL,
                         CONSTRAINT Message_pk PRIMARY KEY (message_ID)
);

-- Table: Payment
CREATE TABLE Payment (
                         payment_ID int  NOT NULL,
                         User_Event_User_ID int  NOT NULL,
                         User_Event_Event_ID int  NOT NULL,
                         amount decimal(8,2)  NOT NULL,
                         status varchar(50)  NOT NULL,
                         method varchar(50)  NOT NULL,
                         transaction_ID int  NOT NULL,
                         paid_at timestamp  NOT NULL,
                         created_at timestamp  NOT NULL,
                         CONSTRAINT Payment_pk PRIMARY KEY (payment_ID)
);

-- Table: Report
CREATE TABLE Report (
                        report_ID int  NOT NULL,
                        reported_User_ID int  NOT NULL,
                        User_user_ID int  NOT NULL,
                        description varchar(1000)  NOT NULL,
                        CONSTRAINT Report_pk PRIMARY KEY (report_ID)
);

-- Table: Role
CREATE TABLE Role (
                      id int  NOT NULL,
                      name int  NOT NULL,
                      CONSTRAINT Role_pk PRIMARY KEY (id)
);

-- Table: Sponsor
CREATE TABLE Sponsor (
                         sponsor_ID int  NOT NULL,
                         amount decimal(8,2)  NOT NULL,
                         description varchar(500)  NOT NULL,
                         Event_event_ID int  NOT NULL,
                         CONSTRAINT Sponsor_pk PRIMARY KEY (sponsor_ID)
);

-- Table: Sport_object
CREATE TABLE Sport_object (
                              object_ID int  NOT NULL,
                              name varchar(20)  NOT NULL,
                              city varchar(20)  NOT NULL,
                              street varchar(20)  NOT NULL,
                              number int  NOT NULL,
                              second_number int  NULL,
                              capacity int  NOT NULL,
                              CONSTRAINT Sport_object_pk PRIMARY KEY (object_ID)
);

-- Table: Team
CREATE TABLE Team (
                      team_ID int  NOT NULL,
                      name varchar(10)  NOT NULL,
                      city varchar(12)  NOT NULL,
                      sport_type varchar(15)  NOT NULL,
                      description varchar(40)  NOT NULL,
                      leader_ID int  NOT NULL,
                      CONSTRAINT Team_pk PRIMARY KEY (team_ID)
);

-- Table: User
CREATE TABLE "User" (
                        user_ID int  NOT NULL,
                        name varchar(10)  NOT NULL,
                        email varchar(15)  NOT NULL,
                        password varchar(16)  NOT NULL,
                        salt varchar(10)  NOT NULL,
                        date_Of_Brith date  NOT NULL,
                        Role_id int  NOT NULL,
                        CONSTRAINT User_pk PRIMARY KEY (user_ID)
);

-- Table: User_Event
CREATE TABLE User_Event (
                            User_ID int  NOT NULL,
                            Event_ID int  NOT NULL,
                            attendance_status varchar(50)  NOT NULL,
                            CONSTRAINT User_Event_pk PRIMARY KEY (User_ID,Event_ID)
);

-- Table: User_Rating
CREATE TABLE User_Rating (
                             user_rate_ID int  NOT NULL,
                             rater_ID int  NOT NULL,
                             rated_ID int  NOT NULL,
                             rating int  NOT NULL,
                             comment varchar(500)  NULL,
                             created_at timestamp  NOT NULL,
                             CONSTRAINT User_Rating_pk PRIMARY KEY (user_rate_ID)
);

-- Table: User_Team
CREATE TABLE User_Team (
                           Team_ID int  NOT NULL,
                           User_ID int  NOT NULL,
                           CONSTRAINT User_Team_pk PRIMARY KEY (Team_ID,User_ID)
);

-- foreign keys
-- Reference: ChatParticipant_Chat (table: Chat_Participant)
ALTER TABLE Chat_Participant ADD CONSTRAINT ChatParticipant_Chat
    FOREIGN KEY (Chat_Chat_ID)
        REFERENCES Chat (Chat_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: ChatParticipant_User (table: Chat_Participant)
ALTER TABLE Chat_Participant ADD CONSTRAINT ChatParticipant_User
    FOREIGN KEY (User_user_ID)
        REFERENCES "User" (user_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Competiton_Sport_object (table: Competiton)
ALTER TABLE Competiton ADD CONSTRAINT Competiton_Sport_object
    FOREIGN KEY (Sport_object_object_ID)
        REFERENCES Sport_object (object_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Competiton_Team_Competiton (table: Competiton_Team)
ALTER TABLE Competiton_Team ADD CONSTRAINT Competiton_Team_Competiton
    FOREIGN KEY (competition_ID)
        REFERENCES Competiton (competition_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Competiton_Team_Team (table: Competiton_Team)
ALTER TABLE Competiton_Team ADD CONSTRAINT Competiton_Team_Team
    FOREIGN KEY (team_ID)
        REFERENCES Team (team_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Event_Event_Visibility (table: Event)
ALTER TABLE Event ADD CONSTRAINT Event_Event_Visibility
    FOREIGN KEY (Event_Visibility_id)
        REFERENCES Event_Visibility (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Event_Rating_Event (table: Event_Rating)
ALTER TABLE Event_Rating ADD CONSTRAINT Event_Rating_Event
    FOREIGN KEY (Event_event_ID)
        REFERENCES Event (event_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Event_Rating_User (table: Event_Rating)
ALTER TABLE Event_Rating ADD CONSTRAINT Event_Rating_User
    FOREIGN KEY (User_user_ID)
        REFERENCES "User" (user_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Event_Sport_object (table: Event)
ALTER TABLE Event ADD CONSTRAINT Event_Sport_object
    FOREIGN KEY (Sport_object_object_ID)
        REFERENCES Sport_object (object_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Event_User (table: Event)
ALTER TABLE Event ADD CONSTRAINT Event_User
    FOREIGN KEY (ownet_ID)
        REFERENCES "User" (user_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Friend_User1 (table: Friendship)
ALTER TABLE Friendship ADD CONSTRAINT Friend_User1
    FOREIGN KEY (friend_user1_ID)
        REFERENCES "User" (user_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Friend_User2 (table: Friendship)
ALTER TABLE Friendship ADD CONSTRAINT Friend_User2
    FOREIGN KEY (friend_user2_ID)
        REFERENCES "User" (user_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Message_Chat (table: Message)
ALTER TABLE Message ADD CONSTRAINT Message_Chat
    FOREIGN KEY (receiver_Chat_ID)
        REFERENCES Chat (Chat_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Messages_User (table: Message)
ALTER TABLE Message ADD CONSTRAINT Messages_User
    FOREIGN KEY (sender_ID)
        REFERENCES "User" (user_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Payment_User_Event (table: Payment)
ALTER TABLE Payment ADD CONSTRAINT Payment_User_Event
    FOREIGN KEY (User_Event_User_ID, User_Event_Event_ID)
        REFERENCES User_Event (User_ID, Event_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Report_User (table: Report)
ALTER TABLE Report ADD CONSTRAINT Report_User
    FOREIGN KEY (reported_User_ID)
        REFERENCES "User" (user_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Sponsor_Event (table: Sponsor)
ALTER TABLE Sponsor ADD CONSTRAINT Sponsor_Event
    FOREIGN KEY (Event_event_ID)
        REFERENCES Event (event_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Sponsor_User (table: Sponsor)
ALTER TABLE Sponsor ADD CONSTRAINT Sponsor_User
    FOREIGN KEY (sponsor_ID)
        REFERENCES "User" (user_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Table_3_Team (table: User_Team)
ALTER TABLE User_Team ADD CONSTRAINT Table_3_Team
    FOREIGN KEY (Team_ID)
        REFERENCES Team (team_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Table_3_User (table: User_Team)
ALTER TABLE User_Team ADD CONSTRAINT Table_3_User
    FOREIGN KEY (User_ID)
        REFERENCES "User" (user_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: Team_User (table: Team)
ALTER TABLE Team ADD CONSTRAINT Team_User
    FOREIGN KEY (leader_ID)
        REFERENCES "User" (user_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: User_Event_Event (table: User_Event)
ALTER TABLE User_Event ADD CONSTRAINT User_Event_Event
    FOREIGN KEY (Event_ID)
        REFERENCES Event (event_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: User_Event_User (table: User_Event)
ALTER TABLE User_Event ADD CONSTRAINT User_Event_User
    FOREIGN KEY (User_ID)
        REFERENCES "User" (user_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: User_Rating_User (table: User_Rating)
ALTER TABLE User_Rating ADD CONSTRAINT User_Rating_User
    FOREIGN KEY (rated_ID)
        REFERENCES "User" (user_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: User_Rating_rater (table: User_Rating)
ALTER TABLE User_Rating ADD CONSTRAINT User_Rating_rater
    FOREIGN KEY (rater_ID)
        REFERENCES "User" (user_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: User_Role (table: User)
ALTER TABLE "User" ADD CONSTRAINT User_Role
    FOREIGN KEY (Role_id)
        REFERENCES Role (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: moderator_ID (table: Report)
ALTER TABLE Report ADD CONSTRAINT moderator_ID
    FOREIGN KEY (User_user_ID)
        REFERENCES "User" (user_ID)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- End of file.

