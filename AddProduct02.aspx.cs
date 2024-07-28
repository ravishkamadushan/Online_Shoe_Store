using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDApplication
{
    public partial class AddProduct02 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["admin"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=MSI;Initial Catalog=Ravishka; Integrated Security= True;");
            if (imageUpload.HasFile)
            {
                string filename = imageUpload.PostedFile.FileName;
                string filepath = "Images/" + imageUpload.FileName;
                imageUpload.PostedFile.SaveAs(Server.MapPath("~/Images/") + filename);
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into Products1 values ('" + TxtName.Text + "', '" + TxtDesc.Text + "', '" + filepath + "', '" + TxtPrice.Text + "', '" + TxtQuantity.Text + "', '" + DropDownList1.SelectedItem.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Product Added Successfully');</script>");
                Response.Redirect("AddProduct02.aspx");
            }
        }
    }
}