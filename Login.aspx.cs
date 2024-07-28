using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace DDApplication
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (! IsPostBack)
            {
                if (Session["username"] != null)
                {
                    Response.Redirect("Home.aspx");
                } 
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=MSI; Initial Catalog=Ravishka; Integrated Security=True");
            SqlDataAdapter sda = new SqlDataAdapter("Select * from User1 where Email='" + TextBox1.Text + "' and Password='" + TextBox2.Text + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (TextBox1.Text =="Admin" & TextBox2.Text == "123")
            {
                Session["admin"] = TextBox1.Text; 
                Label1.Text = "Admin Login Successfull";
                Label1.ForeColor = System.Drawing.Color.Green;
                Response.Redirect("AdminHome.aspx");

            }
            else if (dt.Rows.Count == 1)
            {
                Session["username"] = TextBox1.Text;
                Session["buyitems"] = null;
                fillSavedCart();
                Label1.Text = "Login Successfull";
                Response.Redirect("Home.aspx");
                Label1.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Label1.Text = "Login Unsuccessfull";
                Label1.ForeColor= System.Drawing.Color.Red;
            }
        }

        private void fillSavedCart()
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("sno");
            dt.Columns.Add("pid");
            dt.Columns.Add("pname");
            dt.Columns.Add("pimage");
            dt.Columns.Add("pdesc");
            dt.Columns.Add("pprice");
            dt.Columns.Add("pquantity");
            dt.Columns.Add("pcategory");
            dt.Columns.Add("ptotalprice");

            String mycon = "Data Source=MSI;Initial Catalog=Ravishka;Integrated Security=True";
            SqlConnection scon = new SqlConnection(mycon);
            String myquery = "select * from CartDetails where Email='" + Session["username"].ToString() + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = scon;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                int i = 0;
                int counter = ds.Tables[0].Rows.Count;
                while (i < counter)
                {
                    dr = dt.NewRow();
                    dr["sno"] = i + 1;
                    dr["pid"] = ds.Tables[0].Rows[i]["PId"].ToString();
                    dr["pname"] = ds.Tables[0].Rows[i]["Pname"].ToString();
                    dr["pimage"] = ds.Tables[0].Rows[i]["Pimage"].ToString();
                    dr["pdesc"] = ds.Tables[0].Rows[0]["Pdesc"].ToString();
                    dr["pprice"] = ds.Tables[0].Rows[i]["Pprice"].ToString();
                    dr["pquantity"] = ds.Tables[0].Rows[i]["Pquantity"].ToString();
                    dr["pcategory"] = ds.Tables[0].Rows[0]["Pcategory"].ToString();
                    int price = Convert.ToInt32(ds.Tables[0].Rows[i]["pprice"].ToString());
                    int quantity = Convert.ToInt16(ds.Tables[0].Rows[i]["pquantity"].ToString());
                    int totalprice = price * quantity;
                    dr["ptotalprice"] = totalprice; ;
                    dt.Rows.Add(dr);
                    i = i + 1;
                }
            }
            else
            {
                Session["buyitems"] = null;
            }
            Session["buyitems"] = dt;
        }
    }
}