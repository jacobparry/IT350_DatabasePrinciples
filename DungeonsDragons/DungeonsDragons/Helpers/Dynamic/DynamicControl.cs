using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;


namespace DungeonsDragons.Helpers.Dynamic
{
    public class DynamicControl
    {
        static public void ShowModal(Control parentControl, Control btnCancel, HtmlGenericControl popupDiv)
        {
            ShowModal(parentControl, btnCancel, popupDiv.ClientID);
        }

        static public void ShowModal(Control parentControl, Control btnCancel, string popupDiv)
        {
            if (btnCancel != null)
            {
                ShowModal(parentControl, btnCancel.ID, popupDiv);
            }
            else
            {
                ShowModal(parentControl, (string)null, popupDiv);
            }
        }

        static public void ShowModal(Control parentControl, string btnCancel, string popupDiv)
        {
            Button fakeButton = new Button();
            fakeButton.ID = string.Format("btnFakeMpe_{0}", popupDiv);
            fakeButton.Attributes.Add("style", "display:none;");
            parentControl.Controls.Add(fakeButton);

            AjaxControlToolkit.ModalPopupExtender mpe = new AjaxControlToolkit.ModalPopupExtender();
            mpe.DropShadow = true;
            mpe.ID = "mpe" + popupDiv;

            mpe.BackgroundCssClass = "modalBackground";
            mpe.RepositionMode = AjaxControlToolkit.ModalPopupRepositionMode.None;

            mpe.CancelControlID = getCancelButton(parentControl, btnCancel);
            mpe.TargetControlID = fakeButton.ID;
            mpe.PopupControlID = popupDiv;
            parentControl.Controls.Add(mpe);

            mpe.Show();

            //Page p = (Page)parentControl.Page;

            //string controlName = string.Format("'{0}'", mpe.PopupControlID);
            //string mainctrl = "MainContent_ucModalAddUser_modalAddUser";
            //string ctrl = "MainContent_ucModalAddUser_mpeMainContent_ucModalAddUser_modalAddUser_foregroundElement";
            //JavascriptHelper.JavascriptOnPostback(p.Master, "test", "showAlert", controlName);
        }

        private static string getCancelButton(Control parentControl, string btnCancel)
        {
            if (btnCancel == null)
            {
                btnCancel = "btnFakeCancelMpe";

                Button fakeCancel = new Button();
                fakeCancel.ID = "btnFakeCancelMpe";
                fakeCancel.Attributes.Add("style", "display:none;");
                parentControl.Controls.Add(fakeCancel);
            }

            return btnCancel;
        }

    }
}