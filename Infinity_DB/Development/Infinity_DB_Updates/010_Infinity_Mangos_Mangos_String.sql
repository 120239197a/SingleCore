-- Anticheat

DELETE FROM `mangos_string` WHERE `entry`='11000';
INSERT INTO `mangos_string`
    (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`)
VALUES
    (11000, '|cffff0000[Anticheat]: Cheater detected. Nickname: %s. Cheat type: %s.|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '|cffff0000[Античит]: Читер обнаружен. Имя: %s. Тип чита: %s.|r');

-- Arena Announcer

DELETE FROM `mangos_string` WHERE `entry`='17898';
INSERT INTO `mangos_string`
    (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`)
VALUES
    (17898, '|cffff0000[Arena Queue Announcer]:|r %ux%u %s started!|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '|cffff0000[Анонс Арены]:|r %ux%u %s начинается!|r');

-- Autobroadcast
-- Commit 991d1b3b6f4ab7bb129d

DELETE FROM `mangos_string` WHERE `entry`='1300';
INSERT INTO `mangos_string`
    (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`)
VALUES
    (1300, '|cffffcc00[Server]: |cff00ff00%s|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Refer a friend

DELETE FROM `command` WHERE `name` IN ('account friend add','account friend delete', 'account friend list');

INSERT INTO `command`
    (`name`, `security`, `help`)
VALUES
    ('account friend add',3,'Syntax: .account friend add [#accountId|$accountName] [#friendaccountId|$friendaccountName]\r\n\r\nSet friend account.'),
    ('account friend delete',3,'Syntax: .account friend delete [#accountId|$accountName] [#friendaccountId|$friendaccountName]\r\n\r\nDelete friend account.'),
    ('account friend list',3,'Syntax: .account friend list [#accountId|$accountName]\r\n\r\nList friends for account.');

DELETE FROM `mangos_string` WHERE `entry` IN (11133,11134);
INSERT INTO `mangos_string`
    (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`)
VALUES
    (11133,'RAF system ok.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
    (11134,'RAF system error.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

-- Playerbot

DELETE FROM `command` WHERE `name` = 'bot';
INSERT INTO `command`
    (`name`, `security`, `help`)
VALUES 
    ('bot',0,'Syntax:\r.bot add BOTNAME (add character to world)\r.bot remove BOTNAME (remove character from world)\r.bot co|combatorder BOTNAME COMBATORDER [TARGET]');

DELETE FROM mangos_string WHERE entry BETWEEN 17890 AND 17896;

-- fixes

INSERT INTO mangos_string (entry, content_default, content_loc8) VALUES
(17890, 'Gamemaster %s banned account %s for %s. Reason: %s', 'Гейммастер %s забанил аккаунт %s на %s. Причина: %s'),
(17891, 'Gamemaster %s banned account %s permanently. Reason: %s', 'Гейммастер %s забанил аккаунт %s перманентно. Причина: %s'),
(17892, 'Gamemaster %s banned character %s for %s. Reason: %s', 'Гейммастер %s забанил персонажа %s на %s. Причина: %s'),
(17893, 'Gamemaster %s banned character %s permanently. Reason: %s', 'Гейммастер %s забанил персонажа %s перманентно. Причина: %s'),
(17894, 'Gamemaster %s banned IP address %s for %s. Reason: %s', 'Гейммастер %s забанил IP адрес %s на %s. Причина: %s'),
(17895, 'Gamemaster %s banned IP address %s permanently. Reason: %s', 'Гейммастер %s забанил IP адрес %s перманентно. Причина: %s'),
(17896, 'Gamemaster %s disabled %s\'s chat for %u minutes.', 'Гейммастер %s заблокировал чат %s на %u минут.');

DELETE FROM mangos_string WHERE entry IN (548, 549);

INSERT INTO mangos_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES
(548, 'Player%s %s (guid: %u) Account: %s (id: %u) E-mail: %s GMLevel: %u Last IP: %s Last login: %s Latency: %ums', NULL, NULL, NULL, NULL, NULL, NULL, NULL,'Игрок%s %s (GUID: %u) Аккаунт: %s (id: %u) Е-мейл: %s Уровень доступа: %u Последний IP: %s Последний вход: %s Задержка: %ums'),
(549, 'Race: %s Class: %s Played time: %s Level: %u Money: %ug%us%uc', NULL, NULL, NULL, NULL, NULL, NULL, NULL,'Раса: %s Класс: %s Сыгранное время: %s Уровень: %u Количество денег: %ug%us');

DELETE FROM `command` WHERE `name` IN ('cast','cast back','cast self','cast target');

INSERT INTO `command` (`name`,`security`,`help`) VALUES
('cast',3,'Syntax: .cast #spellid [triggered]\r\n  Cast #spellid to selected target. If no target selected cast to self. If \'triggered\' or part provided then spell casted with triggered flag.'),
('cast back',3,'Syntax: .cast back #spellid [triggered]\r\n  Selected target will cast #spellid to your character. If \'triggered\' or part provided then spell casted with triggered flag.'),
('cast self',3,'Syntax: .cast self #spellid [triggered]\r\nCast #spellid by target at target itself. If \'triggered\' or part provided then spell casted with triggered flag.'),
('cast target',3,'Syntax: .cast target #spellid [triggered]\r\n  Selected target will cast #spellid to his victim. If \'triggered\' or part provided then spell casted with triggered flag.');


DELETE IGNORE FROM `command` WHERE `name` = 'cast dist';
INSERT IGNORE INTO `command` (`name`,`security`,`help`) VALUES
('cast dist',3,'Syntax: .cast dist #spellid [#dist [triggered]]\r\n  You will cast spell to pint at distance #dist. If \'triggered\' or part provided then spell casted with triggered flag. Not all spells can be casted as area spells.');
