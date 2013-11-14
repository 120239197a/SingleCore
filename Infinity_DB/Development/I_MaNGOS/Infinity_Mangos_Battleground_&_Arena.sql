-- Alterac Valley
UPDATE battleground_template SET AllianceStartO = 3.6, HordeStartO = 1.24 WHERE id = 1;
-- Warsong Gulch
UPDATE battleground_template SET HordeStartO = 0 WHERE id = 2;
-- Nagrand Arena
UPDATE battleground_template SET AllianceStartO = 5.21, HordeStartO = 2.06 WHERE id = 4;
-- Blade's Edge Arena
UPDATE battleground_template SET AllianceStartO = 4, HordeStartO = 0.903205 WHERE id = 5;
-- Ruins of Lordaeron
UPDATE battleground_template SET AllianceStartO = 4.83, HordeStartO = 1.7 WHERE id = 8;
-- Dalaran Sewers
UPDATE battleground_template SET HordeStartO = 3.14 WHERE id = 10;
-- The Ring of Valor
UPDATE battleground_template SET AllianceStartO = 4.72, HordeStartO = 1.6 WHERE id = 11;
-- Isle of Conquest
UPDATE battleground_template SET AllianceStartO = 0, HordeStartO = 3.14159 WHERE id = 30;

-- set 1 day respawn time to every creature in BGs/arenas
UPDATE creature SET spawntimesecs = 86400 WHERE map IN (30, 489, 529, 559, 562, 566, 572, 607, 617, 618, 628);
-- set 10 seconds respawn time to:
UPDATE creature SET spawntimesecs = 10 WHERE id IN (
-- Spirit Guides
13116, 13117,
-- SotA demolishers
28781);

-- set 1 day respawn time to every game object in BGs/arenas
UPDATE gameobject SET spawntimesecs = 86400 WHERE map IN (30, 489, 529, 559, 562, 566, 572, 607, 617, 618, 628);
-- set 10 seconds respawn time to:
UPDATE gameobject SET spawntimesecs = 10 WHERE id IN (
-- SotA Seaforium Charges
190753, 194086);

-- --------------------
-- Honorable Defender -
-- --------------------

DELETE FROM creature_template_addon WHERE entry IN (
35379, -- eye of storm alliance
35380, -- eye of storm horde
36349, -- arathi basin alliance
36350); -- arathi basin horde
INSERT INTO creature_template_addon (entry, auras)
VALUES
(35379, 66157 ),
(35380, 66157 ),
(36349, 68652 ),
(36350, 68652 );

UPDATE creature_template SET faction_A = 534, faction_H = 534, unit_flags = 0x2000202 WHERE entry IN (35379, 36349); -- ally
UPDATE creature_template SET faction_A = 714, faction_H = 714, unit_flags = 0x2000202 WHERE entry IN (35380, 36350); -- horde

DELETE FROM creature WHERE id IN (35379, 35380, 36349, 36350);
-- new positions in arathi basin
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, spawntimesecs, spawndist)
VALUES
(152000, 36349, 529, 1, 1, 1166.79, 1200.13, -56.7086, 10, 0 ),-- stable
(152001, 36349, 529, 1, 1, 977.016, 1046.62, -44.8092, 10, 0 ),-- forge
(152002, 36349, 529, 1, 1, 806.182, 874.272, -55.9937, 10, 0 ),-- farm
(152003, 36349, 529, 1, 1, 856.142, 1148.9, 11.1847, 10, 0 ),-- lumber mill
(152004, 36349, 529, 1, 1, 1146.92, 848.178, -110.917, 10, 0 ),-- mine

(152005, 36350, 529, 1, 1, 1166.79, 1200.13, -56.7086, 10, 0 ),-- stable
(152006, 36350, 529, 1, 1, 977.016, 1046.62, -44.8092, 10, 0 ),-- forge
(152007, 36350, 529, 1, 1, 806.182, 874.272, -55.9937, 10, 0 ),-- farm
(152008, 36350, 529, 1, 1, 856.142, 1148.9, 11.1847, 10, 0 ),-- lumber mill
(152009, 36350, 529, 1, 1, 1146.92, 848.178, -110.917, 10, 0 );-- mine

INSERT INTO creature (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, spawntimesecs, spawndist)
VALUES
(152010, 35379, 566, 1, 1, 2286.382568, 1402.460205,1197.108521 , 10, 0 ), -- draenei ruins
(152011, 35379, 566, 1, 1, 2284.859619, 1731.055786,1189.883057 , 10, 0 ), -- mage tower
(152012, 35379, 566, 1, 1, 2043.890747, 1729.769897,1189.863037 , 10, 0 ), -- fel reaver ruins
(152013, 35379, 566, 1, 1, 2048.877930, 1393.445435,1194.356934 , 10, 0 ), -- blood elf tower

(152014, 35380, 566, 1, 1, 2286.382568, 1402.460205,1197.108521 , 10, 0 ), -- draenei ruins
(152015, 35380, 566, 1, 1, 2284.859619, 1731.055786,1189.883057 , 10, 0 ), -- mage tower
(152016, 35380, 566, 1, 1, 2043.890747, 1729.769897,1189.863037 , 10, 0 ), -- fel reaver ruins
(152017, 35380, 566, 1, 1, 2048.877930, 1393.445435,1194.356934 , 10, 0 ); -- blood elf tower

DELETE FROM creature_battleground WHERE guid BETWEEN 152000 AND 152017;

INSERT INTO creature_battleground (guid, event1, event2)
VALUES
-- arathi basin
(152000, 0, 3 ),
(152001, 1, 3 ),
(152002, 2, 3  ),
(152003, 3, 3 ),
(152004, 4, 3 ),
(152005, 0, 4 ),
(152006, 1, 4 ),
(152007, 2, 4 ),
(152008, 3, 4 ),
(152009, 4, 4 ),
-- eye of storm
(152010, 2, 0 ),
(152011, 3, 0 ),
(152012, 0, 0 ),
(152013, 1, 0 ),
(152014, 2, 1 ),
(152015, 3, 1 ),
(152016, 0, 1 ),
(152017, 1, 1 );

-- -------------------
-- The Ring of Valor -
-- -------------------

-- gameobject initial guid
SET @GAMEOBJECT := 541000;

UPDATE gameobject_template SET faction='114', flags='32' WHERE entry IN (192704, 192705, 192388, 192387, 192393, 192394, 192389, 192390);

DELETE FROM `gameobject` WHERE map='618';
DELETE FROM `gameobject` WHERE `guid` BETWEEN @GAMEOBJECT AND @GAMEOBJECT+999;
INSERT INTO gameobject
    (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state)
VALUES
    -- buffs
    (@GAMEOBJECT,'184663','618','1','1','735.551819','-284.794678','28.276682','0.034906','0','0','0','0','-120','100','1'),
    (@GAMEOBJECT+1,'184664','618','1','1','791.224487','-284.794464','28.276682','2.600535','0','0','0','0','-120','100','1'),
    -- elevators
    (@GAMEOBJECT+2,'194582','618','1','1','763.536377','-294.535767','0.505383','3.141593','0','0','0','0','120','100','1'),
    (@GAMEOBJECT+3,'194586','618','1','1','763.506348','-273.873352','0.505383','0','0','0','0','0','120','100','1'),
    -- fire
    (@GAMEOBJECT+4,'192704','618','1','1','743.543457','-283.799469','28.286655','0','0','0','0','0','120','100','1'),
    (@GAMEOBJECT+5,'192705','618','1','1','782.971802','-283.799469','28.286655','0','0','0','0','0','120','100','1'),
    (@GAMEOBJECT+6,'192388','618','1','1','743.711060','-284.099609','27.542587','3.141593','0','0','0','0','120','100','1'),
    (@GAMEOBJECT+7,'192387','618','1','1','783.221252','-284.133362','27.535686','0','0','0','0','0','120','100','1'),
    -- gears
    (@GAMEOBJECT+8,'192393','618','1','1','763.664551','-261.872986','26.686588','0','0','0','0','0','120','100','1'),
    (@GAMEOBJECT+9,'192394','618','1','1','763.578979','-306.146149','26.665222','3.141593','0','0','0','0','120','100','1'),
    -- pillars
    (@GAMEOBJECT+10,'194583','618','1','1','763.632385','-306.162384','25.909504','3.141593','0','0','0','0','120','100','1'),
    (@GAMEOBJECT+11,'194584','618','1','1','723.644287','-284.493256','24.648525','3.141593','0','0','0','0','120','100','1'),
    (@GAMEOBJECT+12,'194585','618','1','1','763.611145','-261.856750','25.909504','0','0','0','0','0','120','100','1'),
    (@GAMEOBJECT+13,'194587','618','1','1','802.211609','-284.493256','24.648525','0','0','0','0','0','120','100','1'),
    -- pulley
    (@GAMEOBJECT+14,'192389','618','1','1','700.722290','-283.990662','39.517582','3.141593','0','0','0','0','120','100','1'),
    (@GAMEOBJECT+15,'192390','618','1','1','826.303833','-283.996429','39.517582','0','0','0','0','0','120','100','1');

DELETE FROM gameobject_battleground WHERE guid IN (SELECT guid FROM gameobject WHERE map=618);
INSERT INTO gameobject_battleground
    (guid, event1, event2) VALUES
    -- buffs
    (@GAMEOBJECT,'253','0'),
    (@GAMEOBJECT+1,'253','0'),
    -- elevators
    (@GAMEOBJECT+2,'254','0'),
    (@GAMEOBJECT+3,'254','0');

DELETE FROM battleground_events WHERE map='618';
INSERT INTO battleground_events
    (map, event1, event2, description) VALUES
    ('618','253','0','buffs'),
    ('618','254','0','doors');


-- Dalaran Arena

-- gameobject initial guid
SET @GAMEOBJECT := 540000;

UPDATE gameobject_template SET faction=114, flags=32, size=1.5 WHERE entry IN (192642, 192643);

DELETE FROM `gameobject` WHERE map=617;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @GAMEOBJECT AND @GAMEOBJECT+999;

INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
    -- buffs
    (@GAMEOBJECT,184663,617,1,1,1291.7,813.424,7.11472,4.64562,0,0,0.730314,-0.683111,86400,100,1),
    (@GAMEOBJECT+1,184664,617,1,1,1291.7,768.911,7.11472,1.55194,0,0,0.700409,0.713742,86400,100,1),
    -- doors
    (@GAMEOBJECT+2,192642,617,1,1,1350.95,817.2,21.4096,3.15,0,0,0.99627,0.0862864,86400,100,1),
    (@GAMEOBJECT+3,192643,617,1,1,1232.65,764.913,21.4729,6.3,0,0,0.0310211,-0.999519,86400,100,1),
    -- waterfall
    (@GAMEOBJECT+4,194395,617,1,1,1291.6,791.05,7.11,3.22012,0,0,0.999229,-0.0392542,86400,100,1),
    (@GAMEOBJECT+5,191877,617,1,1,1291.6,791.05,7.11,3.22012,0,0,0.999229,-0.0392542,86400,100,1);

DELETE FROM gameobject_battleground WHERE guid IN (SELECT guid FROM gameobject WHERE map=617);
INSERT INTO gameobject_battleground (guid, event1, event2) VALUES
    -- buffs
    (@GAMEOBJECT,253,0),
    (@GAMEOBJECT+1,253,0),
    -- doors
    (@GAMEOBJECT+2,254,0),
    (@GAMEOBJECT+3,254,0),
    -- waterfall
    (@GAMEOBJECT+4,250,0),
    (@GAMEOBJECT+5,250,0);

DELETE FROM battleground_events WHERE map=617;
INSERT INTO battleground_events (map, event1, event2, description) VALUES
    (617,253,0,'buffs'),
    (617,254,0,'doors'),
    (617,250,0,'waterfall');

-- Fix Rotation for all Objects in Map
UPDATE gameobject SET rotation0=0, rotation1=0, rotation2=SIN(orientation*0.5), rotation3=COS(orientation*0.5) WHERE map =  617;

-- Sql to create buff object pool for some BG

-- Arathi bassin
-- -------------

-- Stable
REPLACE INTO `gameobject` VALUES (150500, 179871, 529, 1, 1, 1185.71, 1185.24, -56.36, 2.56, 0, 0, 0.022338351, 0.999750467, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150501, 179904, 529, 1, 1, 1185.71, 1185.24, -56.36, 2.56, 0, 0, 0.022338351, 0.999750467, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150502, 179905, 529, 1, 1, 1185.71, 1185.24, -56.36, 2.56, 0, 0, 0.022338351, 0.999750467, 180, 100, 1);

-- Blacksmith
REPLACE INTO `gameobject` VALUES (150503, 179871, 529, 1, 1, 990.75, 1008.18, -42.60, 2.43, 0, 0, 0.021204161, 0.999775166, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150504, 179904, 529, 1, 1, 990.75, 1008.18, -42.60, 2.43, 0, 0, 0.021204161, 0.999775166, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150505, 179905, 529, 1, 1, 990.75, 1008.18, -42.60, 2.43, 0, 0, 0.021204161, 0.999775166, 180, 100, 1);

-- Farm
REPLACE INTO `gameobject` VALUES (150506, 179871, 529, 1, 1, 817.66, 843.34, -56.54, 3.01, 0, 0, 0.026264184, 0.999655036, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150507, 179904, 529, 1, 1, 817.66, 843.34, -56.54, 3.01, 0, 0, 0.026264184, 0.999655036, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150508, 179905, 529, 1, 1, 817.66, 843.34, -56.54, 3.01, 0, 0, 0.026264184, 0.999655036, 180, 100, 1);

-- Lumber Mill
REPLACE INTO `gameobject` VALUES (150509, 179871, 529, 1, 1, 807.46, 1189.16, 11.92, 5.44, 0, 0, 0.047455126, 0.998873370, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150510, 179904, 529, 1, 1, 807.46, 1189.16, 11.92, 5.44, 0, 0, 0.047455126, 0.998873370, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150511, 179905, 529, 1, 1, 807.46, 1189.16, 11.92, 5.44, 0, 0, 0.047455126, 0.998873370, 180, 100, 1);

-- Gold Mine
REPLACE INTO `gameobject` VALUES (150512, 179871, 529, 1, 1, 1146.62, 816.94, -98.49, 6.0, 0, 0, 0.053555973, 0.998564849, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150513, 179904, 529, 1, 1, 1146.62, 816.94, -98.49, 6.0, 0, 0, 0.053555973, 0.998564849, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150514, 179905, 529, 1, 1, 1146.62, 816.94, -98.49, 6.0, 0, 0, 0.053555973, 0.998564849, 180, 100, 1);

-- Add pool id
REPLACE INTO `pool_template` VALUES (15000, 1, "Stable power up buff");
REPLACE INTO `pool_template` VALUES (15001, 1, "Blacksmith power up buff");
REPLACE INTO `pool_template` VALUES (15002, 1, "Farm power up buff");
REPLACE INTO `pool_template` VALUES (15003, 1, "Lumber Mill power up buff");
REPLACE INTO `pool_template` VALUES (15004, 1, "Gold Mine power up buff");

-- Add Stable pool
REPLACE INTO `pool_gameobject` VALUES (150500, 15000, 0, "Stable : Speed buff");
REPLACE INTO `pool_gameobject` VALUES (150501, 15000, 0, "Stable : Regen buff");
REPLACE INTO `pool_gameobject` VALUES (150502, 15000, 0, "Stable : Berserker buff");

-- Add Blacksmith pool
REPLACE INTO `pool_gameobject` VALUES (150503, 15001, 0, "Blacksmith : Speed buff");
REPLACE INTO `pool_gameobject` VALUES (150504, 15001, 0, "Blacksmith : Regen buff");
REPLACE INTO `pool_gameobject` VALUES (150505, 15001, 0, "Blacksmith : Berserker buff");

-- Add Farm pool
REPLACE INTO `pool_gameobject` VALUES (150506, 15002, 0, "Farm : Speed buff");
REPLACE INTO `pool_gameobject` VALUES (150507, 15002, 0, "Farm : Regen buff");
REPLACE INTO `pool_gameobject` VALUES (150508, 15002, 0, "Farm : Berserker buff");

-- Add Lumber Mill pool
REPLACE INTO `pool_gameobject` VALUES (150509, 15003, 0, "Lumber Mill : Speed buff");
REPLACE INTO `pool_gameobject` VALUES (150510, 15003, 0, "Lumber Mill : Regen buff");
REPLACE INTO `pool_gameobject` VALUES (150511, 15003, 0, "Lumber Mill : Berserker buff");

