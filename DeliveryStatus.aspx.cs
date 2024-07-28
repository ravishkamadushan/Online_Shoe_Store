using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDApplication
{
    public partial class DeliveryStatus : System.Web.UI.Page
    {
        string str = "Data Source=MSI; Initial Catalog=Ravishka; Integrated Security=true";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("Login.aspx");
               }
           }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProductList.aspx");
        }
    }
}