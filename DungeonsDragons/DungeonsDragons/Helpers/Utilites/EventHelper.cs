using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace DungeonsDragons.Helpers.Utilites
{
    public class EventHelper
    {
        public static bool TriggerEvent(CommandEventHandler eventHandler, object sender, object arg)
        {
            if (eventHandler != null)
            {
                string name = eventHandler.Method.Name.ToString();

                CommandEventArgs args = new CommandEventArgs(name, arg);

                eventHandler(sender, args);

                return true;
            }
            return false;
        }
    }
}