-- Add Gold Mine pool
REPLACE INTO `pool_gameobject` VALUES (150512, 15004, 0, "Gold Mine : Speed buff");
REPLACE INTO `pool_gameobject` VALUES (150513, 15004, 0, "Gold Mine : Regen buff");
REPLACE INTO `pool_gameobject` VALUES (150514, 15004, 0, "Gold Mine : Berserker buff");

-- Eye of Storm
-- ------------

-- Blood Elf Tower
REPLACE INTO `gameobject` VALUES (150550, 179871, 566, 1, 1, 2050.4599609375, 1372.26000976563, 1194.56005859375, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150551, 179904, 566, 1, 1, 2050.4599609375, 1372.26000976563, 1194.56005859375, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150552, 179905, 566, 1, 1, 2050.4599609375, 1372.26000976563, 1194.56005859375, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);

-- Fel REaver Ruins Tower
REPLACE INTO `gameobject` VALUES (150553, 179871, 566, 1, 1, 2046.32995605469, 1748.81005859375, 1190.03002929688, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150554, 179904, 566, 1, 1, 2046.32995605469, 1748.81005859375, 1190.03002929688, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150555, 179905, 566, 1, 1, 2046.32995605469, 1748.81005859375, 1190.03002929688, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);

-- Mage Tower
REPLACE INTO `gameobject` VALUES (150556, 179871, 566, 1, 1, 2283.3798828125, 1748.81005859375, 1189.7099609375, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150557, 179904, 566, 1, 1, 2283.3798828125, 1748.81005859375, 1189.7099609375, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150558, 179905, 566, 1, 1, 2283.3798828125, 1748.81005859375, 1189.7099609375, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);

-- Draenei Ruins Tower
REPLACE INTO `gameobject` VALUES (150559, 179871, 566, 1, 1, 2302.68994140625, 1391.27001953125, 1197.77001953125, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150560, 179904, 566, 1, 1, 2302.68994140625, 1391.27001953125, 1197.77001953125, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150561, 179905, 566, 1, 1, 2302.68994140625, 1391.27001953125, 1197.77001953125, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);

-- Add pool id
REPLACE INTO `pool_template` VALUES (15010, 1, "Blood Elf Tower power up buff");
REPLACE INTO `pool_template` VALUES (15011, 1, "Fel Reaver Ruins Tower power up buff");
REPLACE INTO `pool_template` VALUES (15012, 1, "Mage Tower power up buff");
REPLACE INTO `pool_template` VALUES (15013, 1, "Dreanei Ruins Tower power up buff");

-- Add Blood Elf Tower pool
REPLACE INTO `pool_gameobject` VALUES (150550, 15010, 0, "Blood Elf Tower : Speed buff");
REPLACE INTO `pool_gameobject` VALUES (150551, 15010, 0, "Blood Elf Tower : Regen buff");
REPLACE INTO `pool_gameobject` VALUES (150552, 15010, 0, "Blood Elf Tower : Berserker buff");

-- Add Fel Reaver Ruins Tower pool
REPLACE INTO `pool_gameobject` VALUES (150553, 15011, 0, "Fel Reaver Ruins Tower : Speed buff");
REPLACE INTO `pool_gameobject` VALUES (150554, 15011, 0, "Fel Reaver Ruins Tower : Regen buff");
REPLACE INTO `pool_gameobject` VALUES (150555, 15011, 0, "Fel Reaver Ruins Tower : Berserker buff");

-- Add Mage Tower pool
REPLACE INTO `pool_gameobject` VALUES (150556, 15012, 0, "Mage Tower : Speed buff");
REPLACE INTO `pool_gameobject` VALUES (150557, 15012, 0, "Mage Tower : Regen buff");
REPLACE INTO `pool_gameobject` VALUES (150558, 15012, 0, "Mage Tower : Berserker buff");

-- Add Dreanei Ruins Tower pool
REPLACE INTO `pool_gameobject` VALUES (150559, 15013, 0, "Dreanei Ruins Tower : Speed buff");
REPLACE INTO `pool_gameobject` VALUES (150560, 15013, 0, "Dreanei Ruins Tower : Regen buff");
REPLACE INTO `pool_gameobject` VALUES (150561, 15013, 0, "Dreanei Ruins Tower : Berserker buff");

-- Isle of Conquest

-- creature and gameobject initial guid
SET @CREATURE := 520000;
SET @GAMEOBJECT := 520000;
DELETE FROM `creature` WHERE `guid` BETWEEN @CREATURE AND @CREATURE+9999;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @GAMEOBJECT AND @GAMEOBJECT+9999;

-- use these 2 queries only if you want to enable IoC by direct queueing it
-- DELETE FROM battleground_template WHERE id = 30;
-- INSERT INTO battleground_template (id, MinPlayersPerTeam, MaxPlayersPerTeam, AllianceStartLoc, AllianceStartO, HordeStartLoc, HordeStartO) VALUES
-- (30, 10, 40, 1485, 0, 1486, 3.14159);

SET names utf8;
DELETE FROM mangos_string WHERE entry BETWEEN 20079 AND 20103;
INSERT INTO mangos_string (entry, content_default, content_loc6, content_loc7, content_loc8) VALUES
(20080, 'The battle will begin in 2 minutes.', 'La batalla por la Isla de la Conquista comenzará en 2 minutos.', 'La batalla por la Isla de la Conquista comenzará en 2 minutos.', 'Бой на Острове Завоеваний начнется через 2 минуты!'),
(20081, 'The battle will begin in 1 minute.', 'La batalla por la Isla de la Conquista comenzará en 1 minuto.', 'La batalla por la Isla de la Conquista comenzará en 1 minuto.', 'Бой на Острове Завоеваний начнется уже через 1 минуту! Начинайте готовиться!'),
(20082, 'The battle will begin in 30 seconds!', 'La batalla por la Isla de la Conquista comenzará en 30 segundos. ¡Preparaos!', 'La batalla por la Isla de la Conquista comenzará en 30 segundos. ¡Preparaos!', 'Бой на Острове Завоеваний начнется через 30 секунд! Будьте готовы!'),
(20083, 'The battle has begun!', '¡La batalla por la Isla de la Conquista ha comenzado!', '¡La batalla por la Isla de la Conquista ha comenzado!', 'Бой начался!'),
(20084, 'Alliance Keep', 'Fortaleza de la Alianza', 'Fortaleza de la Alianza', 'крепость Альянса'),
(20085, 'Horde Keep', 'Fortaleza de la Horda', 'Fortaleza de la Horda', 'крепость Орды'),
(20086, 'The Alliance wins!', '¡Gana la Alianza!', '¡Gana la Alianza!', 'Альянс побеждает!'),
(20087, 'The Horde wins!', '¡Gana la Horda!', '¡Gana la Horda!', 'Орда побеждает!'),
(20088, 'The west gate of the Alliance has been destroyed!', '¡La puerta oeste de la fortaleza de la Alianza ha sido destruida!', '¡La puerta oeste de la fortaleza de la Alianza ha sido destruida!', 'Восточные врата Альянса разрушены!'),
(20089, 'The east gate of the Alliance has been destroyed!', '¡La puerta este de la fortaleza de la Alianza ha sido destruida!', '¡La puerta este de la fortaleza de la Alianza ha sido destruida!', 'Западные врата Альянса разрушены!'),
(20090, 'The front gate of the Alliance has been destroyed!', '¡La puerta central de la fortaleza de la Alianza ha sido destruida!', '¡La puerta central de la fortaleza de la Alianza ha sido destruida!', 'Южные врата Альянса разрушены!'),
(20091, 'The west gate of the Horde has been destroyed!', '¡La puerta oeste de la fortaleza de la Horda ha sido destruida!', '¡La puerta oeste de la fortaleza de la Horda ha sido destruida!', 'Восточные врата Орды разрушены!'),
(20092, 'The east gate of the Horde has been destroyed!', '¡La puerta este de la fortaleza de la Horda ha sido destruida!', '¡La puerta este de la fortaleza de la Horda ha sido destruida!', 'Западные врата Орды разрушены!'),
(20093, 'The front gate of Horde has been destroyed!', '¡La puerta central de la fortaleza de la Horda ha sido destruida!', '¡La puerta central de la fortaleza de la Horda ha sido destruida!', 'Южные врата Орды разрушены!'),
(20094, '$n has assaulted the %s', '¡$n ha asaltado %s!', '¡$n ha asaltado %s!', '$n захватывает %s'),
(20095, '$n has defended the %s', '¡$n ha defendido %s!', '¡$n ha defendido %s!', '$n отбивает и возвращает под свой контроль %s'),
(20096, '$n claims the %s! If left unchallenged, the %s will control it in 1 minute!', '¡$n reclama %s! ¡Si nadie se lo impide, la %s tomará el control en 1 minuto!' , '¡$n reclama %s! ¡Si nadie se lo impide, la %s tomará el control en 1 minuto!', '$n захватывает %s! Если ничего не предпринимать, %s получит контроль уже через 1 минуту!'),
(20097, 'The %s has taken the %s', 'La %s ha tomado %s.', 'La %s ha tomado %s.', '%s захватывает %s'),
(20098, 'Workshop', 'el Taller', 'el Taller', 'Мастерская'),
(20099, 'Docks', 'los Muelles', 'los Muelles', 'Причал'),
(20100, 'Refinery', 'la Refinería', 'la Refinería', 'Нефтезавод'),
(20101, 'Quarry', 'la Cantera', 'la Cantera', 'Каменоломня'),
(20102, 'Hangar', 'el Hangar', 'el Hangar', 'Ангар');

-- IOC vehicles

-- Alliance Gunship Cannon
UPDATE creature_template SET vehicle_id = 452, iconName = 'Gunner', AIName = 'NullAI', faction_A = 3, faction_H = 3, ScriptName = '' WHERE entry = 34929;
-- Horde Gunship Cannon
UPDATE creature_template SET vehicle_id = 453, iconName = 'Gunner', AIName = 'NullAI', faction_A = 6, faction_H = 6, ScriptName = '' WHERE entry = 34935;
-- Keep Cannon
UPDATE creature_template SET ScriptName = '', AIName = 'NullAI' WHERE entry IN (34944, 35429);
UPDATE creature_template SET vehicle_id = 160, iconName = 'Gunner', faction_A = 35, faction_H = 35, unit_flags = unit_flags | 4 WHERE entry IN (34944, 35429);

UPDATE creature_template SET mechanic_immune_mask = mechanic_immune_mask|1|2|8|16|32|64|128|1024|2048|4096|8192|131072|262144|8388608|16777216|67108864 WHERE entry IN (34944, 35429, 34793, 35413, 34775, 35415, 34776, 35431, 35069, 35433, 34802, 35419, 35273, 35421);

-- Alli Glaive Thrower
UPDATE creature_template SET AIName = 'NullAI' WHERE entry = 34802;
UPDATE creature_template SET vehicle_id = 447, iconName = 'vehichleCursor', faction_A = 3, faction_H = 3, ScriptName = '' WHERE entry IN (34802, 35419);

-- Horde Glaive Thrower
UPDATE creature_template SET AIName = 'NullAI' WHERE entry = 35273;
UPDATE creature_template SET vehicle_id = 447, iconName = 'vehichleCursor', faction_A = 6, faction_H = 6, ScriptName = '' WHERE entry IN (35273, 35421);

-- Catapult
UPDATE creature_template SET powertype = 3, vehicle_id = 438, iconName = 'vehichleCursor', faction_A = 35, faction_H = 35, speed_walk = 2.4, speed_run = 2.8, ScriptName = '' WHERE entry in (34793, 35413);

-- Demolisher
UPDATE creature_template SET powertype = 3, vehicle_id = 509, iconName = 'vehichleCursor', faction_A = 35, faction_H = 35, ScriptName = '' WHERE entry IN (34775, 35415);

-- Horde Siege Engine
UPDATE creature_template SET AIName = 'NullAI' WHERE entry = 35069;
UPDATE creature_template SET powertype = 3, vehicle_id = 435, iconName = 'vehichleCursor', faction_A = 6, faction_H = 6, ScriptName = '' WHERE entry IN (35069, 35433);

-- Ally Siege Engine
UPDATE creature_template SET AIName = 'NullAI' WHERE entry = 34776;
UPDATE creature_template SET powertype = 3, vehicle_id = 435, iconName = 'vehichleCursor', faction_A = 3, faction_H = 3, ScriptName = '' WHERE entry IN (34776, 35431);

-- Ally/horde Siege Turret
UPDATE creature_template SET AIName = 'NullAI' WHERE entry IN (34777, 36355);
UPDATE creature_template SET powertype = 3, iconName = 'Gunner', vehicle_id = 436, ScriptName = '' WHERE entry IN (34777, 35436, 36355, 36357);

-- Horde/Ally Flame Turret
UPDATE creature_template SET AIName = 'NullAI' WHERE entry IN (34778, 36356);
UPDATE creature_template SET powertype = 3, iconName = 'Gunner', vehicle_id = 437, ScriptName = '' WHERE entry IN (34778, 35417, 36356, 36358);

DELETE FROM npc_spellclick_spells WHERE npc_entry IN (34929, 34935, 34944, 34793, 34775, 34776, 35069, 34802, 35273, 34778, 36356, 34777, 36355);
INSERT INTO npc_spellclick_spells (npc_entry, spell_id, quest_start, quest_start_active, quest_end, cast_flags) VALUES
(34929, 60968, 0, 0, 0, 1),
(34935, 60968, 0, 0, 0, 1),
(34944, 60968, 0, 0, 0, 1),
(34793, 60968, 0, 0, 0, 1),
(34793, 68362, 0, 0, 0, 3),
(34775, 60968, 0, 0, 0, 1),
(34775, 68365, 0, 0, 0, 3),
(34776, 60968, 0, 0, 0, 1),
(34776, 68364, 0, 0, 0, 3),
(35069, 60968, 0, 0, 0, 1),
(34802, 60968, 0, 0, 0, 1),
(34802, 68363, 0, 0, 0, 3),
(35273, 60968, 0, 0, 0, 1),
(35273, 68363, 0, 0, 0, 3),
(34778, 60968, 0, 0, 0, 1),
(36356, 60968, 0, 0, 0, 1),
(34777, 60968, 0, 0, 0, 1),
(36355, 60968, 0, 0, 0, 1);

DELETE FROM creature_spell WHERE guid IN (34929, 35410, 34935, 34944, 35429, 34793, 34775, 34776, 35069, 34802, 35273, 34778, 36356, 34777, 36355);
INSERT INTO creature_spell (guid, spell, `index`) VALUES
(34929, 69495, 0),
(34935, 68825, 0),
(34944, 67452, 0),
(34944, 68169, 1),
(34793, 66218, 0),
(34793, 66296, 1),
(34775, 67440, 0),
(34775, 67441, 1),
(34776, 67816, 0),
(34776, 69502, 1),
(35069, 67816, 0),
(35069, 69502, 1),
(34802, 66456, 0),
(34802, 67195, 1),
(35273, 66456, 0),
(35273, 67195, 1),
(34777, 67462, 0),
(34777, 69505, 1),
(36355, 67462, 0),
(36355, 69505, 1);

DELETE FROM creature_spell WHERE guid IN (34778, 36356);
INSERT INTO creature_spell (guid, spell, `index`) VALUES
(34778, 66183, 0),
(34778, 66186, 1),
(36356, 66183, 0),
(36356, 66186, 1);

-- /IOC vehicles by /dev/rsa

-- alliance boss
UPDATE creature_template SET faction_A = 84, faction_H = 84, difficulty_entry_1 = 35403, ScriptName = 'boss_bg_ioc' WHERE entry = 34924;
-- alli boss guard faction
UPDATE creature_template SET faction_A = 84, faction_H = 84 WHERE entry = 34919;
-- horde boss
UPDATE creature_template SET faction_A = 83, faction_H = 83, difficulty_entry_1 = 35405, ScriptName = 'boss_bg_ioc' WHERE entry = 34922;
-- horde boss guard faction
UPDATE creature_template SET faction_A = 83, faction_H = 83 WHERE entry = 34918;

-- make sure doors arent clickable
UPDATE gameobject_template SET flags = flags | 4 WHERE entry IN (195223,195703,195491,195451,195452,195437,195436);

-- alli flags in keeps
UPDATE gameobject_template SET faction = 83, flags = 0 WHERE entry IN (195397, 195396, 195392, 195391);
-- horde flags in keeps
UPDATE gameobject_template SET faction = 84, flags = 0 WHERE entry IN (195399, 195398, 195394, 195393);

