create table platform
(
    PlatformID varchar(20) not null comment '平台名',
    id         int auto_increment
        primary key
);

create table player
(
    PlayerID varchar(20)  not null comment '用户名',
    Age      int unsigned null,
    Gender   char(10)     null,
    id       int auto_increment
        primary key
);

create table publisher
(
    Company     varchar(20) null,
    PublisherID varchar(50) null,
    id          int auto_increment
        primary key
);

create table game
(
    GameID       varchar(20) not null,
    Publisher    varchar(50) not null,
    Genre        varchar(50) not null,
    Release_date date        not null,
    Price        double      not null,
    Platform     varchar(20) not null,
    id           int auto_increment
        primary key,
    publisherid  int         null,
    constraint game_publisher__fk
        foreign key (publisherid) references publisher (id)
);

create table relation_consume_comment
(
    id         int auto_increment
        primary key,
    playerid   int  null,
    platformid int  null,
    comment    text null,
    gameid     int  null,
    constraint Relation_Consume_Comment_platform__fk
        foreign key (platformid) references platform (id),
    constraint Relation_Consume_Comment_player__fk
        foreign key (playerid) references player (id),
    constraint relation_consume_comment_game__fk
        foreign key (gameid) references game (id)
);

create table relation_feedback
(
    id          int auto_increment
        primary key,
    publisherid int not null,
    playerid    int not null,
    constraint Relation_Feedback_player__fk
        foreign key (playerid) references player (id),
    constraint Relation_Feedback_publisher__fk
        foreign key (publisherid) references publisher (id)
);

create table relation_play
(
    playerid         int    not null,
    gameid           int    not null,
    id               int auto_increment
        primary key,
    Singleplayertime double null,
    Multiplayertime  double null,
    constraint Relation_Play_game__fk
        foreign key (gameid) references game (id),
    constraint Relation_Play_player__fk
        foreign key (playerid) references player (id)
);

create table relation_sell
(
    id         int auto_increment
        primary key,
    gameid     int null,
    platformid int null,
    constraint Relation_Sell_game__fk
        foreign key (gameid) references game (id),
    constraint Relation_Sell_platform__fk
        foreign key (platformid) references platform (id)
);

create table relation_uploadto
(
    platformid  int         not null,
    gamename    varchar(20) not null,
    publisherid int         not null,
    id          int auto_increment
        primary key,
    constraint Relation_Upload_platform__fk
        foreign key (platformid) references platform (id),
    constraint Relation_Upload_publisher__fk
        foreign key (publisherid) references publisher (id)
);

INSERT INTO playtime.publisher (Company, PublisherID, id) VALUES 
	('Re-Logic', 'Red', 1),
	('4A-game', 'Leonid Stepanov', 2),
	('Rockstar Games', 'Sam houser,Dan houser', 3),
	('Respawn', 'Respawn', 4),
	('Value', 'Value', 5),
	('厦门钢之直男工作室', '厦门钢之直男工作室', 6),
	('capcom', 'capcom', 7),
	('ConcernedApe', 'ConcernedApe', 8),
	('KRAFTON,Inc.', 'KRAFTON,Inc.', 9),
	('Ubisoft Annecy', 'Ubisoft Annecy', 10),
	('Xbox Game', 'Playground Games', 11),
	('Pocketpair', 'Pocketpair', 12),
	('Bethesda', 'Bethesda', 13),
	('网易游戏', '网易游戏', 14),
	('CD PROJEKT RED', 'CD PROJEKT RED', 15);

INSERT INTO playtime.platform (PlatformID, id) VALUES ('steam', 1);

