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
    public partial class AddSpellModal : System.Web.UI.UserControl
    {
        public event CommandEventHandler save;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void LoadAddSpellModal(int CharacterID)
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();

            hfCharacterID.Value = CharacterID.ToString();
            
            showModal();
            DD_Character character = dtdc.DD_Characters.SingleOrDefault(c => c.ID == Convert.ToInt32(hfCharacterID.Value));

            hfCharacterLevel.Value = character.CharacterLevel.ToString();
            hfUserID.Value = character.UserID.ToString();

            PopulateSpellDDL(character.CharacterLevel, character.ClassID);
        }

        private void PopulateSpellDDL(int level, int classID)
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();
            //List<DD_Spell> spellList = new List<DD_Spell>();

            List<DD_Spell> spellList =
                (from spell in dtdc.DD_Spells
                 where spell.RequiredLevel <= level && spell.ClassID == classID
                 select spell).ToList();

            //for (int i = 0; i < dtdc.DD_Spells.Count<DD_Spell>(); i++)
            //{
            //    DD_Spell mySpell = dtdc.DD_Spells.SingleOrDefault(c => c.ID == Convert.ToInt32(classID) && c.RequiredLevel <= level);
            //    spellList.Add(mySpell);
            //}

            ddlSpellList.DataSource = spellList;
            ddlSpellList.DataBind();
        }

        private void showModal()
        {
            DynamicControl.ShowModal(this, btnCancelSpell, divModalAddSpell);
        }

        protected void btnSaveSpell_Click(object sender, EventArgs e)
        {
            try
            {
                DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();

                DD_Character character = dtdc.DD_Characters.SingleOrDefault(c => c.ID == Convert.ToInt32(hfCharacterID.Value));

                DD_CharacterHasSpell spell = new DD_CharacterHasSpell();

                spell.CharacterID = character.ID;
                spell.SpellID = Convert.ToInt32(ddlSpellList.SelectedValue);

                dtdc.DD_CharacterHasSpells.InsertOnSubmit(spell);
                dtdc.SubmitChanges();

                EventHelper.TriggerEvent(save, this, spell);
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}