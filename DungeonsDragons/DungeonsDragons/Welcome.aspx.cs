using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DungeonsDragons
{
    public partial class Welcome : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                lblLoggedIn.Text = "You are logged in!";
            }
            else
            {
                lblLoggedIn.Text = "You must log in to continue!";

            }
        }


    }
}