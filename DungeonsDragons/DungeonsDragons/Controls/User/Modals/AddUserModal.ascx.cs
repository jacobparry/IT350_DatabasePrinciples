using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using DungeonsDragons.Helpers.Dynamic;
using DungeonsDragons.Database;
using DungeonsDragons.Classes;



namespace DungeonsDragons.Controls.User.Modals
{
    public partial class AddUserModal : System.Web.UI.UserControl
    {
        public event CommandEventHandler save;


        protected void Page_Load(object sender, EventArgs e)
        {

        }



        public void LoadAddUserModal()
        {
            showModal();
        }

        private void showModal()
        {
            DynamicControl.ShowModal(this, btnCancelAddUser, divModalAddUser);
        }


        protected void btnSaveAddUser_Click(object sender, EventArgs e)
        {
            try
            {
                DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();

                DD_User addUser = new DD_User();
                SHA256 shaPassword = SHA256.Create();
                Byte[] password = ASCIIEncoding.Default.GetBytes(txtPassword.Text);
                Byte[] hash = shaPassword.ComputeHash(password);


                addUser.LastName = txtLastName.Text.ToLower();
                addUser.FirstName = txtFirstName.Text.ToLower();
                addUser.Password = BitConverter.ToString(hash);
                addUser.DateCreated = DateTime.Today;

                if (!dtdc.DD_Users.Any(s => s.Username == txtUsername.Text.ToLower()))
                {
                    addUser.Username = txtUsername.Text.ToLower();

                    if (!dtdc.DD_Users.Any(s => s.Email == txtEmail.Text.ToLower()))
                    {
                        addUser.Email = txtEmail.Text;

                        //Inserts the new user to the database on a database submit.
                        dtdc.DD_Users.InsertOnSubmit(addUser);
                        dtdc.SubmitChanges();
                    }
                    else
                    {
                        //That Email has already been used.

                    }
                }
                else
                {
                    //That username has already been used.
                }


            }
            catch (Exception ex)
            {


            }
        }
    }
}