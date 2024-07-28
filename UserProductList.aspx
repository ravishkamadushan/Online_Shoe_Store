<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProductList.aspx.cs" Inherits="DDApplication.UserProductList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center">

            <div align="right">
                <asp:LinkButton ID="AllOrder" runat="server" ForeColor="Blue" OnClick="AllOrder_Click" Font-Bold="True">Show All Order List</asp:LinkButton>
                &nbsp;
            </div>

            <b>Select OrderID:</b>
            <asp:TextBox ID="TextBox1" runat="server" ForeColor="#000099" Height="29px" Width="72px"></asp:TextBox>
            &nbsp;
            <asp:Button ID="Button1" runat="server" Text="Click" CssClass="button" Font-Bold="True" Height="39px" 
                OnClick="Button1_Click" Width="72px" />
            <br />
            <br />

            <asp:GridView ID="GridView1" runat="server" BorderWidth="1px" OnRowDataBound="GridView1_RowDataBound" BackColor="White" BorderColor="#999999" BorderStyle="None" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderText="PrdtImage">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" CssClass="auto-style1" Height="105px" ImageUrl='<%# Eval("Image") %>' Width="105px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" ForeColor="White" Font-Bold="True" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            <br />
            <br />

            <div align="center">
                <asp:HyperLink ID="HyperLink1" runat="server" BorderColor="White" Font-Bold="True" 
                    Font-Names="Arial" Font-Size="Large" ForeColor="Blue" NavigateUrl="~/Home.aspx">Back to Home Page</asp:HyperLink>
                <br />
                <br />
                <asp:HyperLink ID="HyperLink2" runat="server" BorderColor="White" Font-Bold="True" 
                    Font-Names="Arial" Font-Size="Large" ForeColor="#00CC00" 
                    NavigateUrl="~/DeliveryStatus.aspx">Back to Previous Page</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
