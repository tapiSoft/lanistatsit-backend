ALTER TABLE matches ALTER gamemode TYPE TEXT USING 'DOTA_GAMEMODE_AP'; -- Don't yet have data so not bothering to make an actual conversion here

DROP TYPE gamemode;
