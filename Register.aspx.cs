using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDApplication
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=MSI; Initial Catalog=Ravishka; Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into User1" + "(Fname,Lname,Email,Phone,Password) values (@Fname,@Lname,@Email,@Phone,@Password)" ,con);
            cmd.Parameters.AddWithValue("@Fname", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Lname", TextBox2.Text);
            cmd.Parameters.AddWithValue("@Email", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Phone", TextBox4.Text);
            cmd.Parameters.AddWithValue("@Password", TextBox5.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Label1.Text = "Registered Successfully";
            Label1.ForeColor = System.Drawing.Color.Green;
            Response.Redirect("Login.aspx");
        }
    }
}