DELETE FROM creature_template WHERE entry >= 110000 AND entry <= 120000;
INSERT INTO creature_template (entry, killcredit1, modelid1, `name`, minlevel, maxlevel, faction, npcflag, unit_flags, unit_flags2, dynamicflags, flags_extra) VALUES
-- (110000, 110000, 17519, "Template", 1, 1, 14, 0, 0, 0, 0, 0),
(110001, 110001, 17519, "Alterac Valley Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110002, 110002, 17519, "Warsong Gulch Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110003, 110003, 17519, "Arathi Basin Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110004, 110004, 17519, "Eye of the Storm Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110005, 110005, 17519, "Strand of the Ancients Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110006, 110006, 17519, "Isle of Conquest Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110007, 110007, 17519, "Arathi Basin Flag Capture Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110008, 110008, 17519, "Warsong Gulch Flag Capture Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110009, 110009, 17519, "Warsong Gulch Flag Recover Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110010, 110010, 17519, "Eye of the Storm Flag Capture Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110011, 110011, 17519, "Alterac Valley Graveyard Capture Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110012, 110012, 17519, "Alterac Valley Tower Defense Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110013, 110013, 17519, "Alterac Valley Tower Capture Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110014, 110014, 17519, "Arathi Basin Base Defense Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110015, 110015, 17519, "Alterac Valley Graveyard Capture Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110016, 110016, 17519, "Isle of Conquest Base Capture Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110017, 110017, 17519, "Isle of Conquest Base Defend Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110018, 110018, 17519, "Kill a Warrior Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110019, 110019, 17519, "Kill a Paladin Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110020, 110020, 17519, "Kill a Hunter Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110021, 110021, 17519, "Kill a Rogue Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110022, 110022, 17519, "Kill a Priest Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110023, 110023, 17519, "Kill a Death Knight Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110024, 110024, 17519, "Kill a Shaman Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110025, 110025, 17519, "Kill a Mage Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110026, 110026, 17519, "Kill a Warlock Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110027, 110027, 17519, "Kill a Druid Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110028, 110028, 17519, "Kill a Human Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110029, 110029, 17519, "Kill an Orc Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110030, 110030, 17519, "Kill a Dwarf Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110031, 110031, 17519, "Kill a Night Elf Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110032, 110032, 17519, "Kill an Undead Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110033, 110033, 17519, "Kill a Tauren Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110034, 110034, 17519, "Kill a Gnome Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110035, 110035, 17519, "Kill a Troll Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110036, 110036, 17519, "Kill a Blood Elf Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110037, 110037, 17519, "Kill a Draenei Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110038, 110038, 17519, "Get a Killing Blow Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110039, 110039, 17519, "Earn Honorable Kill Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0),
(110040, 110040, 17519, "Win Duel Kill Credit", 1, 1, 14, 0, 0, 0, 0, 0)
;


DELETE FROM quest_template WHERE id >= 110000 AND id <= 110100;
INSERT INTO `quest_template` (`id`, `QuestType`, `QuestSortID`, `Flags`, `LogTitle`, `LogDescription`, `QuestDescription`, `EndText`, `RequiredNpcOrGo1`, `RequiredNpcOrGoCount1`, ObjectiveText1) VALUES
('110000','2','3840','12482','Vinci Alterac Valley','Vinci Alterac Valley','Vinci Alterac Valley','Ritorna da Han\'al','110001','1', "Vinci Alterac Valley"),
('110001','2','3840','12482','Vinci Warsong Gulch','Vinci Warsong Gulch','Vinci Warsong Gulch','Ritorna da Han\'al','110002','1', "Vinci Warsong Gulch"),
(110002, '2','3840','12482', 'Vinci Arathi Basin', 'Vinci Arathi Basin', 'Vinci Arathi Basin', 'Ritorna da Han\'al', 110003, 1, 'Vinci Arathi Basin'),
(110003, '2','3840','12482', 'Vinci Eye of the Storm', 'Vinci Eye of the Storm', 'Vinci Eye of the Storm', 'Ritorna da Han\'al', 110004, 1, 'Vinci Eye of the Storm'),
(110004, '2','3840','12482', 'Vinci Strand of the Ancients', 'Vinci Strand of the Ancients', 'Vinci Strand of the Ancients', 'Ritorna da Han\'al', 110005, 1, 'Vinci Strand of the Ancients'),
(110005, '2','3840','12482', 'Vinci Isle of Conquest', 'Vinci Isle of Conquest', 'Vinci Isle of Conquest', 'Ritorna da Han\'al', 110006, 1, 'Vinci Isle of Conquest'),
(110006, '2','3840','12482', 'Arathi Basin Flag Capture', 'Arathi Basin Flag Capture', 'Arathi Basin Flag Capture', 'Ritorna da Han\'al', 110007, 1, 'Arathi Basin Flag Capture'),
(110007, '2','3840','12482', 'Warsong Gulch Flag Capture', 'Warsong Gulch Flag Capture', 'Warsong Gulch Flag Capture', 'Ritorna da Han\'al', 110008, 1, 'Warsong Gulch Flag Capture'),
(110008, '2','3840','12482', 'Warsong Gulch Flag Recover', 'Warsong Gulch Flag Recover', 'Warsong Gulch Flag Recover', 'Ritorna da Han\'al', 110009, 1, 'Warsong Gulch Flag Recover'),
(110009, '2','3840','12482', 'Eye of the Storm Flag Capture', 'Eye of the Storm Flag Capture', 'Eye of the Storm Flag Capture', 'Ritorna da Han\'al', 110010, 1, 'Eye of the Storm Flag Capture'),
(110010, '2','3840','12482', 'Alterac Valley Graveyard Capture', 'Alterac Valley Graveyard Capture', 'Alterac Valley Graveyard Capture', 'Ritorna da Han\'al', 110011, 1, 'Alterac Valley Graveyard Capture'),
(110011, '2','3840','12482', 'Alterac Valley Tower Defense', 'Alterac Valley Tower Defense', 'Alterac Valley Tower Defense', 'Ritorna da Han\'al', 110012, 1, 'Alterac Valley Tower Defense'),
(110012, '2','3840','12482', 'Alterac Valley Tower Capture', 'Alterac Valley Tower Capture', 'Alterac Valley Tower Capture', 'Ritorna da Han\'al', 110013, 1, 'Alterac Valley Tower Capture'),
(110013, '2','3840','12482', 'Arathi Basin Base Defense', 'Arathi Basin Base Defense', 'Arathi Basin Base Defense', 'Ritorna da Han\'al', 110014, 1, 'Arathi Basin Base Defense'),
(110014, '2','3840','12482', 'Alterac Valley Graveyard Capture', 'Alterac Valley Graveyard Capture', 'Alterac Valley Graveyard Capture', 'Ritorna da Han\'al', 110015, 1, 'Alterac Valley Graveyard Capture'),
(110015, '2','3840','12482', 'Isle of Conquest Base Capture', 'Isle of Conquest Base Capture', 'Isle of Conquest Base Capture', 'Ritorna da Han\'al', 110016, 1, 'Isle of Conquest Base Capture'),
(110016, '2','3840','12482', 'Isle of Conquest Base Defend', 'Isle of Conquest Base Defend', 'Isle of Conquest Base Defend', 'Ritorna da Han\'al', 110017, 1, 'Isle of Conquest Base Defend'),
(110017, '2','3840','12482', 'Kill a Warrior', 'Kill a Warrior', 'Kill a Warrior', 'Ritorna da Han\'al', 110018, 1, 'Kill a Warrior'),
(110018, '2','3840','12482', 'Kill a Paladin', 'Kill a Paladin', 'Kill a Paladin', 'Ritorna da Han\'al', 110019, 1, 'Kill a Paladin'),
(110019, '2','3840','12482', 'Kill a Hunter', 'Kill a Hunter', 'Kill a Hunter', 'Ritorna da Han\'al', 110020, 1, 'Kill a Hunter'),
(110020, '2','3840','12482', 'Kill a Rogue', 'Kill a Rogue', 'Kill a Rogue', 'Ritorna da Han\'al', 110021, 1, 'Kill a Rogue'),
(110021, '2','3840','12482', 'Kill a Priest', 'Kill a Priest', 'Kill a Priest', 'Ritorna da Han\'al', 110022, 1, 'Kill a Priest'),
(110022, '2','3840','12482', 'Kill a Death Knight', 'Kill a Death Knight', 'Kill a Death Knight', 'Ritorna da Han\'al', 110023, 1, 'Kill a Death Knight'),
(110023, '2','3840','12482', 'Kill a Shaman', 'Kill a Shaman', 'Kill a Shaman', 'Ritorna da Han\'al', 110024, 1, 'Kill a Shaman'),
(110024, '2','3840','12482', 'Kill a Mage', 'Kill a Mage', 'Kill a Mage', 'Ritorna da Han\'al', 110025, 1, 'Kill a Mage'),
(110025, '2','3840','12482', 'Kill a Warlock', 'Kill a Warlock', 'Kill a Warlock', 'Ritorna da Han\'al', 110026, 1, 'Kill a Warlock'),
(110026, '2','3840','12482', 'Kill a Druid', 'Kill a Druid', 'Kill a Druid', 'Ritorna da Han\'al', 110027, 1, 'Kill a Druid'),
(110027, '2','3840','12482', 'Kill a Human', 'Kill a Human', 'Kill a Human', 'Ritorna da Han\'al', 110028, 1, 'Kill a Human'),
(110028, '2','3840','12482', 'Kill an Orc', 'Kill an Orc', 'Kill an Orc', 'Ritorna da Han\'al', 110029, 1, 'Kill an Orc'),
(110029, '2','3840','12482', 'Kill a Dwarf', 'Kill a Dwarf', 'Kill a Dwarf', 'Ritorna da Han\'al', 110030, 1, 'Kill a Dwarf'),
(110030, '2','3840','12482', 'Kill a Night Elf', 'Kill a Night Elf', 'Kill a Night Elf', 'Ritorna da Han\'al', 110031, 1, 'Kill a Night Elf'),
(110031, '2','3840','12482', 'Kill an Undead', 'Kill an Undead', 'Kill an Undead', 'Ritorna da Han\'al', 110032, 1, 'Kill an Undead'),
(110032, '2','3840','12482', 'Kill a Tauren', 'Kill a Tauren', 'Kill a Tauren', 'Ritorna da Han\'al', 110033, 1, 'Kill a Tauren'),
(110033, '2','3840','12482', 'Kill a Gnome', 'Kill a Gnome', 'Kill a Gnome', 'Ritorna da Han\'al', 110034, 1, 'Kill a Gnome'),
(110034, '2','3840','12482', 'Kill a Troll', 'Kill a Troll', 'Kill a Troll', 'Ritorna da Han\'al', 110035, 1, 'Kill a Troll'),
(110035, '2','3840','12482', 'Kill a Blood Elf', 'Kill a Blood Elf', 'Kill a Blood Elf', 'Ritorna da Han\'al', 110036, 1, 'Kill a Blood Elf'),
(110036, '2','3840','12482', 'Kill a Draenei', 'Kill a Draenei', 'Kill a Draenei', 'Ritorna da Han\'al', 110037, 1, 'Kill a Draenei'),
(110037, '2','3840','12482', 'Get a Killing Blow', 'Get a Killing Blow', 'Get a Killing Blow', 'Ritorna da Han\'al', 110038, 1, 'Get a Killing Blow'),
(110038, '2','3840','12482', 'Earn Honorable Kill', 'Earn Honorable Kill', 'Earn Honorable Kill', 'Ritorna da Han\'al', 110039, 1, 'Earn Honorable Kill'),
(110039, '2','3840','12482', 'Win Duel', 'Win Duel', 'Win Duel', 'Ritorna da Han\'al', 110040, 1, 'Win Duel')
;

UPDATE quest_template SET minlevel = 80, maxlevel = 80, SpecialFlags = 1, OfferRewardText = "Bravo, $N", RequestItemsText = "Si, $N?"  WHERE id >= 110000 AND id <= 110100;