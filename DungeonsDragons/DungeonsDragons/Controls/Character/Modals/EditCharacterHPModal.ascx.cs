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
    public partial class EditCharacterHPModal : System.Web.UI.UserControl
    {
        public event CommandEventHandler save;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void LoadEditHPModal(int characterID)
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
            txtMaxHP.Text = character.MaxHitPoints.ToString();
            txtTempHP.Text = character.TempHitPoints.ToString();
        }


        private void showModal()
        {
            DynamicControl.ShowModal(this, btnCancel, divModalEditHP);
        }


        protected void btnSaveHP_Click(object sender, EventArgs e)
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();

            DD_Character character = dtdc.DD_Characters.SingleOrDefault(c => c.ID == Convert.ToInt32(hfCharacterID.Value));

            saveCharacterHP(character);

            dtdc.SubmitChanges();

            EventHelper.TriggerEvent(save, this, character);

        }

        private void saveCharacterHP(DD_Character character)
        {
            character.MaxHitPoints = Convert.ToInt32(txtMaxHP.Text);
            character.TempHitPoints = Convert.ToInt32(txtTempHP.Text);
        }
    }
}