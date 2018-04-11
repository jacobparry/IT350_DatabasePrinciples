using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DungeonsDragons.Database;

namespace DungeonsDragons
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected Controls.User.Modals.AddUserModal ucAddUserModal;
        protected Controls.User.Modals.LoginModal ucLoginModal;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckLogin();
            }
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            ucLoginModal.save += new CommandEventHandler(ucLoginModal_save);
        }

        private void ucLoginModal_save(object sender, CommandEventArgs e)
        {
            CheckLogin();
            Server.Transfer("Welcome.aspx");
        }

        private void CheckLogin()
        {
            if (Session["Username"] != null)
            {
                lbLogin.Visible = false;
                lbLogout.Visible = true;
                hfUserID.Value = Session["UserID"].ToString();
            }
            else
            {
                lbLogin.Visible = true;
                lbLogout.Visible = false;
            }
        }

        protected void lbAddUser_Click(object sender, EventArgs e)
        {
            //This is how we access the Methods of a UserControl. 
            ucAddUserModal.LoadAddUserModal();
        }

        protected void lbLogin_Click(object sender, EventArgs e)
        {
            ucLoginModal.LoadLoginModal();
        }

        protected void lbLogout_Click(object sender, EventArgs e)
        {
            Session["UserName"] = null;
            Session["UserID"] = null;

            CheckLogin();
            Server.Transfer("Welcome.aspx");

        }
    }
}