INSERT INTO playtime.game (GameID, Publisher, Genre, Release_date, Price, Platform, id, publisherid) VALUES 
	('Terraria', 'Red', 'adventure,create,sandbox', '2011-05-16', 42, 'steam', 1, 1),
	('Metro Exodus', 'Leonid Stepanov', 'adventure', '2019-02-15', 148, 'steam', 2, 2),
	('GTA5', 'Sam houser,Dan houser', 'crime,adventure', '2013-09-17', 89.76, 'steam', 3, 3),
	('APEX', 'Respawn', 'FPS', '2020-11-05', 0, 'steam', 4, 4),
	('CS2', 'Value', 'FPS', '2017-09-16', 0, 'steam', 5, 5),
	('英勇之地', '厦门钢之直男工作室', 'sandbox,instance', '2023-05-18', 0, 'steam', 6, 6),
	('Resident Evil4', 'capcom', 'doomsday,survival', '2023-03-24', 149, 'steam', 7, 7),
	('星露谷物语', 'ConcernedApe', 'Farm simulation', '2016-02-27', 48, 'steam', 8, 8),
	('PUBG', 'KRAFTON,Inc.', 'FPS', '2017-12-21', 0, 'steam', 9, 9),
	('极限国度', 'Ubisoft Annecy', 'sport', '2023-06-09', 198, 'steam', 10, 10),
	('极限竞速：地平线4', 'Playground Games', 'drive,open world', '2021-03-10', 188, 'steam', 11, 11),
	('幻兽帕鲁', 'Pocketpair', 'role playing,adventure', '2024-01-19', 108, 'steam', 12, 12),
	('辐射4', 'Bethesda', 'adventure,open world', '2015-11-10', 20.75, 'steam', 13, 13),
	('永劫无间', '网易游戏', 'action ,role paly', '2021-08-12', 0, 'steam', 14, 14),
	('赛博朋克2077', 'CD PROJEKT RED', 'science fiction,open world', '2020-12-10', 298, 'steam', 15, 15),
	('巫师3：狂猎', 'CD PROJEKT RED', 'open world,role play', '2015-05-19', 149, 'steam', 16, 15);

INSERT INTO playtime.player (PlayerID, Age, Gender, id) VALUES
	('egemciehe1971', 20, 'male', 1),
	('创世品牌', 21, 'male', 2),
	('crimson', 35, 'male', 3),
	('Amalagme-Dette', 20, 'male', 4),
	('闲鱼', 23, 'male', 5),
	('carl', 29, 'male', 6),
	('令狐欲仙', 23, 'male', 7),
	('kebe', 19, 'male', 8),
	('原纯', 21, 'male', 9),
	('风也凉薄', 26, 'male', 10),
	('期许', 24, 'male', 11),
	('吴子', 36, 'male', 12),
	('kdcom', 24, 'male', 13),
	('lyz025666', 26, 'female', 14),
	('谁还不会飞', 24, 'male', 15),
	('qyxzzOvO', 26, 'male', 16),
	('专门欺负老实人', 21, 'male', 17),
	('哇啦o', 21, 'female', 18),
	('时生c', 24, 'male', 19),
	('能屈能伸谢广坤', 25, 'male', 20),
	('Uncle Tracy', 21, 'male', 21),
	('古月月', 25, 'female', 22),
	('不文超', 25, 'male', 23),
	('TinyMarlowe', 33, 'male', 24),
	('39度的风', 22, 'female', 25),
	('Louis', 24, 'male', 26),
	('catdidit', 21, 'female', 27),
	('宇下天长', 24, 'male', 28),
	('双生的天鸟', 22, 'male', 29),
	('香椰', 23, 'male', 30),
	('狂野的裤子', 19, 'male', 31);

insert into playtime.relation_consume_comment (id, playerid, platformid, comment, gameid)
values  (1, 2, 1, '真神降临！', 1),
        (2, 3, 1, '体验感拉满的一部，由线性变为半开放，剧情极佳，尤其DLC强力推荐，地铁系列的枪械手感是真的好，但闪退bug依然存在.', 2),
        (3, 6, 1, 'After playing GTA for a year, I never drive or brush money. I am very proud to think that I am a green player. But yesterday I was retaliated by the hacker.', 3),
        (4, 8, 1, '从公测断断续续玩到现在，个人认为在FPS类型游戏里，APEX的枪械手感、动作流畅性可以排到第一梯队（和战地、COD系列同级）', 4),
        (5, 9, 1, '平淡生活的调味剂', 5),
        (6, 10, 1, '上山下海一堆背刺，玩不了一点。', 6),
        (7, 12, 1, '有点小贵，物有所值', 7),
        (8, 13, 1, '重制版中的巅峰之作', 7),
        (9, 15, 1, '和前女友一起玩的，分手两年了，再也没有打开过，游戏是好游戏，但是我再也没有勇气打开。要珍惜眼前的朋友与爱人。入冬了，鹈鹕镇就快要下雪了，把手揣进口袋里，不要挥手，不要告别。', 8),
        (10, 16, 1, '全是外挂，新手不要买了，真的，我玩了这么久，相信我没问题真是挂', 9),
        (11, 17, 1, '小小作坊，大大口气。', 9),
        (12, 18, 1, '喜欢你是我的秘密~', 10),
        (13, 21, 1, '找了一份996的工作，只能在睡前开会车，感觉感觉跑车的感觉。', 11),
        (14, 23, 1, '农场主模拟器实锤了，它应该支付鞭子磨损的费用', 12),
        (15, 24, 1, '哀其不幸，怒其不争', 13),
        (16, 26, 1, '国产游戏+流星蝴蝶剑情怀加成+出色的战斗设计+优秀的文化内核，不论如何我都会打出好评。', 14),
        (17, 28, 1, '这不是一个完美的赛博游戏，但却是一个完美的赛博世界', 15),
        (18, 30, 1, '不用翻测评了，神作懂么，总统先生的挚爱之作', 16);

