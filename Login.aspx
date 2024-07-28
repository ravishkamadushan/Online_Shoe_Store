<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DDApplication.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 453px;
            width: 550px;
        }
        .auto-style2 {
            height: 87px;
        }
    </style>
</head>
<body style="height: 447px">
    <form id="form1" runat="server">
        <div>
            <table align="center" style="padding: 3px; background-color: #FFFFFF;" class="auto-style1" border="1">
                <tr>
                    <td colspan="2" align="center" class="auto-style2" style="background-color: #0066FF; color: #FFFFFF">
                        <h2>User Login</h2> 

                    </td>
                </tr>

                 <tr>
                    <td colspan="2" align="center" class="auto-style2">
                        <asp:Image ID="Image1" runat="server" Height="234px" ImageUrl="~/Images/UserImage.jpg" />

                    </td>
                </tr>

                <tr>
                    <td align="center" style="width:50%">
                        <b>Email</b>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" BackColor="White" Height="33px" Width="255px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td align="center" style="width:50%">
                        <b>Password</b>
                    </td>
                    <td>
                        
                        <asp:TextBox ID="TextBox2" runat="server" BackColor="White" Height="33px" TextMode="Password" Width="255px"></asp:TextBox>
                        
                    </td>
                </tr>

                <tr>
                    <td align="center" colspan="2" >
                        <asp:Button ID="Button1" runat="server" Text="Login" Height="44px" Width="116px" BackColor="#0066FF" OnClick="Button1_Click" BorderStyle="Double" ForeColor="White" />
                        <br />
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx" ForeColor="Blue">Dont have an account? Register here</asp:HyperLink>
                    </td>   
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
