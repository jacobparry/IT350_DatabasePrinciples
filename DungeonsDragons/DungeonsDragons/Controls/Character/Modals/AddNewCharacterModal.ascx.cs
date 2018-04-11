using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DungeonsDragons.Helpers.Dynamic;
using DungeonsDragons.Helpers.Utilites;
using DungeonsDragons.Database;

namespace DungeonsDragons.Controls.Character.Modals
{
    public partial class AddNewCharacterModal : System.Web.UI.UserControl
    {
        public event CommandEventHandler save;
        public event CommandEventHandler edit;


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void LoadAddCharacterModal()
        {
            hfUserID.Value = Session["UserID"].ToString();
            showModal();
            populateRaceDDL();
            populateClassDDL();
            clearFields();
        }

        private void clearFields()
        {
            txtCharacterName.Text = "";
            ddlRace.SelectedIndex = 0;
            ddlClass.SelectedIndex = 0;
            txtBackground.Text = "";
            txtFaction.Text = "";
            txtAlignment.Text = "";
            txtXP.Text = "";

            txtStrength.Text = "";
            txtDexterity.Text = "";
            txtConstitution.Text = "";
            txtIntelligence.Text = "";
            txtWisdom.Text = "";
            txtCharisma.Text = "";
            txtArmorClass.Text = "";

            txtAcrobatics.Text = "";
            txtAnimalHandling.Text = "";
            txtArcana.Text = "";
            txtAthletics.Text = "";
            txtDeception.Text = "";
            txtHistory.Text = "";
            txtInsight.Text = "";
            txtIntimidation.Text = "";
            txtInvestigation.Text = "";
            txtMedicine.Text = "";
            txtNature.Text = "";
            txtPerception.Text = "";
            txtPerformance.Text = "";
            txtPersuasion.Text = "";
            txtReligion.Text = "";
            txtSleightofHand.Text = "";
            txtStealth.Text = "";
            txtSurvival.Text = "";

            hfCharacterID.Value = "";
        }

        public void LoadEditCharacterModal(int characterID)
        {
            showModal();
            populateRaceDDL();
            populateClassDDL();
            hfUserID.Value = Session["UserID"].ToString();
            hfCharacterID.Value = characterID.ToString();
            populateCharacterFields(characterID);
        }

        private void populateCharacterFields(int characterID)
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();
            DD_Character character = dtdc.DD_Characters.SingleOrDefault(c => c.ID == Convert.ToInt32(hfCharacterID.Value));
            if (character != null)
            {
                populateCharacterDetails(character);
                populateCharacterStats(character);
                populateCharacterSkills(character);

            }
        }

        private void populateCharacterDetails(DD_Character character)
        {
            txtCharacterName.Text = character.CharacterName;
            ddlRace.SelectedValue = character.DD_Race.ID.ToString();
            ddlClass.SelectedValue = character.DD_Class.ID.ToString();
            txtBackground.Text = character.Background;
            txtFaction.Text = character.Faction;
            txtAlignment.Text = character.Alignment;
            txtXP.Text = character.ExperiencePoints.ToString();
        }

        private void populateCharacterStats(DD_Character character)
        {
            txtStrength.Text = character.Strength.ToString();
            txtDexterity.Text = character.Dexterity.ToString();
            txtConstitution.Text = character.Constitution.ToString();
            txtIntelligence.Text = character.Intelligence.ToString();
            txtWisdom.Text = character.Wisdom.ToString();
            txtCharisma.Text = character.Charisma.ToString();
            txtArmorClass.Text = character.ArmorClass.ToString();
        }

