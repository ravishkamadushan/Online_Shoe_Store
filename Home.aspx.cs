using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace DDApplication
{
    public partial class Home1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=MSI; Initial Catalog=Ravishka; Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Label6.Text = "Logged in as " + Session["username"].ToString();
                HyperLink1.Visible = false;
                Button1.Visible = true;
            }
            else
            {
                Label6.Text = "Hello You Can Login Here...";
                HyperLink1.Visible = true;
                Button1.Visible = false;
            }
            if (!IsPostBack)
            {
                Drp_ProductCategory();
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {

            SqlDataAdapter sda = new SqlDataAdapter("Select * from Products1 where (PName like '%" + TextBox1.Text + "%') or (PId like '%" + TextBox1.Text + "%')", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DataList1.DataSourceID = null;
            DataList1.DataSource = dt;
            DataList1.DataBind();



        }


        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Session["addproduct"] = "true";
            if (e.CommandName == "AddToCart")
            {
                DropDownList list = (DropDownList)(e.Item.FindControl("DropDownList1"));
                Response.Redirect("AddCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + list.SelectedItem.ToString());
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Home.aspx");
            Label6.Text = "You have Logged Out Successfully...";
        }
        //Displaying product Categories in Dropdown List
        public void Drp_ProductCategory()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from PRCategory", con);
            DropDownList2.DataSource = cmd.ExecuteReader();
            DropDownList2.DataTextField = "CategoryName";
            DropDownList2.DataValueField = "CategoryId";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, "All Products");
            con.Close();
        }
        //Displaying Products Based on Selected Category
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strQuery = "";
            string selectedproduct = DropDownList2.SelectedItem.Text;
            if (selectedproduct == "All Products")
            {
                strQuery = "";
            }
            else
            {
                strQuery = "where Pcategory = '" + selectedproduct + "' ";
            }
            SqlDataAdapter sda = new SqlDataAdapter("Select * from Products1 " + strQuery + " ", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            try
            {
                if (selectedproduct == dt.Rows[0][6].ToString())
                {
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('No Products Found')</script>");
            }
            DataList1.DataSourceID = null;
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
    }   
}