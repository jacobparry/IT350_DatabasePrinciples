using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DungeonsDragons.Helpers.Dynamic;
using DungeonsDragons.Helpers.Utilites;
using DungeonsDragons.Database;

namespace DungeonsDragons
{
    public partial class Profile : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();
            if (!IsPostBack)
            {
                CheckLogin();
                if (Convert.ToBoolean(hfLoggedIn.Value))
                {
                    divProfilePage.Visible = true;
                    LoadUserInformation();
                    LoadCharacterNames();
                }
                else
                {
                    divProfilePage.Visible = false;
                }
            }

            

                //lblLoggedIn.Text = "You are logged in!";
           
        }

        protected void LoadCharacterNames()
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();

            List<DD_Character> characterList =
                (from character in dtdc.DD_Characters
                 where character.UserID == Convert.ToInt32(Session["UserID"])
                 select character).ToList();
            ddlCharacters.DataSource = characterList;
            ddlCharacters.DataBind();
            ddlCharacters.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            ddlCharacters.SelectedIndex = 0;

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

        protected void LoadUserInformation()
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();

            DD_User user = dtdc.DD_Users.Single(u => u.ID == Convert.ToInt32(Session["UserID"]));
            
            lblName.Text = "Name: " + user.FirstName + " " + user.LastName;
            lblEmail.Text = "Email: " + user.Email;

        }

        protected void ddlCharacterList_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectCharacterFromDDL();
        }

        private void selectCharacterFromDDL()
        {
            if (ddlCharacters.SelectedIndex != 0)
            {
                DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();

                DD_Character character = dtdc.DD_Characters.Single(c => c.ID == Convert.ToInt32(ddlCharacters.SelectedValue));

                if (character != null)
                {
                    FillBeastiary(character);
                    addBeast.Visible = true;
                }
                else
                {
                    //You must select a character.
                }
            }
            else
            {
                fantasticBeasts.Visible = false;
                addBeast.Visible = false;
                beasts.Visible = false;
            }
        }

        protected void FillBeastiary(DD_Character character)
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();

            List<DD_Beastiary> beastiary =
                (from beast in character.DD_Beastiaries
                 select beast).ToList();
            rptBeastiary.DataSource = beastiary;
            rptBeastiary.DataBind();

            beasts.Visible = true;
            

        }

        protected void addBeast_Click(object sender, EventArgs e)
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();

            fantasticBeasts.Visible = true;
            List<DD_Creep> creeps =
                (from creep in dtdc.DD_Creeps
                 select creep).ToList();
            ddlBeasts.DataSource = creeps;
            ddlBeasts.DataBind();
            ddlBeasts.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            ddlBeasts.SelectedIndex = 0;

        }

        protected void submitBeasts_click(object sender, EventArgs e)
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();
            //                DD_Character character = dtdc.DD_Characters.SingleOrDefault(c => c.ID == Convert.ToInt32(ddlCharacters.SelectedValue));

            DD_Creep creep = dtdc.DD_Creeps.Single(c => c.ID == Convert.ToInt32(ddlBeasts.SelectedValue));

            DD_Beastiary beast = new DD_Beastiary();
            DD_Character character = dtdc.DD_Characters.Single(c => c.ID == Convert.ToInt32(ddlCharacters.SelectedValue));

            //Must check if character has already seen the beasty...

            bool doesExist = dtdc.DD_Beastiaries.Any(s => s.CharacterID == character.ID && s.CreepID == creep.ID);
            if (!doesExist)
            {
                beast.HasSeen = true;
                beast.CharacterID = character.ID;
                beast.CreepID = creep.ID;

                dtdc.DD_Beastiaries.InsertOnSubmit(beast);
                dtdc.SubmitChanges();

                FillBeastiary(character);

                if (alreadySeen.Visible == true)
                {
                    alreadySeen.Visible = false;
                }

            }
            else
            {
                alreadySeen.Visible = true;
            }


            /*if (!dtdc.DD_Beastiaries.Any(s => s.CharacterID == character.ID ))
            {
            }*/
        }

        protected void ddlBeasts_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlBeasts.SelectedIndex != 0)
            {
                submitBeast.Visible = true;
            }
            else
            {
                submitBeast.Visible = false;
            }
        }
    }
}