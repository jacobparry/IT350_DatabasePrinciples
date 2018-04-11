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
    public partial class AddItemModal : System.Web.UI.UserControl
    {
        public event CommandEventHandler save;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void LoadAddItemModal(int CharacterID)
        {
            hfCharacterID.Value = CharacterID.ToString();
            showModal();
            PopulateItemDDL();
        }

        private void PopulateItemDDL()
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();
            List<DD_Item> itemList =
                (from item in dtdc.DD_Items
                 select item).ToList();

            ddlItemList.DataSource = itemList;
            ddlItemList.DataBind();
        }

        private void showModal()
        {
            DynamicControl.ShowModal(this, btnCancelItem, divModalAddItem);
        }

        protected void btnSaveItem_Click(object sender, EventArgs e)
        {
            try
            {
                DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();
                DD_Character character = dtdc.DD_Characters.SingleOrDefault(c => c.ID == Convert.ToInt32(hfCharacterID.Value));

                DD_CharacterHasItem characterItem = new DD_CharacterHasItem();

                characterItem.CharacterID = character.ID;
                characterItem.ItemID = Convert.ToInt32(ddlItemList.SelectedValue);
                characterItem.Quantity = Convert.ToInt32(txtQuantity.Text);

                dtdc.DD_CharacterHasItems.InsertOnSubmit(characterItem);
                dtdc.SubmitChanges();

                EventHelper.TriggerEvent(save, this, characterItem);
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}