        private void populateCharacterSkills(DD_Character character)
        {
            txtAcrobatics.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Acrobatics").SingleOrDefault().Value.ToString();
            txtAnimalHandling.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Animal Handling").SingleOrDefault().Value.ToString();
            txtArcana.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Arcana").SingleOrDefault().Value.ToString();
            txtAthletics.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Athletics").SingleOrDefault().Value.ToString();
            txtDeception.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Deception").SingleOrDefault().Value.ToString();
            txtHistory.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "History").SingleOrDefault().Value.ToString();
            txtInsight.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Insight").SingleOrDefault().Value.ToString();
            txtIntimidation.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Intimidation").SingleOrDefault().Value.ToString();
            txtInvestigation.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Investigation").SingleOrDefault().Value.ToString();
            txtMedicine.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Medicine").SingleOrDefault().Value.ToString();
            txtNature.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Nature").SingleOrDefault().Value.ToString();
            txtPerception.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Perception").SingleOrDefault().Value.ToString();
            txtPerformance.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Performance").SingleOrDefault().Value.ToString();
            txtPersuasion.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Persuasion").SingleOrDefault().Value.ToString();
            txtReligion.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Religion").SingleOrDefault().Value.ToString();
            txtSleightofHand.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Sleight of Hand").SingleOrDefault().Value.ToString();
            txtStealth.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Stealth").SingleOrDefault().Value.ToString();
            txtSurvival.Text = character.DD_CharacterHasSkills.Where(c => c.DD_Skill.Name == "Survival").SingleOrDefault().Value.ToString();
        }

        private void populateRaceDDL()
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();
            List<DD_Race> races =
                (from race in dtdc.DD_Races
                 select race).ToList();
            ddlRace.DataSource = races;
            ddlRace.DataBind();
            ddlRace.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            ddlRace.SelectedIndex = 0;

        }

        private void populateClassDDL()
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();
            List<DD_Class> classes =
                (from theClass in dtdc.DD_Classes
                 select theClass).ToList();
            ddlClass.DataSource = classes;
            ddlClass.DataBind();

            ddlClass.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            ddlClass.SelectedIndex = 0;

        }

        private void showModal()
        {
            DynamicControl.ShowModal(this, btnCancelCharacter, divModalAddCharacter);
        }

        protected void btnSaveCharacter_Click(object sender, EventArgs e)
        {

            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();
            DD_Character character = new DD_Character();
            //This checks if there is a character loaded. If there is, then it load the edit. If not, it saves a new one.
            if (hfCharacterID.Value == "")
            {
                dtdc.DD_Characters.InsertOnSubmit(character);
            }
            else
            {
                character = dtdc.DD_Characters.SingleOrDefault(c => c.ID == Convert.ToInt32(hfCharacterID.Value));
            }

            saveCharacterDetails(character);
            dtdc.SubmitChanges();

            saveCharacterSkills(character);

            if (hfCharacterID.Value == "")
            {
                EventHelper.TriggerEvent(save, this, character);
            }
            else
            {
                EventHelper.TriggerEvent(edit, this, character);
            }
        }

        private void saveCharacterSkills(DD_Character character)
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();

            List<DD_Skill> skills =
                (from skill in dtdc.DD_Skills
                 select skill).ToList();


            foreach (DD_Skill skill in skills)
            {
                DD_CharacterHasSkill chs = new DD_CharacterHasSkill();

                if (hfCharacterID.Value == "")
                {
                    dtdc.DD_CharacterHasSkills.InsertOnSubmit(chs);
                    chs.CharacterID = character.ID;
                    chs.SkillID = skill.ID;

                }
                else
                {
                    chs = dtdc.DD_CharacterHasSkills.Single(c => c.DD_Character.ID == character.ID && c.SkillID == skill.ID);
                }

                switch (skill.Name)
                {
                    case "Acrobatics":
                        chs.Value = Convert.ToInt32(txtAcrobatics.Text);
                        break;
                    case "Animal Handling":
                        chs.Value = Convert.ToInt32(txtAnimalHandling.Text);
                        break;
                    case "Arcana":
                        chs.Value = Convert.ToInt32(txtArcana.Text);
                        break;
                    case "Athletics":
                        chs.Value = Convert.ToInt32(txtAthletics.Text);
                        break;
                    case "Deception":
                        chs.Value = Convert.ToInt32(txtDeception.Text);
                        break;
                    case "History":
                        chs.Value = Convert.ToInt32(txtHistory.Text);
                        break;
                    case "Insight":
                        chs.Value = Convert.ToInt32(txtInsight.Text);
                        break;
                    case "Intimidation":
                        chs.Value = Convert.ToInt32(txtIntimidation.Text);
                        break;
                    case "Investigation":
                        chs.Value = Convert.ToInt32(txtInvestigation.Text);
                        break;
                    case "Medicine":
                        chs.Value = Convert.ToInt32(txtMedicine.Text);
                        break;
                    case "Nature":
                        chs.Value = Convert.ToInt32(txtNature.Text);
                        break;
                    case "Perception":
                        chs.Value = Convert.ToInt32(txtPerception.Text);
                        break;
                    case "Performance":
                        chs.Value = Convert.ToInt32(txtPerformance.Text);
                        break;
                    case "Persuasion":
                        chs.Value = Convert.ToInt32(txtPersuasion.Text);
                        break;
                    case "Religion":
                        chs.Value = Convert.ToInt32(txtReligion.Text);
                        break;
                    case "Sleight of Hand":
                        chs.Value = Convert.ToInt32(txtSleightofHand.Text);
                        break;
                    case "Stealth":
                        chs.Value = Convert.ToInt32(txtStealth.Text);
                        break;
                    case "Survival":
                        chs.Value = Convert.ToInt32(txtSurvival.Text);
                        break;
                }

            }

            dtdc.SubmitChanges();

        }

        private void saveCharacterDetails(DD_Character character)
        {
            character.UserID = Convert.ToInt32(hfUserID.Value);
            character.CharacterName = txtCharacterName.Text;
            character.RaceID = Convert.ToInt32(ddlRace.SelectedValue);
            character.ClassID = Convert.ToInt32(ddlClass.SelectedValue);
            character.Background = txtBackground.Text;
            character.Alignment = txtAlignment.Text;
            character.Faction = txtFaction.Text;
            character.ExperiencePoints = Convert.ToInt32(txtXP.Text);
            character.Strength = Convert.ToInt32(txtStrength.Text);
            character.Dexterity = Convert.ToInt32(txtDexterity.Text);
            character.Constitution = Convert.ToInt32(txtConstitution.Text);
            character.Intelligence = Convert.ToInt32(txtIntelligence.Text);
            character.Wisdom = Convert.ToInt32(txtWisdom.Text);
            character.Charisma = Convert.ToInt32(txtCharisma.Text);
            character.ArmorClass = Convert.ToInt32(txtArmorClass.Text);

        }
    }
}