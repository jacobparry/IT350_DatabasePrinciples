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
    public partial class EditCharacterStatsModal : System.Web.UI.UserControl
    {
        public event CommandEventHandler save;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void LoadEditStatsModal(int characterID)
        {
            showModal();
            hfUserID.Value = Session["UserID"].ToString();
            hfCharacterID.Value = characterID.ToString();
            populateCharacterFields(characterID);
        }

        private void populateCharacterFields(int characterID)
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();
            DD_Character character = dtdc.DD_Characters.SingleOrDefault(c => c.ID == Convert.ToInt32(hfCharacterID.Value));

            populateCharacterStats(character);
        }

        private void populateCharacterStats(DD_Character character)
        {
            txtStrength.Text = character.Strength.ToString();
            txtDexterity.Text = character.Dexterity.ToString();
            txtConstitution.Text = character.Constitution.ToString();
            txtIntelligence.Text = character.Intelligence.ToString();
            txtWisdom.Text = character.Wisdom.ToString();
            txtCharisma.Text = character.Charisma.ToString();
        }


        private void showModal()
        {
            DynamicControl.ShowModal(this, btnCancelCharacterStats, divModalEditStats);
        }

        protected void btnSaveCharacterStats_Click(object sender, EventArgs e)
        {

            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();
            DD_Character character = dtdc.DD_Characters.SingleOrDefault(c => c.ID == Convert.ToInt32(hfCharacterID.Value));


            saveCharacterStats(character);
            dtdc.SubmitChanges();

            EventHelper.TriggerEvent(save, this, character);

        }

        private void saveCharacterStats(DD_Character character)
        {
            character.Strength = Convert.ToInt32(txtStrength.Text);
            character.Dexterity = Convert.ToInt32(txtDexterity.Text);
            character.Constitution = Convert.ToInt32(txtConstitution.Text);
            character.Intelligence = Convert.ToInt32(txtIntelligence.Text);
            character.Wisdom = Convert.ToInt32(txtWisdom.Text);
            character.Charisma = Convert.ToInt32(txtCharisma.Text);
        }
    }
}