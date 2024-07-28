using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDApplication
{
    public partial class Message : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=MSI; Initial Catalog=Ravishka; Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into Message" + "(Name,Email,Phone,Message) values (@Name,@Email,@Phone,@Message)", con);
            cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Email", TextBox2.Text);
            cmd.Parameters.AddWithValue("@Phone", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Message", TextBox4.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Label1.Text = "Your Query was Submited!!Thank You for Contacting Us";
            Label1.ForeColor = System.Drawing.Color.Green;
            Response.Redirect("Message.aspx");
          
        }
    }
}