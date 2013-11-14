-- ------------------------------
-- Game Events && Holiday Stuff -
-- ------------------------------

-- --------------------------
-- Hallow Ends
-- --------------------------

-- Fixed Correct spell on bobbing apples ( Hallow Ends Event )  // DBC still showing wrong description in-game but effect works like it should
UPDATE `item_template` SET `spellid_1` = 24707 WHERE `entry` = 20516;

-- ------------------------------------------
-- Boss Headless Horseman fight in scarlet monastry
-- ------------------------------------------

-- Scriptname assignment

UPDATE creature_template SET ScriptName = 'npc_horsemans_head' WHERE entry = 23775;
UPDATE creature_template SET ScriptName = 'mob_pulsing_pumpkin' WHERE entry = 23694;

-- Pumkin fiend template fixes
UPDATE `creature_template` SET `modelid_2` = 21822, `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 23545;

-- Pulsing pumkin template fixes
UPDATE `creature_template` SET `modelid_2` = 24720, `faction_A` = 14, `faction_H` = 14, `type` = 6, `mechanic_immune_mask` = 8388624, `flags_extra` = 0 WHERE `entry` = 23694;

-- head of the horseman fixes
UPDATE `creature_template` SET `modelid_2` = 21908, `faction_A` = 7, `faction_H` = 7, `mechanic_immune_mask` = 787202047 WHERE `entry` = 23775;

-- Fixes to his template ( smart to wiped clean and replaced data)
-- Headless Horseman fixes and ect
UPDATE `creature_template` SET `rank` = 3, `type` = 6, `equipment_id` = 10400, `mechanic_immune_mask` = `mechanic_immune_mask` | 128 WHERE `entry` = 23682;

-- Fix quest script to correct horseman summon location
UPDATE `dbscripts_on_quest_end` SET `x` = 1766.8, `y` = 1349.54, `z` = 18.6855, `o` = 6.2786 WHERE `id` IN(11392, 11401, 11404, 11405);

-- -- Quest fix to get quest inside instance w/o having the others from the villages ( this is the daily neutral one )
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 11401;

-- built new equip_template for him
DELETE FROM `creature_equip_template` WHERE (`entry`=10400);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (10400, 38175, 0, 0);

-- fix no sword showing on regen/whirlwinding headless dude
UPDATE `creature_template` SET `equipment_id` = 10400 WHERE `entry` = 23800;

-- --------------------------------------------------------------------------------------------------------------------------------------------

-- -----------------------------
-- Headless horseman Quest Event
-- -----------------------------

-- Headless Horseman fire bunny
UPDATE creature_template SET unit_flags = 0, AIName = '', faction_a = 35, faction_h = 35, ScriptName = 'npc_horseman_fire_bunny' WHERE entry = 23686;
UPDATE creature_template SET InhabitType = 4, ScriptName = 'npc_shade_of_horseman' WHERE entry = 23543;

-- Headless Horseman fire bunny
UPDATE creature_template SET unit_flags = 0, AIName = 'EventAI' WHERE entry = 23686;
DELETE FROM creature_ai_scripts WHERE id IN (2368601, 2368602);
INSERT INTO creature_ai_scripts (id,creature_id,event_type,event_chance,action1_type,action1_param1) VALUES
-- visual fire aura on initial spawn
(2368601,23686,11,100,11,42075),
-- evade immediately after receiving bucket hit
(2368602,23686,4,100,24,0);

DELETE FROM game_event WHERE entry = 101;
INSERT INTO game_event (entry,start_time,end_time,occurence,LENGTH,description) VALUES
(101,'2012-11-02 18:45:00','2020-12-31 09:00:00','15','6','Hallows End - Horseman Village Attack');

DELETE FROM creature WHERE id IN (23543,23686);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
-- Elwynn Forest
-- Shade of Horseman
('400042','23543','0','1','1','0','1870','-9482.45','64.2219','76.6803','6.12238','900','0','0','2220','0','0','2'),
-- Fire Bunny
('400031','23686','0','1','65535','0','0','-9452.62','43.2718','57.0975','1.17919','900','0','0','67000','7196','0','0'),
('400032','23686','0','1','65535','0','0','-9452.99','80.362','57.3495','4.99359','900','0','0','67000','7196','0','0'),
('400033','23686','0','1','65535','0','0','-9468.09','79.9088','57.7395','4.60482','900','0','0','67000','7196','0','0'),
('400034','23686','0','1','65535','0','0','-9479.98','29.4727','56.1416','3.0835','900','0','0','67000','7196','0','0'),
('400035','23686','0','1','65535','0','0','-9480.2','41.9719','56.9226','2.84004','900','0','0','67000','7196','0','0'),
('400036','23686','0','1','65535','0','0','-9468.28','44.7625','56.7081','1.47502','900','0','0','67000','7196','0','0'),
('400037','23686','0','1','65535','0','0','-9481.17','23.2341','56.6099','2.91857','900','0','0','67000','7196','0','0'),
('400038','23686','0','1','65535','0','0','-9479.61','34.9436','57.3245','2.99319','900','0','0','67000','7196','0','0'),
('400039','23686','0','1','65535','0','0','-9460.37','81.2598','57.9887','4.87028','900','0','0','67000','7196','0','0'),
('400040','23686','0','1','65535','0','0','-9474.57','43.9885','56.6427','1.51664','900','0','0','67000','7196','0','0'),
('400041','23686','0','1','65535','0','0','-9458.91','45.2892','56.6756','1.48287','900','0','0','67000','7196','0','0'),
-- Durotar
-- Shade of Horseman
('400043','23543','1','1','1','0','1870','347.11','-4720.79','31.8356','1.29259','900','0','0','2220','0','0','2'),
-- Fire Bunny
('400044','23686','1','1','1','0','0','370.54','-4717.46','15.853','4.49793','900','0','0','67000','7196','0','0'),
('400045','23686','1','1','1','0','0','364.968','-4715.02','15.7461','3.795','900','0','0','67000','7196','0','0'),
('400046','23686','1','1','1','0','0','365.457','-4709.27','16.062','2.69151','900','0','0','67000','7196','0','0'),
('400047','23686','1','1','1','0','0','366.783','-4702.53','16.2973','2.73471','900','0','0','67000','7196','0','0'),
('400048','23686','1','1','1','0','0','345.918','-4710.18','16.7095','5.30687','900','0','0','67000','7196','0','0'),
('400049','23686','1','1','1','0','0','351.283','-4704.73','16.6699','5.31473','900','0','0','67000','7196','0','0'),
('400050','23686','1','1','1','0','0','356.453','-4700.39','16.5244','5.58962','900','0','0','67000','7196','0','0'),
('400051','23686','1','1','1','0','0','361.826','-4695.48','16.4174','5.55821','900','0','0','67000','7196','0','0'),
('400052','23686','1','1','1','0','0','338.509','-4707.98','17.6254','4.10129','900','0','0','67000','7196','0','0'),
('400053','23686','1','1','1','0','0','329.66','-4703.14','16.7397','4.31334','900','0','0','67000','7196','0','0'),
('400054','23686','1','1','1','0','0','322.6','-4698.53','16.8243','4.28585','900','0','0','67000','7196','0','0');

DELETE FROM game_event_creature WHERE guid IN (SELECT guid FROM creature WHERE id IN (23543,23686));
INSERT INTO game_event_creature (guid,EVENT) SELECT guid, 101 FROM creature WHERE id IN (23543,23686);

-- --------------------------------
-- Pilgrim's bounty event scripts -
-- --------------------------------
UPDATE `creature_template` SET `ScriptName` = 'npc_wild_turkey' WHERE `entry` = 32820;

-- ----------------
-- Lunar Festival -
-- ----------------

-- Check your DB. Game objects (Id: 300058) should be placed on center of creatures (Id:15897)!

DELETE FROM spell_script_target WHERE entry = 26373;
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES (26373, 0, 300058);

DELETE FROM dbscripts_on_go_template_use WHERE `id` = 300058;
INSERT INTO dbscripts_on_go_template_use
  (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments)
VALUES
  (300058, 0, 15, 26448, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 'Holiday - Teleport: Moonglade');

-- ---------------
-- Fishing Xtrag -
-- ---------------
-- set ai for riggle
UPDATE `creature_template` SET `ScriptName`='npc_riggle_bassbait' WHERE entry=15077;
-- updated start time for event Fishing Extravaganza
UPDATE `game_event` SET `start_time` = '2009-06-14 14:00:00' WHERE `entry` = 15;
-- Create Jang
UPDATE `creature` SET `equipment_id` = 1711, `position_x` = -14438, `position_y` = 473.661, `position_z` = 15.3137, `orientation` = 3.65362, `curhealth` = 3200 WHERE `id` = 15078;
-- Create Fishbot 5000
UPDATE `creature` SET `position_x` = -14440, `position_y` = 477.446, `position_z` = 15.25, `orientation` = 3.71802, `curhealth` = 2600 WHERE `id` = 15079;
-- Create Riggle Bassbait
UPDATE `creature` SET `equipment_id` = 13, `position_x` = -14439.3, `position_y` = 475.42, `position_z` = 15.892, `orientation` = 3.68503, `curhealth` = 3700 WHERE `id` = 15077;
-- Create Soapbox gameobject
DELETE FROM `gameobject` WHERE `id`=180403;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(954391, 180403, 0, 1, 1, -14439.3, 475.42, 15.2791, 3.68503, 0, 0, 0.963311, -0.268388, 25, 0, 1);

-- new event - Fishing Extravaganza Questgivers
-- Remove NPC and GO from any other event.
DELETE FROM `game_event_creature` WHERE `guid` IN (954687,954688,954689);
DELETE FROM `game_event_gameobject`WHERE `guid`=954391;
-- Create Event
DELETE FROM `game_event` WHERE `entry` = 35; -- this cause drop event "Edge of Madness, Gri'lek" from ytdb !
INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`) VALUES (35, '2009-03-29 14:00:00', '2020-12-31 00:00:00', 10080, 180, 0, 'Fishing Extravaganza Questgivers');
-- Add NPCs to Event
DELETE FROM `game_event_creature` WHERE abs(`event`) = 35;
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (954687,35), (954688,35), (954689,35);
-- Add Soapbox to Event
DELETE FROM `game_event_gameobject` WHERE abs(`event`) = 35;
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (954391,35);
-- Remove Quests from normal DB:
DELETE FROM `creature_questrelation` WHERE quest IN (8193,8194,8225,8224,8221);
-- Add Quests to Event
-- Riggle Bassbait Quest: Master Angler
-- Jang Quest: Apprentice Angler
-- Fishbot 5000 Quest: Rare Fish - Brownell's Blue Striped Racer
-- Fishbot 5000 Quest: Rare Fish - Dezian Queenfish
-- Fishbot 5000 Quest: Rare Fish - Keefer's Angelfish
DELETE FROM `game_event_quest` WHERE `event` = 35;
INSERT INTO `game_event_quest` (`quest`,`event`) VALUES (8193,35), (8194,35), (8225,35), (8224,35), (8221,35);
