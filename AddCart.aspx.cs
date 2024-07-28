using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;

namespace DDApplication
{
    public partial class AddCart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=MSI;Initial Catalog=Ravishka;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
               
                //Adding products to gridview
                Session["addproducts"] = "false";
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


                if (Request.QueryString["id"] != null)
                {
                    if (Session["buyitems"] == null)
                    {
                        dr = dt.NewRow();
                        

                        SqlDataAdapter da = new SqlDataAdapter("select * from Products1 where PId=" + Request.QueryString["id"],con);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        dr["sno"] = 1;
                        dr["pid"] = ds.Tables[0].Rows[0]["PId"].ToString();
                        dr["pname"] = ds.Tables[0].Rows[0]["Pname"].ToString();
                        dr["pimage"] = ds.Tables[0].Rows[0]["Pimage"].ToString();
                        dr["pdesc"] = ds.Tables[0].Rows[0]["Pdesc"].ToString();
                        dr["pprice"] = ds.Tables[0].Rows[0]["Pprice"].ToString();
                        dr["pquantity"] = Request.QueryString["quantity"];
                        dr["pcategory"] = ds.Tables[0].Rows[0]["Pcategory"].ToString();

                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["pprice"].ToString());
                        int Quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int TotalPrice = price * Quantity;
                        dr["ptotalprice"] = TotalPrice;

                        dt.Rows.Add(dr);

                        con.Open();
                        SqlCommand cmd = new SqlCommand("Insert into CartDetails values('" + dr["sno"] + "', '" + dr["pid"] + "', '" + dr["pname"] + "', '" + dr["pdesc"] + "', '" + dr["pimage"] + "', '" + dr["pprice"] + "', '" + dr["pquantity"] + "', '" + dr["pcategory"] + "', '" + Session["username"].ToString() + "')", con);
                        cmd.ExecuteNonQuery();
                        con.Close();

                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        Button1.Enabled = true;

                        GridView1.FooterRow.Cells[6].Text = "Total Amount";
                        GridView1.FooterRow.Cells[7].Text = grandtotal().ToString();
                        Response.Redirect("AddCart.aspx");
                    }
                    else
                    {
                        dt = (DataTable)Session["buyitems"];
                        int sr;
                        sr = dt.Rows.Count; //sr means serial number

                        dr = dt.NewRow();
                        SqlConnection scon = new SqlConnection("Data Source=MSI;Initial Catalog=Ravishka;Integrated Security=True");

                        SqlDataAdapter da = new SqlDataAdapter("select * from Products1 where PId=" + Request.QueryString["id"], scon);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        dr["sno"] = sr + 1;
                        dr["pid"] = ds.Tables[0].Rows[0]["PId"].ToString();
                        dr["pname"] = ds.Tables[0].Rows[0]["Pname"].ToString();
                        dr["pimage"] = ds.Tables[0].Rows[0]["Pimage"].ToString();
                        dr["pdesc"] = ds.Tables[0].Rows[0]["Pdesc"].ToString();
                        dr["pprice"] = ds.Tables[0].Rows[0]["Pprice"].ToString();
                        dr["pquantity"] = Request.QueryString["quantity"];
                        dr["pcategory"] = ds.Tables[0].Rows[0]["Pcategory"].ToString();

                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["pprice"].ToString());
                        int Quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int TotalPrice = price * Quantity;
                        dr["ptotalprice"] = TotalPrice;

                        dt.Rows.Add(dr);
                        con.Open();
                        SqlCommand cmd = new SqlCommand("Insert into CartDetails values('" + dr["sno"] + "', '" + dr["pid"] + "', '" + dr["pname"] + "', '" + dr["pdesc"] + "', '" + dr["pimage"] + "', '" + dr["pprice"] + "', '" + dr["pquantity"] + "', '" + dr["pcategory"] + "', '" + Session["username"].ToString() + "')", con);
                        cmd.ExecuteNonQuery();
                        con.Close();

                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        Button1.Enabled = true;

                        GridView1.FooterRow.Cells[6].Text = "Total Amount";
                        GridView1.FooterRow.Cells[7].Text = grandtotal().ToString();
                        Response.Redirect("AddCart.aspx");
                    }
                }

                else
               {
                    dt = (DataTable)Session["buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                    }
                }
            }
            //If the shooping cart is empty link button not visible
            if (GridView1.Rows.Count.ToString() == "0")
            {
                LinkButton1.Enabled = false;
                LinkButton1.ForeColor = System.Drawing.Color.White;
                Button1.Enabled = false;
                Button1.Text = "No Items";
            }
            else
            {
                LinkButton1.Enabled = true;
                Button1.Enabled = true;
            }
            String OrderDate = DateTime.Now.ToShortDateString();
            Session["Orderdate"] = OrderDate;
            orderid();

        }
        // calculatrion related to the final price
        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int totalprice = 0;
            while (i < nrow)
            {
                totalprice = totalprice + Convert.ToInt32(dt.Rows[i]["ptotalprice"].ToString());
                i = i + 1;
            }
            return totalprice;
        }

        //Generating Unique Order ID 
        public void orderid()
        {
            String alpha = "abCdefghIjklmNopqrStuvwXyz123456789";
            Random r = new Random();
            char[]myArray = new char[5];
            for (int i = 0; i < 5; i++)
            {
                myArray[i] = alpha[(int)(35 * r.NextDouble())];
            }

            String orderid;
            orderid = "Order_Id: " + DateTime.Now.Hour.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString()
                + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(myArray) + DateTime.Now.Minute.ToString()
                + DateTime.Now.Second.ToString();
            Session["orderid"] = orderid;
        }

        //Deleting Row From the Cart
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];

            for (int i = 0;i < dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                string qdata;
                string dtdata;
                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);
                TableCell prID = GridView1.Rows[e.RowIndex].Cells[1];

                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();

                    con.Open();
                    SqlCommand cmd = new SqlCommand("Delete top (1) from CartDetails where PId='" + prID.Text + "' and Email='" + Session["username"] + "' ", con);
                    //Item Has been Deleted From the shopping Cart
                    break;
                }
            }

            //Setting Serial No after deleting row items from the Shopping Cart
            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges ();
            }

            Session["buyitems"] = dt;
            Response.Redirect("AddCart.aspx");
        }
        // checking for is there enough quantity to order
        protected void Button1_Click(object sender, EventArgs e)
        {
            bool isTrue = false;
            DataTable dt = (DataTable)Session["buyitems"];
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int pId = Convert.ToInt16(dt.Rows[i]["pid"]);
                int pQuantity = Convert.ToInt16(dt.Rows[i]["pquantity"]);
                SqlDataAdapter sda = new SqlDataAdapter("Select Pquantity,Pname from Products1 where PId='" + pId + "' ",con);
                DataTable dtable = new DataTable();
                sda.Fill(dtable);
                int quantity = Convert.ToInt16(dtable.Rows[0][0]);
                if (quantity <= 0)
                {
                    string pName = dtable.Rows[0][1].ToString();
                    string msg = "" + pName + "is not in Stock";
                    Response.Write("<script>alert('" + msg + "');</script>");
                    isTrue = true;
                }
            }
            if (GridView1.Rows.Count.ToString() == "0")
            {
                Response.Write("<script>alert('Your Cart is Empty. You cannot place an Order');</script>");
            }
            else
            {
                if (isTrue == false)
                {
                    Response.Redirect("PlaceOrder.aspx");
                }
            }

        }

        public void clearcart()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete from CartDetails where Email='" + Session["username"] + "' ",con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("AddCart.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["buyitems"] = null;
            clearcart();
        }
    }
}