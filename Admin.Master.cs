﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDApplication
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCategory_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCategory.aspx");
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct02.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //Function Related to the Logout Button of Admin Menu
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateProduct.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrderStatus.aspx");
        }
    }
}