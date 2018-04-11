using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using DungeonsDragons.Classes;
using DungeonsDragons.Database;


namespace DungeonsDragons
{
    public partial class CharacterSheet : DungeonTrackerPage
    {
        protected Controls.Character.Modals.AddNewCharacterModal ucCharacterModal;
        protected Controls.Character.Modals.EditCharacterStatsModal ucEditStatsModal;
        protected Controls.Character.Modals.AddItemModal ucAddItemModal;
        protected Controls.Character.Modals.AddSpellModal ucAddSpellModal;
        protected Controls.Character.Modals.EditCharacterHPModal ucEditHPModal;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckLogin();
                if (Convert.ToBoolean(hfLoggedIn.Value))
                {
                    loadDDLCharacterList();
                }
            }

        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            ucCharacterModal.save += new CommandEventHandler(ucCharacterModal_Save);
            ucCharacterModal.edit += new CommandEventHandler(ucCharacterModal_Edit);

            ucEditStatsModal.save += new CommandEventHandler(ucEditStatsModal_Save);

            ucAddItemModal.save += new CommandEventHandler(ucAddItemModal_Save);
            ucAddSpellModal.save += new CommandEventHandler(ucAddSpellModal_Save);

            ucEditHPModal.save += new CommandEventHandler(ucEditHPModal_Save);
        }

        private void ucEditHPModal_Save(object sender, CommandEventArgs e)
        {
            selectCharacterFromDDL();
        }

        private void ucAddSpellModal_Save(object sender, CommandEventArgs e)
        {
            selectCharacterFromDDL();
        }

        private void ucAddItemModal_Save(object sender, CommandEventArgs e)
        {
            selectCharacterFromDDL();
        }

        private void ucEditStatsModal_Save(object sender, CommandEventArgs e)
        {
            selectCharacterFromDDL();
        }

        private void ucCharacterModal_Edit(object sender, CommandEventArgs e)
        {
            selectCharacterFromDDL();
        }

        private void ucCharacterModal_Save(object sender, CommandEventArgs e)
        {
            loadDDLCharacterList();
        }

        private void loadDDLCharacterList()
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();

            //Read Comments in the CheckLogin() method to understand what hfUserId is.
            List<DD_Character> characterList =
                (from character in dtdc.DD_Characters
                 where character.UserID == Convert.ToInt32(hfUserID.Value)
                 select character).ToList();

            ddlCharacterList.DataSource = characterList;
            ddlCharacterList.DataBind();
            ddlCharacterList.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            ddlCharacterList.SelectedIndex = 0;
        }

        protected void ddlCharacterList_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectCharacterFromDDL();
        }

        private void selectCharacterFromDDL()
        {
            if (ddlCharacterList.SelectedIndex != 0)
            {
                DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();

                DD_Character character = dtdc.DD_Characters.SingleOrDefault(c => c.ID == Convert.ToInt32(ddlCharacterList.SelectedValue));

                if (character != null)
                {
                    populateCharacterSheet(character);
                    divCharacterSheet.Visible = true;
                    hfCharacterID.Value = character.ID.ToString();
                }
                else
                {
                    //You must select a character.
                }
            }
            else
            {
                divCharacterSheet.Visible = false;
            }
        }

        private void populateCharacterSheet(DD_Character character)
        {
            populateCharacterDetails(character);
            populateCharacterStats(character);
            populateSkills(character);
            populateItems(character);
            populateSpells(character);
        }

        private void populateSpells(DD_Character character)
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();

            List<DD_CharacterHasSpell> spellList =
                (from spell in character.DD_CharacterHasSpells
                 select spell).ToList();

            rptSpells.DataSource = spellList;
            rptSpells.DataBind();
        }

        private void populateItems(DD_Character character)
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();

            List<DD_CharacterHasItem> chiList =
                (from citem in character.DD_CharacterHasItems
                 select citem).ToList();

            rptCharacterItems.DataSource = chiList;
            rptCharacterItems.DataBind();
        }

        private void populateSkills(DD_Character character)
        {

            lblSkillAcrobatics.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Acrobatics").SingleOrDefault().Value.ToString();
            lblSkillAnimalHandling.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Animal Handling").SingleOrDefault().Value.ToString();
            lblSkillArcana.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Arcana").SingleOrDefault().Value.ToString();
            lblSkillAthletics.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Athletics").SingleOrDefault().Value.ToString();
            lblSkillDeception.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Deception").SingleOrDefault().Value.ToString();
            lblSkillHistory.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "History").SingleOrDefault().Value.ToString();
            lblSkillInsight.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Insight").SingleOrDefault().Value.ToString();
            lblSkillIntimidation.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Intimidation").SingleOrDefault().Value.ToString();
            lblSkillInvestigation.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Investigation").SingleOrDefault().Value.ToString();
            lblSkillMedicine.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Medicine").SingleOrDefault().Value.ToString();
            lblSkillNature.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Nature").SingleOrDefault().Value.ToString();
            lblSkillPerception.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Perception").SingleOrDefault().Value.ToString();
            lblSkillPerformance.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Performance").SingleOrDefault().Value.ToString();
            lblSkillPersuasion.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Persuasion").SingleOrDefault().Value.ToString();
            lblSkillReligion.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Religion").SingleOrDefault().Value.ToString();
            lblSkillSleightofHand.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Sleight of Hand").SingleOrDefault().Value.ToString();
            lblSkillStealth.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Stealth").SingleOrDefault().Value.ToString();
            lblSkillSurvival.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Survival").SingleOrDefault().Value.ToString();

        }

        private void populateCharacterStats(DD_Character character)
        {
            lblStrength.Text = character.Strength.ToString();
            lblDexterity.Text = character.Dexterity.ToString();
            lblConstitution.Text = character.Constitution.ToString();
            lblIntelligence.Text = character.Intelligence.ToString();
            lblWisdom.Text = character.Wisdom.ToString();
            lblCharisma.Text = character.Charisma.ToString();

            lblMaxHP.Text = character.MaxHitPoints.ToString();
            lblTempHP.Text = character.TempHitPoints.ToString();
            /*
             * These following things should be updated in the database using Triggers.
             * We need to figure out how to use Triggers.
             */

            lblModStr.Text = character.StrengthModifier.ToString();
            lblModDex.Text = character.DexterityModifier.ToString();
            lblModConst.Text = character.ConstitutionModifer.ToString();
            lblModInt.Text = character.IntelligenceModifier.ToString();
            lblModWis.Text = character.WisdomModifier.ToString();
            lblModChar.Text = character.CharismaModifier.ToString();

            lblSTstr.Text = character.StrengthSavingThrow.ToString();
            lblSTdex.Text = character.DexteritySavingThrow.ToString();
            lblSTconst.Text = character.ConstitutinSavingThrow.ToString();
            lblSTint.Text = character.IntelligenceSavingThrow.ToString();
            lblSTwis.Text = character.WisdomSavingThrow.ToString();
            lblSTchar.Text = character.CharismaSavingThrow.ToString();
        }

        private void populateCharacterDetails(DD_Character character)
        {
            lblCharacterName.Text = character.CharacterName;
            lblClass.Text = character.DD_Class.Name;
            lblLevel.Text = character.CharacterLevel.ToString();
            lblBackground.Text = character.Background.ToString();
            lblPlayerName.Text = character.DD_User.Username;
            lblFaction.Text = character.Faction.ToString();
            lblRace.Text = character.DD_Race.Name;
            lblAlignment.Text = character.Alignment.ToString();
            lblXP.Text = character.ExperiencePoints.ToString();
        }

        private void CheckLogin()
        {
            if (Session["Username"] != null)
            {
                //There is a really cool thing called <asp:HiddenField>.
                //It does not show up ever, but it allows you to store a value on the page
                //so you can then reference the value and use it wherever you want/need.
                hfUserID.Value = Session["UserID"].ToString();
                hfLoggedIn.Value = "true";
            }
            else
            {
                Server.Transfer("Welcome.aspx", true);
            }
        }

        protected void btnAddCharacter_Click(object sender, EventArgs e)
        {
            ucCharacterModal.LoadAddCharacterModal();
        }

        protected void lbEditCharacter_Click(object sender, EventArgs e)
        {
            ucCharacterModal.LoadEditCharacterModal(Convert.ToInt32(hfCharacterID.Value));
        }

        protected void lbEditStats_Click(object sender, EventArgs e)
        {
            ucEditStatsModal.LoadEditStatsModal(Convert.ToInt32(hfCharacterID.Value));
        }

        protected void lbEditHP_Click(object sender, EventArgs e)
        {
            ucEditHPModal.LoadEditHPModal(Convert.ToInt32(hfCharacterID.Value));
        }

        protected void lbEditInventory_Click(object sender, EventArgs e)
        {
            ucAddItemModal.LoadAddItemModal(Convert.ToInt32(hfCharacterID.Value));
        }

        protected void addSpellButton_Click(object sender, EventArgs e)
        {
            ucAddSpellModal.LoadAddSpellModal(Convert.ToInt32(hfCharacterID.Value));
        }

    }
}