insert into playtime.relation_feedback (id, publisherid, playerid)
values  (1, 1, 1),
        (2, 1, 2),
        (3, 2, 3),
        (4, 2, 4),
        (5, 3, 5),
        (6, 3, 6),
        (7, 4, 7),
        (8, 4, 8),
        (9, 5, 9),
        (10, 5, 1),
        (11, 6, 10),
        (12, 6, 11),
        (13, 7, 12),
        (14, 7, 13),
        (15, 8, 14),
        (16, 8, 15),
        (17, 9, 16),
        (18, 9, 17),
        (19, 10, 18),
        (20, 10, 19),
        (21, 11, 20),
        (22, 11, 21),
        (23, 12, 22),
        (24, 12, 23),
        (25, 13, 24),
        (26, 13, 25),
        (27, 14, 26),
        (28, 14, 27),
        (29, 15, 28),
        (30, 15, 29),
        (31, 15, 30),
        (32, 15, 31);

insert into playtime.relation_play (playerid, gameid, id, Singleplayertime, Multiplayertime)
values  (1, 1, 1, 53.6, 126.7),
        (2, 1, 2, 21, 92.5),
        (3, 2, 3, 21.6, 0),
        (4, 2, 4, 30.2, 0),
        (5, 3, 5, 46.2, 112.5),
        (6, 3, 6, 53.1, 88.9),
        (7, 4, 7, 0, 412.5),
        (8, 4, 8, 0, 123.2),
        (9, 5, 9, 0, 12.9),
        (1, 5, 10, 0, 336.7),
        (10, 6, 11, 124.1, 166.5),
        (11, 6, 12, 300.2, 421),
        (12, 7, 13, 42.1, 0),
        (13, 7, 14, 35.5, 0),
        (14, 8, 15, 102.2, 195.9),
        (15, 8, 16, 31, 67),
        (16, 9, 17, 0, 4828.6),
        (17, 9, 18, 0, 5389.2),
        (18, 10, 19, 0, 39.9),
        (19, 10, 20, 0, 15.1),
        (20, 11, 21, 22, 7.5),
        (21, 11, 22, 5.1, 3.2),
        (22, 12, 23, 70.7, 48.9),
        (23, 12, 24, 5.4, 43.3),
        (24, 13, 25, 140.7, 0),
        (25, 13, 26, 100.4, 0),
        (26, 14, 27, 0, 1173.6),
        (27, 14, 28, 0, 923.6),
        (28, 15, 29, 33.6, 0),
        (29, 15, 30, 75.1, 0),
        (30, 16, 31, 619.3, 0),
        (31, 16, 32, 159, 0);

insert into playtime.relation_sell (id, gameid, platformid)
values  (1, 1, 1),
        (2, 2, 1),
        (3, 3, 1),
        (4, 4, 1),
        (5, 5, 1),
        (6, 6, 1),
        (7, 7, 1),
        (8, 8, 1),
        (9, 9, 1),
        (10, 10, 1),
        (11, 11, 1),
        (12, 12, 1),
        (13, 13, 1),
        (14, 14, 1),
        (15, 15, 1),
        (16, 16, 1);

insert into playtime.relation_uploadto (platformid, gamename, publisherid, id)
values  (1, 'Terraria', 1, 1),
        (1, 'Metro Exodus', 2, 2),
        (1, 'GTA5', 3, 3),
        (1, 'APEX', 4, 4),
        (1, 'CS2', 5, 5),
        (1, '英勇之地', 6, 6),
        (1, 'Resident Evil4', 7, 7),
        (1, '星露谷物语', 8, 8),
        (1, 'PUBG', 9, 9),
        (1, '极限国度', 10, 10),
        (1, '极限竞速：地平线4', 11, 11),
        (1, '幻兽帕鲁', 12, 12),
        (1, '辐射4', 13, 13),
        (1, '永劫无间', 14, 14),
        (1, '赛博朋克2077', 15, 15),
        (1, '巫师3：狂猎', 15, 16);