-- Seaforium charges
UPDATE gameobject_template SET data2 = 1, data4 = 1, data7 = 10 WHERE entry IN (195331, 195235);

-- some people say bombs should be consumed after 3 uses, some say they dont disappear.. Im making them non-consumable
-- if huge bombs should have 3 charges, type has to be changed to spellcaster too, as goobers dont have charges
-- bombs in the horde keep
UPDATE gameobject_template SET faction = 1997, flags = 0, data5 = 0 WHERE entry IN (195333, 195232);
-- bombs in the alli keep
UPDATE gameobject_template SET faction = 1995, flags = 0, data5 = 0 WHERE entry IN (195332, 195237);

-- horde teleporters
UPDATE gameobject_template SET faction = 1995, flags = 0 WHERE entry IN (195313, 195314);
UPDATE gameobject_template SET faction = 1995 WHERE entry = 195326;
-- alliance teleporters
UPDATE gameobject_template SET faction = 1997, flags = 0 WHERE entry IN (195315, 195316);
UPDATE gameobject_template SET faction = 1997 WHERE entry = 195320;

-- scriptnames
UPDATE gameobject_template SET ScriptName = '' WHERE entry BETWEEN 195313 AND 195316;
-- gunship portals
-- disabled till fixed
-- UPDATE gameobject_template SET ScriptName = 'go_ic_teleport' WHERE entry IN (195320, 195326);

-- teleports
DELETE FROM `spell_script_target`WHERE `entry` IN (66550, 66551);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
('66551', '0', '195313'), -- horde teleporters
('66550', '0', '195314'),
('66550', '0', '195315'), -- alliance teleporters
('66551', '0', '195316');

-- no regeneration buff for vehicles
DELETE FROM creature_template_addon WHERE entry IN (34929, 34935, 34944, 34793, 34775, 34776, 35069, 34802, 35273, 34778, 36356, 34777, 36355);
INSERT INTO creature_template_addon (entry, auras) VALUES
(34929, 52455),
(34935, 52455),
(34944, 52455),
(34793, 52455),
(34775, 52455),
(34776, 52455),
(35069, 52455),
(34802, 52455),
(35273, 52455),
(34778, 52455),
(36356, 52455),
(34777, 52455),
(36355, 52455);

-- Achievements
DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (11492, 11493, 11494, 11495, 12059, 12066, 12067, 12132, 12163);
INSERT INTO achievement_criteria_requirement VALUES
(11492, 6, 4710, 0),  -- Four Car Garage (x4)
(11493, 6, 4710, 0),
(11494, 6, 4710, 0),
(11495, 6, 4710, 0),
(12059, 6, 4710, 0),  -- Isle of Conquest All-Star
(12066, 6, 4710, 0),  -- A-bomb-inable
(12067, 6, 4710, 0),  -- A-bomb-ination
(12132, 6, 4710, 0),  -- Cut the Blue Wire... No the Red Wire!
(12163, 6, 4710, 0);  -- Back Door Job

