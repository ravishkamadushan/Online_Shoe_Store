<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCart.aspx.cs" Inherits="DDApplication.AddCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div align="center" style="margin:0 auto;">

            <h2 style="text-decoration:underline overline blink; color:#06203F">You Have Following Product In Your Cart</h2>
            <br /><br />
            <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Names="Calisto MT" 
                Font-Size="X-Large" NavigateUrl="~/Home.aspx">Continue Shopping</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Names="Calisto MT" Font-Size="X-Large" OnClick="LinkButton1_Click">Clear Cart</asp:LinkButton>
            <br /><br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#0099FF" BorderColor="Black" BorderWidth="5px" EmptyDataText="No Products Avilable In your Shopping Cart" Font-Bold="True" Height="257px" ShowFooter="True" Width="1100px" OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="sno" HeaderText="Sr No">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="pid" HeaderText="Product ID">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:ImageField DataImageUrlField="pimage" HeaderText="Product Image">
                        <ControlStyle Height="300px" Width="340px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:ImageField>
                    <asp:BoundField DataField="pname" HeaderText="Product Name">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="pprice" HeaderText="Price">
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="pquantity" HeaderText="Quantity">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ptotalprice" HeaderText="Total Price">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CommandField ShowDeleteButton="True" DeleteText="Remove" />
                </Columns>
                <FooterStyle BackColor="#06203F" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#06203F" ForeColor="White" />
            </asp:GridView><br /><br />

            <asp:Button ID="Button1" runat="server" Text="Place Order" BackColor="#0099FF" BorderColor="#06203F" 
                Font-Bold="True" Font-Size="Large" ForeColor="White" Height="46px" Width="135px" OnClick="Button1_Click" />

        </div>
    </form>
</body>
</html>
