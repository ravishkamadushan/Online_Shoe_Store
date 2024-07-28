using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDApplication
{
    public partial class PlaceOrder : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=MSI;Initial Catalog=Ravishka;Integrated Security=True;");
        bool isTrue = false;

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

        protected void Button1_Click(object sender, EventArgs e)
        {
             if (Session["buyitems"] != null && Session["Orderid"] != null)
            {
                DataTable dt = (DataTable)Session["buyitems"];
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    string pId = dt.Rows[i]["pid"].ToString();
                    int pQuantity = Convert.ToInt16(dt.Rows[i]["pquantity"]);
                    SqlDataAdapter sda = new SqlDataAdapter("Select Pquantity from Products1 where PId='" + pId + "' ",con);
                    DataTable dtble = new DataTable();
                    sda.Fill(dtble);
                    int quantity = Convert.ToInt16(dtble.Rows[0][0]);
                    if (quantity > 0)
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("Insert into Orders(orderid,sno,productid,productname,price,quantity,orderdate,status,email) values('" + Session["Orderid"] + "'," + dt.Rows[i]["sno"] + "," + dt.Rows[i]["pid"] + ",'" + dt.Rows[i]["pname"] + "'," + dt.Rows[i]["pprice"] + "," + dt.Rows[i]["pquantity"] + ",'" + Session["Orderdate"] + "','pending', '" + Session["username"].ToString() + "')", con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                decreaseQuantity();
                payment();
                clearcart();
                Session["buyitems"] = null;
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("AddCart.aspx");
            }
                
        }
        public void payment()
        {
            if (isTrue== true)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into CardsD" + "(FIname,LAname,Cardno,EXdate,CVV,Billadd) values(@FIname,@LAname,@Cardno,@EXdate,@CVV,@Billadd)", con);


                cmd.Parameters.AddWithValue("@FIname", TextBox1.Text);
                cmd.Parameters.AddWithValue("@LAname", TextBox2.Text);
                cmd.Parameters.AddWithValue("@Cardno", (TextBox3.Text));
                cmd.Parameters.AddWithValue("@EXdate", TextBox4.Text);
                cmd.Parameters.AddWithValue("@CVV", TextBox5.Text);
                cmd.Parameters.AddWithValue("@Billadd", TextBox6.Text);

                cmd.ExecuteNonQuery();
                con.Close(); 
            }
            Session["address"] = TextBox6.Text;
        }
        public void decreaseQuantity()
        {
            DataTable dt = (DataTable)Session["buyitems"];
            for (int i = 0; i <= dt.Rows.Count -1; i++)
            {
                int pId = Convert.ToInt16(dt.Rows[i]["pid"]);
                int pQuantity = Convert.ToInt16(dt.Rows[i]["pquantity"]);
                SqlDataAdapter sda = new SqlDataAdapter("Select Pquantity,Pname from Products1 where PId='" + pId + "' ", con);
                DataTable dtable = new DataTable();
                sda.Fill(dtable);
                int quantity = Convert.ToInt16(dtable.Rows[0][0]);
                if (quantity > 0)
                {
                    int reducedQuantity = quantity - pQuantity;
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update Products1 set Pquantity='" + reducedQuantity + "' where PId='" + pId + "' ", con);
                    cmd.ExecuteNonQuery();
                    con.Close() ;
                    isTrue = true;
                }
                else
                {
                    isTrue = false;
                }
            }
        }
        public void clearcart()
        {
            if (Session["username"] != null)
            {
                DataTable dt = (DataTable)Session["buyitems"];
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    int pId = Convert.ToInt16(dt.Rows[i]["pid"]);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Delete from CartDetails where PId='" + pId + "' and Email='" + Session["username"] + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

    }
}
