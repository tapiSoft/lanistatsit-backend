CREATE TYPE gamemode AS ENUM ('All Pick', 'All Random', 'Single Draft', 'Random Draft', 'Captains Draft', 'Captains Mode', 'All Random Deathmatch', 'Ability Draft');

ALTER TABLE matches ALTER gamemode TYPE gamemode USING 'All Pick'; -- Don't yet have data so not bothering to make an actual conversion here