###############################
-- SPAWNING STATIC OBJECTS
###############################
DELETE FROM gameobject WHERE map=628;
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
-- chairs
(@GAMEOBJECT , 160415 , 628 , 3 , 1 , 1117.19 , -365.674 , 18.8456 , 0.968657 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+1 , 195418 , 628 , 3 , 1 , 632.156 , -304.503 , 5.4879 , 1.15603 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+2 , 195416 , 628 , 3 , 1 , 643.86 , -270.204 , 5.48898 , 2.36903 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+3 , 160410 , 628 , 3 , 1 , 902.234 , -455.508 , 18.3935 , -1.00356 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+4 , 160410 , 628 , 3 , 1 , 1066.19 , -337.214 , 18.8225 , 0.453785 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+5 , 160418 , 628 , 3 , 1 , 810.237 , -461.2 , 25.4627 , 1.5708 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+6 , 160416 , 628 , 3 , 1 , 798.324 , -444.951 , 22.5601 , -1.02102 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+7 , 160416 , 628 , 3 , 1 , 1081.81 , -358.637 , 18.5531 , 1.92859 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+8 , 160419 , 628 , 3 , 1 , 814.931 , -470.816 , 33.6373 , -3.12412 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+9 , 195410 , 628 , 3 , 1 , 632.876 , -282.461 , 5.45364 , -0.851094 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+10 , 195414 , 628 , 3 , 1 , 635.796 , -276.295 , 5.48659 , -3.03273 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+11 , 160415 , 628 , 3 , 1 , 762.245 , -444.795 , 22.8526 , -1.98095 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- flagpoles
(@GAMEOBJECT+12 , 195131 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.74278 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+13 , 195131 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+14 , 195131 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.91986 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+15 , 195131 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+16 , 195131 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.23147 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+17 , 195439 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+18 , 195439 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- stoves
(@GAMEOBJECT+19 , 174863 , 628 , 3 , 1 , 903.291 , -457.345 , 18.1356 , 2.23402 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+20 , 174863 , 628 , 3 , 1 , 11068.1 , -336.373 , 18.5647 , -2.59181 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+21 , 160411 , 628 , 3 , 1 , 761.462 , -446.684 , 22.5602 , 0.244344 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+22 , 160411 , 628 , 3 , 1 , 1118.32 , -363.969 , 18.5532 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- bench
(@GAMEOBJECT+23 , 186896 , 628 , 3 , 1 , 834.208 , -461.826 , 22.3067 , 1.5708 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+24 , 186922 , 628 , 3 , 1 , 826.153 , -461.985 , 22.5149 , 1.5708 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+25 , 186899 , 628 , 3 , 1 , 817.446 , -470.47 , 25.372 , -1.56207 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+26 , 186904 , 628 , 3 , 1 , 827.001 , -474.415 , 25.372 , 1.57952 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+27 , 186897 , 628 , 3 , 1 , 819.264 , -461.961 , 22.7614 , 1.57952 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- bonfires
(@GAMEOBJECT+28 , 195376 , 628 , 3 , 1 , 1162.91 , -734.578 , 48.8948 , -2.9845 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+29 , 195208 , 628 , 3 , 1 , 1282.34 , -799.762 , 87.1357 , -3.13286 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+30 , 195210 , 628 , 3 , 1 , 1358.06 , -732.178 , 87.1606 , -3.13284 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+31 , 195207 , 628 , 3 , 1 , 1281.76 , -732.844 , 87.1574 , -3.13246 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+32 , 195209 , 628 , 3 , 1 , 1358.81 , -797.899 , 87.2953 , 3.13312 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+33 , 195377 , 628 , 3 , 1 , 1162.21 , -790.543 , 48.9162 , 2.27765 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- braziers
(@GAMEOBJECT+34 , 195402 , 628 , 3 , 1 , 1262.21 , -751.358 , 48.8133 , 2.26893 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+35 , 195403 , 628 , 3 , 1 , 1262.58 , -781.861 , 48.8132 , 2.04203 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+36 , 195425 , 628 , 3 , 1 , 223.818 , -839.352 , 60.7917 , 1.09083 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+37 , 195424 , 628 , 3 , 1 , 224.277 , -822.77 , 60.7917 , 2.06822 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- huge seaforium bombs
(@GAMEOBJECT+38 , 195332 , 628 , 3 , 1 , 297.321 , -851.321 , 48.9163 , -0.942477 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+39 , 195332 , 628 , 3 , 1 , 298.104 , -861.026 , 48.9163 , -2.75761 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+40 , 195332 , 628 , 3 , 1 , 300.372 , -818.733 , 48.9162 , 0.785397 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+41 , 195332 , 628 , 3 , 1 , 302.135 , -810.708 , 48.9162 , -1.0472 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+42 , 195333 , 628 , 3 , 1 , 1268.31 , -745.783 , 48.9188 , 0.785397 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+43 , 195333 , 628 , 3 , 1 , 1268.51 , -738.122 , 48.9175 , -1.0472 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+44 , 195333 , 628 , 3 , 1 , 1273.07 , -786.573 , 48.9419 , -0.942477 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+45 , 195333 , 628 , 3 , 1 , 1273.85 , -796.278 , 48.9364 , -2.75761 , 0 , 0 , 0 , 0 , 10 , 0 , 0),

###############################
-- DYNAMIC OBJECTS
###############################

-- BANNERS, order:
--  contested
--  alli in conflict
--  horde in conflict
--  alli owned
--  horde owned

-- docks
(@GAMEOBJECT+46 , 195157 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+47 , 180059 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+48 , 180061 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+49 , 180058 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+50 , 180060 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- hangar
(@GAMEOBJECT+51 , 195158 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+52 , 180059 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+53 , 180061 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+54 , 180058 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+55 , 180060 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- workshop
(@GAMEOBJECT+56 , 195133 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+57 , 180059 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+58 , 180061 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+59 , 180058 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+60 , 180060 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- quarry
(@GAMEOBJECT+61 , 195338 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+62 , 180059 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+63 , 180061 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+64 , 180058 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+65 , 180060 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- refinery
(@GAMEOBJECT+66 , 195343 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+67 , 180059 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+68 , 180061 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+69 , 180058 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+70 , 180060 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

-- Keeps
--  alli contested
--  horde contested
--  alli owned
--  horde owned
-- Alli keep
(@GAMEOBJECT+71 , 195397 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+72 , 195399 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+73 , 195396 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+74 , 195398 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- Horde keep
(@GAMEOBJECT+75 , 195392 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+76 , 195394 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+77 , 195391 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+78 , 195393 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

-- banner auras
(@GAMEOBJECT+79 , 180100 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+80 , 180101 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+81 , 180102 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

(@GAMEOBJECT+82 , 180100 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+83 , 180101 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+84 , 180102 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

(@GAMEOBJECT+85 , 180100 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+86 , 180101 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+87 , 180102 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

(@GAMEOBJECT+88 , 180100 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+89 , 180101 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+90 , 180102 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

(@GAMEOBJECT+91 , 180100 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+92 , 180101 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+93 , 180102 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

(@GAMEOBJECT+94 , 180100 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+95 , 180101 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

(@GAMEOBJECT+96 , 180100 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+97 , 180101 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

-- tower portcullisses
(@GAMEOBJECT+98 , 195436 , 628 , 3 , 1 , 401.024 , -780.724 , 49.9482 , -2.52896 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+99 , 195436 , 628 , 3 , 1 , 399.802 , -885.208 , 50.1939 , 2.516 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+100 , 195437 , 628 , 3 , 1 , 1156.89 , -843.998 , 48.6322 , 0.732934 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+101 , 195437 , 628 , 3 , 1 , 1157.05 , -682.36 , 48.6322 , -0.829132 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- keep portcullisses
(@GAMEOBJECT+102 , 195452 , 628 , 3 , 1 , 273.033 , -832.199 , 51.4109 , -0.0261791 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+103 , 195451 , 628 , 3 , 1 , 288.203 , -832.767 , 51.4681 , 6.24156 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+104 , 195223 , 628 , 3 , 1 , 1283.05 , -765.878 , 50.8297 , -3.13286 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- teleports
(@GAMEOBJECT+105 , 195315 , 628 , 3 , 1 , 324.635 , -749.128 , 49.3602 , 0.0174525 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+106 , 195315 , 628 , 3 , 1 , 311.92 , -913.972 , 48.8159 , 3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+107 , 195315 , 628 , 3 , 1 , 425.675 , -857.09 , 48.5104 , -1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+108 , 195316 , 628 , 3 , 1 , 323.54 , -888.361 , 48.9197 , 0.0349063 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+109 , 195316 , 628 , 3 , 1 , 326.285 , -777.366 , 49.0208 , 3.12412 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+110 , 195316 , 628 , 3 , 1 , 397.089 , -859.382 , 48.8993 , 1.64061 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+111 , 195314 , 628 , 3 , 1 , 1143.25 , -779.599 , 48.629 , 1.64061 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+112 , 195314 , 628 , 3 , 1 , 1236.53 , -669.415 , 48.2729 , 0.104719 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+113 , 195314 , 628 , 3 , 1 , 1235.09 , -857.898 , 48.9163 , 3.07177 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+114 , 195313 , 628 , 3 , 1 , 1233.27 , -844.526 , 48.8824 , -0.0174525 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+115 , 195313 , 628 , 3 , 1 , 1235.53 , -683.872 , 49.304 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+116 , 195313 , 628 , 3 , 1 , 1158.76 , -746.182 , 48.6277 , -1.51844 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- teleport effects
(@GAMEOBJECT+117 , 195701 , 628 , 3 , 1 , 425.686 , -857.092 , 48.51 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+118 , 195701 , 628 , 3 , 1 , 324.634 , -749.148 , 49.359 , 0.0174525 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+119 , 195701 , 628 , 3 , 1 , 311.911 , -913.986 , 48.8157 , 3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+120 , 195701 , 628 , 3 , 1 , 326.266 , -777.347 , 49.0215 , 3.12412 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+121 , 195701 , 628 , 3 , 1 , 323.55 , -888.347 , 48.9198 , 0.0174525 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+122 , 195701 , 628 , 3 , 1 , 397.116 , -859.378 , 48.8989 , 1.64061 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+123 , 195702 , 628 , 3 , 1 , 1143.25 , -779.623 , 48.6291 , 1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+124 , 195702 , 628 , 3 , 1 , 1158.64 , -746.148 , 48.6277 , -1.50098 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+125 , 195702 , 628 , 3 , 1 , 1233.25 , -844.573 , 48.8836 , 0.0174525 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+126 , 195702 , 628 , 3 , 1 , 1235.07 , -857.957 , 48.9163 , 3.05433 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+127 , 195702 , 628 , 3 , 1 , 1236.46 , -669.344 , 48.2684 , 0.087266 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+128 , 195702 , 628 , 3 , 1 , 1235.6 , -683.806 , 49.3028 , -3.07177 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- gunship portals
(@GAMEOBJECT+129 , 195320 , 628 , 3 , 1 , 827.958 , -994.467 , 134.071 , 0 , 0 , 0 , 0 , 0 , 0 , 0, 0),
(@GAMEOBJECT+130 , 195320 , 628 , 3 , 1 , 738.613 , -1106.58 , 134.745 , 2.54818 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+131 , 195320 , 628 , 3 , 1 , 672.283 , -1156.99 , 133.706 , 1.37881 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+132 , 195326 , 628 , 3 , 1 , 827.958 , -994.467 , 134.071 , 0 , 0 , 0 , 0 , 0 , 0 , 0, 0),
(@GAMEOBJECT+133 , 195326 , 628 , 3 , 1 , 738.613 , -1106.58 , 134.745 , 2.54818 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+134 , 195326 , 628 , 3 , 1 , 672.283 , -1156.99 , 133.706 , 1.37881 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- seaforium bombs
(@GAMEOBJECT+135 , 195232 , 628 , 3 , 1 , 750.601 , -864.597 , 13.4754 , 1.93731 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+136 , 195232 , 628 , 3 , 1 , 785.509 , -864.715 , 13.3993 , 2.47837 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+137 , 195237 , 628 , 3 , 1 , 750.601 , -864.597 , 13.4754 , 1.93731 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+138 , 195237 , 628 , 3 , 1 , 785.509 , -864.715 , 13.3993 , 2.47837 , 0 , 0 , 0 , 0 , 10 , 0 , 0);

DELETE FROM gameobject_battleground WHERE guid IN (SELECT guid FROM gameobject WHERE map=628);
INSERT INTO gameobject_battleground (guid, event1, event2) VALUES
(@GAMEOBJECT+46 , 0 , 0),
(@GAMEOBJECT+47 , 0 , 1),
(@GAMEOBJECT+48 , 0 , 2),
(@GAMEOBJECT+49 , 0 , 3),
(@GAMEOBJECT+50 , 0 , 4),
(@GAMEOBJECT+51 , 1 , 0),
(@GAMEOBJECT+52 , 1 , 1),
(@GAMEOBJECT+53 , 1 , 2),
(@GAMEOBJECT+54 , 1 , 3),
(@GAMEOBJECT+55 , 1 , 4),
(@GAMEOBJECT+56 , 2 , 0),
(@GAMEOBJECT+57 , 2 , 1),
(@GAMEOBJECT+58 , 2 , 2),
(@GAMEOBJECT+59 , 2 , 3),
(@GAMEOBJECT+60 , 2 , 4),
(@GAMEOBJECT+61 , 3 , 0),
(@GAMEOBJECT+62 , 3 , 1),
(@GAMEOBJECT+63 , 3 , 2),
(@GAMEOBJECT+64 , 3 , 3),
(@GAMEOBJECT+65 , 3 , 4),
(@GAMEOBJECT+66 , 4 , 0),
(@GAMEOBJECT+67 , 4 , 1),
(@GAMEOBJECT+68 , 4 , 2),
(@GAMEOBJECT+69 , 4 , 3),
(@GAMEOBJECT+70 , 4 , 4),
(@GAMEOBJECT+71 , 5 , 1),
(@GAMEOBJECT+72 , 5 , 2),
(@GAMEOBJECT+73 , 5 , 3),
(@GAMEOBJECT+74 , 5 , 4),
(@GAMEOBJECT+75 , 6 , 1),
(@GAMEOBJECT+76 , 6 , 2),
(@GAMEOBJECT+77 , 6 , 3),
(@GAMEOBJECT+78 , 6 , 4),
(@GAMEOBJECT+79 , 0 , 3),
(@GAMEOBJECT+80 , 0 , 4),
(@GAMEOBJECT+81 , 0 , 0),
(@GAMEOBJECT+82 , 1 , 3),
(@GAMEOBJECT+83 , 1 , 4),
(@GAMEOBJECT+84 , 1 , 0),
(@GAMEOBJECT+85 , 2 , 3),
(@GAMEOBJECT+86 , 2 , 4),
(@GAMEOBJECT+87 , 2 , 0),
(@GAMEOBJECT+88 , 3 , 3),
(@GAMEOBJECT+89 , 3 , 4),
(@GAMEOBJECT+90 , 3 , 0),
(@GAMEOBJECT+91 , 4 , 3),
(@GAMEOBJECT+92 , 4 , 4),
(@GAMEOBJECT+93 , 4 , 0),
(@GAMEOBJECT+94 , 5 , 3),
(@GAMEOBJECT+95 , 5 , 4),
(@GAMEOBJECT+96 , 6 , 3),
(@GAMEOBJECT+97 , 6 , 4),
(@GAMEOBJECT+98 , 254 , 0),
(@GAMEOBJECT+99 , 254 , 0),
(@GAMEOBJECT+100 , 254 , 0),
(@GAMEOBJECT+101 , 254 , 0),
(@GAMEOBJECT+102 , 251 , 0),
(@GAMEOBJECT+103 , 251 , 0),
(@GAMEOBJECT+104 , 252 , 0),
(@GAMEOBJECT+105 , 7 , 0),
(@GAMEOBJECT+106 , 7 , 0),
(@GAMEOBJECT+107 , 7 , 0),
(@GAMEOBJECT+108 , 7 , 0),
(@GAMEOBJECT+109 , 7 , 0),
(@GAMEOBJECT+110 , 7 , 0),
(@GAMEOBJECT+111 , 7 , 0),
(@GAMEOBJECT+112 , 7 , 0),
(@GAMEOBJECT+113 , 7 , 0),
(@GAMEOBJECT+114 , 7 , 0),
(@GAMEOBJECT+115 , 7 , 0),
(@GAMEOBJECT+116 , 7 , 0),
(@GAMEOBJECT+117 , 254 , 0),
(@GAMEOBJECT+118 , 254 , 0),
(@GAMEOBJECT+119 , 254 , 0),
(@GAMEOBJECT+120 , 254 , 0),
(@GAMEOBJECT+121 , 254 , 0),
(@GAMEOBJECT+122 , 254 , 0),
(@GAMEOBJECT+123 , 254 , 0),
(@GAMEOBJECT+124 , 254 , 0),
(@GAMEOBJECT+125 , 254 , 0),
(@GAMEOBJECT+126 , 254 , 0),
(@GAMEOBJECT+127 , 254 , 0),
(@GAMEOBJECT+128 , 254 , 0),
(@GAMEOBJECT+129 , 1 , 3),
(@GAMEOBJECT+130 , 1 , 3),
(@GAMEOBJECT+131 , 1 , 3),
(@GAMEOBJECT+132 , 1 , 4),
(@GAMEOBJECT+133 , 1 , 4),
(@GAMEOBJECT+134 , 1 , 4),
(@GAMEOBJECT+135 , 2 , 3),
(@GAMEOBJECT+136 , 2 , 3),
(@GAMEOBJECT+137 , 2 , 4),
(@GAMEOBJECT+138 , 2 , 4);

DELETE FROM battleground_events WHERE map = 628;
INSERT INTO battleground_events (map, event1, event2, description) VALUES
(628, 0, 0, 'Dock - Neutral'),
(628, 0, 1, 'Dock - Alliance contested'),
(628, 0, 2, 'Dock - Horde contested'),
(628, 0, 3, 'Dock - Alliance owned'),
(628, 0, 4, 'Dock - Horde owned'),
(628, 1, 0, 'Hangar - Neutral'),
(628, 1, 1, 'Hangar - Alliance contested'),
(628, 1, 2, 'Hangar - Horde contested'),
(628, 1, 3, 'Hangar - Alliance owned'),
(628, 1, 4, 'Hangar - Horde owned'),
(628, 2, 0, 'Workshop - Neutral'),
(628, 2, 1, 'Workshop - Alliance contested'),
(628, 2, 2, 'Workshop - Horde contested'),
(628, 2, 3, 'Workshop - Alliance owned'),
(628, 2, 4, 'Workshop - Horde owned'),
(628, 3, 0, 'Quarry - Neutral'),
(628, 3, 1, 'Quarry - Alliance contested'),
(628, 3, 2, 'Quarry - Horde contested'),
(628, 3, 3, 'Quarry - Alliance owned'),
(628, 3, 4, 'Quarry - Horde owned'),
(628, 4, 0, 'Refinery - Neutral'),
(628, 4, 1, 'Refinery - Alliance contested'),
(628, 4, 2, 'Refinery - Horde contested'),
(628, 4, 3, 'Refinery - Alliance owned'),
(628, 4, 4, 'Refinery - Horde owned'),
(628, 5, 1, 'Alli keep - Alliance contested'),
(628, 5, 2, 'Alli keep - Horde contested'),
(628, 5, 3, 'Alli keep - Alliance owned'),
(628, 5, 4, 'Alli keep - Horde owned'),
(628, 6, 1, 'Horde keep - Alliance contested'),
(628, 6, 2, 'Horde keep - Horde contested'),
(628, 6, 3, 'Horde keep - Alliance owned'),
(628, 6, 4, 'Horde keep - Horde owned'),
(628, 7, 0, 'Base teleport spawn'),
(628, 8, 0, 'Npcs'),
(628, 9, 0, 'Alli Boss guards'),
(628, 10, 0, 'Horde Boss guards'),
(628, 11, 0, 'Alli Boss'),
(628, 12, 0, 'Horde Boss'),
(628, 251, 0, 'Alli Boss gate'),
(628, 252, 0, 'Horde Boss gate'),
(628, 254, 0, 'Door');

################################################################
-- DYNAMIC CREATURES
################################################################
DELETE FROM creature WHERE map=628;
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
-- workshop siege engines
(@CREATURE, 34776, 628, 3, 1, 0, 0, 773.680542, -884.092041, 16.8090363, 1.58824956, 180000, 0, 0, 250000, 0, 0, 0),
(@CREATURE+1, 35069, 628, 3, 1, 0, 0, 773.680542, -884.092041, 16.8090363, 1.58824956, 180000, 0, 0, 250000, 0, 0, 0),
-- workshop demolishers
(@CREATURE+2, 34775, 628, 3, 1, 0, 0, 751.8281, -852.732666, 12.5250978, 1.46607661, 180000, 0, 0, 70000, 0, 0, 0),
(@CREATURE+3, 34775, 628, 3, 1, 0, 0, 761.809, -854.2274, 12.5263243, 1.46607661, 180000, 0, 0, 70000, 0, 0, 0),
(@CREATURE+4, 34775, 628, 3, 1, 0, 0, 783.4722, -853.9601, 12.54775, 1.71042264, 180000, 0, 0, 70000, 0, 0, 0),
(@CREATURE+5, 34775, 628, 3, 1, 0, 0, 793.055542, -852.71875, 12.5671329, 1.71042264, 180000, 0, 0, 70000, 0, 0, 0),
(@CREATURE+6, 34775, 628, 3, 1, 0, 0, 751.8281, -852.732666, 12.5250978, 1.46607661, 180000, 0, 0, 70000, 0, 0, 0),
(@CREATURE+7, 34775, 628, 3, 1, 0, 0, 761.809, -854.2274, 12.5263243, 1.46607661, 180000, 0, 0, 70000, 0, 0, 0),
(@CREATURE+8, 34775, 628, 3, 1, 0, 0, 783.4722, -853.9601, 12.54775, 1.71042264, 180000, 0, 0, 70000, 0, 0, 0),
(@CREATURE+9, 34775, 628, 3, 1, 0, 0, 793.055542, -852.71875, 12.5671329, 1.71042264, 180000, 0, 0, 70000, 0, 0, 0),
-- dock glaive throwers
(@CREATURE+10, 34802, 628, 3, 1, 0, 0, 779.3125, -342.972229, 12.2104874, 4.712389, 180000, 0, 0, 50000, 0, 0, 0),
(@CREATURE+11, 34802, 628, 3, 1, 0, 0, 790.029541, -342.899323, 12.2128582, 4.71238, 180000, 0, 0, 50000, 0, 0, 0),
(@CREATURE+12, 35273, 628, 3, 1, 0, 0, 779.3125, -342.972229, 12.2104874, 4.712389, 180000, 0, 0, 50000, 0, 0, 0),
(@CREATURE+13, 35273, 628, 3, 1, 0, 0, 790.029541, -342.899323, 12.2128582, 4.71238, 180000, 0, 0, 50000, 0, 0, 0),
-- dock catapults
(@CREATURE+14, 34793, 628, 3, 1, 0, 0, 757.283, -341.7795, 12.2113762, 4.729842, 180000, 0, 0, 15000, 0, 0, 0),
(@CREATURE+15, 34793, 628, 3, 1, 0, 0, 766.947937, -342.053833, 12.2009945, 4.694, 180000, 0, 0, 15000, 0, 0, 0),
(@CREATURE+16, 34793, 628, 3, 1, 0, 0, 800.3785, -342.607635, 12.1669979, 4.6774, 180000, 0, 0, 15000, 0, 0, 0),
(@CREATURE+17, 34793, 628, 3, 1, 0, 0, 810.7257, -342.083344, 12.1675768, 4.6600, 180000, 0, 0, 15000, 0, 0, 0),
(@CREATURE+18, 34793, 628, 3, 1, 0, 0, 757.283, -341.7795, 12.2113762, 4.729842, 180000, 0, 0, 15000, 0, 0, 0),
(@CREATURE+19, 34793, 628, 3, 1, 0, 0, 766.947937, -342.053833, 12.2009945, 4.694, 180000, 0, 0, 15000, 0, 0, 0),
(@CREATURE+20, 34793, 628, 3, 1, 0, 0, 800.3785, -342.607635, 12.1669979, 4.6774, 180000, 0, 0, 15000, 0, 0, 0),
(@CREATURE+21, 34793, 628, 3, 1, 0, 0, 810.7257, -342.083344, 12.1675768, 4.6600, 180000, 0, 0, 15000, 0, 0, 0),
-- spirit guides (alli - docks, hangar, workshop, alli keep, horde keep, alli rescue point)
(@CREATURE+22, 13116, 628, 3, 1, 0, 0, 629.57, -279.83, 11.33, 0.0, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+23, 13116, 628, 3, 1, 0, 0, 780.729, -1103.08, 135.51, 2.27, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+24, 13116, 628, 3, 1, 0, 0, 775.74, -652.77, 9.31, 4.27, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+25, 13116, 628, 3, 1, 0, 0, 278.42, -883.20, 49.89, 1.53, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+26, 13116, 628, 3, 1, 0, 0, 1300.91, -834.04, 48.91, 1.69, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+27, 13116, 628, 3, 1, 0, 0, 438.86, -310.04, 51.81, 5.87, 10, 0, 0, 24420, 4868, 0, 0),
-- spirit guides (horde - docks, hangar, workshop, horde keep, alli keep, horde rescue point)
(@CREATURE+28, 13117, 628, 3, 1, 0, 0, 629.57, -279.83, 11.33, 0.0, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+29, 13117, 628, 3, 1, 0, 0, 780.729, -1103.08, 135.51, 2.27, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+30, 13117, 628, 3, 1, 0, 0, 775.74, -652.77, 9.31, 4.27, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+31, 13117, 628, 3, 1, 0, 0, 1300.91, -834.04, 48.91, 1.69, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+32, 13117, 628, 3, 1, 0, 0, 278.42, -883.20, 49.89, 1.53, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+33, 13117, 628, 3, 1, 0, 0, 1148.65, -1250.98, 16.60, 1.74, 10, 0, 0, 24420, 4868, 0, 0),
-- bosses (horde, alli)
(@CREATURE+34, 34922, 628, 3, 1, 0, 0, 1295.44, -765.733, 70.0541, 0.0, 864000, 0, 0, 600001, 0, 0, 0),
(@CREATURE+35, 34924, 628, 3, 1, 0, 0, 224.983, -831.573, 60.9034, 0.0, 864000, 0, 0, 600001, 0, 0, 0),
-- boss guards (4x horde, 4x alli)
(@CREATURE+36, 34918, 628, 3, 1, 0, 0, 1296.01, -773.256, 69.958, 0.292168, 180000, 0, 0, 4608, 0, 0, 0),
(@CREATURE+37, 34918, 628, 3, 1, 0, 0, 1295.94, -757.756, 69.9587, 6.02165, 180000, 0, 0, 4608, 0, 0, 0),
(@CREATURE+38, 34918, 628, 3, 1, 0, 0, 1295.09, -760.927, 69.9587, 5.94311, 180000, 0, 0, 4608, 0, 0, 0),
(@CREATURE+39, 34918, 628, 3, 1, 0, 0, 1295.13, -769.7, 69.95, 0.34, 180000, 0, 0, 4608, 0, 0, 0),
(@CREATURE+40, 34919, 628, 3, 1, 0, 0, 223.969, -822.958, 60.8151, 0.46337, 180000, 0, 0, 4608, 0, 0, 0),
(@CREATURE+41, 34919, 628, 3, 1, 0, 0, 224.211, -826.952, 60.8188, 6.25961, 180000, 0, 0, 4608, 0, 0, 0),
(@CREATURE+42, 34919, 628, 3, 1, 0, 0, 223.119, -838.386, 60.8145, 5.64857, 180000, 0, 0, 4608, 0, 0, 0),
(@CREATURE+43, 34919, 628, 3, 1, 0, 0, 223.889, -835.102, 60.8201, 6.21642, 180000, 0, 0, 4608, 0, 0, 0),
-- keep cannons
(@CREATURE+44, 34944, 628, 3, 1, 0, 0, 415.825, -754.634, 87.799, 1.78024, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+45, 34944, 628, 3, 1, 0, 0, 410.142, -755.332, 87.7991, 1.78024, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+46, 34944, 628, 3, 1, 0, 0, 424.33, -879.352, 88.0446, 0.436332, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+47, 34944, 628, 3, 1, 0, 0, 425.602, -786.646, 87.7991, 5.74213, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+48, 34944, 628, 3, 1, 0, 0, 426.743, -884.939, 87.9613, 0.436332, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+49, 34944, 628, 3, 1, 0, 0, 404.736, -755.495, 87.7989, 1.78024, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+50, 34944, 628, 3, 1, 0, 0, 428.375, -780.797, 87.7991, 5.79449, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+51, 34944, 628, 3, 1, 0, 0, 429.175, -890.436, 88.0446, 0.436332, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+52, 34944, 628, 3, 1, 0, 0, 430.872, -775.278, 87.7991, 5.88176, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+53, 34944, 628, 3, 1, 0, 0, 408.056, -911.283, 88.0445, 4.64258, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+54, 34944, 628, 3, 1, 0, 0, 413.609, -911.566, 88.0447, 4.66003, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+55, 34944, 628, 3, 1, 0, 0, 402.554, -910.557, 88.0446, 4.57276, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+56, 34944, 628, 3, 1, 0, 0, 1158.91, -660.144, 87.9332, 0.750492, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+57, 34944, 628, 3, 1, 0, 0, 1156.22, -866.809, 87.8754, 5.27089, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+58, 34944, 628, 3, 1, 0, 0, 1163.74, -663.67, 88.3571, 0.558505, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+59, 34944, 628, 3, 1, 0, 0, 1135.18, -683.896, 88.0409, 3.9619, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+60, 34944, 628, 3, 1, 0, 0, 1138.91, -836.359, 88.3728, 2.18166, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+61, 34944, 628, 3, 1, 0, 0, 1162.08, -863.717, 88.358, 5.48033, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+62, 34944, 628, 3, 1, 0, 0, 1167.13, -669.212, 87.9682, 0.383972, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+63, 34944, 628, 3, 1, 0, 0, 1137.72, -688.517, 88.4023, 3.9619, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+64, 34944, 628, 3, 1, 0, 0, 1135.29, -840.878, 88.0252, 2.30383, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+65, 34944, 628, 3, 1, 0, 0, 1144.33, -833.309, 87.9268, 2.14675, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+66, 34944, 628, 3, 1, 0, 0, 1135.29, -840.878, 88.0252, 2.30383, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+67, 34944, 628, 3, 1, 0, 0, 1142.59, -691.946, 87.9756, 3.9619, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+68, 34944, 628, 3, 1, 0, 0, 1166.13, -858.391, 87.9653, 5.63741, 180000, 0, 0, 35000, 0, 0, 0);

DELETE FROM creature_battleground WHERE guid IN (SELECT guid FROM creature WHERE map=628);
INSERT INTO creature_battleground (guid, event1, event2) VALUES
-- siege engines
(@CREATURE , 2 , 3),
(@CREATURE+1 , 2 , 4),
-- demolishers
(@CREATURE+2 , 2 , 3),
(@CREATURE+3 , 2 , 3),
(@CREATURE+4 , 2 , 3),
(@CREATURE+5 , 2 , 3),
(@CREATURE+6 , 2 , 4),
(@CREATURE+7 , 2 , 4),
(@CREATURE+8 , 2 , 4),
(@CREATURE+9 , 2 , 4),
-- glaive throwers
(@CREATURE+10 , 0 , 3),
(@CREATURE+11 , 0 , 3),
(@CREATURE+12 , 0 , 4),
(@CREATURE+13 , 0 , 4),
-- catapults
(@CREATURE+14 , 0 , 3),
(@CREATURE+15 , 0 , 3),
(@CREATURE+16 , 0 , 3),
(@CREATURE+17 , 0 , 3),
(@CREATURE+18 , 0 , 4),
(@CREATURE+19 , 0 , 4),
(@CREATURE+20 , 0 , 4),
(@CREATURE+21 , 0 , 4),
-- spirit guides
(@CREATURE+22 , 0 , 3),
(@CREATURE+23 , 1 , 3),
(@CREATURE+24 , 2 , 3),
(@CREATURE+25 , 5 , 3),
(@CREATURE+26 , 6 , 3),
(@CREATURE+28 , 0 , 4),
(@CREATURE+29 , 1 , 4),
(@CREATURE+30 , 2 , 4),
(@CREATURE+31 , 5 , 4),
(@CREATURE+32 , 6 , 4),
-- bosses
(@CREATURE+34 , 12 , 0),
(@CREATURE+35 , 11 , 0),
-- boss guards
(@CREATURE+36 , 10 , 0),
(@CREATURE+37 , 10 , 0),
(@CREATURE+38 , 10 , 0),
(@CREATURE+39 , 10 , 0),
(@CREATURE+40 , 9 , 0),
(@CREATURE+41 , 9 , 0),
(@CREATURE+42 , 9 , 0),
(@CREATURE+43 , 9 , 0),
-- keep cannons
(@CREATURE+44 , 8 , 0),
(@CREATURE+45 , 8 , 0),
(@CREATURE+46 , 8 , 0),
(@CREATURE+47 , 8 , 0),
(@CREATURE+48 , 8 , 0),
(@CREATURE+49 , 8 , 0),
(@CREATURE+50 , 8 , 0),
(@CREATURE+51 , 8 , 0),
(@CREATURE+52 , 8 , 0),
(@CREATURE+53 , 8 , 0),
(@CREATURE+54 , 8 , 0),
(@CREATURE+55 , 8 , 0),
(@CREATURE+56 , 8 , 0),
(@CREATURE+57 , 8 , 0),
(@CREATURE+58 , 8 , 0),
(@CREATURE+59 , 8 , 0),
(@CREATURE+60 , 8 , 0),
(@CREATURE+61 , 8 , 0),
(@CREATURE+62 , 8 , 0),
(@CREATURE+63 , 8 , 0),
(@CREATURE+64 , 8 , 0),
(@CREATURE+65 , 8 , 0),
(@CREATURE+66 , 8 , 0),
(@CREATURE+67 , 8 , 0),
(@CREATURE+68 , 8 , 0);

DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (12066, 12067, 12163);
INSERT INTO achievement_criteria_requirement VALUES
(12066, 0, 0, 0),  -- A-bomb-inable
(12067, 0, 0, 0),  -- A-bomb-ination
(12163, 0, 0, 0);  -- Back Door Job

-- Strand of the Ancients

-- creature and gameobject initial guid
SET @CREATURE := 510000;
SET @GAMEOBJECT := 510000;

DELETE FROM `creature` WHERE `guid` BETWEEN @CREATURE AND @CREATURE+9999;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @GAMEOBJECT AND @GAMEOBJECT+9999;

DELETE FROM battleground_template WHERE id = 9;
INSERT INTO battleground_template (id, MinPlayersPerTeam, MaxPlayersPerTeam, AllianceStartLoc, AllianceStartO, HordeStartLoc, HordeStartO) VALUES (9, 5, 15, 1367, 0, 1368, 0);
-- Rigger Sparklight
UPDATE creature_template SET npcflag = 1, ScriptName = 'npc_sa_vendor' WHERE entry IN (29260, 29262);
-- Seaforium source
-- left this to remove old bad hack
-- DELETE FROM creature_template WHERE entry = 50000;
-- modify some "should not be changed" data in DB
-- dummy radius for passing some check, only 1 charge and 10 seconds delay
UPDATE gameobject_template SET data2 = 1, data4 = 1, data7 = 10 WHERE entry = 190752;
-- set factions for 2 Massive Seaforium Bombs
-- use these if needed in Your DB (maybe already have better factions?)
-- UPDATE gameobject_template SET faction = 3 WHERE entry = 190753;
-- UPDATE gameobject_template SET faction = 6 WHERE entry = 194086;

-- Achievements
DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (6447);
INSERT INTO achievement_criteria_requirement VALUES
(6447, 6, 4384, 0);

-- Doors
UPDATE gameobject_template SET faction = 14 WHERE entry IN (192549, 190727, 190726, 190723, 190724, 190722);
-- Cleanup for UDB, as ytdb doesnt have flag 16 there..
-- UPDATE gameobject_template SET flags=flags|16 WHERE entry = 192829;
UPDATE gameobject_template SET faction = 3 WHERE entry = 194082;
UPDATE gameobject_template SET faction = 6 WHERE entry = 194083;
-- make Defender's Portal usable by all factions (rest is handled by script)
UPDATE gameobject_template SET faction=0 , ScriptName = 'go_sa_def_portal' WHERE entry = 191575;

-- Massive Seaforium Charge (fix wrong use area - "Not valid area" message)
UPDATE item_template SET area = 0, Map = 607 WHERE entry = 39213;

-- Seaforium barrels
UPDATE gameobject_template SET faction = 12, data0 = 52415, data1 = 1 WHERE entry = 190753;
UPDATE gameobject_template SET faction = 29, data0 = 52415, data1 = 1 WHERE entry = 194086;
UPDATE locales_gameobject SET name_loc3 = 'Zephyriumbombe', name_loc6 = 'Barril de Seforio', name_loc7 = 'Barril de Seforio' WHERE entry IN (190753, 194086);

-- Banners - horde/alli occupied, clickable banner
UPDATE gameobject_template SET flags = 0 WHERE entry IN (191309, 191310);

-- Vehicles support
-- Battleground Demolisher
UPDATE creature_template SET npcflag = 0, minlevel = 70, maxlevel = 70, minhealth = 80000, maxhealth = 80000, mechanic_immune_mask = mechanic_immune_mask|1|2|8|16|32|64|128|1024|2048|4096|8192|131072|262144|8388608|16777216|67108864, vehicle_id = 158, ScriptName = '', AIName = 'NullAI' WHERE entry IN (28781, 32796);
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (28781, 32796);
INSERT INTO npc_spellclick_spells (`npc_entry`, `spell_id`, `quest_start`, `quest_start_active`, `quest_end`, `cast_flags`) VALUES
(28781, 60968, 0, 0, 0, 1),
(32796, 60968, 0, 0, 0, 1);
-- Demolishers must not heal
DELETE FROM creature_template_addon WHERE entry IN (28781, 32796);
INSERT INTO creature_template_addon VALUES
(28781, 0, 0, 0, 0, 0, 0, 52455),
(32796, 0, 0, 0, 0, 0, 0, 52455);

-- Antipersonnel Cannon
UPDATE `creature_template` SET npcflag = 0, minlevel = 80, maxlevel = 80, iconName = 'Gunner', unit_flags=4, minhealth = 44910, maxhealth = 44910, faction_A = 35, faction_H = 35, RegenHealth=0, mechanic_immune_mask = mechanic_immune_mask|1|2|8|16|32|64|128|1024|2048|4096|8192|131072|262144|8388608|16777216|67108864, ScriptName = '', AIName = 'NullAI' WHERE entry IN (27894, 32795);
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27894, 32795);
INSERT INTO npc_spellclick_spells (`npc_entry`, `spell_id`, `quest_start`, `quest_start_active`, `quest_end`, `cast_flags`) VALUES
(27894, 60968, 0, 0, 0, 1),
(32795, 60968, 0, 0, 0, 1);
-- Cannon must not heal
DELETE FROM creature_template_addon WHERE entry IN (27894, 32795);
INSERT INTO creature_template_addon VALUES
(27894, 0, 0, 0, 0, 0, 0, 52455),
(32795, 0, 0, 0, 0, 0, 0, 52455);

-- Rigger Sparklight
DELETE FROM creature WHERE map=607;
INSERT INTO creature (guid,id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,DeathState,MovementType)  VALUES
(@CREATURE, 29260, 607, 3, 1, 0, 0, 1360.81, -322.18, 36.83, 0.32, 800, 0, 0, 6986, 0, 0, 0),
(@CREATURE+1, 29262, 607, 3, 1, 0, 0, 1363.87, 220.95, 37.06, 2.67, 800, 0, 0, 6986, 0, 0, 0),
-- Antipersonnel Cannon
(@CREATURE+2, 27894, 607, 3, 1, 0, 0, 1421.94, -196.53, 42.18, 0.90, 800, 0, 0, 63000, 0, 0, 0),
(@CREATURE+3, 27894, 607, 3, 1, 0, 0, 1455.09, -219.92, 41.95, 1.03, 800, 0, 0, 63000, 0, 0, 0),
(@CREATURE+4, 27894, 607, 3, 1, 0, 0, 1405.33, 84.25, 41.18, 5.40, 800, 0, 0, 63000, 0, 0, 0),
(@CREATURE+5, 27894, 607, 3, 1, 0, 0, 1436.51, 110.02, 41.40, 5.32, 800, 0, 0, 63000, 0, 0, 0),
(@CREATURE+6, 27894, 607, 3, 1, 0, 0, 1236.33, 92.17, 64.96, 5.68, 800, 0, 0, 63000, 0, 0, 0),
(@CREATURE+7, 27894, 607, 3, 1, 0, 0, 1215.04, 57.73, 64.73, 5.71, 800, 0, 0, 63000, 0, 0, 0),
(@CREATURE+8, 27894, 607, 3, 1, 0, 0, 1232.35, -187.34, 66.94, 0.37, 800, 0, 0, 63000, 0, 0, 0),
(@CREATURE+9, 27894, 607, 3, 1, 0, 0, 1249.95, -223.74, 66.72, 0.43, 800, 0, 0, 63000, 0, 0, 0),
(@CREATURE+10, 27894, 607, 3, 1, 0, 0, 1068.82, -127.38, 96.44, 0.06, 800, 0, 0, 63000, 0, 0, 0),
(@CREATURE+11, 27894, 607, 3, 1, 0, 0, 1068.35, -87.04, 93.80, 6.24, 800, 0, 0, 63000, 0, 0, 0),
-- Battleground Demolisher
(@CREATURE+12, 28781, 607, 3, 1, 0, 0, 1582.57, -96.37, 8.47, 5.57, 10, 0, 0, 80000, 0, 0, 0),
(@CREATURE+13, 28781, 607, 3, 1, 0, 0, 1610.55, -117.52, 8.77, 2.44, 10, 0, 0, 80000, 0, 0, 0),
(@CREATURE+14, 28781, 607, 3, 1, 0, 0, 1594.24, 39.16, 7.49, 0.62, 10, 0, 0, 80000, 0, 0, 0),
(@CREATURE+15, 28781, 607, 3, 1, 0, 0, 1618.60, 62.26, 7.17, 3.61, 10, 0, 0, 80000, 0, 0, 0),
(@CREATURE+16, 28781, 607, 3, 1, 0, 0, 1371.2, -317.169, 34.9982, 1.93504, 10, 0, 0, 80000, 0, 0, 0),
(@CREATURE+17, 28781, 607, 3, 1, 0, 0, 1365.52, -301.854, 34.0439, 1.91998, 10, 0, 0, 80000, 0, 0, 0),
(@CREATURE+18, 28781, 607, 3, 1, 0, 0, 1353.28, 224.092, 35.2432, 4.35363, 10, 0, 0, 80000, 0, 0, 0),
(@CREATURE+19, 28781, 607, 3, 1, 0, 0, 1347.65, 208.805, 34.2892, 4.39378, 10, 0, 0, 80000, 0, 0, 0),
-- Horde and Alliance Spirit Guides
(@CREATURE+20, 13116, 607, 3, 1, 0, 0, 1400.49, -293.963, 32.0608, 2.08096, 10, 0, 0, 37890, 6310, 0, 0),
(@CREATURE+21, 13117, 607, 3, 1, 0, 0, 1400.49, -293.963, 32.0608, 2.08096, 10, 0, 0, 37420, 6310, 0, 0),
(@CREATURE+22, 13116, 607, 3, 1, 0, 0, 1400.49, -293.963, 32.0608, 2.08096, 10, 0, 0, 37890, 6310, 0, 0),
(@CREATURE+23, 13117, 607, 3, 1, 0, 0, 1400.49, -293.963, 32.0608, 2.08096, 10, 0, 0, 37420, 6310, 0, 0),
(@CREATURE+24, 13116, 607, 3, 1, 0, 0, 1389.22, 205.673, 32.0597, 4.445, 10, 0, 0, 37890, 6310, 0, 0),
(@CREATURE+25, 13117, 607, 3, 1, 0, 0, 1389.22, 205.673, 32.0597, 4.445, 10, 0, 0, 37420, 6310, 0, 0),
(@CREATURE+26, 13116, 607, 3, 1, 0, 0, 1389.22, 205.673, 32.0597, 4.445, 10, 0, 0, 37890, 6310, 0, 0),
(@CREATURE+27, 13117, 607, 3, 1, 0, 0, 1389.22, 205.673, 32.0597, 4.445, 10, 0, 0, 37420, 6310, 0, 0),
(@CREATURE+28, 13116, 607, 3, 1, 0, 0, 1111.58, 6.40605, 69.2963, 6.20037, 10, 0, 0, 37890, 6310, 0, 0),
(@CREATURE+29, 13117, 607, 3, 1, 0, 0, 1111.58, 6.40605, 69.2963, 6.20037, 10, 0, 0, 37420, 6310, 0, 0),
(@CREATURE+30, 13116, 607, 3, 1, 0, 0, 1111.58, 6.40605, 69.2963, 6.20037, 10, 0, 0, 37890, 6310, 0, 0),
(@CREATURE+31, 13117, 607, 3, 1, 0, 0, 1111.58, 6.40605, 69.2963, 6.20037, 10, 0, 0, 37420, 6310, 0, 0),
(@CREATURE+32, 13116, 607, 3, 1, 0, 0, 952.963, -192.742, 92.3584, 0.35779, 10, 0, 0, 37890, 6310, 0, 0),
(@CREATURE+33, 13117, 607, 3, 1, 0, 0, 952.963, -192.742, 92.3584, 0.35779, 10, 0, 0, 37420, 6310, 0, 0),
(@CREATURE+34, 13116, 607, 3, 1, 0, 0, 1448.78, -52.9605, 5.74272, 0.0530517, 10, 0, 0, 37890, 6310, 0, 0),
(@CREATURE+35, 13117, 607, 3, 1, 0, 0, 1448.78, -52.9605, 5.74272, 0.0530517, 10, 0, 0, 37420, 6310, 0, 0);

DELETE FROM creature_battleground WHERE guid IN (SELECT guid FROM creature WHERE map=607);
INSERT INTO creature_battleground VALUES
-- Workshops
(@CREATURE, 9, 0),
(@CREATURE+1, 9, 0),
-- Antipersonnel Cannon
(@CREATURE+2, 10, 0),
(@CREATURE+3, 10, 0),
(@CREATURE+4, 10, 0),
(@CREATURE+5, 10, 0),
(@CREATURE+6, 10, 0),
(@CREATURE+7, 10, 0),
(@CREATURE+8, 10, 0),
(@CREATURE+9, 10, 0),
(@CREATURE+10, 10, 0),
(@CREATURE+11, 10, 0),
-- Battleground Demolisher
(@CREATURE+12, 9, 0),
(@CREATURE+13, 9, 0),
(@CREATURE+14, 9, 0),
(@CREATURE+15, 9, 0),
(@CREATURE+16, 12, 0),
(@CREATURE+17, 12, 0),
(@CREATURE+18, 13, 0),
(@CREATURE+19, 13, 0),
-- Horde and Alliance Spirit Guides
(@CREATURE+20, 0, 1),
(@CREATURE+21, 0, 2),
(@CREATURE+22, 0, 3),
(@CREATURE+23, 0, 4),
(@CREATURE+24, 1, 1),
(@CREATURE+25, 1, 2),
(@CREATURE+26, 1, 3),
(@CREATURE+27, 1, 4),
(@CREATURE+28, 2, 1),
(@CREATURE+29, 2, 2),
(@CREATURE+30, 2, 3),
(@CREATURE+31, 2, 4),
(@CREATURE+32, 3, 3),
(@CREATURE+33, 3, 4),
(@CREATURE+34, 4, 3),
(@CREATURE+35, 4, 4);

DELETE FROM gameobject WHERE map=607;
INSERT INTO gameobject VALUES
-- Titan Relic & Doors
(@GAMEOBJECT, 194082, 607, 3, 1, 836.502, -108.811, 111.587, 0.121379, 0, 0, 0.0606524, 0.998159, 86400, 0, 1),
(@GAMEOBJECT+1, 194083, 607, 3, 1, 836.502, -108.811, 111.587, 0.121379, 0, 0, 0.0606524, 0.998159, 86400, 0, 1),
(@GAMEOBJECT+2, 190727, 607, 3, 1, 1054.47, -107.76, 82.16, 0.06, 0, 0, 0.008726535, 0.9999619, 600, 0, 1),
(@GAMEOBJECT+3, 190726, 607, 3, 1, 1228.62, -212.12, 55.34, 0.48, 0, 0, 0.008726535, 0.9999619, 600, 0, 1),
(@GAMEOBJECT+4, 190723, 607, 3, 1, 1215.82, 80.64, 53.38, 5.68, 0, 0, 0.008726535, 0.9999619, 600, 0, 1),
(@GAMEOBJECT+5, 190724, 607, 3, 1, 1431.05, -219.21, 30.89, 0.83, 0, 0, 0.008726535, 0.9999619, 600, 0, 1),
(@GAMEOBJECT+6, 190722, 607, 3, 1, 1413.15, 107.78, 28.69, 5.42, 0, 0, 0.008726535, 0.9999619, 600, 0, 1),
(@GAMEOBJECT+7, 192549, 607, 3, 1, 873.3, -108.286, 117.171, 0.00894308, 0, 0, 0.00447152, 0.99999, 600, 0, 1),

-- Flags
(@GAMEOBJECT+8, 180058, 607, 3, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1), -- Alliance contested banner
(@GAMEOBJECT+9, 180060, 607, 3, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1), -- Horde contested banner
(@GAMEOBJECT+10, 180058, 607, 3, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1), -- Alliance occupied banner (not clickable)
(@GAMEOBJECT+11, 180060, 607, 3, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1), -- Horde occupied banner
(@GAMEOBJECT+12, 180100, 607, 3, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1), -- Alliance Banner Aura, for contested state
(@GAMEOBJECT+13, 180101, 607, 3, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1), -- Horde Banner Aura, for contested state
(@GAMEOBJECT+14, 180100, 607, 3, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1), -- Alliance Banner Aura, for occupied state
(@GAMEOBJECT+15, 180101, 607, 3, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1), -- Horde Banner Aura, for occupied state
(@GAMEOBJECT+16, 191311, 607, 3, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1), -- Flagpole

(@GAMEOBJECT+17, 180058, 607, 3, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1), -- Alliance Banner
(@GAMEOBJECT+18, 180060, 607, 3, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1), -- Horde Banner
(@GAMEOBJECT+19, 180058, 607, 3, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1), -- Alliance Banner
(@GAMEOBJECT+20, 180060, 607, 3, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1), -- Horde Banner
(@GAMEOBJECT+21, 180100, 607, 3, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1), -- Alliance Banner Aura
(@GAMEOBJECT+22, 180101, 607, 3, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1), -- Horde Banner Aura
(@GAMEOBJECT+23, 180100, 607, 3, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1), -- Alliance Banner Aura
(@GAMEOBJECT+24, 180101, 607, 3, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1), -- Horde Banner Aura
(@GAMEOBJECT+25, 191311, 607, 3, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1), -- Flagpole

(@GAMEOBJECT+26, 180058, 607, 3, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1), -- Alliance Banner
(@GAMEOBJECT+27, 180060, 607, 3, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1), -- Horde Banner
(@GAMEOBJECT+28, 180058, 607, 3, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1), -- Alliance Banner
(@GAMEOBJECT+29, 180060, 607, 3, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1), -- Horde Banner
(@GAMEOBJECT+30, 180100, 607, 3, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1), -- Alliance Banner Aura
(@GAMEOBJECT+31, 180101, 607, 3, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1), -- Horde Banner Aura
(@GAMEOBJECT+32, 180100, 607, 3, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1), -- Alliance Banner Aura
(@GAMEOBJECT+33, 180101, 607, 3, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1), -- Horde Banner Aura
(@GAMEOBJECT+34, 191311, 607, 3, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1), -- Flagpole
-- Defender's Portal
(@GAMEOBJECT+35, 191575, 607, 3, 1, 1468.12, -225.7, 30.8969, 5.68042, 0, 0, 0.296839, -0.954928, 25, 0, 1),
(@GAMEOBJECT+36, 191575, 607, 3, 1, 1394.07, 72.3632, 31.0541, 0.818809, 0, 0, 0.398063, 0.917358, 25, 0, 1),
(@GAMEOBJECT+37, 191575, 607, 3, 1, 1216.12, 47.7665, 54.2785, 4.05465, 0, 0, 0.897588, -0.440835, 25, 0, 1),
(@GAMEOBJECT+38, 191575, 607, 3, 1, 1255.73, -233.153, 56.4357, 5.01833, 0, 0, 0.591105, -0.806595, 25, 0, 1),
(@GAMEOBJECT+39, 191575, 607, 3, 1, 1065.02, -89.9522, 81.0758, 1.58771, 0, 0, 0.71306, 0.701103, 25, 0, 1),
(@GAMEOBJECT+40, 191575, 607, 3, 1, 880.162, -95.979, 109.835, 3.14672, 0, 0, 0.999997, -0.00256531, 25, 0, 1),
(@GAMEOBJECT+41, 191575, 607, 3, 1, 880.68, -120.799, 109.835, 3.16636, 0, 0, 0.999923, -0.0123816, 25, 0, 1),
-- Seaforium Bombs
-- Western base bombs
(@GAMEOBJECT+42, 190753 , 607 , 3 , 1 , 1333.45 , 211.354 , 31.0538 , 5.03666 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+43, 190753 , 607 , 3 , 1 , 1334.29 , 209.582 , 31.0532 , 1.28088 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+44, 190753 , 607 , 3 , 1 , 1332.72 , 210.049 , 31.0532 , 1.28088 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+45, 190753 , 607 , 3 , 1 , 1334.28 , 210.78 , 31.0538 , 3.85856 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+46, 190753 , 607 , 3 , 1 , 1332.64 , 211.39 , 31.0532 , 1.29266 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+47, 190753 , 607 , 3 , 1 , 1371.41 , 194.028 , 31.5107 , 0.753095 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+48, 190753 , 607 , 3 , 1 , 1372.39 , 194.951 , 31.4679 , 0.753095 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+49, 190753 , 607 , 3 , 1 , 1371.58 , 196.942 , 30.9349 , 1.01777 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+50, 190753 , 607 , 3 , 1 , 1370.43 , 196.614 , 30.9349 , 0.957299 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+51, 190753 , 607 , 3 , 1 , 1369.46 , 196.877 , 30.9351 , 2.45348 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+52, 190753 , 607 , 3 , 1 , 1370.35 , 197.361 , 30.9349 , 1.08689 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+53, 190753 , 607 , 3 , 1 , 1369.47 , 197.941 , 30.9349 , 0.984787 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+54, 194086 , 607 , 3 , 1 , 1333.45 , 211.354 , 31.0538 , 5.03666 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+55, 194086 , 607 , 3 , 1 , 1334.29 , 209.582 , 31.0532 , 1.28088 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+56, 194086 , 607 , 3 , 1 , 1332.72 , 210.049 , 31.0532 , 1.28088 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+57, 194086 , 607 , 3 , 1 , 1334.28 , 210.78 , 31.0538 , 3.85856 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+58, 194086 , 607 , 3 , 1 , 1332.64 , 211.39 , 31.0532 , 1.29266 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+59, 194086 , 607 , 3 , 1 , 1371.41 , 194.028 , 31.5107 , 0.753095 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+60, 194086 , 607 , 3 , 1 , 1372.39 , 194.951 , 31.4679 , 0.753095 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+61, 194086 , 607 , 3 , 1 , 1371.58 , 196.942 , 30.9349 , 1.01777 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+62, 194086 , 607 , 3 , 1 , 1370.43 , 196.614 , 30.9349 , 0.957299 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+63, 194086 , 607 , 3 , 1 , 1369.46 , 196.877 , 30.9351 , 2.45348 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+64, 194086 , 607 , 3 , 1 , 1370.35 , 197.361 , 30.9349 , 1.08689 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+65, 194086 , 607 , 3 , 1 , 1369.47 , 197.941 , 30.9349 , 0.984787 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
-- Beach bombs
(@GAMEOBJECT+66, 190753 , 607 , 3 , 1 , 1592.49 , 47.5969 , 7.52271 , 4.63218 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+67, 190753 , 607 , 3 , 1 , 1593.91 , 47.8036 , 7.65856 , 4.63218 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+68, 190753 , 607 , 3 , 1 , 1593.13 , 46.8106 , 7.54073 , 4.63218 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+69, 190753 , 607 , 3 , 1 , 1589.22 , 36.3616 , 7.45975 , 4.64396 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+70, 190753 , 607 , 3 , 1 , 1588.24 , 35.5842 , 7.55613 , 4.79564 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+71, 190753 , 607 , 3 , 1 , 1588.14 , 36.7611 , 7.49675 , 4.79564 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+72, 190753 , 607 , 3 , 1 , 1595.74 , 35.5278 , 7.46602 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+73, 190753 , 607 , 3 , 1 , 1596 , 36.6475 , 7.47991 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+74, 190753 , 607 , 3 , 1 , 1597.03 , 36.2356 , 7.48631 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+75, 190753 , 607 , 3 , 1 , 1597.93 , 37.1214 , 7.51725 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+76, 190753 , 607 , 3 , 1 , 1598.16 , 35.888 , 7.50018 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+77, 190753 , 607 , 3 , 1 , 1579.6 , -98.0917 , 8.48478 , 1.37996 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+78, 190753 , 607 , 3 , 1 , 1581.2 , -98.401 , 8.47483 , 1.37996 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+79, 190753 , 607 , 3 , 1 , 1580.38 , -98.9556 , 8.4772 , 1.38781 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+80, 190753 , 607 , 3 , 1 , 1585.68 , -104.966 , 8.88551 , 0.493246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+81, 190753 , 607 , 3 , 1 , 1586.15 , -106.033 , 9.10616 , 0.493246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+82, 190753 , 607 , 3 , 1 , 1584.88 , -105.394 , 8.82985 , 0.493246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+83, 190753 , 607 , 3 , 1 , 1581.87 , -100.899 , 8.46164 , 0.929142 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+84, 190753 , 607 , 3 , 1 , 1581.48 , -99.4657 , 8.46926 , 0.929142 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+85, 190753 , 607 , 3 , 1 , 1583.2 , -91.2291 , 8.49227 , 1.40038 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+86, 190753 , 607 , 3 , 1 , 1581.94 , -91.0119 , 8.49977 , 1.40038 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+87, 190753 , 607 , 3 , 1 , 1582.33 , -91.951 , 8.49353 , 1.1844 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+88, 194086 , 607 , 3 , 1 , 1592.49 , 47.5969 , 7.52271 , 4.63218 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+89, 194086 , 607 , 3 , 1 , 1593.91 , 47.8036 , 7.65856 , 4.63218 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+90, 194086 , 607 , 3 , 1 , 1593.13 , 46.8106 , 7.54073 , 4.63218 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+91, 194086 , 607 , 3 , 1 , 1589.22 , 36.3616 , 7.45975 , 4.64396 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+92, 194086 , 607 , 3 , 1 , 1588.24 , 35.5842 , 7.55613 , 4.79564 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+93, 194086 , 607 , 3 , 1 , 1588.14 , 36.7611 , 7.49675 , 4.79564 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+94, 194086 , 607 , 3 , 1 , 1595.74 , 35.5278 , 7.46602 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+95, 194086 , 607 , 3 , 1 , 1596 , 36.6475 , 7.47991 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+96, 194086 , 607 , 3 , 1 , 1597.03 , 36.2356 , 7.48631 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+97, 194086 , 607 , 3 , 1 , 1597.93 , 37.1214 , 7.51725 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+98, 194086 , 607 , 3 , 1 , 1598.16 , 35.888 , 7.50018 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+99, 194086 , 607 , 3 , 1 , 1579.6 , -98.0917 , 8.48478 , 1.37996 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+100, 194086 , 607 , 3 , 1 , 1581.2 , -98.401 , 8.47483 , 1.37996 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+101, 194086 , 607 , 3 , 1 , 1580.38 , -98.9556 , 8.4772 , 1.38781 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+102, 194086 , 607 , 3 , 1 , 1585.68 , -104.966 , 8.88551 , 0.493246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+103, 194086 , 607 , 3 , 1 , 1586.15 , -106.033 , 9.10616 , 0.493246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+104, 194086 , 607 , 3 , 1 , 1584.88 , -105.394 , 8.82985 , 0.493246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+105, 194086 , 607 , 3 , 1 , 1581.87 , -100.899 , 8.46164 , 0.929142 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+106, 194086 , 607 , 3 , 1 , 1581.48 , -99.4657 , 8.46926 , 0.929142 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+107, 194086 , 607 , 3 , 1 , 1583.2 , -91.2291 , 8.49227 , 1.40038 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+108, 194086 , 607 , 3 , 1 , 1581.94 , -91.0119 , 8.49977 , 1.40038 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+109, 194086 , 607 , 3 , 1 , 1582.33 , -91.951 , 8.49353 , 1.1844 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
-- Eastern base bombs
(@GAMEOBJECT+110 , 190753 , 607 , 3 , 1 , 1342.06 , -304.049 , 30.9532 , 5.59507 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+111, 190753 , 607 , 3 , 1 , 1340.96 , -304.536 , 30.9458 , 1.28323 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+112, 190753 , 607 , 3 , 1 , 1341.22 , -303.316 , 30.9413 , 0.486051 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+113, 190753 , 607 , 3 , 1 , 1342.22 , -302.939 , 30.986 , 4.87643 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+114, 190753 , 607 , 3 , 1 , 1382.16 , -287.466 , 32.3063 , 4.80968 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+115, 190753 , 607 , 3 , 1 , 1381 , -287.58 , 32.2805 , 4.80968 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+116, 190753 , 607 , 3 , 1 , 1381.55 , -286.536 , 32.3929 , 2.84225 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+117, 190753 , 607 , 3 , 1 , 1382.75 , -286.354 , 32.4099 , 1.00442 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+118, 190753 , 607 , 3 , 1 , 1379.92 , -287.34 , 32.2872 , 3.81615 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+119, 194086 , 607 , 3 , 1 , 1342.06 , -304.049 , 30.9532 , 5.59507 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+120, 194086 , 607 , 3 , 1 , 1340.96 , -304.536 , 30.9458 , 1.28323 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+121, 194086 , 607 , 3 , 1 , 1341.22 , -303.316 , 30.9413 , 0.486051 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+122, 194086 , 607 , 3 , 1 , 1342.22 , -302.939 , 30.986 , 4.87643 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+123, 194086 , 607 , 3 , 1 , 1382.16 , -287.466 , 32.3063 , 4.80968 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+124, 194086 , 607 , 3 , 1 , 1381 , -287.58 , 32.2805 , 4.80968 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+125, 194086 , 607 , 3 , 1 , 1381.55 , -286.536 , 32.3929 , 2.84225 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+126, 194086 , 607 , 3 , 1 , 1382.75 , -286.354 , 32.4099 , 1.00442 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+127, 194086 , 607 , 3 , 1 , 1379.92 , -287.34 , 32.2872 , 3.81615 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
-- Middle bombs (both beach and relic side)
(@GAMEOBJECT+128 , 190753 , 607 , 3 , 1 , 1100.52 , -2.41391 , 70.2984 , 0.131054 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+129, 190753 , 607 , 3 , 1 , 1099.35 , -2.13851 , 70.3375 , 4.4586 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+130, 190753 , 607 , 3 , 1 , 1099.59 , -1.00329 , 70.238 , 2.49903 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+131, 190753 , 607 , 3 , 1 , 1097.79 , 0.571316 , 70.159 , 4.00307 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+132, 190753 , 607 , 3 , 1 , 1098.74 , -7.23252 , 70.7972 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+133, 190753 , 607 , 3 , 1 , 1098.46 , -5.91443 , 70.6715 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+134, 190753 , 607 , 3 , 1 , 1097.53 , -7.39704 , 70.7959 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+135, 190753 , 607 , 3 , 1 , 1097.32 , -6.64233 , 70.7424 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+136, 190753 , 607 , 3 , 1 , 1096.45 , -5.96664 , 70.7242 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+137, 190753 , 607 , 3 , 1 , 971.725 , 0.496763 , 86.8467 , 2.09233 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+138, 190753 , 607 , 3 , 1 , 973.589 , 0.119518 , 86.7985 , 3.17225 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+139, 190753 , 607 , 3 , 1 , 972.524 , 1.25333 , 86.8351 , 5.28497 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+140, 190753 , 607 , 3 , 1 , 971.993 , 2.05668 , 86.8584 , 5.28497 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+141, 190753 , 607 , 3 , 1 , 973.635 , 2.11805 , 86.8197 , 2.36722 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+142, 190753 , 607 , 3 , 1 , 974.791 , 1.74679 , 86.7942 , 1.5936 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+143, 190753 , 607 , 3 , 1 , 974.771 , 3.0445 , 86.8125 , 0.647199 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+144, 190753 , 607 , 3 , 1 , 979.554 , 3.6037 , 86.7923 , 1.69178 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+145, 190753 , 607 , 3 , 1 , 979.758 , 2.57519 , 86.7748 , 1.76639 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+146, 190753 , 607 , 3 , 1 , 980.769 , 3.48904 , 86.7939 , 1.76639 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+147, 190753 , 607 , 3 , 1 , 979.122 , 2.87109 , 86.7794 , 1.76639 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+148, 190753 , 607 , 3 , 1 , 986.167 , 4.85363 , 86.8439 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+149, 190753 , 607 , 3 , 1 , 986.176 , 3.50367 , 86.8217 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+150, 190753 , 607 , 3 , 1 , 987.33 , 4.67389 , 86.8486 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+151, 190753 , 607 , 3 , 1 , 985.23 , 4.65898 , 86.8368 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+152, 190753 , 607 , 3 , 1 , 984.556 , 3.54097 , 86.8137 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+153, 194086 , 607 , 3 , 1 , 1100.52 , -2.41391 , 70.2984 , 0.131054 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+154, 194086 , 607 , 3 , 1 , 1099.35 , -2.13851 , 70.3375 , 4.4586 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+155, 194086 , 607 , 3 , 1 , 1099.59 , -1.00329 , 70.238 , 2.49903 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+156, 194086 , 607 , 3 , 1 , 1097.79 , 0.571316 , 70.159 , 4.00307 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+157, 194086 , 607 , 3 , 1 , 1098.74 , -7.23252 , 70.7972 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+158, 194086 , 607 , 3 , 1 , 1098.46 , -5.91443 , 70.6715 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+159, 194086 , 607 , 3 , 1 , 1097.53 , -7.39704 , 70.7959 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+160, 194086 , 607 , 3 , 1 , 1097.32 , -6.64233 , 70.7424 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+161, 194086 , 607 , 3 , 1 , 1096.45 , -5.96664 , 70.7242 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+162, 194086 , 607 , 3 , 1 , 971.725 , 0.496763 , 86.8467 , 2.09233 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+163, 194086 , 607 , 3 , 1 , 973.589 , 0.119518 , 86.7985 , 3.17225 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+164, 194086 , 607 , 3 , 1 , 972.524 , 1.25333 , 86.8351 , 5.28497 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+165, 194086 , 607 , 3 , 1 , 971.993 , 2.05668 , 86.8584 , 5.28497 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+166, 194086 , 607 , 3 , 1 , 973.635 , 2.11805 , 86.8197 , 2.36722 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+167, 194086 , 607 , 3 , 1 , 974.791 , 1.74679 , 86.7942 , 1.5936 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+168, 194086 , 607 , 3 , 1 , 974.771 , 3.0445 , 86.8125 , 0.647199 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+169, 194086 , 607 , 3 , 1 , 979.554 , 3.6037 , 86.7923 , 1.69178 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+170, 194086 , 607 , 3 , 1 , 979.758 , 2.57519 , 86.7748 , 1.76639 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+171, 194086 , 607 , 3 , 1 , 980.769 , 3.48904 , 86.7939 , 1.76639 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+172, 194086 , 607 , 3 , 1 , 979.122 , 2.87109 , 86.7794 , 1.76639 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+173, 194086 , 607 , 3 , 1 , 986.167 , 4.85363 , 86.8439 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+174, 194086 , 607 , 3 , 1 , 986.176 , 3.50367 , 86.8217 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+175, 194086 , 607 , 3 , 1 , 987.33 , 4.67389 , 86.8486 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+176, 194086 , 607 , 3 , 1 , 985.23 , 4.65898 , 86.8368 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+177, 194086 , 607 , 3 , 1 , 984.556 , 3.54097 , 86.8137 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+178, 192687 , 607 , 3 , 1 , 1415.57 , 105.176 , 41.5615 , 5.44516 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+179, 192689 , 607 , 3 , 1 , 1433.34 , -216.488 , 43.4646 , 0.871786 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+180, 192690 , 607 , 3 , 1 , 1231.73 , -210.455 , 67.8883 , 0.512855 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+181, 192691 , 607 , 3 , 1 , 1218.8 , 78.7113 , 65.5368 , 5.64543 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+182, 192685 , 607 , 3 , 1 , 1057.88 , -107.601 , 94.7255 , 0.0471208 , 0 , 0 , 0 , 0 , 10 , 0 , 0);

DELETE FROM gameobject_battleground WHERE guid IN (SELECT guid FROM gameobject WHERE map=607);
INSERT INTO gameobject_battleground VALUES
-- Titan Relic & Doors
(@GAMEOBJECT, 14, 1),
(@GAMEOBJECT+1, 14, 2),
(@GAMEOBJECT+2, 11, 0),
(@GAMEOBJECT+3, 11, 0),
(@GAMEOBJECT+4, 11, 0),
(@GAMEOBJECT+5, 11, 0),
(@GAMEOBJECT+6, 11, 0),
(@GAMEOBJECT+7, 11, 0),

(@GAMEOBJECT+8, 0, 1),
(@GAMEOBJECT+9, 0, 2),
(@GAMEOBJECT+10, 0, 3),
(@GAMEOBJECT+11, 0, 4),
(@GAMEOBJECT+12, 0, 1),
(@GAMEOBJECT+13, 0, 2),
(@GAMEOBJECT+14, 0, 3),
(@GAMEOBJECT+15, 0, 4),
(@GAMEOBJECT+16, 11, 0),

(@GAMEOBJECT+17, 1, 1),
(@GAMEOBJECT+18, 1, 2),
(@GAMEOBJECT+19, 1, 3),
(@GAMEOBJECT+20, 1, 4),
(@GAMEOBJECT+21, 1, 1),
(@GAMEOBJECT+22, 1, 2),
(@GAMEOBJECT+23, 1, 3),
(@GAMEOBJECT+24, 1, 4),
(@GAMEOBJECT+25, 11, 0),

(@GAMEOBJECT+26, 2, 1),
(@GAMEOBJECT+27, 2, 2),
(@GAMEOBJECT+28, 2, 3),
(@GAMEOBJECT+29, 2, 4),
(@GAMEOBJECT+30, 2, 1),
(@GAMEOBJECT+31, 2, 2),
(@GAMEOBJECT+32, 2, 3),
(@GAMEOBJECT+33, 2, 4),
(@GAMEOBJECT+34, 11, 0),
-- Defender's Portal
(@GAMEOBJECT+35, 11, 0),
(@GAMEOBJECT+36, 11, 0),
(@GAMEOBJECT+37, 11, 0),
(@GAMEOBJECT+38, 11, 0),
(@GAMEOBJECT+39, 11, 0),
(@GAMEOBJECT+40, 11, 0),
(@GAMEOBJECT+41, 11, 0),
-- Seaforium Bombs
-- Western base bombs
(@GAMEOBJECT+42, 6, 3),
(@GAMEOBJECT+43, 6, 3),
(@GAMEOBJECT+44, 6, 3),
(@GAMEOBJECT+45, 6, 3),
(@GAMEOBJECT+46, 6, 3),
(@GAMEOBJECT+47, 6, 3),
(@GAMEOBJECT+48, 6, 3),
(@GAMEOBJECT+49, 6, 3),
(@GAMEOBJECT+50, 6, 3),
(@GAMEOBJECT+51, 6, 3),
(@GAMEOBJECT+52, 6, 3),
(@GAMEOBJECT+53, 6, 3),
(@GAMEOBJECT+54, 6, 4),
(@GAMEOBJECT+55, 6, 4),
(@GAMEOBJECT+56, 6, 4),
(@GAMEOBJECT+57, 6, 4),
(@GAMEOBJECT+58, 6, 4),
(@GAMEOBJECT+59, 6, 4),
(@GAMEOBJECT+60, 6, 4),
(@GAMEOBJECT+61, 6, 4),
(@GAMEOBJECT+62, 6, 4),
(@GAMEOBJECT+63, 6, 4),
(@GAMEOBJECT+64, 6, 4),
(@GAMEOBJECT+65, 6, 4),
-- Beach bombs
(@GAMEOBJECT+66, 8, 3),
(@GAMEOBJECT+67, 8, 3),
(@GAMEOBJECT+68, 8, 3),
(@GAMEOBJECT+69, 8, 3),
(@GAMEOBJECT+70, 8, 3),
(@GAMEOBJECT+71, 8, 3),
(@GAMEOBJECT+72, 8, 3),
(@GAMEOBJECT+73, 8, 3),
(@GAMEOBJECT+74, 8, 3),
(@GAMEOBJECT+75, 8, 3),
(@GAMEOBJECT+76, 8, 3),
(@GAMEOBJECT+77, 8, 3),
(@GAMEOBJECT+78, 8, 3),
(@GAMEOBJECT+79, 8, 3),
(@GAMEOBJECT+80, 8, 3),
(@GAMEOBJECT+81, 8, 3),
(@GAMEOBJECT+82, 8, 3),
(@GAMEOBJECT+83, 8, 3),
(@GAMEOBJECT+84, 8, 3),
(@GAMEOBJECT+85, 8, 3),
(@GAMEOBJECT+86, 8, 3),
(@GAMEOBJECT+87, 8, 3),
(@GAMEOBJECT+88, 8, 4),
(@GAMEOBJECT+89, 8, 4),
(@GAMEOBJECT+90, 8, 4),
(@GAMEOBJECT+91, 8, 4),
(@GAMEOBJECT+92, 8, 4),
(@GAMEOBJECT+93, 8, 4),
(@GAMEOBJECT+94, 8, 4),
(@GAMEOBJECT+95, 8, 4),
(@GAMEOBJECT+96, 8, 4),
(@GAMEOBJECT+97, 8, 4),
(@GAMEOBJECT+98, 8, 4),
(@GAMEOBJECT+99, 8, 4),
(@GAMEOBJECT+100, 8, 4),
(@GAMEOBJECT+101, 8, 4),
(@GAMEOBJECT+102, 8, 4),
(@GAMEOBJECT+103, 8, 4),
(@GAMEOBJECT+104, 8, 4),
(@GAMEOBJECT+105, 8, 4),
(@GAMEOBJECT+106, 8, 4),
(@GAMEOBJECT+107, 8, 4),
(@GAMEOBJECT+108, 8, 4),
(@GAMEOBJECT+109, 8, 4),
-- Eastern base bombs
(@GAMEOBJECT+110, 5, 4),
(@GAMEOBJECT+111, 5, 3),
(@GAMEOBJECT+112, 5, 3),
(@GAMEOBJECT+113, 5, 3),
(@GAMEOBJECT+114, 5, 3),
(@GAMEOBJECT+115, 5, 3),
(@GAMEOBJECT+116, 5, 3),
(@GAMEOBJECT+117, 5, 3),
(@GAMEOBJECT+118, 5, 3),
(@GAMEOBJECT+119, 5, 4),
(@GAMEOBJECT+120, 5, 4),
(@GAMEOBJECT+121, 5, 4),
(@GAMEOBJECT+122, 5, 4),
(@GAMEOBJECT+123, 5, 4),
(@GAMEOBJECT+124, 5, 4),
(@GAMEOBJECT+125, 5, 4),
(@GAMEOBJECT+126, 5, 4),
(@GAMEOBJECT+127, 5, 4),
-- Middle bombs (both beach and relic side)
(@GAMEOBJECT+128, 7, 3),
(@GAMEOBJECT+129, 7, 3),
(@GAMEOBJECT+130, 7, 3),
(@GAMEOBJECT+131, 7, 3),
(@GAMEOBJECT+132, 7, 3),
(@GAMEOBJECT+133, 7, 3),
(@GAMEOBJECT+134, 7, 3),
(@GAMEOBJECT+135, 7, 3),
(@GAMEOBJECT+136, 7, 3),
(@GAMEOBJECT+137, 7, 3),
(@GAMEOBJECT+138, 7, 3),
(@GAMEOBJECT+139, 7, 3),
(@GAMEOBJECT+140, 7, 3),
(@GAMEOBJECT+141, 7, 3),
(@GAMEOBJECT+142, 7, 3),
(@GAMEOBJECT+143, 7, 3),
(@GAMEOBJECT+144, 7, 3),
(@GAMEOBJECT+145, 7, 3),
(@GAMEOBJECT+146, 7, 3),
(@GAMEOBJECT+147, 7, 3),
(@GAMEOBJECT+148, 7, 3),
(@GAMEOBJECT+149, 7, 3),
(@GAMEOBJECT+150, 7, 3),
(@GAMEOBJECT+151, 7, 3),
(@GAMEOBJECT+152, 7, 3),
(@GAMEOBJECT+153, 7, 4),
(@GAMEOBJECT+154, 7, 4),
(@GAMEOBJECT+155, 7, 4),
(@GAMEOBJECT+156, 7, 4),
(@GAMEOBJECT+157, 7, 4),
(@GAMEOBJECT+158, 7, 4),
(@GAMEOBJECT+159, 7, 4),
(@GAMEOBJECT+160, 7, 4),
(@GAMEOBJECT+161, 7, 4),
(@GAMEOBJECT+162, 7, 4),
(@GAMEOBJECT+163, 7, 4),
(@GAMEOBJECT+164, 7, 4),
(@GAMEOBJECT+165, 7, 4),
(@GAMEOBJECT+166, 7, 4),
(@GAMEOBJECT+167, 7, 4),
(@GAMEOBJECT+168, 7, 4),
(@GAMEOBJECT+169, 7, 4),
(@GAMEOBJECT+170, 7, 4),
(@GAMEOBJECT+171, 7, 4),
(@GAMEOBJECT+172, 7, 4),
(@GAMEOBJECT+173, 7, 4),
(@GAMEOBJECT+174, 7, 4),
(@GAMEOBJECT+175, 7, 4),
(@GAMEOBJECT+176, 7, 4),
(@GAMEOBJECT+177, 7, 4),
(@GAMEOBJECT+178, 15, 0),
(@GAMEOBJECT+179, 16, 0),
(@GAMEOBJECT+180, 17, 0),
(@GAMEOBJECT+181, 18, 0),
(@GAMEOBJECT+182, 19, 0);

DELETE FROM battleground_events WHERE map = 607;
INSERT INTO battleground_events (map, event1, event2, description) VALUES
(607, 0, 1, 'East gy - A contested'),   -- flags, spirit healers only
(607, 0, 2, 'East gy - H contested'),
(607, 0, 3, 'East gy - A occupied'),
(607, 0, 4, 'East gy - H occupied'),
(607, 1, 1, 'West gy - A contested'),
(607, 1, 2, 'West gy - H contested'),
(607, 1, 3, 'West gy - A occupied'),
(607, 1, 4, 'West gy - H occupied'),
(607, 2, 1, 'Central gy - A contested'),
(607, 2, 2, 'Central gy - H contested'),
(607, 2, 3, 'Central gy - A occupied'),
(607, 2, 4, 'Central gy - H occupied'),
(607, 3, 3, 'Relic gy A'),
(607, 3, 4, 'Relic gy H'),
(607, 4, 3, 'Beach gy A'),
(607, 4, 4, 'Beach gy H'),
(607, 5, 3, 'East bombs - A occupied'), -- bombs only
(607, 5, 4, 'East bombs - H occupied'),
(607, 6, 3, 'West bombs - A occupied'),
(607, 6, 4, 'West bombs - H occupied'),
(607, 7, 3, 'Central bombs - A occupied'),
(607, 7, 4, 'Central bombs - H occupied'),
(607, 8, 3, 'Beach bombs - A occupied'),
(607, 8, 4, 'Beach bombs - H occupied'),
(607, 9, 0, 'Dock demolishers, factory npcs'),
(607, 10, 0, 'Defender cannons'),
(607, 11, 0, 'Gameobjects'),            -- flagpoles, defender portals, gates, relic
(607, 12, 0, 'E base demolishers'),
(607, 13, 0, 'W base demolishers'),
(607, 14, 1, 'Titan Relic - A attacking'),
(607, 14, 2, 'Titan Relic - H attacking'),
(607, 15, 0, 'Green sigil'),
(607, 16, 0, 'Blue sigil'),
(607, 17, 0, 'Red sigil'),
(607, 18, 0, 'Purple sigil'),
(607, 19, 0, 'Yellow sigil');

-- Fix Rotation for all Objects in Map
UPDATE gameobject SET rotation0=0, rotation1=0, rotation2=SIN(orientation*0.5), rotation3=COS(orientation*0.5) WHERE map = 607;

DELETE FROM mangos_string WHERE entry BETWEEN 20000 AND 20044;
INSERT INTO mangos_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES
(20000, 'The battle for Strand of the Ancients begins in 2 minute.', NULL, NULL, 'Die Schlacht um den Strand der Uralten beginnt in 2 Minuten.', NULL, NULL, 'La batalla por la Playa de los Ancestros comenzará en 2 minutos.', 'La batalla por la Playa de los Ancestros comenzará en 2 minutos.', 'Битва за Берег Древних начнется через 2 минуты.'),
(20001, 'The battle for Strand of the Ancients begins in 1 minute.', NULL, NULL, 'Die Schlacht um den Strand der Uralten beginnt in 1 Minute.', NULL, NULL, 'La batalla por la Playa de los Ancestros comenzará en 1 minuto.', 'La batalla por la Playa de los Ancestros comenzará en 1 minuto.', 'Битва за Берег Древних начнется через 1 минуту.'),
(20002, 'The battle for Strand of the Ancients begins in 30 seconds.', NULL, NULL, 'Die Schlacht um den Strand der Uralten beginnt in 30 Sekunden.', NULL, NULL, 'La batalla por la Playa de los Ancestros comenzará en 30 segundos. ¡Preparaos!', 'La batalla por la Playa de los Ancestros comenzará en 30 segundos. ¡Preparaos!', 'Битва за Берег Древних начнется через 30 секунд. Приготовтесь!'),
(20003, 'The battle for Strand of the Ancients has begun!', NULL, NULL, 'Lasst die Schlacht um den Strand der Uralten beginnen!', NULL, NULL, '¡Que comience la batalla por la Playa de los Ancestros!', '¡Que comience la batalla por la Playa de los Ancestros!', 'Битва за Берег Древних началась! '),
(20004, 'The %s is under attack!', NULL, NULL, '%s wird angegriffen!', NULL, NULL, '¡La puerta %s esta siendo asediada!', '¡La puerta %s esta siendo asediada!', 'Врата %s подвергаются нападению!'),
(20005, 'The %s is damaged!', NULL, NULL, '%s ist beschadigt!', NULL, NULL, '¡La puerta %s ha sido dañada!', '¡La puerta %s ha sido dañada!', 'Врата %s повреждены!'),
(20006, 'The %s was destroyed!', NULL, NULL, '%s ist zerstort!', NULL, NULL, '¡La puerta %s ha sido destruida!', '¡La puerta %s ha sido destruida!', 'Врата %s уничтожены!'),
(20007, 'Gate of the Green Emerald', NULL, NULL, 'Das Tor des Smaragdhorizonts', NULL, NULL, 'de la Esmeralda Verde', 'de la Esmeralda Verde', 'Зеленого изумруда'),
(20008, 'Gate of the Blue Sapphire', NULL, NULL, 'Das Tor des Saphirhimmels', NULL, NULL, 'del Zafiro Azul', 'del Zafiro Azul', 'Синего сапфира'),
(20009, 'Gate of the Purple Amethyst', NULL, NULL, 'Das Tor des Amethysystems', NULL, NULL, 'de la Amatista Púrpura', 'de la Amatista Púrpura', 'Лилового аметиста'),
(20010, 'Gate of the Red Sun', NULL, NULL, 'Das Tor der Rubinsonne', NULL, NULL, 'del Sol Rojo', 'del Sol Rojo', 'Красного солнца'),
(20011, 'Gate of the Yellow Moon', NULL, NULL, 'Das Tor des Goldmondes', NULL, NULL, 'de la Luna Amarilla', 'de la Luna Amarilla', 'Желтой луны'),
(20012, 'Chamber of Ancient Relics', NULL, NULL,'Die Kammer der Uralten', NULL, NULL, 'Cámara de Reliquias Antiguas', 'Cámara de Reliquias Antiguas', 'Комната древних святынь'),
(20013, 'East graveyard!', NULL, NULL, 'ostlicher Friedhof!', NULL, NULL, 'Cementerio Este', 'Cementerio Este', 'Восточное кладбище!'),
(20014, 'West graveyard!', NULL, NULL, 'westlicher Friedhof!', NULL, NULL, 'Cementerio Oeste', 'Cementerio Oeste', 'Западное кладбище!'),
(20015, 'South graveyard!', NULL, NULL, 'sudlicher Friedhof!', NULL, NULL, 'Cementerio Sur', 'Cementerio Sur', 'Южное кладбище!'),
(20016, '$n placed a Seaforium Charge!', NULL, NULL, '$n plaziert eine Zephyriumladung!', NULL, NULL, '¡$n ha colocado una carga de seforio!', '¡$n ha colocado una carga de seforio!', '$n заложил сифориевый заряд!'),
(20017, 'The Alliance won the first round, the Relic of Titan was captured!', NULL, NULL, 'Die Allianz hat die erste Runde gewonnen, das Titanenportal erobert!', NULL, NULL, '¡La Alianza gana la primera ronda! ¡La reliquia de Titán ha sido capturada!', '¡La Alianza gana la primera ronda! ¡La reliquia de Titán ha sido capturada!', 'Первый раунд за Альянсом! Реликвия Титана захвачена!'),
(20018, 'The Horde won the first round, the Relic of Titan was captured!', NULL, NULL, 'Die Horde hat die erste Runde gewonnen, das Titanenportal erobert!', NULL, NULL, '¡La Horda gana la primera ronda! ¡La reliquia de Titán ha sido capturada!', '¡La Horda gana la primera ronda! ¡La reliquia de Titán ha sido capturada!', 'Первый раунд за Ордой! Реликвия Титана захвачена!'),
(20019, 'The Alliance won the second round, the Relic of Titan was captured!', NULL, NULL, 'Die Allianz hat die zweite Runde gewonnen, das Titanenportal erobert!', NULL, NULL, '¡La Horda gana la segunda ronda! ¡La reliquia de Titán ha sido capturada!', '¡La Horda gana la segunda ronda! ¡La reliquia de Titán ha sido capturada!', 'Второй раунд за Альянсом! Реликвия Титана захвачена!'),
(20020, 'The Horde won the second round, the Relic of Titan was captured!', NULL, NULL, 'Die Horde hat die zweite Runde gewonnen, das Titanenportal erobert!', NULL, NULL, '¡La Alianza gana la segunda ronda! ¡La reliquia de Titán ha sido capturada!', '¡La Alianza gana la segunda ronda! ¡La reliquia de Titán ha sido capturada!', 'Второй раунд за Ордой! Реликвия Титана захвачена!'),
(20021, 'The Eastern Graveyard has been captured by the Horde!', NULL, NULL, NULL, NULL, NULL, '¡La Horda ha capturado el cementerio oriental!', '¡La Horda ha capturado el cementerio oriental!', 'Орда захватила Восточное кладбище!'),
(20022, 'The Western Graveyard has been captured by the Horde!', NULL, NULL, NULL, NULL, NULL, '¡La Horda ha capturado el cementerio occidental!', '¡La Horda ha capturado el cementerio occidental!', 'Орда захватила Западное кладбище!'),
(20023, 'The Southern Graveyard has been captured by the Horde!', NULL, NULL, NULL, NULL, NULL, '¡La Horda ha capturado el cementerio sur!', '¡La Horda ha capturado el cementerio sur!', 'Орда захватила Южное кладбище!'),
(20024, 'The Eastern Graveyard has been captured by the Alliance!', NULL, NULL, NULL, NULL, NULL, '¡La Alianza ha capturado el cementerio oriental!', '¡La Alianza ha capturado el cementerio oriental!', 'Альянс захватил Восточное кладбище!'),
(20025, 'The Western Graveyard has been captured by the Alliance!', NULL, NULL, NULL, NULL, NULL, '¡La Alianza ha capturado el cementerio occidental!', '¡La Alianza ha capturado el cementerio occidental!', 'Альянс захватил Западное кладбище!'),
(20026, 'The Southern Graveyard has been captured by the Alliance!', NULL, NULL, NULL, NULL, NULL, '¡La Alianza ha capturado el cementerio sur!', '¡La Alianza ha capturado el cementerio sur!', 'Альянс захватил Южное кладбище!'),
(20027, 'The chamber has been breached! The Titan Relic is vulnerable!', NULL, NULL, NULL, NULL, NULL, '¡La puerta de la Cámara de Reliquias antiguas ha sido destruida! ¡La reliquia de titán es vulnerable!', '¡La puerta de la Cámara de Reliquias antiguas ha sido destruida! ¡La reliquia de titán es vulnerable!', 'Комната древних святынь разрушена!'),
(20028, 'The Gate of the Green Emerald was destroyed!', NULL, NULL, 'Das Tor des Smaragdhorizonts ist zerstort!', NULL, NULL, '¡La puerta de la Esmeralda Verde ha sido destruida!', '¡La puerta de la Esmeralda Verde ha sido destruida!', 'Врата Зеленого Изумруда разрушены!'),
(20029, 'The Gate of the Blue Sapphire was destroyed!', NULL, NULL, 'Das Tor des Saphirhimmels ist zerstort!', NULL, NULL, '¡La puerta del Zafiro Azul ha sido destruida!', '¡La puerta del Zafiro Azul ha sido destruida!', 'Врата Синего Сапфира разрушены!'),
(20030, 'The Gate of the Purple Amethyst was destroyed!', NULL, NULL, 'Das Tor des Amethyststerns ist zerstort worden', NULL, NULL, '¡La puerta de la Amatista Púrpura ha sido destruida!', '¡La puerta de la Amatista Púrpura ha sido destruida!', 'Врата Лилового Аметиста разрушены!'),
(20031, 'The Gate of the Red Sun was destroyed!', NULL, NULL, 'Das Tor der Rubinsonne ist zerstort worden!', NULL, NULL, '¡La puerta del Sol Rojo ha sido destruida!', '¡La puerta del Sol Rojo ha sido destruida!', 'Врата Красного Солнца разрушены!'),
(20032, 'The Gate of the Yellow Moon was destroyed!', NULL, NULL, 'Das Tor des Goldmondes ist zerstort worden!', NULL, NULL, '¡La puerta de la Luna Amarilla ha sido destruida!', '¡La puerta de la Luna Amarilla ha sido destruida!', 'Врата Желтой Луны разрушены!'),
(20033, 'The Chamber of Ancient Relics is under attack!',  NULL,  NULL,  NULL,  NULL,  NULL, '¡La puerta de la Cámara de Reliquias antiguas esta siendo asediada!',  '¡La puerta de la Cámara de Reliquias antiguas esta siendo asediada!',  'Комната древних святынь повреждена!'),
(20034, 'The Gate of the Green Emerald is damaged!', NULL, NULL, 'Das Tor des Smaragdhorizonts ist beschadigt worden', NULL, NULL, '¡La puerta de la Esmeralda Verde ha sido dañada!', '¡La puerta de la Esmeralda Verde ha sido dañada!', 'Врата Зеленого Изумруда повреждены!'),
(20035, 'The Gate of the Blue Sapphire is damaged!', NULL, NULL, 'Das Tor des Saphirhimmels ist beschadigt worden!', NULL, NULL, '¡La puerta del Zafiro Azul ha sido dañada!', '¡La puerta del Zafiro Azul ha sido dañada!', 'Врата Синего Сапфира повреждены!'),
(20036, 'The Gate of the Purple Amethyst is damaged!', NULL, NULL, 'Das Tor des Amethyststerns ist beschadigt worden!', NULL, NULL, '¡La puerta de la Amatista Púrpura ha sido dañada!', '¡La puerta de la Amatista Púrpura ha sido dañada!', 'Врата Лилового Аметиста повреждены!'),
(20037, 'The Gate of the Red Sun is damaged!', NULL, NULL, 'Das Tor der Rubinsonne ist beschadigt worden!', NULL, NULL, '¡La puerta del Sol Rojo ha sido dañada!', '¡La puerta del Sol Rojo ha sido dañada!', 'Врата Красного Солнца повреждены!'),
(20038, 'The Gate of the Yellow Moon is damaged!', NULL, NULL, 'Das Tor des Goldmondes ist beschadigt worden!', NULL, NULL, '¡La puerta de la Luna Amarilla ha sido dañada!', '¡La puerta de la Luna Amarilla ha sido dañada!', 'Врата Желтой Луны повреждены!'),
(20039, 'The Horde won the first round, the Relic of Titan was no captured!', NULL, NULL, 'Runde 1 - Beendet!', NULL, NULL, '¡Ronda 1 acabada!', '¡Ronda 1 acabada!', 'Первый раунд за Ордой! Реликвия Титана не была захвачена!'),
(20040, 'The Alliance won the first round, the Relic of Titan was no captured!', NULL, NULL, 'Runde 1 - Beendet!', NULL, NULL, '¡Ronda 1 acabada!', '¡Ronda 1 acabada!', 'Первый раунд за Альянсом! Реликвия Титана не была захвачена!'),
(20041, 'The Horde won the second round, the Relic of Titan was no captured!', NULL, NULL, 'Runde 2 - Beendet!', NULL, NULL, '¡Ronda 2 acabada!', '¡Ronda 2 acabada!', 'Второй раунд за Ордой! Реликвия Титана не была захвачена!'),
(20042, 'The Alliance won the second round, the Relic of Titan was no captured!', NULL, NULL, 'Runde 2 - Beendet!', NULL, NULL, '¡Ronda 2 acabada!', '¡Ronda 2 acabada!', 'Второй раунд за Альянсом! Реликвия Титана не была захвачена!'),
(20043, 'Round 1 - Finished!',  NULL,  NULL,  'Runde 1 - Beendet!',  NULL,  NULL,  '¡Ronda 1 acabada!', '¡Ronda 1 acabada!', 'Первый раунд окончен'),
(20044, 'The game has ended in a draw!', NULL, NULL, 'Das Spiel ist unentschieden!!!', NULL, NULL, '¡El campo de batalla ha acabado en empate!', '¡El campo de batalla ha acabado en empate!', 'Ничья!!!');

