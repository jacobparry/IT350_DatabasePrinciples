using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using DungeonsDragons.Helpers;
using DungeonsDragons.Helpers.Dynamic;
using DungeonsDragons.Helpers.Utilites;
using DungeonsDragons.Database;



namespace DungeonsDragons.Controls.User.Modals
{
    public partial class LoginModal : System.Web.UI.UserControl
    {
        public event CommandEventHandler save;


        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public void LoadLoginModal()
        {
            showModal();
        }

        private void showModal()
        {
            DynamicControl.ShowModal(this, btnCancelLogin, divModalLogin);
        }

        public void btnSaveLogin_Click(object sender, EventArgs e)
        {
            try
            {
                DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();

                string passwordToCompare = hashPasswordToCompare();

                DD_User user = dtdc.DD_Users.SingleOrDefault(u => u.Username.ToLower() == txtUsername.Text.ToLower() && u.Password == passwordToCompare);
                if (user != null)
                {
                    LoginHelper.setupSessionVariables(user);
                    EventHelper.TriggerEvent(save, this, user);
                }
                else
                {
                    //displayError();
                }
                //EventHelper.TriggerEvent(save, this, null);
            }
            catch (Exception ex)
            {
                //displayError(ex);
                showModal();
            }
        }

        private string hashPasswordToCompare()
        {
            SHA256 shaPassword = SHA256.Create();
            Byte[] password = ASCIIEncoding.Default.GetBytes(txtPassword.Text);
            Byte[] hash = shaPassword.ComputeHash(password);
            string passwordToCompare = BitConverter.ToString(hash);

            return passwordToCompare;
        }
    }
}