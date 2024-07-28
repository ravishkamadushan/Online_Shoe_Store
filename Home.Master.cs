using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDApplication
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {   
            //Counting products amount that in the shopping cart
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            if(dt != null)
            {
                Label2.Text = dt.Rows.Count.ToString();
            }
            else
            {
                Label2.Text = "0";
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Random ran = new Random();
            int i = ran.Next(1,5);
            Image2.ImageUrl = "~/Images/" + i.ToString() + ".jpg";
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AddCart.aspx");
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("DeliveryStatus.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://web.facebook.com/login.php?_rdc=1&_rdr");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://web.whatsapp.com/");
        }
    }
}