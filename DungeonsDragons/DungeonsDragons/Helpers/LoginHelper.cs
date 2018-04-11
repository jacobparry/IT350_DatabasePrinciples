using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using DungeonsDragons.Database;

namespace DungeonsDragons.Helpers
{
    public class LoginHelper
    {
        static public void setupSessionVariables(DD_User user)
        {
            DungeonTrackerDataContext dtdc = new DungeonTrackerDataContext();

            HttpSessionState Session = HttpContext.Current.Session;

            Session["UserID"] = user.ID;
            Session["Username"] = user.Username;
        }
    }
}