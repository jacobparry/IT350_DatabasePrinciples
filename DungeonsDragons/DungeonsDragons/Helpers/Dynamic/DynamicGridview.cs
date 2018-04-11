using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace MiniMiserHelpers.Dynamic
{
    public class DynamicGridview
    {
        GridView DynamicGV;

        public DynamicGridview(GridView gv)
        {
            DynamicGV = gv;

            for (int i = DynamicGV.Columns.Count - 1; i >= 0; i--)
            {
                DynamicGV.Columns.RemoveAt(i);
            }
        }

        public void createTemplateField(string header, HorizontalAlign ha, ITemplate iTemplate, int width)
        {
            createTemplateField(header, ha, iTemplate, null, width);
        }

        public void createTemplateField(string header, HorizontalAlign ha, ITemplate iTemplate, ITemplate footerTemplate, int width)
        {
            TemplateField tf = new TemplateField();

            tf.HeaderText = header;
            tf.ItemTemplate = iTemplate;
            tf.ItemStyle.Width = Unit.Pixel(width);
            tf.ItemStyle.HorizontalAlign = ha;

            DynamicGV.Columns.Add(tf);

            if (footerTemplate != null)
            {
                tf.FooterStyle.HorizontalAlign = HorizontalAlign.Center;
                tf.FooterTemplate = footerTemplate;
            }
        }
    }
}