-- torta
DELETE FROM `gameobject_template` WHERE (entry = 300800);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES
(300800, 22, 8234, 'A Beautiful Cake', '', '', '', 0, 0, 1, 27741, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartGameObjectAI', '', 12340);

DELETE FROM `smart_scripts` WHERE (source_type = 1 AND entryorguid = 300800);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(300800, 1, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 75, 27741, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

-- lanciarazzi
DELETE FROM `gameobject_template` WHERE (entry = 300801);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES
(300801, 5, 6543, 'Spararazzi', '', '', '', 0, 16, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartGameObjectAI', '', 12340);

DELETE FROM creature_template WHERE entry = 300800;
INSERT INTO creature_template (entry) VALUES (300800);
UPDATE `creature_template` SET  `modelid1` = 1126, `modelid2` = 24719, `name` = 'Razzo Trigger', `faction` = 35, `unit_flags` = 33554432, `unit_flags2` = 2048, `InhabitType` = 4, `Health_Mod` = 2, `Mana_Mod` = 1, `flags_extra` = 128 WHERE (entry = 300800);
UPDATE `creature_template` SET scale = 10 WHERE entry = 300800;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 300800;
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 300800);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(300800, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 11, 44940, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ''),
(300800, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 10000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `smart_scripts` WHERE (source_type = 1 AND entryorguid = 300801);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(300801, 1, 0, 0, 60, 0, 100, 0, 20000, 20000, 20000, 20000, 12, 300800, 1, 10000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '');


DELETE FROM `gameobject_template` WHERE (entry = 300802);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES
(300802, 22, 6656, 'Sweet and Lovely Chest', '', '', '', 0, 0, 2.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'eventi_go_sweet_chest', 12340);

DELETE FROM `gameobject_template` WHERE (entry = 300803);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES
(300803, 22, 6656, 'Sweet and Lovely Chest', '', '', '', 0, 0, 2.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'eventi_go_sweet_chest', 12340);

DELETE FROM `gameobject_template` WHERE (entry = 300804);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES
(300804, 22, 6656, 'Sweet and Lovely Chest', '', '', '', 0, 0, 2.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'eventi_go_sweet_chest', 12340);

DELETE FROM `creature_template` WHERE (entry = 300805);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(300805, 0, 0, 0, 0, 0, 17870, 0, 0, 0, 'K\'eru', '', NULL, 30803, 83, 83, 0, 1741, 1, 1.1, 1.5, 1.2, 1, 0, 0, 0, 8, 832, 2048, 0, 0, 0, 0, 0, 0, 7, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 3, 0, 10, 10, 1, 0, 0, 1, 0, 2, '', 12341);

-- teleport
DELETE FROM npc_text WHERE ID IN (300805);
INSERT INTO npc_text (ID, text0_0, text0_1, lang0, em0_0) VALUES 
(300805, "<La luce intorno a K'eru pulsa di un colore violaceo. È pronto a teletrasportarti.>", 0, 0, 0);

DELETE FROM gossip_menu WHERE entry = 30803;
INSERT INTO gossip_menu (entry, text_id) VALUES
(30803, 300805);

DELETE FROM gossip_menu_option WHERE menu_id = 30803;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag) VALUES 
(30803, 1, 0, "Teleportami all'evento My Lovely Agony.", 1, 1);
-- (31203, 2, 0, "Teletrasportami, per favore.", 1, 1);

DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 300805);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(300805, 0, 0, 0, 62, 0, 100, 0, 30803, 1, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8318, -2476, 152, 4.5, 'On Gossip Option 1 Selected - Teleport');