IF EXISTS(SELECT * FROM sys.triggers WHERE name = 'DungeonsDragons_StatModifier')
BEGIN
	DROP TRIGGER DungeonsDragons_CharacterLevel
END
GO

CREATE TRIGGER DungeonsDragons_CharacterLevel
       ON DD_Character
AFTER INSERT, UPDATE
AS
BEGIN
	IF ((SELECT TRIGGER_NESTLEVEL()) > 5 )
	RETURN
     Update DD_Character	 
	 Set CharacterLevel = (1+sqrt(ExperiencePoints/125 + 1))/2; 
	  
END
