<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryStatus.aspx.cs" Inherits="DDApplication.DeliveryStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-top: 87px;
        }
        .auto-style2 {
            width: 1355px;
        }
        .auto-style3 {
            width: 512px;
        }
        .auto-style4 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style2">
            <table>
                <tr>
                    <td>
            <asp:Image ID="Image1" runat="server" CssClass="auto-style1" 
                Height="600px" ImageUrl="~/Images/10172553_8309.jpg" Width="831px" />   
                        </td>
                    <td class="auto-style3" colspan="2" align="center">
                        <asp:Label ID="Label1" runat="server" Text="Check Your Order Status" Font-Bold="True" Font-Names="Arial" 
                            Font-Size="X-Large" ForeColor="#CC0000"></asp:Label>
                        <br />
                        <hr style="color:#06203F; border-width:3px" />
                        <br />
                        <br />
                        <asp:Image ID="Image2" runat="server" CssClass="auto-style4" Height="89px" ImageUrl="~/Images/Delivery02.jpg" Width="399px" />
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" Font-Underline="True" ForeColor="Blue" OnClick="LinkButton1_Click">Check Your All Orders</asp:LinkButton>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" Font-Underline="True" ForeColor="#00CC00" NavigateUrl="~/Home.aspx">Go Back to Home Page</asp:HyperLink>
                    </td>
                    </tr>
                </table>
        </div>
    </form>
</body>
</html>
