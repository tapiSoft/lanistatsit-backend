CREATE TABLE lans(
    id SERIAL PRIMARY KEY
);

CREATE TABLE matches(
    id INTEGER PRIMARY KEY NOT NULL,
    lan_id INTEGER REFERENCES lans(id) NOT NULL,
    radiant_win BOOLEAN NOT NULL,
    duration_seconds INTEGER NOT NULL,
    first_blood_time_seconds INTEGER NOT NULL,
    towerstatus_dire INTEGER NOT NULL,
    towerstatus_radiant INTEGER NOT NULL,
    barracksstatus_dire INTEGER NOT NULL,
    barracksstatus_radiant INTEGER NOT NULL,
    gamemode TEXT NOT NULL,
    total_kills INTEGER NOT NULL
);

CREATE INDEX lan_index ON matches(lan_id);

CREATE TABLE players(
    id INTEGER PRIMARY KEY NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE heroes(
    id INTEGER PRIMARY KEY NOT NULL,
    image_name TEXT NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE played_matches(
    match_id INTEGER NOT NULL REFERENCES matches(id),
    player_id INTEGER NOT NULL REFERENCES players(id),
    hero_id INTEGER NOT NULL REFERENCES heroes(id),
    kills INTEGER NOT NULL,
    deaths INTEGER NOT NULL,
    assists INTEGER NOT NULL,
    net_worth INTEGER NOT NULL,
    last_hits INTEGER NOT NULL,
    gpm INTEGER NOT NULL,
    xpm INTEGER NOT NULL,
    hero_damage INTEGER NOT NULL,
    tower_damage INTEGER NOT NULL,
    hero_healing INTEGER NOT NULL,
    level INTEGER NOT NULL,
    radiant BOOLEAN NOT NULL
);

CREATE INDEX match_index ON played_matches(match_id);
CREATE INDEX player_index ON played_matches(player_id);

INSERT INTO heroes(id,name,image_name) VALUES(1,'Anti-Mage','antimage_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(2,'Axe','axe_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(3,'Bane','bane_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(4,'Bloodseeker','bloodseeker_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(5,'Crystal Maiden','crystal_maiden_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(6,'Drow Ranger','drow_ranger_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(7,'Earthshaker','earthshaker_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(8,'Juggernaut','juggernaut_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(9,'Mirana','mirana_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(11,'Shadow Fiend','nevermore_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(10,'Morphling','morphling_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(12,'Phantom Lancer','phantom_lancer_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(13,'Puck','puck_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(14,'Pudge','pudge_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(15,'Razor','razor_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(16,'Sand King','sand_king_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(17,'Storm Spirit','storm_spirit_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(18,'Sven','sven_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(19,'Tiny','tiny_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(20,'Vengeful Spirit','vengefulspirit_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(21,'Windranger','windrunner_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(22,'Zeus','zuus_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(23,'Kunkka','kunkka_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(25,'Lina','lina_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(31,'Lich','lich_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(26,'Lion','lion_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(27,'Shadow Shaman','shadow_shaman_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(28,'Slardar','slardar_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(29,'Tidehunter','tidehunter_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(30,'Witch Doctor','witch_doctor_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(32,'Riki','riki_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(33,'Enigma','enigma_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(34,'Tinker','tinker_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(35,'Sniper','sniper_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(36,'Necrophos','necrolyte_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(37,'Warlock','warlock_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(38,'Beastmaster','beastmaster_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(39,'Queen of Pain','queenofpain_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(40,'Venomancer','venomancer_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(41,'Faceless Void','faceless_void_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(42,'Skeleton King','skeleton_king_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(43,'Death Prophet','death_prophet_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(44,'Phantom Assassin','phantom_assassin_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(45,'Pugna','pugna_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(46,'Templar Assassin','templar_assassin_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(47,'Viper','viper_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(48,'Luna','luna_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(49,'Dragon Knight','dragon_knight_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(50,'Dazzle','dazzle_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(51,'Clockwerk','rattletrap_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(52,'Leshrac','leshrac_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(53,'Nature''s Prophet','furion_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(54,'Lifestealer','life_stealer_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(55,'Dark Seer','dark_seer_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(56,'Clinkz','clinkz_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(57,'Omniknight','omniknight_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(58,'Enchantress','enchantress_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(59,'Huskar','huskar_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(60,'Night Stalker','night_stalker_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(61,'Broodmother','broodmother_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(62,'Bounty Hunter','bounty_hunter_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(63,'Weaver','weaver_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(64,'Jakiro','jakiro_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(65,'Batrider','batrider_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(66,'Chen','chen_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(67,'Spectre','spectre_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(69,'Doom','doom_bringer_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(68,'Ancient Apparition','ancient_apparition_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(70,'Ursa','ursa_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(71,'Spirit Breaker','spirit_breaker_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(72,'Gyrocopter','gyrocopter_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(73,'Alchemist','alchemist_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(74,'Invoker','invoker_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(75,'Silencer','silencer_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(76,'Outworld Devourer','obsidian_destroyer_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(77,'Lycan','lycan_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(78,'Brewmaster','brewmaster_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(79,'Shadow Demon','shadow_demon_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(80,'Lone Druid','lone_druid_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(81,'Chaos Knight','chaos_knight_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(82,'Meepo','meepo_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(83,'Treant Protector','treant_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(84,'Ogre Magi','ogre_magi_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(85,'Undying','undying_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(86,'Rubick','rubick_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(87,'Disruptor','disruptor_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(88,'Nyx Assassin','nyx_assassin_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(89,'Naga Siren','naga_siren_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(90,'Keeper of the Light','keeper_of_the_light_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(91,'Io','wisp_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(92,'Visage','visage_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(93,'Slark','slark_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(94,'Medusa','medusa_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(95,'Troll Warlord','troll_warlord_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(96,'Centaur Warrunner','centaur_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(97,'Magnus','magnataur_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(98,'Timbersaw','shredder_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(99,'Bristleback','bristleback_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(100,'Tusk','tusk_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(101,'Skywrath Mage','skywrath_mage_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(102,'Abaddon','abaddon_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(103,'Elder Titan','elder_titan_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(104,'Legion Commander','legion_commander_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(105,'Techies','techies_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(106,'Ember Spirit','ember_spirit_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(107,'Earth Spirit','earth_spirit_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(108,'Abyssal Underlord','abyssal_underlord_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(109,'Terrorblade','terrorblade_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(110,'Phoenix','phoenix_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(111,'Oracle','oracle_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(112,'Winter Wyvern','winter_wyvern_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(113,'Arc Warden','arc_warden_sb.png');
INSERT INTO heroes(id,name,image_name) VALUES(-1,'Unknown Hero','');
