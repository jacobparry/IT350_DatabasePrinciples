IF EXISTS(SELECT * FROM sys.triggers WHERE name = 'DungeonsDragons_StatModifier')
BEGIN
	DROP TRIGGER DungeonsDragons_StatModifier
END
GO

CREATE TRIGGER DungeonsDragons_StatModifier
       ON DD_Character
AFTER INSERT, UPDATE
AS
BEGIN
     Update DD_Character
	 Set StrengthModifier = (Strength -10)/2;
	 Update DD_Character
	 Set DexterityModifier = (Dexterity - 10) /2;
	 Update DD_Character
	 Set ConstitutionModifer = (Constitution - 10) /2;
	 Update DD_Character
	 Set IntelligenceModifier = (Intelligence - 10) /2;
	 Update DD_Character
	 Set WisdomModifier = (Wisdom - 10) /2;
	 Update DD_Character
	 Set CharismaModifier = (Charisma - 10) /2;

	 Update DD_Character
	 Set StrengthSavingThrow = StrengthModifier;
	 Update DD_Character
	 Set DexteritySavingThrow = DexterityModifier;
	 Update DD_Character
	 Set ConstitutinSavingThrow = ConstitutionModifer;
	 Update DD_Character
	 Set IntelligenceSavingThrow = IntelligenceModifier;
	 Update DD_Character
	 Set WisdomSavingThrow = WisdomModifier;
	 Update DD_Character
	 Set CharismaSavingThrow = CharismaModifier;
END
