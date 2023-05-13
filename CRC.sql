CREATE TABLE BRANCH(

  branch_id int(10) not null,
  branch_name char(20) not null,
  branch_address char(25) not null,
  branch_manager char(25) not null,
  
  CONSTRAINT pk_branch primary key (branch_id)

);

CREATE TABLE USER1 (
  
  user_id int(20) not null,
  user_name char(25) not null,
  user_mob int(15) not null,
  user_mail varchar(30) not null,
  user_address varchar(50) not null,
  user_branch_id int(10) not null,
  CONSTRAINT p_user FOREIGN KEY (user_branch_id)
  REFERENCES BRANCH(branch_id) ON DELETE CASCADE ON UPDATE CASCADE
  CONSTRAINT pk_user primary key (user_id),
  
  );

  CREATE TABLE CREDIT_CARD(

    crc_name varchar(25) not null,
    crc_id int(15) not null,
    crc_bal int(10) not null,
    crc_type varchar(15) not null,
    crc_user_id int(20) not null,

    CONSTRAINT pk_credit_card primary key (crc_id),
    CONSTRAINT p_crc_id FOREIGN KEY (crc_user_id) 
    REFERENCES USER1(user_id) ON DELETE CASCADE ON UPDATE CASCADE

  );

  CREATE TABLE LIMITS(
    
    limit_user_id int(15) not null,
    limit_bal int(10) not null,
    limit_crc_id int(15) not null,

    CONSTRAINT pk_limits primary key (limit_user_id),
    CONSTRAINT p_limit_id FOREIGN KEY (limit_crc_id) 
    REFERENCES CREDIT_CARD(crc_id) ON DELETE CASCADE ON UPDATE CASCADE

  );

  CREATE TABLE APPLICATIONS(

    app_num int(10) not null,
    app_user_id int(20) not null,
    app_type varchar(20) not null,

    CONSTRAINT pk_applications primary key (app_num),
    CONSTRAINT p_app_id FOREIGN KEY (app_user_id)
    REFERENCES USER1(user_id) ON DELETE CASCADE ON UPDATE CASCADE

  );
--insert into branch
insert into branch values(11111,"RB-1","JP Nagar","Mr. Das");
insert into branch values(22222,"RB-2","BTM Layout","Mr. Gupta");
insert into branch values(33333,"RB-3","HSR Layout","Mrs. Shetty");
insert into branch values(44444,"RB-4","Electronic City","Mr. Banerji");
insert into branch values(55555,"RB-5","Koramangala","Mrs. Sharma");

--insert into user1
insert into user1 values(88796332,"Mr. ABC",7437632857,"ABC@xyz.com","JP Nagar",11111);
insert into user1 values(27364733,"Mr. DEF",3792573729,"DEF@xyz.com","BTM Layout",22222);
insert into user1 values(81239871,"Mr. GHI",4856283628,"GHI@xyz.com","HSR Layout",33333);
insert into user1 values(35133154,"Mr. JKL",1654581474,"JKL@xyz.com","Electronic City",44444);
insert into user1 values(12422736,"Mr. MNO",5146153787,"MNO@xyz.com","Koramangala",55555);

--insert into credit card

insert into credit_card values("PLATINUM",2147483647,15000,"PERSONAL",88796332);
insert into credit_card values("SILVER",884289642,5000,"PERSONAL",27364733);
insert into credit_card values("GOLD",1111222233,10000,"PERSONAL",81239871);
insert into credit_card values("PLATINUM",44455566,15000,"CURRENT",35133154);
insert into credit_card values("GOLD",777788999,10000,"PERSONAL",12422736);

--insert into limits
insert into limits values(478256386,15000,840126846108);
insert into limits values(734792367,5000,88428964261);
insert into limits values(418126812,10000,111122223333);
insert into limits values(454365167,15000,444455556666);
insert into limits values(810972641,10000,777788889999);

--insert into applications
insert into applications values(11,88796332,"PERSONAL");
insert into applications values(12,27364733,"CAR");
insert into applications values(13,81239871,"PERSONAL");
insert into applications values(14,35133154,"HOUSE");
insert into applications values(15,12422736,"CAR");
